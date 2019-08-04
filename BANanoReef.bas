B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public Reef As BANanoObject
	Private BANano As BANano  'ignore
	Public ID As Object
	Private Item As Map
	Private mtemplate As String
	Public UI As UOEHTML
	Private data As Map
	Private binternal As Boolean
	Private attachTo As List
End Sub

'Initializes the reef
Public Sub Initialize(elementID As Object) As BANanoReef
	ID = elementID
	Item.Initialize
	UI.Initialize(elementID).SetImportant(False) 
	data.Initialize 
	binternal = False
	attachTo.Initialize 
	Return Me
End Sub

'set id
Sub SetID(eid As String) As BANanoReef
	binternal = True
	UI.ID = eid
	Return Me
End Sub

'set type
Sub SetType(t As String) As BANanoReef
	binternal = True
	UI.SetTYPE(t)
	Return Me
End Sub

'set width
Sub SetWidth(w As Object) As BANanoReef
	binternal = True
	UI.SetStyle("width", w)
	Return Me
End Sub

'set height
Sub SetHeight(h As Object) As BANanoReef
	binternal = True
	UI.SetStyle("height",h)
	Return Me
End Sub

'set tag
Sub SetTag(t As Object) As BANanoReef
	binternal = True
	UI.SetTag(t)
	Return Me
End Sub

'set label
Sub SetLabel(l As Object) As BANanoReef
	binternal = True
	data.Put("label", l)
	UI.Addcontent("{label}")
	Return Me
End Sub

'set value
Sub SetValue(v As Object) As BANanoReef
	binternal = True
	data.Put("value", v)
	UI.SetAttr("value","{value}")
	Return Me
End Sub

'set class
Sub SetClass(c As Object) As BANanoReef
	binternal = True
	data.Put("class", c)
	UI.SetAttr("class","{class}")
	Return Me
End Sub

'add class
Sub AddClass(c As Object) As BANanoReef
	binternal = True
	UI.AddClass(c)
	Return Me
End Sub

'set attribute
Sub SetAttr(a As String, v As String) As BANanoReef
	binternal = True
	UI.SetAttr(a, v)
	Return Me
End Sub

'set style
Sub SetStyle(p As String, v As String) As BANanoReef
	binternal = True
	UI.SetStyle(p,v)
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
	SetTemplate(sout)
	Return Me
End Sub

'set attachTo
Sub SetAttachTo(thisItem As BANanoObject) As BANanoReef
	attachTo.Add(thisItem)
	Return Me
End Sub

'build element
Sub Render(bSanitize As Boolean)
	Item.Put("data", data)
	If binternal Then
		SetTemplateHTML(UI)
	End If
	Dim props As Map
	Dim tmp As BANanoObject = BANano.CallBack(Me,"template", Array(props))
	If bSanitize Then
		Dim html As Object
		Dim cb As BANanoObject = BANano.CallBack(Me, "sanitize", Array(html))
		Item.Put("sanitize", cb)
	End If
	Item.Put("template", tmp)
	If attachTo.Size > 0 Then
		Dim bo As BANanoObject = attachTo.Get(0)
		Dim fld As BANanoObject = bo.GetField("data")
		Item.put("data", fld)
		Item.Put("attachTo", attachTo)
	End If
	Reef.Initialize2("Reef", Array(ID, Item))
	Reef.RunMethod("render", Null)
End Sub

'attach
Sub Attach(targets As List) As BANanoReef
	Reef.RunMethod("attach", Array(targets))
	Return Me
End Sub

'detach
Sub Detach(targets As List) As BANanoReef
	Reef.RunMethod("detach", Array(targets))
	Return Me
End Sub


'just store data, id should be null
Sub SetLagoon(b As Boolean) As BANanoReef
	Item.Put("lagoon", b)
	Return Me
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


'get the data field bananoobject
Sub BOData As BANanoObject
	Dim fld As BANanoObject = Reef.GetField("data")
	Return fld
End Sub

'set the data to use in the component
Sub SetData(d As Map) As BANanoReef
	For Each mk As String In d.Keys
		Dim mv As Object = d.Get(mk)
		data.Put(mk, mv)
	Next
	Return Me
End Sub

'set data key and value
Sub SetDataKeyValue(k As String, v As Object) As BANanoReef
	data.Put(k, v)
	Return Me
End Sub

'set the template to render the element
Sub SetTemplate(t As Object) As BANanoReef
	mtemplate = t
	Return Me
End Sub

'update the data
Sub Refresh(dm As Object) As BANanoReef
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