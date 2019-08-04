B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
Sub Class_Globals
	Private Reef As BANanoObject
	Private BANano As BANano  'ignore
	Public ID As String
	Private Item As Map
	Private mtemplate As String
	Private ui As UOEHTML
	Private data As Map
	Private binternal As Boolean
End Sub

'Initializes the reef
Public Sub Initialize(elementID As String) As BANanoReef
	ID = elementID.tolowercase
	Item.Initialize
	ui.Initialize(elementID).SetImportant(False) 
	data.Initialize 
	binternal = False
	Return Me
End Sub

'set id
Sub SetID(eid As String) As BANanoReef
	binternal = True
	ui.ID = eid
	Return Me
End Sub

'set type
Sub SetType(t As String) As BANanoReef
	binternal = True
	ui.SetTYPE(t)
	Return Me
End Sub

'set width
Sub SetWidth(w As Object) As BANanoReef
	binternal = True
	ui.SetStyle("width", w)
	Return Me
End Sub

'set height
Sub SetHeight(h As Object) As BANanoReef
	binternal = True
	ui.SetStyle("height",h)
	Return Me
End Sub

'set tag
Sub SetTag(t As Object) As BANanoReef
	binternal = True
	ui.SetTag(t)
	Return Me
End Sub

'set label
Sub SetLabel(l As Object) As BANanoReef
	binternal = True
	data.Put("label", l)
	ui.Addcontent("{label}")
	Return Me
End Sub

'set value
Sub SetValue(v As Object) As BANanoReef
	binternal = True
	data.Put("value", v)
	ui.SetAttr("value","{value}")
	Return Me
End Sub

'set class
Sub SetClass(c As Object) As BANanoReef
	binternal = True
	data.Put("class", c)
	ui.SetAttr("class","{class}")
	Return Me
End Sub

'add class
Sub AddClass(c As Object) As BANanoReef
	binternal = True
	ui.AddClass(c)
	Return Me
End Sub

'set attribute
Sub SetAttr(a As String, v As String) As BANanoReef
	binternal = True
	ui.SetAttr(a, v)
	Return Me
End Sub

'set style
Sub SetStyle(p As String, v As String) As BANanoReef
	binternal = True
	ui.SetStyle(p,v)
	Return Me
End Sub

'create an html object
Sub CreateHTML(itemID As String) As UOEHTML
	Dim h As UOEHTML
	h.Initialize(itemID)
	Return h 
End Sub

'set the template using UOEHTML
Sub SetTemplateHTML(t As UOEHTML) As BANanoReef
	Dim sout As String = t.HTML
	Log(sout) 
	SetTemplate(sout)
	Return Me
End Sub

'build element
Sub Render(bSanitize As Boolean)
	If binternal Then
		SetData(data)
		SetTemplateHTML(ui)
	End If
	Dim props As Map
	Dim tmp As BANanoObject = BANano.CallBack(Me,"template", Array(props))
	If bSanitize Then
		Dim html As Object
		Dim cb As BANanoObject = BANano.CallBack(Me, "sanitize", Array(html))
		Item.Put("sanitize", cb)
	End If
	Item.Put("template", tmp)
	Reef.Initialize2("Reef", Array(ID, Item))
	Reef.RunMethod("render", Null)
End Sub

'sanitize html content 
private Sub sanitize(html As Object) As Object
	Dim dp As BANanoObject
	dp.Initialize("DOMPurify")
	Dim obj As Object = dp.RunMethod("sanitize", Array(html)).Result
	Return obj
End Sub
	
'get the data of the element
Sub GetData As Map
	Dim bo As Map = Reef.RunMethod("getData", Null).result
	Return bo
End Sub

'set the data to use in the component
Sub SetData(d As Map) As BANanoReef
	Item.Put("data", d)
	Return Me
End Sub

'set the template to render the element
Sub SetTemplate(t As Object) As BANanoReef
	mtemplate = t
	Return Me
End Sub

'update the data
Sub Refresh(dm As Map) As BANanoReef
	Reef.RunMethod("setData", Array(dm))
	Return Me
End Sub

'replace all bracket things
private Sub template(props As Map) As Object   'ignore
	Dim mout As String = mtemplate
	For Each mk As String In props.Keys
		Dim mv As String = props.Get(mk)
		Dim tag As String = $"{${mk}}"$
		mout = mout.Replace(tag,mv)
		tag = $"#${mk}#"$
		mout = mout.Replace(tag,mv)
	Next
	Return mout
End Sub

'get all strings inbetween hash
Sub GetHashedWords(original As String, delim As String) As List
	Dim L As List
	L.Initialize
	Dim OpenHashAt As Int = -1

	For I = 0 To original.Length - 1
		If original.CharAt(I) = delim Then
			If OpenHashAt = -1 Then 
				OpenHashAt = I
			Else 
				L.Add(original.SubString2(OpenHashAt + 1, I))
				OpenHashAt = -1
			End If
		End If
	Next
	Return l
End Sub