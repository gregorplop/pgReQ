#tag Class
Protected Class pgReQ_session
	#tag Method, Flags = &h0
		Sub Constructor(byref initSession as PostgreSQLDatabase, channels2listen() as string, optional requests2process() as pgReQ_request)
		  if IsNull(initSession) then
		    mLastError = "No valid postgres session"
		    return
		  end if
		  
		  pgSession = initSession
		  mCurrentPID = getPID 
		  if mCurrentPID = -1 then 
		    mLastError = "Error getting PID"
		    return
		  end if
		  
		  if IsNull(channels2listen) = false then
		    dim channel2listen as String
		    if channels2listen.Ubound < 0 then
		      mLastError = "No channels to listen to"
		      Return
		    end if
		    for i as Integer = 0 to channels2listen.Ubound
		      channel2listen = channels2listen(i).Lowercase.ReplaceAll("%pid%" , str(mCurrentPID))
		      pgSession.SQLExecute("LISTEN " + channel2listen)
		      
		      if pgSession.Error then 
		        mLastError = "Error setting up listener: " + pgSession.ErrorMessage
		        return
		      else
		        ChannelsListening.Append channel2listen
		      end if
		      
		    next i
		  else
		    mLastError = "No channels to listen to"
		    Return
		  end if
		  
		  requestDeclarations = requests2process
		  
		  AddHandler pgSession.ReceivedNotification , WeakAddressOf pgSessionReceiveNotification
		  
		  queuePollTimer = new Timer
		  queuePollTimer.Period = PollTimerPeriod
		  AddHandler queuePollTimer.Action , WeakAddressOf PollTimerAction
		  queuePollTimer.Mode = timer.ModeMultiple
		  
		  
		  mLastError = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChannelsListening() As string()
		  Return ChannelsListening
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChannelsListening(idx as Integer) As string
		  try
		    Return ChannelsListening(idx)
		  Catch e as OutOfBoundsException
		    Return ""
		  end try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getPID() As integer
		  if IsNull(pgSession) then return -1
		  
		  dim rs as RecordSet = pgSession.SQLSelect("SELECT pg_backend_pid()")
		  
		  if pgSession.Error then 
		    return -1
		  else
		    Return rs.IdxField(1).IntegerValue
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getRequestsAwaitingResponse() As pgReQ_request()
		  dim output(-1) as pgReQ_request
		  dim lastidx as Integer = RequestsAwaitingResponse.Ubound
		  
		  try  // just in case...
		    
		    for i as Integer = 0 to lastidx
		      output.Append RequestsAwaitingResponse(i).Clone
		    next i
		    
		  Catch e as OutOfBoundsException
		    Return output
		  end try
		  
		  Return output
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getRequestsReceived() As pgReQ_request()
		  dim output(-1) as pgReQ_request
		  dim lastidx as Integer = RequestsReceived.Ubound
		  
		  try  // just in case...
		    
		    for i as Integer = 0 to lastidx
		      output.Append RequestsReceived(i).Clone
		    next i
		    
		  Catch e as OutOfBoundsException
		    Return output
		  end try
		  
		  Return output
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getResponsesReceived() As pgReQ_request()
		  dim output(-1) as pgReQ_request
		  dim lastidx as Integer = ResponsesReceived.Ubound
		  
		  try  // just in case...
		    
		    for i as Integer = 0 to lastidx
		      output.Append ResponsesReceived(i).Clone
		    next i
		    
		  Catch e as OutOfBoundsException
		    Return output
		  end try
		  
		  Return output
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getUUID() As string
		  if IsNull(pgSession) then return ""
		  
		  dim rs as RecordSet = pgSession.SQLSelect("SELECT uuid_in(md5(random()::text || clock_timestamp()::text)::cstring)")
		  
		  if pgSession.Error then 
		    Return ""
		  else
		    Return rs.IdxField(1).StringValue
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As string
		  return mLastError
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pgSessionReceiveNotification(sender as PostgreSQLDatabase, Name as string, ID as integer, Extra as String)
		  // name = channel coming from - ID = pid of the sender - extra = the json-formatted request
		  
		  dim incomingRequest as new pgReQ_request(extra)
		  
		  if incomingRequest.Error then // not a pgReQ request
		    RaiseEvent NotificationPassthrough(Name , ID , Extra)
		    return
		  end if
		  
		  // it's pgReQ
		  
		  if ID = mCurrentPID then return  // it's a message this session sent out and for some reason it's set up to listen to that channel
		  
		  // is it a response to a request I've made?
		  if incomingRequest.isResponse and incomingRequest.initiatorPID = mCurrentPID then
		    dim idx as Integer = searchAwaitingRequestsQueue(incomingRequest.UUID)
		    if idx < 0 then // never made such request, this is weird...
		      // normally this shouldn't happen
		    else  // we got a reply we've been waiting for
		      RequestsAwaitingResponse.Remove(idx)
		      ResponsesReceived.Append incomingRequest
		      RaiseEvent ResponseReceived(incomingRequest.UUID)
		    end if
		    Return
		  end if
		  
		  
		  // is it a request I'm configured to process?
		  for i as Integer = 0 to RequestDeclarations.Ubound
		    if RequestDeclarations(i).Type.Uppercase = incomingRequest.Type.Uppercase then //yes
		      incomingRequest.processing = false
		      incomingRequest.MyOwnRequest = false
		      RequestsReceived.Append incomingRequest
		      RaiseEvent RequestReceived(incomingRequest.UUID)
		      return
		    end if
		  next i
		  
		  // cannot think of anything else...
		  // the rest if debugging
		  
		  app.controller.log.AddRow ""
		  app.controller.log.AddRow incomingRequest.UUID
		  app.controller.log.AddRow incomingRequest.Type
		  app.controller.log.AddRow incomingRequest.creationStamp.SQLDateTime
		  app.controller.log.AddRow str(IsNull(incomingRequest.responseStamp))
		  app.controller.log.AddRow ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PID() As Integer
		  Return mCurrentPID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PollTimerAction(sender as Timer)
		  if IsNull(pgSession) then  // there's no connection to the db
		    sender.Mode = timer.ModeOff
		    RaiseEvent ServiceInterrupted("Connection to postgres server no longer valid")
		    return
		  end if
		  
		  
		  VerifyServiceCounter = VerifyServiceCounter + 1
		  dim thisSecond as Int64 = date(new date).TotalSeconds
		  
		  if lastSecond <> thisSecond then  // code here executes once per second
		    lastSecond = thisSecond
		    dim RequestsAwaitingResponseUbound as Integer = RequestsAwaitingResponse.Ubound
		    dim expiredRequest as pgReQ_request
		    
		    for i as Integer = 0 to RequestsAwaitingResponseUbound
		      if i <= RequestsAwaitingResponse.Ubound then
		        RequestsAwaitingResponse(i).TimeoutCountdown = RequestsAwaitingResponse(i).TimeoutCountdown - 1
		        if RequestsAwaitingResponse(i).TimeoutCountdown < 0 then  // this request has expired
		          expiredRequest = RequestsAwaitingResponse(i).Clone
		          RequestsAwaitingResponse.Remove(i)
		          exit for i  // note that only one request expiration is reported per second: just for simplicity's sake
		        end if
		      end if
		    next i
		    
		    if IsNull(expiredRequest) = false then RaiseEvent RequestExpired(expiredRequest)
		    
		  end if
		  
		  
		  if VerifyServiceCounter > VerifyServiceIntervalMultiplier then  // code here executes once per VerifyServiceIntervalMultiplier
		    
		    dim currentPID as Integer = getPID 
		    
		    if mCurrentPID <> currentPID then // db error/disconnect/reconnect
		      sender.Mode = timer.ModeOff
		      RaiseEvent ServiceInterrupted("Error verifying current PID")
		      Return
		    end if
		    
		    VerifyServiceCounter = 0
		    
		  end if
		  
		  // code below executes once per PollTimerPeriod
		  
		  pgSession.CheckForNotifications
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function popResponse(UUID as string) As pgReQ_request
		  dim i as Integer = 0
		  dim output as pgReQ_request = nil
		  
		  while i <= ResponsesReceived.Ubound
		    if ResponsesReceived(i).UUID = UUID then 
		      output = ResponsesReceived(i).Clone
		      ResponsesReceived.Remove(i)
		      Return output
		    end if
		    i = i + 1
		  wend
		  
		  return output
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function searchAwaitingRequestsQueue(UUID as String) As Integer
		  dim i as Integer = 0
		  
		  while i <= RequestsAwaitingResponse.Ubound
		    if RequestsAwaitingResponse(i).UUID = UUID then return i
		    i = i + 1
		  wend
		  
		  return -1
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sendRequest(request2send as pgReQ_request) As pgReQ_request
		  if request2send.Error then Return request2send
		  
		  if IsNull(pgSession) then 
		    request2send.Error = true
		    request2send.ErrorMessage = "No PostgreSQL session!"
		    Return request2send
		  end if
		  
		  request2send.UUID = getUUID
		  
		  if request2send.UUID = "" then
		    request2send.Error = true
		    request2send.ErrorMessage = "Could not get UUID!"
		    Return request2send
		  end if
		  
		  request2send.creationStamp = new Date
		  request2send.initiatorPID = mCurrentPID
		  request2send.MyOwnRequest = true
		  
		  dim JSONpackage as String = request2send.toJSON
		  
		  if JSONpackage.InStr("'") > 0 then
		    request2send.Error = true
		    request2send.ErrorMessage = "JSON payload to the queue should not contain a single quote character!"
		    Return request2send
		  end if
		  
		  dim NOTIFY as string = "NOTIFY " + request2send.RequestChannel + " , '" + JSONpackage + "'"
		  pgSession.SQLExecute(NOTIFY)
		  
		  if pgSession.Error then
		    request2send.Error = true
		    request2send.ErrorMessage = "Error sending request: " + pgSession.ErrorMessage
		    Return request2send
		  end if
		  
		  if request2send.RequireResponse then RequestsAwaitingResponse.Append request2send.Clone
		  
		  Return request2send
		  
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event NotificationPassthrough(Name as string, ID as integer, Extra as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RequestExpired(ExpiredRequest as pgReQ_request)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RequestReceived(UUID as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResponseReceived(UUID as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceInterrupted(errorMsg as string)
	#tag EndHook


	#tag Property, Flags = &h21
		Private ChannelsListening() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			used by PollTimerAction
		#tag EndNote
		Private LastSecond As int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentPID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastError As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pgSession As PostgreSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h21
		Private queuePollTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RequestDeclarations() As pgReQ_request
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RequestsAwaitingResponse() As pgReQ_request
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RequestsReceived() As pgReQ_request
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ResponsesReceived() As pgReQ_request
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			used by PollTimerAction
		#tag EndNote
		Private VerifyServiceCounter As Integer
	#tag EndProperty


	#tag Constant, Name = PollTimerPeriod, Type = Double, Dynamic = False, Default = \"250", Scope = Public
	#tag EndConstant

	#tag Constant, Name = VerifyServiceIntervalMultiplier, Type = Double, Dynamic = False, Default = \"500", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
