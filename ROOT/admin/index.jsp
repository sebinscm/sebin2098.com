<%@ page import="java.net.*"%>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/bottom_line2.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link rel="shortcut icon" type="image/ico" href="/img/sebin.ico" />		
<TITLE>Administration - Supply Chain Management </TITLE>
<META content="text/html; charset=ks_c_5601-1987" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="/login/ssw_styles.css">
<STYLE type=text/css>.style1 {
	FONT-SIZE: 16px
}
.sec_head {
	LINE-HEIGHT: 20px; BACKGROUND-COLOR: #dddddd; PADDING-LEFT: 10px; FONT-FAMILY: Geneva, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 13px; FONT-WEIGHT: bold
}
</STYLE>
<LINK rel=stylesheet type=text/css href="new_login_files/mainstyle.css">
<SCRIPT type=text/javascript src="/login/jquery-1.js"></SCRIPT>
<LINK rel=stylesheet type=text/css href="new_login_files/featuredcontentglider.css">
<SCRIPT type=text/javascript src="new_login_files/featuredcontentglider.js"></SCRIPT>
<LINK rel=stylesheet type=text/css href="/login/addthis_widget.css" media=all><!--next end --><!--Zoom end -->
<SCRIPT type=text/javascript src="/login/highslide.js"></SCRIPT>

<STYLE type=text/css>.highslide-wrapper DIV {
	FONT-FAMILY: Verdana, Helvetica; FONT-SIZE: 10pt
}
.highslide {
	OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: medium; CURSOR: url(/login/zoomin.cur), pointer; TEXT-DECORATION: none
}
.highslide-active-anchor IMG {
	VISIBILITY: hidden
}
.highslide IMG {
	
}
.highslide:hover IMG {
	BORDER-BOTTOM-COLOR: silver; BORDER-TOP-COLOR: silver; BORDER-RIGHT-COLOR: silver; BORDER-LEFT-COLOR: silver
}
.highslide-wrapper {
	BACKGROUND: white
}
.drop-shadow {
	BACKGROUND: white
}
.highslide-image {
	BORDER-BOTTOM: white 1px solid
}
.highslide-image-blur {
	
}
.highslide-caption {
	BORDER-BOTTOM: white 1px solid; PADDING-BOTTOM: 5px; BACKGROUND-COLOR: silver; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; DISPLAY: none; FONT-FAMILY: Verdana, Helvetica; FONT-SIZE: 10pt; PADDING-TOP: 5px
}
.highslide-loading {
	border:1px solid black; BACKGROUND-IMAGE: url('/login/loader.white.gif'); PADDING-BOTTOM: 2px; BACKGROUND-COLOR: white; PADDING-LEFT: 22px; PADDING-RIGHT: 2px; DISPLAY: block; BACKGROUND-REPEAT: no-repeat; FONT-FAMILY: sans-serif; BACKGROUND-POSITION: 3px 1px; COLOR: black; FONT-SIZE: 8pt; FONT-WEIGHT: bold; TEXT-DECORATION: none; PADDING-TOP: 2px
}
A.highslide-credits {
	PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; COLOR: silver; FONT-SIZE: 10px; TEXT-DECORATION: none; PADDING-TOP: 2px
}
A.highslide-credits I {
	PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; COLOR: silver; FONT-SIZE: 10px; TEXT-DECORATION: none; PADDING-TOP: 2px
}
A.highslide-credits:hover {
	BACKGROUND-COLOR: gray; COLOR: white
}
A.highslide-credits:hover I {
	BACKGROUND-COLOR: gray; COLOR: white
}

.highslide-overlay {
	DISPLAY: none
}

</STYLE>
</HEAD>
<BODY onLoad="getid(document.frmMain)" background="/img/bgimg3.gif">
<script src="script/fieldval.js"></script>	
<SCRIPT for="document" event="onkeypress">
if (window.event.keyCode==13)
{
        login()
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
function ValidEntry()
{
	if(document.sign_top.adminid.value == "")
	{
		alert("Please Enter User ID!");
		document.sign_top.adminid.focus();
		return false;
	}
	if(document.sign_top.passwd.value == "")
	{
		alert("Please Enter password!");
		document.sign_top.passwd.focus();
		return false;
	}
	
	
}

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

 function saveid() {
      var expdate = new Date();

        if (document.sign_top.checksaveid.checked  )
          expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 60);
        else
          expdate.setTime(expdate.getTime() - 1);
          setCookie("saveid", document.sign_top.adminid.value, expdate);
   }
 function getid() {
     document.sign_top.checksaveid.checked = ((document.sign_top.adminid.value = getCookie("saveid")) != "");
  }
