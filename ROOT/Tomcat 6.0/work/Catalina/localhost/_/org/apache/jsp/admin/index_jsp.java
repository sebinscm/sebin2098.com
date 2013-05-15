package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


//-------------------------------------------
// CopyRightLogo
//
//-------------------------------------------
String CopyRightLogo()
{
  String str;
  str = "<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' >";
  str += "<tr><td width='100%' height='2' align='center' >";
  str += "<HR color='#5BA3C1' width=100% size=1></td></tr>";
  str += " <tr><td width='100%' align='center' ><FONT size=2 >";
  str += "&copy;Copyright 2011 ";
  str += "Sebin Trading Enterprise Co,. Ltd. All Rights Reserved.<BR>";
  str += "Contact to <FONT color=blue><A href='mailto:scm@sebin2098.com'>scm@sebin2098.com</A>";
  str += " for more information.</FONT>";
  str += "</td></tr></table>";

  return (String)str;
}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/bottom_line2.jsp");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=euc-kr");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"/error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("<HTML xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<HEAD>\r\n");
      out.write("<link rel=\"shortcut icon\" type=\"image/ico\" href=\"/img/sebin.ico\" />\t\t\r\n");
      out.write("<TITLE>Administration - Supply Chain Management </TITLE>\r\n");
      out.write("<META content=\"text/html; charset=ks_c_5601-1987\" http-equiv=Content-Type>\r\n");
      out.write("<LINK rel=stylesheet type=text/css href=\"/login/ssw_styles.css\">\r\n");
      out.write("<STYLE type=text/css>.style1 {\r\n");
      out.write("\tFONT-SIZE: 16px\r\n");
      out.write("}\r\n");
      out.write(".sec_head {\r\n");
      out.write("\tLINE-HEIGHT: 20px; BACKGROUND-COLOR: #dddddd; PADDING-LEFT: 10px; FONT-FAMILY: Geneva, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 13px; FONT-WEIGHT: bold\r\n");
      out.write("}\r\n");
      out.write("</STYLE>\r\n");
      out.write("<LINK rel=stylesheet type=text/css href=\"new_login_files/mainstyle.css\">\r\n");
      out.write("<SCRIPT type=text/javascript src=\"/login/jquery-1.js\"></SCRIPT>\r\n");
      out.write("<LINK rel=stylesheet type=text/css href=\"new_login_files/featuredcontentglider.css\">\r\n");
      out.write("<SCRIPT type=text/javascript src=\"new_login_files/featuredcontentglider.js\"></SCRIPT>\r\n");
      out.write("<LINK rel=stylesheet type=text/css href=\"/login/addthis_widget.css\" media=all><!--next end --><!--Zoom end -->\r\n");
      out.write("<SCRIPT type=text/javascript src=\"/login/highslide.js\"></SCRIPT>\r\n");
      out.write("\r\n");
      out.write("<STYLE type=text/css>.highslide-wrapper DIV {\r\n");
      out.write("\tFONT-FAMILY: Verdana, Helvetica; FONT-SIZE: 10pt\r\n");
      out.write("}\r\n");
      out.write(".highslide {\r\n");
      out.write("\tOUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: medium; CURSOR: url(/login/zoomin.cur), pointer; TEXT-DECORATION: none\r\n");
      out.write("}\r\n");
      out.write(".highslide-active-anchor IMG {\r\n");
      out.write("\tVISIBILITY: hidden\r\n");
      out.write("}\r\n");
      out.write(".highslide IMG {\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write(".highslide:hover IMG {\r\n");
      out.write("\tBORDER-BOTTOM-COLOR: silver; BORDER-TOP-COLOR: silver; BORDER-RIGHT-COLOR: silver; BORDER-LEFT-COLOR: silver\r\n");
      out.write("}\r\n");
      out.write(".highslide-wrapper {\r\n");
      out.write("\tBACKGROUND: white\r\n");
      out.write("}\r\n");
      out.write(".drop-shadow {\r\n");
      out.write("\tBACKGROUND: white\r\n");
      out.write("}\r\n");
      out.write(".highslide-image {\r\n");
      out.write("\tBORDER-BOTTOM: white 1px solid\r\n");
      out.write("}\r\n");
      out.write(".highslide-image-blur {\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write(".highslide-caption {\r\n");
      out.write("\tBORDER-BOTTOM: white 1px solid; PADDING-BOTTOM: 5px; BACKGROUND-COLOR: silver; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; DISPLAY: none; FONT-FAMILY: Verdana, Helvetica; FONT-SIZE: 10pt; PADDING-TOP: 5px\r\n");
      out.write("}\r\n");
      out.write(".highslide-loading {\r\n");
      out.write("\tborder:1px solid black; BACKGROUND-IMAGE: url('/login/loader.white.gif'); PADDING-BOTTOM: 2px; BACKGROUND-COLOR: white; PADDING-LEFT: 22px; PADDING-RIGHT: 2px; DISPLAY: block; BACKGROUND-REPEAT: no-repeat; FONT-FAMILY: sans-serif; BACKGROUND-POSITION: 3px 1px; COLOR: black; FONT-SIZE: 8pt; FONT-WEIGHT: bold; TEXT-DECORATION: none; PADDING-TOP: 2px\r\n");
      out.write("}\r\n");
      out.write("A.highslide-credits {\r\n");
      out.write("\tPADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; COLOR: silver; FONT-SIZE: 10px; TEXT-DECORATION: none; PADDING-TOP: 2px\r\n");
      out.write("}\r\n");
      out.write("A.highslide-credits I {\r\n");
      out.write("\tPADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; COLOR: silver; FONT-SIZE: 10px; TEXT-DECORATION: none; PADDING-TOP: 2px\r\n");
      out.write("}\r\n");
      out.write("A.highslide-credits:hover {\r\n");
      out.write("\tBACKGROUND-COLOR: gray; COLOR: white\r\n");
      out.write("}\r\n");
      out.write("A.highslide-credits:hover I {\r\n");
      out.write("\tBACKGROUND-COLOR: gray; COLOR: white\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".highslide-overlay {\r\n");
      out.write("\tDISPLAY: none\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</STYLE>\r\n");
      out.write("</HEAD>\r\n");
      out.write("<BODY onLoad=\"getid(document.frmMain)\" background=\"/img/bgimg3.gif\">\r\n");
      out.write("<script src=\"script/fieldval.js\"></script>\t\r\n");
      out.write("<SCRIPT for=\"document\" event=\"onkeypress\">\r\n");
      out.write("if (window.event.keyCode==13)\r\n");
      out.write("{\r\n");
      out.write("        login()\r\n");
      out.write("}\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\r\n");
      out.write("function ValidEntry()\r\n");
      out.write("{\r\n");
      out.write("\tif(document.sign_top.adminid.value == \"\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"Please Enter User ID!\");\r\n");
      out.write("\t\tdocument.sign_top.adminid.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(document.sign_top.passwd.value == \"\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"Please Enter password!\");\r\n");
      out.write("\t\tdocument.sign_top.passwd.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function setCookie (name, value, expires) {\r\n");
      out.write("      document.cookie = name + \"=\" + escape (value) + \"; path=/; expires=\" + expires.toGMTString();\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("    function getCookie(Name) {\r\n");
      out.write("      var search = Name + \"=\"\r\n");
      out.write("        if (document.cookie.length > 0) {\r\n");
      out.write("          offset = document.cookie.indexOf(search)\r\n");
      out.write("          if (offset != -1) {\r\n");
      out.write("            offset += search.length\r\n");
      out.write("\r\n");
      out.write("            end = document.cookie.indexOf(\";\", offset)\r\n");
      out.write("\r\n");
      out.write("            if (end == -1)\r\n");
      out.write("              end = document.cookie.length\r\n");
      out.write("            return unescape(document.cookie.substring(offset, end))\r\n");
      out.write("         }\r\n");
      out.write("      }\r\n");
      out.write("      return \"\";\r\n");
      out.write("   }\r\n");
      out.write("\r\n");
      out.write(" function saveid() {\r\n");
      out.write("      var expdate = new Date();\r\n");
      out.write("\r\n");
      out.write("        if (document.sign_top.checksaveid.checked  )\r\n");
      out.write("          expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 60);\r\n");
      out.write("        else\r\n");
      out.write("          expdate.setTime(expdate.getTime() - 1);\r\n");
      out.write("          setCookie(\"saveid\", document.sign_top.adminid.value, expdate);\r\n");
      out.write("   }\r\n");
      out.write(" function getid() {\r\n");
      out.write("     document.sign_top.checksaveid.checked = ((document.sign_top.adminid.value = getCookie(\"saveid\")) != \"\");\r\n");
      out.write("  }\r\n");
      out.write("function init()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.sign_top.adminid.focus();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function bookmark() {\r\n");
      out.write("    var now = new Date(), x;\r\n");
      out.write("    now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000);\r\n");
      out.write("    now = now.toGMTString();\r\n");
      out.write("\r\n");
      out.write("    x = document.cookie.toLowerCase().indexOf(\"bookmark\");\r\n");
      out.write("    if(x == -1){\r\n");
      out.write("        document.cookie = 'bookmark = ADMIN - Supply Chain Management ;expires=' + now + ';';\r\n");
      out.write("        window.external.AddFavorite(\"http://www.sebin2098.com/admin\", document.title);\r\n");
      out.write("    init();\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("<LINK rel=stylesheet type=text/css href=\"/login/ssw_styles.css\">\r\n");
      out.write("<BR>\r\n");
      out.write("<BR>\r\n");
      out.write("<BR>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=700 align=center  bgcolor=\"white\">\r\n");
      out.write("\t<FORM id=sign_top onsubmit=\"return ValidEntry();\" method=post  name=sign_top action=login.jsp>\r\n");
      out.write("  <TBODY>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD width=600 height=\"40\"><b>\r\n");
      out.write("    <font size=\"4\" face=\"BankGothic Md BT\" color=\"#5F4C0B\"> &nbsp;&nbsp;&nbsp; Welcome to Supply  Chain Management</font></b></TD>\r\n");
      out.write("    <TD vAlign=bottom width=100 align=right height=\"40\">\r\n");
      out.write("    <img border=\"0\" src=\"/img/sebin_mid.jpg\" height=\"40\"></TD></TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD height=\"150\" colspan=2 ><IMG src=\"/login/banner.jpg\" width=700 height=150></TD>    \r\n");
      out.write("   </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD class=menu_style colSpan=2 height=\"30\">&nbsp;<A href=\"/terms.html\">Terms & Condition </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("    \t<A href=\"/disclaimer.html\" >Disclamier </A> &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;\r\n");
      out.write("    \t <A href=\"/contactus.html\">Contact us</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<A href=\"/index.jsp\"  target=_top>Buyers login </A>&nbsp;&nbsp; \r\n");
      out.write("  </TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  </TBODY>\r\n");
      out.write(" </TABLE>\r\n");
      out.write("<TABLE bgcolor=\"#E8EDB8\" border=0 cellSpacing=0 cellPadding=0 width=700 align=center height=\"180\"  >\r\n");
      out.write("  <TBODY >\r\n");
      out.write("  <TR>    \r\n");
      out.write("    <TD  style=\"PADDING-BOTTOM: 5px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 5px\" rowSpan=2 width=384 align=middle height=\"202\" background=\"/img/bgimage.jpg\">\r\n");
      out.write("      <TABLE border=0 cellSpacing=0 cellPadding=0 width=400 height=\"265\" bgcolor=\"#E8EDB8\" style=\"border-collapse: collapse\" bordercolor=\"#111111\">\r\n");
      out.write("        <TBODY>\r\n");
      out.write("        <TR >\r\n");
      out.write("          <TD align=middle height=\"265\"  background=\"/img/bgimage.jpg\"><div>\t\r\n");
      out.write("\t\t\t\t\t<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0\" width=\"421\" height=\"255\">\r\n");
      out.write("\t\t\t\t\t  <param name=\"movie\" value=\"../img/slide.swf\" />\r\n");
      out.write("\t\t\t\t\t  <param name=\"quality\" value=\"high\" />\r\n");
      out.write("\t\t\t\t\t  <param name=\"allowFullScreen\" value=\"true\" />\r\n");
      out.write("\t\t\t\t\t  <param name=\"allowScriptAccess\" value=\"always\" />\r\n");
      out.write("\t\t\t\t\t  <param name=\"wmode\" value=\"transparent\">\r\n");
      out.write("\t\t\t\t\t  <embed src=\"slide.swf\"\r\n");
      out.write("\t\t\t\t\t         quality=\"high\"\r\n");
      out.write("\t\t\t\t\t         type=\"application/x-shockwave-flash\"\r\n");
      out.write("\t\t\t\t\t         WMODE=\"transparent\"\r\n");
      out.write("\t\t\t\t\t         width=\"421\"\r\n");
      out.write("\t\t\t\t\t         height=\"255\"\r\n");
      out.write("\t\t\t\t\t         allowFullScreen=\"true\"\r\n");
      out.write("\t\t\t\t\t         pluginspage=\"http://www.macromedia.com/go/getflashplayer\"\r\n");
      out.write("\t\t\t\t\t         allowScriptAccess=\"always\" />\r\n");
      out.write("\t\t\t\t\t</object></div>\r\n");
      out.write("\t\t\t</TD></TR>\r\n");
      out.write("        </TBODY>\r\n");
      out.write("        </TABLE>\r\n");
      out.write("    </TD>\r\n");
      out.write("    <TD  5px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 5px\" rowSpan=2 width=384 align=middle height=\"202\" background=\"/img/bgimage.gif\">\r\n");
      out.write("      <TABLE border=0 cellSpacing=0 cellPadding=0 >\r\n");
      out.write("      \t<TR>\r\n");
      out.write("          <TD colspan=2 height=30 ><b><font size=2 color='#58ACFA'>&nbsp;&nbsp;&nbsp;&nbsp; SEBIN staff/admin Login</font><b></TD>          \r\n");
      out.write("        </TR>\r\n");
      out.write("        <TR>\r\n");
      out.write("          <TD width=\"29%\"><font size=2 color=white>&nbsp; User ID &nbsp;</font></TD>\r\n");
      out.write("          <TD width=\"71%\"><INPUT class=formFileds size=20 type=text name=adminid></TD>\r\n");
      out.write("        </TR>\r\n");
      out.write("        <TR>\r\n");
      out.write("          <TD><font size=2 color=white>Password &nbsp;</font></TD>\r\n");
      out.write("          <TD><INPUT class=formFileds size=20 TYPE=PASSWORD name=passwd></TD>\r\n");
      out.write("        </TR>\r\n");
      out.write("        <TR>\r\n");
      out.write("          <TD align=center colspan=2 height=30><INPUT src=\"/img/btn_login.png\"  type=image></TD>\r\n");
      out.write("         </TR>\r\n");
      out.write("          <TR>\r\n");
      out.write("          \t<TD width=\"30%\"> </TD>\r\n");
      out.write("          <TD width=\"50%\" align=left > <SPAN ><font size=2 color=yellow>Remember Me</font> <input  type=\"checkbox\" name=\"checksaveid\" onClick=\"saveid()\"></SPAN></TD>\r\n");
      out.write("        </TR>\r\n");
      out.write("       </TABLE>\r\n");
      out.write("      </TD>\r\n");
      out.write(" </form>  \r\n");
      out.write("</TABLE> \r\n");
      out.write("<BR>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=950 align=center>\r\n");
      out.write("  <TBODY>\r\n");
      out.write("  \t");

out.println(CopyRightLogo());

      out.write("\r\n");
      out.write("  </TBODY></TABLE></BODY></HTML>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
