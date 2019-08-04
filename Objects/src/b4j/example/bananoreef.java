package b4j.example;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;

public class bananoreef extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    public static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new  anywheresoftware.b4j.objects.FxBA("b4j.example", "b4j.example.bananoreef", this);
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            ba.htSubs = htSubs;
             
        }
        if (BA.isShellModeRuntimeCheck(ba))
                this.getClass().getMethod("_class_globals", b4j.example.bananoreef.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public com.ab.banano.BANanoObject _reef = null;
public com.ab.banano.BANano _banano = null;
public String _id = "";
public anywheresoftware.b4a.objects.collections.Map _item = null;
public String _mtemplate = "";
public b4j.example.main _main = null;
public b4j.example.pgindex _pgindex = null;
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 1;BA.debugLine="Sub Class_Globals";
 //BA.debugLineNum = 2;BA.debugLine="Private Reef As BANanoObject";
_reef = new com.ab.banano.BANanoObject();
 //BA.debugLineNum = 3;BA.debugLine="Private BANano As BANano  'ignore";
_banano = new com.ab.banano.BANano();
 //BA.debugLineNum = 4;BA.debugLine="Public ID As String";
_id = "";
 //BA.debugLineNum = 5;BA.debugLine="Private Item As Map";
_item = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 6;BA.debugLine="Private mtemplate As String";
_mtemplate = "";
 //BA.debugLineNum = 7;BA.debugLine="End Sub";
return "";
}
public b4j.example.uoehtml  _createhtml(String _itemid) throws Exception{
b4j.example.uoehtml _h = null;
 //BA.debugLineNum = 17;BA.debugLine="Sub CreateHTML(itemID As String) As UOEHTML";
 //BA.debugLineNum = 18;BA.debugLine="Dim h As UOEHTML";
_h = new b4j.example.uoehtml();
 //BA.debugLineNum = 19;BA.debugLine="h.Initialize(itemID)";
_h._initialize /*b4j.example.uoehtml*/ (ba,_itemid);
 //BA.debugLineNum = 20;BA.debugLine="Return h";
if (true) return _h;
 //BA.debugLineNum = 21;BA.debugLine="End Sub";
return null;
}
public anywheresoftware.b4a.objects.collections.Map  _getdata() throws Exception{
anywheresoftware.b4a.objects.collections.Map _bo = null;
 //BA.debugLineNum = 53;BA.debugLine="Sub GetData As Map";
 //BA.debugLineNum = 54;BA.debugLine="Dim bo As Map = Reef.RunMethod(\"getData\", Null).r";
_bo = new anywheresoftware.b4a.objects.collections.Map();
_bo.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_reef.RunMethod("getData",__c.Null).Result()));
 //BA.debugLineNum = 55;BA.debugLine="Return bo";
if (true) return _bo;
 //BA.debugLineNum = 56;BA.debugLine="End Sub";
