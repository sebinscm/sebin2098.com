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
<TITLE>Supply Chain Management | Sebin Enterprise Co,. Ltd.</TITLE>
<LINK rel="shortcut icon" href="favicon.ico">
<LINK rel=stylesheet type=text/css  href="/login/body-sheet.css">
</HEAD>
<BODY dir=ltr>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#00899b>
  <TBODY>
  <TR>
    <TD height=22 align=middle>
      </TD></TR>
  <TR>
    <TD align=middle>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center height=70 >
        <TBODY>
        <TR>
          <TD bgColor=#ffffff width="5%">&nbsp;</TD>
          <TD bgColor=#ffffff width="16%" align=middle><A  href="/admin/index.jsp"><IMG border=0  src="/login/log-scm.gif"></A></TD>
          <TD bgColor=#ffffff width="5%">&nbsp;</TD>
          <TD bgColor=#ffffff height=80 vAlign=center width="47%" align=middle></TD>
          <TD bgColor=#ffffff vAlign=top width="27%">
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
              height=70><TBODY>
              <TR>
                <TD class="fontfamilyverdana normal12white" vAlign=bottom  width="94%" align=right>
                  <TABLE border=0 cellSpacing=4 cellPadding=0 align=right  height=21 >
                    <TBODY>
                    <TR>
                      <TD height=24>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=190 >
                          <TBODY>
                          <TR>
                            <TD align=middle><font face="Century Gothic" size=2><A href="/terms.html">Terms & Conditions</A></font></TD></TR></TBODY></TABLE></TD>
                      <TD>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=90 height=20 >
                          <TBODY>
                          <TR>
                            <TD align=middle><A href="/admin/disclaimer.html"><font face="Century Gothic" size=2>Disclaimer</font></A></TD></TR></TBODY></TABLE></TD>
                      <TD width=5>&nbsp;</TD></TR></TBODY></TABLE></TD>
                <TD vAlign=top width="6%" colSpan=2 align=right><IMG src="/login/headcorner.gif"  width=16 height=14></TD></TR><!--<tr>
                <td height="26" colspan="3">&nbsp;</td>
              </tr>--></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD height=1></TD></TR></TBODY></TABLE>

