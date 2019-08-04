package b4j.example;


import anywheresoftware.b4a.BA;

public class pgindex extends Object{
public static pgindex mostCurrent = new pgindex();

public static BA ba;
static {
		ba = new  anywheresoftware.b4j.objects.FxBA("b4j.example", "b4j.example.pgindex", null);
		ba.loadHtSubs(pgindex.class);
        if (ba.getClass().getName().endsWith("ShellBA")) {
			
			ba.raiseEvent2(null, true, "SHELL", false);
			ba.raiseEvent2(null, true, "CREATE", true, "b4j.example.pgindex", ba);
		}
	}
    public static Class<?> getObject() {
		return pgindex.class;
	}

 public static anywheresoftware.b4a.keywords.Common __c = null;
public static b4j.example.bananoreef _reef = null;
public static anywheresoftware.b4a.objects.Timer _timer = null;
public static int _namecnt = 0;
public static b4j.example.main _main = null;
public static String  _init() throws Exception{
 //BA.debugLineNum = 8;BA.debugLine="Sub Init";
 //BA.debugLineNum = 10;BA.debugLine="reef.Initialize(\"#body\")";
_reef._initialize /*b4j.example.bananoreef*/ (ba,"#body");
 //BA.debugLineNum = 12;BA.debugLine="reef.SetData(CreateMap(\"greeting\": \"Hello\", \"name";
_reef._setdata /*b4j.example.bananoreef*/ (anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("greeting"),(Object)("Hello"),(Object)("name"),(Object)("world")}));
 //BA.debugLineNum = 14;BA.debugLine="reef.SetTemplate($\"<h1>{greeting}, {name}!</h1>\"$";
_reef._settemplate /*b4j.example.bananoreef*/ ((Object)(("<h1>{greeting}, {name}!</h1>")));
 //BA.debugLineNum = 16;BA.debugLine="reef.Render(False)";
_reef._render /*String*/ (anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 18;BA.debugLine="nameCnt = 0";
_namecnt = (int) (0);
 //BA.debugLineNum = 19;BA.debugLine="timer.Initialize(\"timer1\", 3000)";
_timer.Initialize(ba,"timer1",(long) (3000));
 //BA.debugLineNum = 20;BA.debugLine="timer.Enabled = True";
_timer.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 21;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private reef As BANanoReef";
_reef = new b4j.example.bananoreef();
 //BA.debugLineNum = 4;BA.debugLine="Private timer As Timer";
_timer = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 5;BA.debugLine="Private nameCnt As Int";
_namecnt = 0;
 //BA.debugLineNum = 6;BA.debugLine="End Sub";
return "";
}
public static String  _timer1_tick() throws Exception{
 //BA.debugLineNum = 23;BA.debugLine="Sub timer1_tick";
 //BA.debugLineNum = 24;BA.debugLine="nameCnt = nameCnt + 1";
_namecnt = (int) (_namecnt+1);
 //BA.debugLineNum = 25;BA.debugLine="Select Case nameCnt";
switch (_namecnt) {
case 1: {
 //BA.debugLineNum = 27;BA.debugLine="reef.Refresh(CreateMap(\"name\":\"Mashy\"))";
_reef._refresh /*b4j.example.bananoreef*/ (anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("name"),(Object)("Mashy")}));
 break; }
case 2: {
 //BA.debugLineNum = 29;BA.debugLine="reef.Refresh(CreateMap(\"name\":\"Ozzie\"))";
_reef._refresh /*b4j.example.bananoreef*/ (anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("name"),(Object)("Ozzie")}));
 break; }
case 3: {
 //BA.debugLineNum = 31;BA.debugLine="reef.Refresh(CreateMap(\"name\":\"Orio\"))";
_reef._refresh /*b4j.example.bananoreef*/ (anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("name"),(Object)("Orio")}));
 break; }
case 4: {
 //BA.debugLineNum = 33;BA.debugLine="reef.Refresh(CreateMap(\"name\":\"Ernesto\"))";
_reef._refresh /*b4j.example.bananoreef*/ (anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("name"),(Object)("Ernesto")}));
 break; }
case 5: {
 //BA.debugLineNum = 35;BA.debugLine="reef.Refresh(CreateMap(\"greeting\":\"Good day\", \"n";
_reef._refresh /*b4j.example.bananoreef*/ (anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("greeting"),(Object)("Good day"),(Object)("name"),(Object)("Anele Mbanga")}));
 //BA.debugLineNum = 36;BA.debugLine="nameCnt = 0";
_namecnt = (int) (0);
 break; }
}
;
 //BA.debugLineNum = 38;BA.debugLine="End Sub";
return "";
}
}
