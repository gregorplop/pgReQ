#tag Class
Protected Class pgReQ_session
	#tag Method, Flags = &h0
		Sub Constructor(byref initSession as PostgreSQLDatabase)
		  if IsNull(initSession) then
		    mLastError = "No valid postgres session"
		    return
		  end if
		  
		  pgSession = initSession
		  mCurrentPID = getPID
		  
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

	#tag Method, Flags = &h0
		Function PID() As Integer
		  Return mCurrentPID
		  
		End Function
	#tag EndMethod


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
		Private Queue(-1) As pgReQ_request
	#tag EndProperty

	#tag Property, Flags = &h21
		Private templates(-1) As pgReQ_request
	#tag EndProperty


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
