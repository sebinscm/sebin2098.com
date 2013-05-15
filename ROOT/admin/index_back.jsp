<%@ page import="java.net.*"%>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/bottom_line.jsp" %>

<HTML>
<SCRIPT for="document" event="onkeypress">
if (window.event.keyCode==13)
{
        Login()
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">

function setCookie (name, value, expires) {
      document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
  }

    function getCookie(Name) {
      var search = Name + "="
        if (document.cookie.length > 0) {
          offset = document.cookie.indexOf(search)
          if (offset != -1) {
            offset += search.length

            end = document.cookie.indexOf(";", offset)

            if (end == -1)
              end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
         }
      }
      return "";
   }

 function saveid(form) {
      var expdate = new Date();

        if (form.checksaveid.checked  )
          expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 60);
        else
          expdate.setTime(expdate.getTime() - 1);
          setCookie("saveid", form.adminid.value, expdate);
   }
 function getid(form) {
     form.checksaveid.checked = ((form.adminid.value = getCookie("saveid")) != "");
  }
function init()
{
	frmMain.adminid.focus();
}

function Login() {
	adminid = frmMain.adminid.value;
	password = frmMain.password.value;
	if( adminid.length > 0 )
		if( password.length > 0 )
			frmMain.submit();
		else {
			frmMain.password.focus();
			alert('Input password!');
		}
	else {
		frmMain.adminid.focus();
		alert('Input Your id and password!');
	}
}

function bookmark() {
    var now = new Date(), x;
    now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000);
    now = now.toGMTString();

    x = document.cookie.toLowerCase().indexOf("bookmark");
    if(x == -1){
        document.cookie = 'bookmark = Fast Future Brands Supply Chain Management Home;expires=' + now + ';';
        window.external.AddFavorite("http://scm.valleygirl.com.au", document.title);
    init();
    }
}
</SCRIPT>
<HEAD>
<link rel="shortcut icon" type="image/ico" href="../img/FFB2.ico" />	
<TITLE>Supply Chain Management : Fast Future Brands Fashions Pty. Ltd.</TITLE>
</HEAD>
<BODY onLoad="getid(document.frmMain)" topmargin=0 leftmargin=0>
<center>
<TABLE border=0 cellPadding=0 cellSpacing=0 class=pgCnt width="772" height="86">
  <TR>
    <TD class=tbBg vAlign=top width="800" height="85">
      <TABLE border=0 cellPadding=0 cellSpacing=0 class=tbBg width="798" height="85" style="border-collapse: collapse" bordercolor="#111111">
        <TBODY>
        <TR>
          <TD width=288 height="85"></a>
          <img border="0" src="../img/FFB_small_logo.gif" ></TD>
          <TD width=287 height="85">
          <img border="0" src="../img/header_1.gif" width="350" height="60"></TD>
          <TD width=242 height="85">
          <img border="0" src="../img/header_2.gif" width="237" height="60"></TD>
          <TD vAlign=top width="14" height="85"></TD></TR>
        </TBODY></TABLE></TD>
  </TR>
  <TR>
    <TD class=tbCmdBg width=1261 height="1">
    <p align="right">&nbsp;<b><font face="Century Gothic"> <font color="#5BA3C1">
    Welcome Supply Chain Management for Administration</font></font></b></p>
      <TABLE border=0 cellPadding=0 cellSpacing=0 class=tbCmdBg width="800" style="border-collapse: collapse" bordercolor="#111111" bgcolor="#FFFFFF">
        <TBODY>
        <TR>
          <TD width=31 bordercolor="#FFFFFF"></TD></TR></TBODY></TABLE> </TD>
    </TR></TABLE>
<CENTER>
<TABLE WIDTH=794 HEIGHT=260>
<TR>
<TD WIDTH=390><img border="0" src="../img/scm-admin2.jpg" ></TD>
<TD WIDTH=276 ALIGN=CENTER>
<FORM ACTION="login.jsp" NAME=frmMain METHOD=POST>
<TABLE>
<TR><TD ALIGN=RIGHT><font size="2" face="Arial">Admin ID</font></TD>
<TD><INPUT TYPE=TEXT NAME=adminid SIZE=10 MAXLENGTH=10 style="width: 85px;border:1px solid #5BA3C1;font-size:9pt;"></TD>
</TR><TR>
<TD ALIGN=RIGHT><FONT SIZE=2 face="Arial">Password</font></TD>
<TD><INPUT TYPE=PASSWORD NAME=password SIZE=10 MAXLENGTH=10 style="width: 85px;border:1px solid #5BA3C1;font-size:9pt;"></TD>
</TR><TD width=50></TD><TD ALIGN=Center><FONT SIZE=2><INPUT TYPE=BUTTON VALUE="Login" ONCLICK="JavaScript:Login()"></TD><TR>
<TR><TD COLSPAN=2 ALIGN=Center><font size=2 color=blue>Remember Me</font> <input type="checkbox" name="checksaveid" onClick="saveid(this.form)"></TD>
<TR><TD COLSPAN=2><font size=1 color=red>Forgotten your password?</font><font size=1 color=black>&nbsp;click&nbsp;<a href="mailto:systemadmin@fastfuturebrands.com.au?subject=SCM Request for lost user password">here</a>&nbsp;to request</font></td>	
</TR>		
<TD COLSPAN=2 ALIGN=CENTER>
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
    <td width="75%"><font size="1"><br>
      <font face="Arial">
      Supply Chain Management (SCM) System allows you to improve communications, while simultaneously
      forming tighter&nbsp; relationships with upstream vendors.&nbsp;<br>
  We are now using workflow automation, performance management, advanced planning engines and order management to improve&nbsp;<br>
 order fulfillment processes across the supply chain. As a result, many of the unnecessary and lengthy delays prevalent in today's<br>
      &nbsp;fulfillment process are virtually eliminated.<br>
      It is now possible to efficiently promise, plan, source and fulfill purchase order at a time across your entire supply chain.</font></font></td>
    <td width="17%"></td>
  </tr>
  <br>
</table>
<br><br>
<p>
<font size=2 color=green> This website is best viewed with a screen resolution setting of 1024 x 768 pixels.</font>
<p>
<%
out.println(CopyRightLogo());
%>
</BODY>
</HTML>