function init()
{
	document.sign_top.adminid.focus();
}


function bookmark() {
    var now = new Date(), x;
    now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000);
    now = now.toGMTString();

    x = document.cookie.toLowerCase().indexOf("bookmark");
    if(x == -1){
        document.cookie = 'bookmark = ADMIN - Supply Chain Management ;expires=' + now + ';';
        window.external.AddFavorite("http://www.sebin2098.com/admin", document.title);
    init();
    }
}

</SCRIPT>
<LINK rel=stylesheet type=text/css href="/login/ssw_styles.css">
<BR>
<BR>
<BR>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=700 align=center  bgcolor="white">
	<FORM id=sign_top onsubmit="return ValidEntry();" method=post  name=sign_top action=login.jsp>
  <TBODY>
  <TR>
    <TD width=600 height="40"><b>
    <font size="4" face="BankGothic Md BT" color="#5F4C0B"> &nbsp;&nbsp;&nbsp; Welcome to Supply  Chain Management</font></b></TD>
    <TD vAlign=bottom width=100 align=right height="40">
    <img border="0" src="/img/sebin_mid.jpg" height="40"></TD></TR>
  <TR>
    <TD height="150" colspan=2 ><IMG src="/login/banner.jpg" width=700 height=150></TD>    
   </TR>
  <TR>
    <TD class=menu_style colSpan=2 height="30">&nbsp;<A href="/terms.html">Terms & Condition </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<A href="/disclaimer.html" >Disclamier </A> &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;
    	 <A href="/contactus.html">Contact us</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<A href="/index.jsp"  target=_top>Buyers login </A>&nbsp;&nbsp; 
  </TD>
  </TR>
  </TBODY>
 </TABLE>
<TABLE bgcolor="#E8EDB8" border=0 cellSpacing=0 cellPadding=0 width=700 align=center height="180"  >
  <TBODY >
  <TR>    
    <TD  style="PADDING-BOTTOM: 5px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 5px" rowSpan=2 width=384 align=middle height="202" background="/img/bgimage.jpg">
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=400 height="265" bgcolor="#E8EDB8" style="border-collapse: collapse" bordercolor="#111111">
        <TBODY>
        <TR >
          <TD align=middle height="265"  background="/img/bgimage.jpg"><div>	
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="421" height="255">
					  <param name="movie" value="../img/slide.swf" />
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
					</object></div>
			</TD></TR>
        </TBODY>
        </TABLE>
    </TD>
    <TD  5px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 5px" rowSpan=2 width=384 align=middle height="202" background="/img/bgimage.gif">
      <TABLE border=0 cellSpacing=0 cellPadding=0 >
      	<TR>
          <TD colspan=2 height=30 ><b><font size=2 color='#58ACFA'>&nbsp;&nbsp;&nbsp;&nbsp; SEBIN staff/admin Login</font><b></TD>          
        </TR>
        <TR>
          <TD width="29%"><font size=2 color=white>&nbsp; User ID &nbsp;</font></TD>
          <TD width="71%"><INPUT class=formFileds size=20 type=text name=adminid></TD>
        </TR>
        <TR>
          <TD><font size=2 color=white>Password &nbsp;</font></TD>
          <TD><INPUT class=formFileds size=20 TYPE=PASSWORD name=passwd></TD>
        </TR>
        <TR>
          <TD align=center colspan=2 height=30><INPUT src="/img/btn_login.png"  type=image></TD>
         </TR>
          <TR>
          	<TD width="30%"> </TD>
          <TD width="50%" align=left > <SPAN ><font size=2 color=yellow>Remember Me</font> <input  type="checkbox" name="checksaveid" onClick="saveid()"></SPAN></TD>
        </TR>
       </TABLE>
      </TD>
 </form>  
</TABLE> 
<BR>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=950 align=center>
  <TBODY>
  	<%
out.println(CopyRightLogo());
%>
  </TBODY></TABLE></BODY></HTML>