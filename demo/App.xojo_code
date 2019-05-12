#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  controller = new controllerWindow
		  consumers.Append new consumerWindow
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		consumers(-1) As consumerWindow
	#tag EndProperty

	#tag Property, Flags = &h0
		controller As controllerWindow
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
