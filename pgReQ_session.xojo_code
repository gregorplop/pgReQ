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
		  
		  System.DebugLog(name + EndOfLine + str(id) + EndOfLine + Extra)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PID() As Integer
		  Return mCurrentPID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PollTimerAction(sender as Timer)
		  static VerifyServiceCounter as integer
		  VerifyServiceCounter = VerifyServiceCounter + 1
		  
		  
		  if IsNull(pgSession) = false then 
		    if VerifyServiceCounter > VerifyServiceIntervalMultiplier then
		      
		      dim currentPID as Integer = getPID 
		      if mCurrentPID <> currentPID then // db error/disconnect/reconnect
		        queuePollTimer.Mode = timer.ModeOff
		        RaiseEvent ServiceInterrupted("Error verifying current PID")
		        Return
		      end if
		    end if
		    
		    pgSession.CheckForNotifications
		    
		  else
		    RaiseEvent ServiceInterrupted("Connection to postgres server no longer valid")
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sendRequest(request2send as pgReQ_request) As pgReQ_request
		  // returns pair: left is boolean, true for success, false for error. right is pgReQ_request when left = true , string carrying error message when left = false
		  
		  if request2send.Error then Return request2send
		  
		  if IsNull(pgSession) then 
		    request2send.Error = true
		    request2send.ErrorMessage = "No PostgreSQL session!"
		    Return request2send
		  end if
		  
		  request2send.UUID = getUUID
		  
		  if request2send.UUID = "" then
		    request2send.Error = true
		    request2send.ErrorMessage = "Could not get UUID"
		    Return request2send
		  end if
		  
		  request2send.creationStamp = new Date
		  request2send.initiatorPID = mCurrentPID
		  request2send.MyOwnRequest = true
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RequestExpired(ExpiredRequest as pgReQ_request)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceInterrupted(errorMsg as string)
	#tag EndHook


	#tag Property, Flags = &h21
		Private ChannelsListening() As String
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