<TABLE border=1 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD vAlign=top width=990>
      <DIV><B class=lightbluecorner><B class=lightbluecorner1><B></B></B><B 
      class=lightbluecorner2><B></B></B><B class=lightbluecorner3></B><B 
      class=lightbluecorner4></B><B class=lightbluecorner5></B></B>
      <DIV class=lightbluecornerfg><!-- content goes here -->
      <TABLE class=padingrightleft border=0 cellSpacing=3 cellPadding=0  width="99%" align=center>
        <TBODY>
        <TR>
          <TD>
            <DIV><B class=whitecornerlightbluebg><B 
            class=whitecornerlightbluebg1><B></B></B><B 
            class=whitecornerlightbluebg2><B></B></B><B 
            class=whitecornerlightbluebg3></B><B 
            class=whitecornerlightbluebg4></B><B 
            class=whitecornerlightbluebg5></B></B>
            <DIV class=whitecornerlightbluebgfg><!-- content goes here -->
            <TABLE border=0 cellSpacing=2 cellPadding=0 width="99%"  align=center>
              <TBODY>
              <TR>
                <TD vAlign=top width="63%">
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=524  align=center>
                    <TBODY>
                    <TR>
                      <TD class="fontfamilyverdana bgtextorange" height=67  vAlign=bottom><font SIZE=4 color="#FFFFFF" face="Century Gothic" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Welcome to Supply Chain Management </B></font></TD></TR>
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
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=522 align=center>
                    <TBODY>
                    <TR>
                      <TD height=60 width=502 align=left><SPAN class="fontfamilyverdana normal12blue">
                         </SPAN></TD></TR></TBODY></TABLE><BR></TD>
                <TD vAlign=top width="37%">
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" height=29>
                    <TBODY>
                    <TR>
                      <TD class="fontfamilyverdana textorange16" width="93%" align=left>&nbsp;&nbsp;<FONT size=4>Buyer Login</FONT></TD>
                      <TD class="fontfamilyverdana textorange16" width="7%"  align=right><A  href="login_first.html" target=_blank><IMG border=0 alt=Help src="/login/pass2.jpg" ></A></TD></TR>
                   </TBODY></TABLE>
                   <B class=lightbluecorner><B class=lightbluecorner1><B></B></B><B class=lightbluecorner2><B></B></B><B class=lightbluecorner3></B><B class=lightbluecorner4></B><B class=lightbluecorner5></B></B>
                  <DIV class=lightbluecornerfg><!-- content goes here -->
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                  height=190>
                    <TBODY>
                    <TR>
                      <TD vAlign=top>
                        <FORM ACTION="login.jsp" NAME=frmMain METHOD=POST>
                        <TABLE border=0 cellSpacing=3 cellPadding=0 width="87%"  align=center>
                          <TBODY>
                          <TR>
                            <TD class="fontfamilyverdana error" height=25  vAlign=center colSpan=3 align=middle></TD></TR>
                          <TR>
                            <TD class="fontfamilyverdana normal12blue" width="30%" align=right>Buyer Id : </TD>
                            <TD height=25 colSpan=2 align=left><INPUT TYPE=TEXT NAME=scmid value=<%=ag_id%> SIZE=28 MAXLENGTH=28 ></TD></TR>
                          <TR>
                            <TD class="fontfamilyverdana normal12blue"  align=right>Password : </TD>
                            <TD height=25 colSpan=2 align=left><INPUT TYPE=PASSWORD value=<%=ag_pwd%> NAME=passwd SIZE=30 MAXLENGTH=30 ></TD></TR>
                          <TR>
                            <TD>&nbsp;</TD>
                            <TD width="5%"> <input type="checkbox" name="checksaveid" onClick="saveid(this.form)"></TD>
                            <TD class="fontfamilyverdana smalltext11"  width="73%">Remember Me </TD></TR>
                          <TR>
                            <TD>&nbsp;</TD>
                            <TD colSpan=2>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 width=60>
                                <TBODY>
                                <TR>
                                <TD align=middle><INPUT TYPE=BUTTON VALUE="Login" ONCLICK="JavaScript:Login()"> 
                                <!--INPUT value=LOGIN type=hidden name=action > 
                                <INPUT type=hidden name=uid> <INPUT type=hidden name=red-->
                                </TD>
                                </TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>&nbsp;</TD>
                            <TD class="fontfamilyverdana smalltext11" 
                              colSpan=2><a class="fontfamilyverdana smalltext11" href="mailto:scm@ffb.net.au?subject=SCM Request for lost user password">Forgot your password?</A></TD></TR></TBODY></TABLE></FORM></TD></TR>
                              </TBODY></TABLE></DIV><B class=lightbluecorner><B class=lightbluecorner5></B><B class=lightbluecorner4></B><B class=lightbluecorner3></B>
                              	<B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD height=5></TD></TR></TBODY></TABLE><B  class=lightbluecorner><B class=lightbluecorner1><B></B></B><B class=lightbluecorner2><B></B></B>
                      	<B class=lightbluecorner3></B><B class=lightbluecorner4></B><B class=lightbluecorner5></B></B>
                  <DIV class=lightbluecornerfg><!-- content goes here -->
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD vAlign=top>
                        <TABLE border=0 cellSpacing=3 cellPadding=0 width="87%"  align=center>
                          <TBODY>
                          <TR>
                            <TD height=19 colSpan=3 align=middle><SPAN  class="fontfamilyverdana normal12blue"><IMG border=0 alt=Help src="/login/easy.gif" >Easy to access? </SPAN></TD></TR>
                          <TR>
                            <TD height=39 vAlign=top colSpan=3 align=middle><a class="fontfamilyverdana smalltext11" href="JavaScript:bookmark()">Add&nbsp;to my favorite sites</a>
                  </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV><Bclass=lightbluecorner><B class=lightbluecorner5></B><B class=lightbluecorner4></B><B class=lightbluecorner3></B>
                  	<B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B></TD></TR></TBODY></TABLE></DIV>
                  		<B class=whitecornerlightbluebg><B class=whitecornerlightbluebg5></B>
                  			<B class=whitecornerlightbluebg4></B><B class=whitecornerlightbluebg3></B><B class=whitecornerlightbluebg2><B></B></B>
                  			<B  class=whitecornerlightbluebg1><B></B></B></B></DIV></TD></TR></TBODY></TABLE></DIV><B class=lightbluecorner><B class=lightbluecorner5></B>
                  				<B  class=lightbluecorner4></B><B class=lightbluecorner3></B><B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B></DIV></TD></TR>
                  					</TBODY></TABLE>
</TR>
</TBODY>
</TABLE>
<TABLE WIDTH=794 HEIGHT=50 align=center>
	  <tr><TD>
    <font size="1"><br>
      <font face="Century Gothic" color="#585858" >
      Supply Chain Management(SCM) solution optimises your supply chain and improves your business processes.
      SCM is a powerful tool allowing the delivery of the right product, to the right place at the right time and at the right price. 
      As the internet matured into a viable commercial platform, SCM evolved into what is now known as e-SCM.  
      Web based supply chain management systems permit companies to optimize business processes both within and outside of their company walls. 
</font></font></td>
   </TD>
  </tr>
  <br>
</table>
 <%
out.println(CopyRightLogo());
%>
</BODY>
</HTML>
