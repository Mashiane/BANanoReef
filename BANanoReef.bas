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
End Sub

'Initializes the reef
Public Sub Initialize(elementID As String) As BANanoReef
	ID = elementID.tolowercase
	Item.Initialize
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

'build element
Sub Render(bSanitize As Boolean)
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
		Dim tag As String = $"#${mk}#"$
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