<%@ page import="java.net.*"%>
<%@ page errorPage="error.jsp" %>
<%@ include file="bottom_line.jsp" %>
<%
if (!session.isNew()) session.invalidate();

String ag_id = request.getParameter("ag_id");
String ag_pwd = request.getParameter("ag_pwd");
%>
<HTML>
<SCRIPT for="document" event="onkeypress">
if (window.event.keyCode==13)
{
        Login()
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
function init()
{
	frmMain.scmid.focus();
}
function NUser() {
	frmMain.method="GET";
	frmMain.action="new_user.html";
	frmMain.submit();
}
function NShop() {
	frmMain.action="new_shop.jsp";
	frmMain.submit();
}
function Login() {
	scmid = frmMain.scmid.value;
	passwd = frmMain.passwd.value;
	if( scmid.length > 0 )
		if( passwd.length > 0 )
			frmMain.submit();
		else {
			frmMain.passwd.focus();
			alert('Input password!');
		}
	else {
		frmMain.scmid.focus();
		alert('Input Your id and password!');
	}
}
function Manual()
{
	frmMain.method = "GET";
	frmMain.action = "/umanual/Manual.htm";
	frmMain.submit();
}
function bookmark() {
    var now = new Date(), x;
    now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000);
    now = now.toGMTString();

    x = document.cookie.toLowerCase().indexOf("bookmark");
    if(x == -1){
        document.cookie = 'bookmark = Sebin Enterprise Co,. Ltd. Supply Chain Management Home;expires=' + now + ';';
        window.external.AddFavorite("http://scm.sebinenterprise.com/admin", document.title);
    init();
    }
}



</SCRIPT>
<HEAD>
<link rel="shortcut icon" type="image/ico" href="/img/FFB2.ico" />	
<TITLE>Supply Chain Management : Sebin Enterprise Co,. Ltd.</TITLE>
</HEAD>
<BODY onLoad="getid(document.frmMain)"  text=#000000 background="/img/bgimage.gif" leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<center>
<div align="center">
   <table cellspacing="0" cellpadding="0" border="0" style="width: 869; height="20" >

      <tr >
          <td width="137" height="50"></td>
          	
      </tr>
</table>
      
<TABLE WIDTH=794 HEIGHT=50>
<TR>
<td><font SIZE=4 color="#FFFFFF" face="Century Gothic" ><B>Welcome to Supply Chain Management </B></font></tr>
</TABLE>
<TABLE WIDTH=794 HEIGHT=260>	
<TABLE WIDTH=794 HEIGHT=260>
<TR>
<TD WIDTH=390><img border="0" src="/img/scm_login3.jpg"></TD>
<TD WIDTH=404 ALIGN=CENTER>
<FORM ACTION="login.jsp" NAME=frmMain METHOD=POST>
<TABLE>
<TR>
<TD ALIGN=RIGHT><font face="Century Gothic" size=2 color="#FFFFFF" ><b>Buyer ID</b></font></TD>
<TD><INPUT TYPE=TEXT NAME=scmid SIZE=10 MAXLENGTH=10 value=<%=ag_id%> style="width: 85px;border:1px solid #5BA3C1;font-size:9pt;"></TD>
</TR><TR>
<TD ALIGN=RIGHT><font face="Century Gothic" size=2 color="#FFFFFF" ><b>Password</b></font></TD>
<TD><INPUT TYPE=PASSWORD NAME=passwd SIZE=10 MAXLENGTH=10 value=<%=ag_pwd%> style="width: 85px;border:1px solid #5BA3C1;font-size:9pt;"></TD>
</TR><TR>
<TD COLSPAN=2 ALIGN=CENTER>
</TD>
</TR>
<TR>
<TD COLSPAN=2 ALIGN=right><FONT SIZE=2>
<INPUT TYPE=BUTTON VALUE="Login" ONCLICK="JavaScript:Login()">
</TD>
</TR>
</TABLE>
</FORM>

</TD></TR>

</TABLE>
</center>
<table border="0" cellpadding="0" cellspacing="0" width="84%">
  <tr>
    <td width="8%"></td>
    <td width="75%"><font face="Century Gothic" size=1 color="#FFFFFF" ><br>
      <font face="Arial">
      Supply Chain Management (SCM) e-SCM solution optimises your supply chain and improves your business processes.
      SCM is a powerful tool allowing the delivery of the right product, to the right place at the right time and at the right price. 
      As the internet matured into a viable commercial platform, SCM evolved into what is now known as e-SCM.  
      Web based supply chain management systems permit companies to optimize business processes both within and outside of their company walls. </font></font></td>
    <td width="17%"></td>
  </tr>
  <br>
</table>
<br><br>
<p>
<font size=2 color=green> This website is best viewed with a screen resolution setting of 1024 x 768 pixels.</font>
<p>
<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>
 <tr><td width='100%' height='2' align='center'>
  <HR color="#5BA3C1" width=100% size=1></td></tr>
  <tr><td width='100%' align='center'>
  <font face="Century Gothic" size=2 color="#FFFFFF" >&copy;Copyright 2011 </font>
  <font face="Century Gothic" size=2 color=green>Sebin Enterprise Co,. Ltd. All Rights Reserved.</FONT><BR>
  <font face="Century Gothic" size=2 color="#FFFFFF" > For more information,please contact &nbsp;&nbsp;<A href='mailto:scm@sebinenterprise.com'>scm@sebinenterprise.com</A></FONT>
  </td></tr></table>
</BODY>
</HTML>