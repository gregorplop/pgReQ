#tag Class
Protected Class pgReQ_request
	#tag Method, Flags = &h0
		Sub Constructor(initID as string, optional initTimeout as Integer = -1)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		creationStamp As date
	#tag EndProperty

	#tag Property, Flags = &h0
		ID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		initiatorPID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		payload As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		responderPID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Response As Boolean
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
			Name="ID"
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
			Name="Response"
			Group="Behavior"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