return null;
}
public anywheresoftware.b4a.objects.collections.List  _gethashedwords(String _original,String _delim) throws Exception{
anywheresoftware.b4a.objects.collections.List _l = null;
int _openhashat = 0;
int _i = 0;
 //BA.debugLineNum = 88;BA.debugLine="Sub GetHashedWords(original As String, delim As St";
 //BA.debugLineNum = 89;BA.debugLine="Dim L As List";
_l = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 90;BA.debugLine="L.Initialize";
_l.Initialize();
 //BA.debugLineNum = 91;BA.debugLine="Dim OpenHashAt As Int = -1";
_openhashat = (int) (-1);
 //BA.debugLineNum = 93;BA.debugLine="For I = 0 To original.Length - 1";
{
final int step4 = 1;
final int limit4 = (int) (_original.length()-1);
_i = (int) (0) ;
for (;_i <= limit4 ;_i = _i + step4 ) {
 //BA.debugLineNum = 94;BA.debugLine="If original.CharAt(I) = delim Then";
if (_original.charAt(_i)==BA.ObjectToChar(_delim)) { 
 //BA.debugLineNum = 95;BA.debugLine="If OpenHashAt = -1 Then";
if (_openhashat==-1) { 
 //BA.debugLineNum = 96;BA.debugLine="OpenHashAt = I";
_openhashat = _i;
 }else {
 //BA.debugLineNum = 98;BA.debugLine="L.Add(original.SubString2(OpenHashAt + 1, I))";
_l.Add((Object)(_original.substring((int) (_openhashat+1),_i)));
 //BA.debugLineNum = 99;BA.debugLine="OpenHashAt = -1";
_openhashat = (int) (-1);
 };
 };
 }
};
 //BA.debugLineNum = 103;BA.debugLine="Return l";
if (true) return _l;
 //BA.debugLineNum = 104;BA.debugLine="End Sub";
return null;
}
public b4j.example.bananoreef  _initialize(anywheresoftware.b4a.BA _ba,String _elementid) throws Exception{
innerInitialize(_ba);
 //BA.debugLineNum = 10;BA.debugLine="Public Sub Initialize(elementID As String) As BANa";
 //BA.debugLineNum = 11;BA.debugLine="ID = elementID.tolowercase";
_id = _elementid.toLowerCase();
 //BA.debugLineNum = 12;BA.debugLine="Item.Initialize";
_item.Initialize();
 //BA.debugLineNum = 13;BA.debugLine="Return Me";
if (true) return (b4j.example.bananoreef)(this);
 //BA.debugLineNum = 14;BA.debugLine="End Sub";
return null;
}
public b4j.example.bananoreef  _refresh(anywheresoftware.b4a.objects.collections.Map _dm) throws Exception{
 //BA.debugLineNum = 71;BA.debugLine="Sub Refresh(dm As Map) As BANanoReef";
 //BA.debugLineNum = 72;BA.debugLine="Reef.RunMethod(\"setData\", Array(dm))";
_reef.RunMethod("setData",(Object)(new Object[]{(Object)(_dm.getObject())}));
 //BA.debugLineNum = 73;BA.debugLine="Return Me";
if (true) return (b4j.example.bananoreef)(this);
 //BA.debugLineNum = 74;BA.debugLine="End Sub";
return null;
}
public String  _render(boolean _bsanitize) throws Exception{
anywheresoftware.b4a.objects.collections.Map _props = null;
com.ab.banano.BANanoObject _tmp = null;
Object _html = null;
com.ab.banano.BANanoObject _cb = null;
 //BA.debugLineNum = 31;BA.debugLine="Sub Render(bSanitize As Boolean)";
 //BA.debugLineNum = 32;BA.debugLine="Dim props As Map";
_props = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 33;BA.debugLine="Dim tmp As BANanoObject = BANano.CallBack(Me,\"tem";
_tmp = (com.ab.banano.BANanoObject)(_banano.CallBack(this,"template",anywheresoftware.b4a.keywords.Common.ArrayToList(new Object[]{(Object)(_props.getObject())})));
 //BA.debugLineNum = 34;BA.debugLine="If bSanitize Then";
if (_bsanitize) { 
 //BA.debugLineNum = 35;BA.debugLine="Dim html As Object";
_html = new Object();
 //BA.debugLineNum = 36;BA.debugLine="Dim cb As BANanoObject = BANano.CallBack(Me, \"sa";
_cb = (com.ab.banano.BANanoObject)(_banano.CallBack(this,"sanitize",anywheresoftware.b4a.keywords.Common.ArrayToList(new Object[]{_html})));
 //BA.debugLineNum = 37;BA.debugLine="Item.Put(\"sanitize\", cb)";
_item.Put((Object)("sanitize"),(Object)(_cb));
 };
 //BA.debugLineNum = 39;BA.debugLine="Item.Put(\"template\", tmp)";
_item.Put((Object)("template"),(Object)(_tmp));
 //BA.debugLineNum = 40;BA.debugLine="Reef.Initialize2(\"Reef\", Array(ID, Item))";
_reef.Initialize2("Reef",(Object)(new Object[]{(Object)(_id),(Object)(_item.getObject())}));
 //BA.debugLineNum = 41;BA.debugLine="Reef.RunMethod(\"render\", Null)";
_reef.RunMethod("render",__c.Null);
 //BA.debugLineNum = 42;BA.debugLine="End Sub";
return "";
}
public Object  _sanitize(Object _html) throws Exception{
com.ab.banano.BANanoObject _dp = null;
Object _obj = null;
 //BA.debugLineNum = 45;BA.debugLine="private Sub sanitize(html As Object) As Object";
 //BA.debugLineNum = 46;BA.debugLine="Dim dp As BANanoObject";
_dp = new com.ab.banano.BANanoObject();
 //BA.debugLineNum = 47;BA.debugLine="dp.Initialize(\"DOMPurify\")";
_dp.Initialize((Object)("DOMPurify"));
 //BA.debugLineNum = 48;BA.debugLine="Dim obj As Object = dp.RunMethod(\"sanitize\", Arra";
_obj = _dp.RunMethod("sanitize",(Object)(new Object[]{_html})).Result();
 //BA.debugLineNum = 49;BA.debugLine="Return obj";
if (true) return _obj;
 //BA.debugLineNum = 50;BA.debugLine="End Sub";
return null;
}
public b4j.example.bananoreef  _setdata(anywheresoftware.b4a.objects.collections.Map _d) throws Exception{
 //BA.debugLineNum = 59;BA.debugLine="Sub SetData(d As Map) As BANanoReef";
 //BA.debugLineNum = 60;BA.debugLine="Item.Put(\"data\", d)";
_item.Put((Object)("data"),(Object)(_d.getObject()));
 //BA.debugLineNum = 61;BA.debugLine="Return Me";
if (true) return (b4j.example.bananoreef)(this);
 //BA.debugLineNum = 62;BA.debugLine="End Sub";
return null;
}
public b4j.example.bananoreef  _settemplate(Object _t) throws Exception{
 //BA.debugLineNum = 65;BA.debugLine="Sub SetTemplate(t As Object) As BANanoReef";
 //BA.debugLineNum = 66;BA.debugLine="mtemplate = t";
_mtemplate = BA.ObjectToString(_t);
 //BA.debugLineNum = 67;BA.debugLine="Return Me";
if (true) return (b4j.example.bananoreef)(this);
 //BA.debugLineNum = 68;BA.debugLine="End Sub";
return null;
}
public b4j.example.bananoreef  _settemplatehtml(b4j.example.uoehtml _t) throws Exception{
String _sout = "";
 //BA.debugLineNum = 24;BA.debugLine="Sub SetTemplateHTML(t As UOEHTML) As BANanoReef";
 //BA.debugLineNum = 25;BA.debugLine="Dim sout As String = t.HTML";
_sout = _t._html /*String*/ ();
 //BA.debugLineNum = 26;BA.debugLine="SetTemplate(sout)";
_settemplate((Object)(_sout));
 //BA.debugLineNum = 27;BA.debugLine="Return Me";
if (true) return (b4j.example.bananoreef)(this);
 //BA.debugLineNum = 28;BA.debugLine="End Sub";
return null;
}
public Object  _template(anywheresoftware.b4a.objects.collections.Map _props) throws Exception{
String _mout = "";
String _mk = "";
String _mv = "";
String _tag = "";
 //BA.debugLineNum = 77;BA.debugLine="private Sub template(props As Map) As Object   'ig";
 //BA.debugLineNum = 78;BA.debugLine="Dim mout As String = mtemplate";
_mout = _mtemplate;
 //BA.debugLineNum = 79;BA.debugLine="For Each mk As String In props.Keys";
{
final anywheresoftware.b4a.BA.IterableList group2 = _props.Keys();
final int groupLen2 = group2.getSize()
;int index2 = 0;
;
for (; index2 < groupLen2;index2++){
_mk = BA.ObjectToString(group2.Get(index2));
 //BA.debugLineNum = 80;BA.debugLine="Dim mv As String = props.Get(mk)";
_mv = BA.ObjectToString(_props.Get((Object)(_mk)));
 //BA.debugLineNum = 81;BA.debugLine="Dim tag As String = $\"{${mk}}\"$";
_tag = ("{"+__c.SmartStringFormatter("",(Object)(_mk))+"}");
 //BA.debugLineNum = 82;BA.debugLine="mout = mout.Replace(tag,mv)";
_mout = _mout.replace(_tag,_mv);
 }
};
 //BA.debugLineNum = 84;BA.debugLine="Return mout";
if (true) return (Object)(_mout);
 //BA.debugLineNum = 85;BA.debugLine="End Sub";
return null;
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
