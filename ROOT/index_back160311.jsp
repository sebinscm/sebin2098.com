<%@ page import="java.net.*"%>
<%@ page errorPage="error.jsp" %>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
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
          setCookie("saveid", form.scmid.value, expdate);
   }
 function getid(form) {
     form.checksaveid.checked = ((form.scmid.value = getCookie("saveid")) != "");
  }
	
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
        window.external.AddFavorite("http://scm.sebinenterprise.com", document.title);
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
<TR><!--TD><a href="http://scm.sebinenterprise.com" target="_new"><img border="0" src="../img/sebin_logo.gif" ></a></td-->
<td><font SIZE=4 color="#FFFFFF" face="Century Gothic" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Welcome to Supply Chain Management </B></font></tr>
</TABLE>
<TABLE WIDTH=794 HEIGHT=260>	
<TR>		
<TD>
<div>	
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="421" height="255">
  <param name="movie" value="/img/slide.swf" />
  <param name="quality" value="high" />
  <param name="allowFullScreen" value="true" />
  <param name="allowScriptAccess" value="always" />
  <param name="wmode" value="transparent">
  <embed src="slide.swf"
         quality="high"
         type="application/x-shockwave-flash"
         WMODE="transparent"
         width="421"
         height="255"
         allowFullScreen="true"
         pluginspage="http://www.macromedia.com/go/getflashplayer"
         allowScriptAccess="always" />
</object>	
</div>	
<!--TD WIDTH=390><img border="0" src="/img/scm_login3.jpg" ></TD-->
<TD WIDTH=404 ALIGN=CENTER>
<FORM ACTION="login.jsp" NAME=frmMain METHOD=POST>
<TABLE border=0>
<TR><TD ALIGN=RIGHT><font face="Century Gothic" size=2 color="#FFFFFF" >Buyer ID</font></TD>
<TD><INPUT TYPE=TEXT NAME=scmid SIZE=10 MAXLENGTH=10 style="width: 85px;border:1px solid #5BA3C1;font-size:9pt;"></TD>
</TR><TR>
<TD ALIGN=RIGHT><font face="Century Gothic" size=2 color="#FFFFFF" >Password</font></TD>
<TD><INPUT TYPE=PASSWORD NAME=passwd SIZE=10 MAXLENGTH=10 style="width: 85px;border:1px solid #5BA3C1;font-size:9pt;"></TD>
</TR><TD width=50></TD><TD ALIGN=Center><FONT SIZE=2><INPUT TYPE=BUTTON VALUE="Login" ONCLICK="JavaScript:Login()"></TD><TR>
<TR><TD COLSPAN=2 ALIGN=Center><font face="Century Gothic" size=2 color="#FFFFFF" >Remember Me</font> <input type="checkbox" name="checksaveid" onClick="saveid(this.form)"></TD><br>
<TR><TD COLSPAN=2><font face="Century Gothic" size=1 color="red" >Forgotten your password?</font><font face="Century Gothic" size=1 color="#FFFFFF" >&nbsp;click&nbsp;<a href="mailto:scm@ffb.net.au?subject=Request for lost user password">here</a>&nbsp;to request</font></td></TR>
<TR><TD COLSPAN=2 ALIGN=left><font face="Century Gothic" size=1 color="Yellow" ><a href="JavaScript:bookmark()">Add</a>&nbsp;to my favorite sites</font></TD></TR>
</TABLE>
</FORM>

</TD></TR>
</TABLE>
</center>
<TABLE WIDTH=794 HEIGHT=50>
	  <tr><TD>
    <font size="1"><br>
      <font face="Century Gothic" color="#FFFFFF" >
      Supply Chain Management(SCM) solution optimises your supply chain and improves your business processes.
      SCM is a powerful tool allowing the delivery of the right product, to the right place at the right time and at the right price. 
      As the internet matured into a viable commercial platform, SCM evolved into what is now known as e-SCM.  
      Web based supply chain management systems permit companies to optimize business processes both within and outside of their company walls. 
</font></font></td>
   </TD>
  </tr>
  <br>
</table>
<br><br>
<!--p>
<font face="Century Gothic" size=2 color="#FFFFFF" > This website is best viewed with a screen resolution setting of 1024 x 768 pixels.</font>
<p-->
<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>
 <tr><td width='100%' height='2' align='center'>
  <HR color="#5BA3C1" width=100% size=1></td></tr>
  <tr><td width='100%' align='center'>
  <font face="Century Gothic" size=2 color="#FFFFFF" >&copy;Copyright 2011 </font>
  <font face="Century Gothic" size=2 color=green>Sebin Enterprise Co,. Ltd. All Rights Reserved.</FONT><BR>
  <font face="Century Gothic" size=2 color="#FFFFFF" > For more information,please contact &nbsp;&nbsp;<A href='mailto:scm@sebinenterprise.com'>scm@sebinenterprise.com</A></FONT>
  </td></tr></table>
</div>
</BODY>
</HTML>
