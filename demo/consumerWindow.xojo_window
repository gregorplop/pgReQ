#tag Window
Begin Window consumerWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   528
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   500
   MinimizeButton  =   True
   MinWidth        =   800
   Placement       =   1
   Resizeable      =   True
   Title           =   "pgReQ demo"
   Visible         =   True
   Width           =   990
   Begin TextField hostField
      AcceptTabs      =   False
      Alignment       =   2
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "host"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   30
      HelpTag         =   "host"
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   120
   End
   Begin TextField portField
      AcceptTabs      =   False
      Alignment       =   2
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "port"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   30
      HelpTag         =   "port"
      Index           =   -2147483648
      Italic          =   False
      Left            =   152
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   77
   End
   Begin TextField usernameField
      AcceptTabs      =   False
      Alignment       =   2
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "user name"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   30
      HelpTag         =   "user name"
      Index           =   -2147483648
      Italic          =   False
      Left            =   601
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   126
   End
   Begin TextField passwordField
      AcceptTabs      =   False
      Alignment       =   2
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "password"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   30
      HelpTag         =   "password"
      Index           =   -2147483648
      Italic          =   False
      Left            =   739
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   126
   End
   Begin PushButton ConnectBtn
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Connect"
      Default         =   False
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   877
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   93
   End
   Begin Listbox log
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   446
      HelpTag         =   "log"
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   601
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   62
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   369
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField databasenameField
      AcceptTabs      =   False
      Alignment       =   2
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "database"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   30
      HelpTag         =   "database"
      Index           =   -2147483648
      Italic          =   False
      Left            =   308
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   187
   End
   Begin Listbox RequestList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   367
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   141
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   569
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label RequestsSentLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Requests sent to controller"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   104
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   256
   End
   Begin PushButton SendNewRequestBtn
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Send HASH request"
      Default         =   False
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   343
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   14.0
      TextUnit        =   0
      Top             =   104
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   246
   End
   Begin PushButton NewConsumerBtn
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "New Consumer"
      Default         =   False
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   14.0
      TextUnit        =   0
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin Timer UpdateListTimer
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   500
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  reqSession = nil
		  if IsNull(db) = false then db.Close
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  autofillCredentials
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub autofillCredentials()
		  dim pgpass as FolderItem = SpecialFolder.UserHome.Child("pgservice.txt")
		  
		  if pgpass.Exists then
		    
		    dim inputStream as TextInputStream
		    inputStream = TextInputStream.Open(pgpass)
		    
		    hostField.Text = inputStream.ReadLine
		    portField.Text = inputStream.ReadLine
		    databasenameField.Text = inputStream.ReadLine
		    usernameField.Text = inputStream.ReadLine
		    passwordField.Text = inputStream.ReadLine
		    
		    inputStream.Close
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isUUIDlisted(UUID as string) As integer
		  dim i as Integer = 0
		  
		  while i < RequestList.ListCount
		    if UUID = RequestList.cell(i,0) then return i
		    i = i + 1
		  wend
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestExpired(sender as pgReQ_session, ExpiredRequest as pgReQ_request)
		  log.AddRow "Expired request: " + ExpiredRequest.UUID
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ServiceInterrupted(sender as pgReQ_session, errorMsg as string)
		  log.AddRow ""
		  log.AddRow "Service interrupted!"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateRequestsList()
		  if IsNull(reqSession) then return
		  
		  dim requests(-1) as pgReQ_request
		  dim responses(-1) as pgReQ_request
		  
		  dim idx as integer
		  dim UUIDsRead(-1) as string
		  dim row(6) as string
		  
		  requests = reqSession.getRequestsAwaitingResponse
		  responses = reqSession.getResponsesReceived
		  
		  for i as Integer = 0 to responses.Ubound  // merge the requests and responses array, no need to handle them separateley
		    requests.Append responses(i)
		  next i
		  
		  
		  for i as Integer = 0 to requests.Ubound
		    UUIDsRead.Append requests(i).UUID
		    
		    idx = isUUIDlisted(requests(i).UUID)
		    
		    if idx < 0 then
		      
		      row(0) = requests(i).UUID
		      row(1) = requests(i).Type
		      row(2) = requests(i).creationStamp.SQLDateTime
		      row(3) = if(isnull(requests(i).getParameter("CLEARTEXT")) , "" , requests(i).getParameter("CLEARTEXT").StringValue)
		      row(4) = str(requests(i).TimeoutCountdown)
		      row(5) = if(IsNull(requests(i).responseStamp) , "" , requests(i).responseStamp.SQLDateTime)
		      row(6) = if(isnull(requests(i).getParameter("RESPONSE")) , "" , requests(i).getParameter("RESPONSE").StringValue)
		      
		      RequestList.AddRow row
		      
		    else
		      
		      RequestList.cell(idx , 4) = str(requests(i).TimeoutCountdown)
		      RequestList.cell(idx , 5) = if(IsNull(requests(i).responseStamp) , "" , requests(i).responseStamp.SQLDateTime)
		      RequestList.cell(idx , 6) = if(isnull(requests(i).getParameter("RESPONSE")) , "" , requests(i).getParameter("RESPONSE").StringValue)
		      
		    end if
		    
		  next i
		  
		  // remove elements from the list
		  dim i as Integer = 0
		  while i <= RequestList.ListCount - 1
		    if UUIDsRead.IndexOf(RequestList.cell(i,0)) < 0 then  // row should be removed from the list
		      RequestList.RemoveRow(i)
		    else  // row should remain in the list
		      i = i + 1
		    end if
		  wend
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private db As PostgreSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h21
		Private reqSession As pgReQ_session
	#tag EndProperty


	#tag Constant, Name = constTitle, Type = String, Dynamic = False, Default = \"pgReQ consumer", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events passwordField
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConnectBtn
	#tag Event
		Sub Action()
		  log.DeleteAllRows
		  
		  db = new PostgreSQLDatabase
		  
		  db.Host = hostField.Text.Trim
		  db.Port = portField.Text.Trim.Val
		  db.DatabaseName = databasenameField.Text.Trim
		  db.UserName = usernameField.Text.Trim
		  db.Password = passwordField.Text.Trim
		  
		  if db.Connect = false then 
		    log.AddRow db.ErrorMessage
		    return
		  else
		    log.AddRow "connected to db" 
		  end if
		  
		  reqSession = new pgReQ_session(db , Array("client_%pid%"))
		  
		  if reqSession.LastError <> "" then
		    log.AddRow "error creating req session"
		    log.AddRow reqSession.LastError
		    Return
		    
		  else
		    log.AddRow "initialized queue"
		  end if
		  
		  log.AddRow "pid: " + str(reqSession.PID)
		  
		  dim channelsListening() as String = reqSession.getChannelsListening
		  for i as Integer = 0 to channelsListening.Ubound
		    log.AddRow "listening to channel: " + channelsListening(i)
		  next i
		  
		  AddHandler reqSession.ServiceInterrupted , WeakAddressOf ServiceInterrupted
		  AddHandler reqSession.RequestExpired , WeakAddressOf RequestExpired
		  
		  UpdateListTimer.Mode = timer.ModeMultiple
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events log
	#tag Event
		Sub DoubleClick()
		  
		  Dim row, column As Integer
		  row = Me.RowFromXY(System.MouseX - Me.Left - Self.Left, System.MouseY - Me.Top - Self.Top)
		  column = Me.ColumnFromXY(System.MouseX - Me.Left - Self.Left, System.MouseY - Me.Top - Self.Top)
		  
		  if row < 0 then return
		  
		  MsgBox me.cell(row,column)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row Mod 2 = 0 Then
		    g.ForeColor= rgb(249, 240, 234)
		  Else
		    g.ForeColor= &cFFFFFF
		  End If
		  g.FillRect(0, 0, g.Width, g.Height)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events RequestList
	#tag Event
		Sub Open()
		  me.ColumnCount = 7
		  me.Heading(0) = "UUID"
		  me.Heading(1) = "Type"
		  me.Heading(2) = "Sent at"
		  me.Heading(3) = "Parameters"
		  me.Heading(4) = "Timeout in"
		  me.Heading(5) = "Received at"
		  me.Heading(6) = "Response"
		  
		  me.HasHeading = true
		  me.HeaderType(-1) = Listbox.HeaderTypes.NotSortable
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row Mod 2 = 0 Then
		    g.ForeColor= rgb(249, 240, 234)
		  Else
		    g.ForeColor= &cFFFFFF
		  End If
		  g.FillRect(0, 0, g.Width, g.Height)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SendNewRequestBtn
	#tag Event
		Sub Action()
		  if IsNull(reqSession) then 
		    log.AddRow "no open session"
		    return 
		  end if
		  
		  dim newRequest as new pgReQ_request("HASH" , 10 , true)  // create a CREATEFILE request, give it 10 secs timeout and expect a reply
		  
		  // this is just generating some text in an -essentially- random manner
		  dim preciseMicroseconds as Int64 = Microseconds
		  dim clearText as String = str(preciseMicroseconds)
		  
		  newRequest.setParameter("CLEARTEXT" , clearText) // add a parameter specialized for this request type
		  
		  newRequest.RequestChannel = "controller" 
		  newRequest.ResponseChannel = reqSession.getChannelsListening(0)
		  
		  newRequest = reqSession.sendRequest(newRequest)
		  
		  if newRequest.Error then
		    MsgBox "Error sending request: " + newRequest.ErrorMessage
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewConsumerBtn
	#tag Event
		Sub Action()
		  app.newConsumer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UpdateListTimer
	#tag Event
		Sub Action()
		  updateRequestsList
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
