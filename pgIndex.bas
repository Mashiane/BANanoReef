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
	Private banano As BANano
	Private btn1 As BANanoReef
	Private sourceOfTruth As BANanoReef
	Private app As BANanoReef
	Private todos As BANanoReef
End Sub

Sub Init
	'create a div with id cont1
	Dim cont1 As UOEHTML
	cont1.Initialize("cont1").SetTag("div")
	'create a div with id buttons1
	Dim buttons1 As UOEHTML
	buttons1.Initialize("buttons1").SetTag("div")
	'
	Dim lst As UOEHTML
	lst.Initialize("listofthings").SetTag("div")
	
	'get the body of the page, created by banano, 
	Dim body As BANanoElement = banano.GetElement("#body")
	'empty the body
	body.empty
	'
	'add cont1 and buttons1 to body
	body.Append(cont1.HTML)
	body.Append(buttons1.html)
	body.Append(lst.HTML)
	
	'initialize a reef and set the object to render it to
	reef.Initialize("#cont1")
	'define the properties for the element, we have greeting and name
	reef.SetData(CreateMap("greeting": "Hello", "name": "world"))
	'define the h1 html element
	reef.SetTemplate($"<h1>#greeting#, #name#!</h1>"$)
	'we render the element to the body
	reef.Render(False)
	'
	'lets create another html5 component and render it to buttons1 container
	
	btn1.Initialize("#buttons1")
	btn1.SetTag("button").SetID("btn1").SetLabel("Button 1")
	btn1.SetStyle("background-color","blue").SetStyle("color", "white")
	btn1.SetHeight("100px").SetWidth("100px")
	btn1.Render(False)
	'
	'event
	banano.GetElement("#btn1").HandleEvents("click", Me, "btn1_click")
	
	nameCnt = 0
	timer.Initialize("timer1", 1000)
	timer.Enabled = True
	
	'using lagoons to set state
	sourceOfTruth.Initialize(Null).SetLagoon(True)
	sourceOfTruth.SetDataKeyValue("greeting", "Hello, world!")
	sourceOfTruth.SetDataKeyValue("todos", Array("Buy milk", "Bake a birthday cake", "Go apple picking"))
	sourceOfTruth.Render(False)
	'
	app.Initialize("#listofthings")
	'build the template
	Dim tmp As UOEHTML
	tmp.Initialize("").SetTag("h1").SetContent("{greeting}") 
	Dim tmp1 As UOEHTML
	tmp1.Initialize("todos").SetTag("div")
	Dim sb As StringBuilder
	sb.Initialize 
	sb.Append(tmp.HTML).Append(tmp1.HTML)
	'
	app.SetTemplate(sb.ToString) 
	app.SetAttachTo(sourceOfTruth.Reef)
	app.Render(False)
	'reactively update state
	sourceOfTruth.Refresh(CreateMap("greeting": "Hi, universe"))
End Sub

Sub btn1_click
	banano.Window.Alert("I clicked btn1!")
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
		btn1.Refresh(CreateMap("label":"My Blue Button"))
	End Select
End Sub
