#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  controller = new controllerWindow
		  
		  newConsumer
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub newConsumer()
		  app.consumers.Append new consumerWindow
		  app.consumers(app.consumers.Ubound).Title = consumerWindow.constTitle + " " + str(app.consumers.Ubound)
		  
		End Sub
	#tag EndMethod


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
