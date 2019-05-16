#tag Class
Protected Class pgReQ_session
	#tag Method, Flags = &h0
		Sub Constructor(byref initSession as PostgreSQLDatabase, channels2listen() as string, optional requests2process() as pgReQ_request)
		  if IsNull(initSession) then
		    mLastError = "No valid postgres session"
		    return
		  end if
		  
		  pgSession = initSession
		  mCurrentPID = getPID  // will set mLastError if it fails
		  if mCurrentPID = -1 then return
		  
		  if IsNull(channels2listen) = false then
		    if channels2listen.Ubound < 0 then
		      mLastError = "No channels to listen to"
		      Return
		    end if
		    for i as Integer = 0 to channels2listen.Ubound
		      pgSession.SQLExecute("LISTEN """ + channels2listen(i).Lowercase.ReplaceAll("%pid%" , str(mCurrentPID)) + """")
		      if pgSession.Error then 
		        mLastError = "Error setting up listener: " + pgSession.ErrorMessage
		        return
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

	#tag Method, Flags = &h21
		Private Function getPID() As integer
		  if IsNull(pgSession) then 
		    mLastError = "Null db session"
		    return -1
		  end if
		  
		  dim rs as RecordSet = pgSession.SQLSelect("SELECT pg_backend_pid()")
		  
		  if pgSession.Error then
		    mLastError = "db error: " + pgSession.ErrorMessage
		    return -1
		  end if
		  
		  mLastError = ""
		  Return rs.IdxField(1).IntegerValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getUUID() As string
		  if IsNull(pgSession) then 
		    mLastError = "Null db session"
		    return ""
		  end if
		  
		  dim rs as RecordSet = pgSession.SQLSelect("SELECT uuid_in(md5(random()::text || clock_timestamp()::text)::cstring)")
		  
		  if pgSession.Error then
		    mLastError = "db error: " + pgSession.ErrorMessage
		    return ""
		  end if
		  
		  mLastError = ""
		  Return rs.IdxField(1).StringValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As string
		  return mLastError
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pgSessionReceiveNotification(sender as PostgreSQLDatabase, Name as string, ID as integer, Extra as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PID() As Integer
		  Return mCurrentPID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PollTimerAction(sender as Timer)
		  if IsNull(pgSession) = false then 
		    pgSession.CheckForNotifications
		    
		    
		    // some other stuff
		    
		    
		    
		  else
		    RaiseEvent ServiceInterrupted("Connection to postgres server no longer valid")
		  end if
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ServiceInterrupted(errorMsg as string)
	#tag EndHook


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


	#tag Constant, Name = PollTimerPeriod, Type = Double, Dynamic = False, Default = \"250", Scope = Private
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
