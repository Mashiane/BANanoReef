B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.51
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Private reef As BANanoReef
	Private timer As Timer
	Private nameCnt As Int
End Sub

Sub Init
	'initialize a reef and set the object to render it to
	reef.Initialize("#body")
	'define the properties for the element, we have greeting and name
	reef.SetData(CreateMap("greeting": "Hello", "name": "world"))
	'define the h1 html element
	reef.SetTemplate($"<h1>#greeting#, #name#!</h1>"$)
	'we render the element to the body
	reef.Render(False)
	'
	nameCnt = 0
	timer.Initialize("timer1", 3000)
	timer.Enabled = True
End Sub

Sub timer1_tick
	nameCnt = nameCnt + 1
	Select Case nameCnt
	Case 1
		reef.Refresh(CreateMap("name":"Mashy"))
	Case 2
		reef.Refresh(CreateMap("name":"Ozzie"))
	Case 3
		reef.Refresh(CreateMap("name":"Orio"))
	Case 4
		reef.Refresh(CreateMap("name":"Ernesto"))
	Case 5
		reef.Refresh(CreateMap("greeting":"Good day", "name":"Anele Mbanga"))
		nameCnt = 0
	End Select
End Sub
