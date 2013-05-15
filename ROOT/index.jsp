<%@ page import="java.net.*"%>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/bottom_line2.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
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
          setCookie("saveid", form.scmid.value, expdate);
   }
 function getid(form) {
     form.checksaveid.checked = ((form.scmid.value = getCookie("saveid")) != "");
  }
function init()
{
	frmMain.scmid.focus();
}

function Login() {
	scmid = frmMain.scmid.value;
	passwd = frmMain.passwd.value;
	if( scmid.length > 0 )
		if( passwd.length > 0 )
			frmMain.submit();
		else {
			frmMain.passwd.focus();
			alert('Please input your password!');
		}
	else {
		frmMain.scmid.focus();
		alert('Please input Your id and password!');
	}
}

function bookmark() {
    var now = new Date(), x;
    now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000);
    now = now.toGMTString();

    x = document.cookie.toLowerCase().indexOf("bookmark");
    if(x == -1){
        document.cookie = 'bookmark = SEBIN-Supply Chain Management Home;expires=' + now + ';';
        window.external.AddFavorite("http://www.sebin2098.com", document.title);
    init();
    }
}
</SCRIPT>	
<HEAD>
<link rel="shortcut icon" type="image/ico" href="/img/sebin.ico" />	
<TITLE>Supply Chain Management</TITLE>
<LINK rel="shortcut icon" href="favicon.ico">
<LINK rel=stylesheet type=text/css href="/login/body-sheet.css">
</HEAD>
<BODY onLoad="getid(document.frmMain)" dir=ltr text=#000000 background="/img/bgimage3.jpg" >
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%"  >
  <TBODY>
  <TR>
    <TD height=22 align=middle>
      </TD></TR>
  <TR>
    <TD align=middle>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="800" align=center height=70 bgColor="#E6E6E6">
        <TBODY >
        <TR>
          <TD  width="5%">&nbsp;</TD>
          <TD  width="36%" align=middle><font size='4' face="Century Gothic" color="#585858" ><b>Welcome to Supply Chain Management </b></font><!--IMG border=0  src="/login/log-scm.gif"--></A></TD>
          <!--TD width="5%">&nbsp;</TD-->
          <TD  height=70 vAlign=center width="35%" align=middle></TD>
          <TD vAlign=top width="40%">
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%"   height=70 bgColor="#E6E6E6"><TBODY>
              <TR>
                <TD class="fontfamilyverdana normal12white" vAlign=bottom  width="94%" align=right>
                  <TABLE border=0 cellSpacing=4 cellPadding=0 align=right  height=21 >
                    <TBODY >
                    <TR>
                      <TD height=24>
                      	<TABLE border=0 cellSpacing=0 cellPadding=0 width=180 bgColor="#E6E6E6">
                          <TBODY>
                          <TR>
                          	<TD align=middle><font face="Century Gothic" size=2><A class="fontfamilyverdana smalltext11" href="/terms.html">Terms & Conditions</A></font></TD>
                            <TD align=middle><font face="Century Gothic" size=2><A class="fontfamilyverdana smalltext11" href="/disclaimer.html">Disclaimer</A></font></TD></TR></TBODY></TABLE></TD>
                      <TD>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=90 height=20 bgColor="#E6E6E6"">
                          <TBODY>
                          <TR>
                            <TD align=middle><A class="fontfamilyverdana smalltext11" href="/contactus.html">Contact us</font></A></TD></TR></TBODY></TABLE></TD>
                 <TD width=5>&nbsp;</TD></TR></TBODY></TABLE></TD>
                <TD vAlign=top width="6%" colSpan=2 align=right></TD>
                </TR>
                <tr>
                    <td height="26" colspan="3" align=right ><A class="fontfamilyverdana smalltext11" href="/admin/index.jsp">Sebin users login<IMG border=0  src="/img/admin.gif"></a>&nbsp;&nbsp;&nbsp;</td>
                </tr></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="800" align=center bgColor="#E6E6E6">
  <TBODY>
  <TR>
    <TD height=1></TD></TR></TBODY></TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="800" align=center bgColor="#E6E6E6">
  <TBODY >
  <TR>
    <TD vAlign=top width=800>
      <DIV><B class=lightbluecorner><B class=lightbluecorner1><B></B></B><B 
      class=lightbluecorner2><B></B></B><B class=lightbluecorner3></B><B 
      class=lightbluecorner4></B><B class=lightbluecorner5></B></B>
      <DIV class=lightbluecornerfg><!-- content goes here -->
      <TABLE class=padingrightleft border=0 cellSpacing=3 cellPadding=0 width="99%" align=center bgColor="#E6E6E6">
        <TBODY>
        <TR>
          <TD>
            <!-- content goes here -->
            <TABLE border=0 cellSpacing=2 cellPadding=0 width="99%"  align=center bgColor="#E6E6E6">
              <TBODY>
              <TR>
                <TD vAlign=top width="63%">
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=524  align=center>
                    <TBODY>
                    <TR>
                      <TD class="fontfamilyverdana bgtextorange" height=67 vAlign=bottom></TD></TR>
                    <TR>
                      <TD height=186><!--<img src="images/share-to-friends.jpg" width="396" height="150" />-->
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
												</object>	</TD></TR></TBODY></TABLE>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=522 align=center bgColor="#E6E6E6">
                    <TBODY>
                    <TR>
                      <TD height=60 width=502 align=left><SPAN class="fontfamilyverdana normal12blue">
                         </SPAN></TD></TR></TBODY></TABLE><BR></TD>
                <TD vAlign=top width="37%">
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" height=29 bgColor="#E6E6E6">
                    <TBODY>
                    <TR>
                      <TD class="fontfamilyverdana textorange16" width="93%" align=left>&nbsp;&nbsp;<FONT size=4>Buyer Login</FONT></TD>
                      <TD class="fontfamilyverdana textorange16" width="7%"  align=right><A  href="login_first.html" target=_blank></A></TD></TR>
                   </TBODY></TABLE>
                   <B class=lightbluecorner><B class=lightbluecorner1><B></B></B><B class=lightbluecorner2><B></B></B><B class=lightbluecorner3></B><B class=lightbluecorner4></B><B class=lightbluecorner5></B></B>
                  <DIV class=lightbluecornerfg><!-- content goes here -->
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" height=190 bgColor="#E6E6E6">
                    <TBODY>
                    <TR>
                      <TD vAlign=top>
                        <FORM ACTION="login.jsp" NAME=frmMain METHOD=POST>
                        <TABLE border=0 cellSpacing=3 cellPadding=0 width="87%"  align=center >
                          <TBODY>
                          <TR>
                            <TD class="fontfamilyverdana error" height=25  vAlign=center colSpan=3 align=middle></TD></TR>
                          <TR>
                            <TD class="fontfamilyverdana normal12blue" width="30%" align=right>Buyer ID : </TD>
                            <TD height=25 colSpan=2 align=left><INPUT TYPE=TEXT NAME=scmid SIZE=15 MAXLENGTH=15 style="width: 100px;border:1px solid #5BA3C1;font-size:9pt;"></TD></TR>
                          <TR>
                            <TD class="fontfamilyverdana normal12blue"  width="30%"  align=right>Password : </TD>
                            <TD height=25 colSpan=2 align=left><INPUT TYPE=PASSWORD NAME=passwd SIZE=15 MAXLENGTH=15 style="width: 100px;border:1px solid #5BA3C1;font-size:9pt;"></TD></TR>
                          <TR>
                            <TD>&nbsp;</TD>
                            <TD width="5%"> <input type="checkbox" name="checksaveid" onClick="saveid(this.form)"></TD>
                            <TD class="fontfamilyverdana smalltext11"  width="73%">Remember Me </TD></TR>
                          <TR>
                            <TD>&nbsp;</TD>
                            <TD colSpan=2>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 width=60>
                                <TBODY>
                                <TR>
                                <TD align=middle><INPUT TYPE=BUTTON VALUE="Login" ONCLICK="JavaScript:Login()">                                 
                                </TD>
                                </TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>&nbsp;</TD>
                            <TD class="fontfamilyverdana smalltext11" 
                              colSpan=2><a class="fontfamilyverdana smalltext11" href="mailto:scm@sebin2098.com?subject=SCM Request for lost user password">Forgot your password?</A></TD></TR></TBODY></TABLE></FORM></TD></TR>
                              </TBODY></TABLE></DIV><B class=lightbluecorner><B class=lightbluecorner5></B><B class=lightbluecorner4></B><B class=lightbluecorner3></B>
                              	<B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor="#E6E6E6">
                    <TBODY>
                    <TR>
                      <TD height=5></TD></TR></TBODY></TABLE>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor="#E6E6E6">
                    <TBODY>
                    <TR>
                      <TD vAlign=top>
                        <TABLE border=0 cellSpacing=3 cellPadding=0 width="87%"  align=center bgColor="#E6E6E6">
                          <TBODY>
                          <TR>
                            <TD height=19 colSpan=3 align=middle><SPAN  class="fontfamilyverdana normal12blue"><IMG border=0 alt=Help src="/login/easy.gif" >Easy to access? </SPAN></TD></TR>
                          <TR>
                            <TD height=39 vAlign=top colSpan=3 align=middle><a class="fontfamilyverdana smalltext11" href="JavaScript:bookmark()">Add&nbsp;to my favorite sites</a>
                  </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV><B class=lightbluecorner><B class=lightbluecorner5></B><B class=lightbluecorner4></B><B class=lightbluecorner3></B>
                  	<B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B></TD></TR></TBODY></TABLE></DIV>
                  		<B class=whitecornerlightbluebg><B class=whitecornerlightbluebg5></B>
                  			<B class=whitecornerlightbluebg4></B><B class=whitecornerlightbluebg3></B><B class=whitecornerlightbluebg2><B></B></B>
                  			<B  class=whitecornerlightbluebg1><B></B></B></B></DIV></TD></TR></TBODY></TABLE></DIV><B class=lightbluecorner><B class=lightbluecorner5></B>
                  				<B  class=lightbluecorner4></B><B class=lightbluecorner3></B><B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B></DIV></TD></TR>
                  					</TBODY></TABLE>
</TR>
</TBODY>
</TABLE>

<!--TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" align=center >
<tr><td width='100%' height='50' align='center'>
  <DIV class=links><SPAN class=first><A class="fontfamilyverdana smalltext11" href="/contactus.html">Contact Us</A></SPAN>	
	<SPAN class=divider>::</SPAN> <SPAN><A href="/security.html" class="fontfamilyverdana smalltext11">Security</A></SPAN>
	<SPAN class=divider>::</SPAN> <SPAN><A href="/terms.html" class="fontfamilyverdana smalltext11">Terms & Conditions</A></SPAN>
	<SPAN class=divider>::</SPAN> <SPAN><A href="/disclaimer.html" class="fontfamilyverdana smalltext11">Disclaimer</A></SPAN>
	<SPAN class=divider>::</SPAN> <SPAN><a href="mailto:info@sebin2098.com" class="fontfamilyverdana smalltext11">Enquires</A></SPAN>
</DIV>
</td></tr>
</table-->
<%
out.println(CopyRightLogo());
%>
  </td></tr>
</table>
</BODY>
</HTML>
