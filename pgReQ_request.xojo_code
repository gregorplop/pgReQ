#tag Class
Protected Class pgReQ_request
	#tag Method, Flags = &h0
		Function Clone() As pgReQ_request
		  dim clone as new pgReQ_request(Type , TimeoutCountdown , RequireResponse)
		  
		  clone.creationStamp = new date(creationStamp)
		  clone.Error = Error
		  clone.ErrorMessage = ErrorMessage
		  clone.initiatorPID = initiatorPID
		  clone.MyOwnRequest = MyOwnRequest
		  clone.payload = clonePayload
		  clone.responderPID = responderPID
		  clone.responseStamp = new date(responseStamp)
		  clone.UUID = UUID
		  
		  return clone
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function clonePayload() As Dictionary
		  dim output as new Dictionary
		  
		  for i as Integer = 0 to payload.Count - 1
		    output.Value(payload.Key(i)) = payload.Value(payload.Key(i))
		  next i
		  
		  Return output
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(initJSON as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(initType as string, initTimeout as Integer, optional ExpectResponse as Boolean = true)
		  payload = new Dictionary
		  
		  if initType.Trim = "" then
		    Error = true
		    ErrorMessage = "No Type supplied in new request"
		    return
		  end if
		  
		  Type = initType
		  TimeoutCountdown = initTimeout
		  RequireResponse = ExpectResponse
		  
		  Error = false
		  ErrorMessage = ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toJSON() As string
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		creationStamp As date
	#tag EndProperty

	#tag Property, Flags = &h0
		Error As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorMessage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		initiatorPID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			true = This is a request this client has made
			false = This is a request this client has received and it is configured to process it
			
		#tag EndNote
		MyOwnRequest As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		payload As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireResponse As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		responderPID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		responseStamp As date
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			In seconds
		#tag EndNote
		TimeoutCountdown As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As String
	#tag EndProperty

	#tag Property, Flags = &h0
		UUID As string
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initiatorPID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="responderPID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeoutCountdown"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UUID"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireResponse"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
