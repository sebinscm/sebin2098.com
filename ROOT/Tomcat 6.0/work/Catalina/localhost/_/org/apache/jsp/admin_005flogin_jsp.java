package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;

public final class admin_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


//-------------------------------------------
// CopyRightLogo
//
//-------------------------------------------
String CopyRightLogo()
{
  String str;
  str = "<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' >";
  str += "<tr><td width='100%' height='2' align='center' colspan='2'>";
  str += "<HR color='#5BA3C1' width=100% size=1></td></tr>";
  str += "<tr><td width='40%'align='right'><img src='/img/sebin_small.jpg'></td>";
  str += " <td width='60%' align='left'><FONT size=2 color=778899>";
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
    _jspx_dependants.add("/bottom_line.jsp");
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write('\n');
      out.write('\r');
      out.write('\n');

if (!session.isNew()) session.invalidate();

String ag_id = request.getParameter("ag_id");
String ag_pwd = request.getParameter("ag_pwd");

      out.write("\n");
      out.write("<HTML> \r\n");
      out.write("<SCRIPT for=\"document\" event=\"onkeypress\">\r\n");
      out.write("if (window.event.keyCode==13)\r\n");
      out.write("{\r\n");
      out.write("        Login()\r\n");
      out.write("}\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\r\n");
      out.write("function init()\r\n");
      out.write("{\r\n");
      out.write("\tfrmMain.scmid.focus();\r\n");
      out.write("}\r\n");
      out.write("\n");
      out.write("function Login() {\r\n");
      out.write("\tscmid = frmMain.scmid.value;\r\n");
      out.write("\tpasswd = frmMain.passwd.value;\r\n");
      out.write("\tif( scmid.length > 0 )\r\n");
      out.write("\t\tif( passwd.length > 0 )\r\n");
      out.write("\t\t\tfrmMain.submit();\r\n");
      out.write("\t\telse {\r\n");
      out.write("\t\t\tfrmMain.passwd.focus();\r\n");
      out.write("\t\t\talert('Input password!');\r\n");
      out.write("\t\t}\r\n");
      out.write("\telse {\r\n");
      out.write("\t\tfrmMain.scmid.focus();\r\n");
      out.write("\t\talert('Input Your id and password!');\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\n");
      out.write("function bookmark() {\r\n");
      out.write("    var now = new Date(), x;\r\n");
      out.write("    now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000);\r\n");
      out.write("    now = now.toGMTString();\r\n");
      out.write("\r\n");
      out.write("    x = document.cookie.toLowerCase().indexOf(\"bookmark\");\r\n");
      out.write("    if(x == -1){\r\n");
      out.write("        document.cookie = 'bookmark = Sebin Enterprise Co,. Ltd. Supply Chain Management Home;expires=' + now + ';';\r\n");
      out.write("        window.external.AddFavorite(\"http://scm.sebinenterprise.com/admin\", document.title);\r\n");
      out.write("    init();\r\n");
      out.write("    }\n");
      out.write("}\r \r\n");
      out.write("</SCRIPT>\n");
      out.write("<HEAD>\r\n");
      out.write("<TITLE>Supply Chain Management | Sebin Enterprise Co,. Ltd.</TITLE>\r\n");
      out.write("<LINK rel=\"shortcut icon\" href=\"favicon.ico\">\r\n");
      out.write("<LINK rel=stylesheet type=text/css \r href=\"/login/body-sheet.css\">\r\n");
      out.write("</HEAD>\r\n");
      out.write("<BODY dir=ltr>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\" bgColor=#00899b>\r\n");
      out.write("  <TBODY>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD height=22 align=middle>\r\n");
      out.write("      </TD></TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD align=middle>\r\n");
      out.write("      <TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center height=70 >\r\n");
      out.write("        <TBODY>\r\n");
      out.write("        <TR>\r\n");
      out.write("          <TD bgColor=#ffffff width=\"5%\">&nbsp;</TD>\r\n");
      out.write("          <TD bgColor=#ffffff width=\"16%\" align=middle><A \r href=\"/admin/index.jsp\"><IMG border=0 \r src=\"/login/log-scm.gif\"></A></TD>\r\n");
      out.write("          <TD bgColor=#ffffff width=\"5%\">&nbsp;</TD>\r\n");
      out.write("          <TD bgColor=#ffffff height=80 vAlign=center width=\"47%\" align=middle></TD>\r\n");
      out.write("          <TD bgColor=#ffffff vAlign=top width=\"27%\">\r\n");
      out.write("            <TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\" \r\n");
      out.write("              height=70><TBODY>\r\n");
      out.write("              <TR>\r\n");
      out.write("                <TD class=\"fontfamilyverdana normal12white\" vAlign=bottom \r width=\"94%\" align=right>\r\n");
      out.write("                  <TABLE border=0 cellSpacing=4 cellPadding=0 align=right  height=21 >\r\n");
      out.write("                    <TBODY>\r\n");
      out.write("                    <TR>\r\n");
      out.write("                      <TD height=24>\r\n");
      out.write("                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=190 >\r\n");
      out.write("                          <TBODY>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD align=middle><font face=\"Century Gothic\" size=2><A \rhref=\"/terms.html\">Terms & Conditions</A></font></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("                      <TD>\r\n");
      out.write("                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=90 height=20 >\r\n");
      out.write("                          <TBODY>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD align=middle><A \rhref=\"/admin/disclaimer.html\"><font face=\"Century Gothic\" size=2>Disclaimer</font></A></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("                      <TD width=5>&nbsp;</TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("                <TD vAlign=top width=\"6%\" colSpan=2 align=right><IMG src=\"/login/headcorner.gif\" \r width=16 height=14></TD></TR><!--<tr>\r\n");
      out.write("                <td height=\"26\" colspan=\"3\">&nbsp;</td>\r\n");
      out.write("              </tr>--></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>\r\n");
      out.write("  <TBODY>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD height=1></TD></TR></TBODY></TABLE>\r\n");
      out.write("\r\n");
      out.write("<TABLE border=1 cellSpacing=0 cellPadding=0 width=990 align=center>\r\n");
      out.write("  <TBODY>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD vAlign=top width=990>\r\n");
      out.write("      <DIV><B class=lightbluecorner><B class=lightbluecorner1><B></B></B><B \r\n");
      out.write("      class=lightbluecorner2><B></B></B><B class=lightbluecorner3></B><B \r\n");
      out.write("      class=lightbluecorner4></B><B class=lightbluecorner5></B></B>\r\n");
      out.write("      <DIV class=lightbluecornerfg><!-- content goes here -->\r\n");
      out.write("      <TABLE class=padingrightleft border=0 cellSpacing=3 cellPadding=0 \r width=\"99%\" align=center>\r\n");
      out.write("        <TBODY>\r\n");
      out.write("        <TR>\r\n");
      out.write("          <TD>\r\n");
      out.write("            <DIV><B class=whitecornerlightbluebg><B \r\n");
      out.write("            class=whitecornerlightbluebg1><B></B></B><B \r\n");
      out.write("            class=whitecornerlightbluebg2><B></B></B><B \r\n");
      out.write("            class=whitecornerlightbluebg3></B><B \r\n");
      out.write("            class=whitecornerlightbluebg4></B><B \r\n");
      out.write("            class=whitecornerlightbluebg5></B></B>\r\n");
      out.write("            <DIV class=whitecornerlightbluebgfg><!-- content goes here -->\r\n");
      out.write("            <TABLE border=0 cellSpacing=2 cellPadding=0 width=\"99%\" \r align=center>\r\n");
      out.write("              <TBODY>\r\n");
      out.write("              <TR>\r\n");
      out.write("                <TD vAlign=top width=\"63%\">\r\n");
      out.write("                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=524 \r align=center>\r\n");
      out.write("                    <TBODY>\r\n");
      out.write("                    <TR>\r\n");
      out.write("                      <TD class=\"fontfamilyverdana bgtextorange\" height=67 \r vAlign=bottom><font SIZE=4 color=\"#FFFFFF\" face=\"Century Gothic\" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Welcome to Supply Chain Management </B></font></TD></TR>\r\n");
      out.write("                    <TR>\r\n");
      out.write("                      <TD height=186><!--<img src=\"images/share-to-friends.jpg\" width=\"396\" height=\"150\" />-->\r\n");
      out.write("                        <object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0\" width=\"421\" height=\"255\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t  <param name=\"movie\" value=\"/img/slide.swf\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t  <param name=\"quality\" value=\"high\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t  <param name=\"allowFullScreen\" value=\"true\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t  <param name=\"allowScriptAccess\" value=\"always\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t  <param name=\"wmode\" value=\"transparent\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t  <embed src=\"slide.swf\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t         quality=\"high\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t         type=\"application/x-shockwave-flash\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t         WMODE=\"transparent\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t         width=\"421\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t         height=\"255\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t         allowFullScreen=\"true\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t         pluginspage=\"http://www.macromedia.com/go/getflashplayer\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t         allowScriptAccess=\"always\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</object>\t</TD></TR></TBODY></TABLE>\r\n");
      out.write("                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=522 align=center>\r\n");
      out.write("                    <TBODY>\r\n");
      out.write("                    <TR>\r\n");
      out.write("                      <TD height=60 width=502 align=left><SPAN class=\"fontfamilyverdana normal12blue\">\r\n");
      out.write("                         </SPAN></TD></TR></TBODY></TABLE><BR></TD>\r\n");
      out.write("                <TD vAlign=top width=\"37%\">\r\n");
      out.write("                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\" height=29>\r\n");
      out.write("                    <TBODY>\r\n");
      out.write("                    <TR>\r\n");
      out.write("                      <TD class=\"fontfamilyverdana textorange16\" width=\"93%\" align=left>&nbsp;&nbsp;<FONT size=4>Buyer Login</FONT></TD>\r\n");
      out.write("                      <TD class=\"fontfamilyverdana textorange16\" width=\"7%\" \r align=right><A \r href=\"login_first.html\" target=_blank><IMG border=0 alt=Help src=\"/login/pass2.jpg\" ></A></TD></TR>\r\n");
      out.write("                   </TBODY></TABLE>\r\n");
      out.write("                   <B class=lightbluecorner><B class=lightbluecorner1><B></B></B><B class=lightbluecorner2><B></B></B><B class=lightbluecorner3></B><B class=lightbluecorner4></B><B class=lightbluecorner5></B></B>\r\n");
      out.write("                  <DIV class=lightbluecornerfg><!-- content goes here -->\r\n");
      out.write("                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\" \r\n");
      out.write("                  height=190>\r\n");
      out.write("                    <TBODY>\r\n");
      out.write("                    <TR>\r\n");
      out.write("                      <TD vAlign=top>\r\n");
      out.write("                        <FORM ACTION=\"login.jsp\" NAME=frmMain METHOD=POST>\n");
      out.write("                        <TABLE border=0 cellSpacing=3 cellPadding=0 width=\"87%\"  align=center>\r\n");
      out.write("                          <TBODY>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD class=\"fontfamilyverdana error\" height=25 \r vAlign=center colSpan=3 align=middle></TD></TR>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD class=\"fontfamilyverdana normal12blue\" width=\"30%\" align=right>Buyer Id : </TD>\r\n");
      out.write("                            <TD height=25 colSpan=2 align=left><INPUT TYPE=TEXT NAME=scmid value=");
      out.print(ag_id);
      out.write(" SIZE=28 MAXLENGTH=28 ></TD></TR>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD class=\"fontfamilyverdana normal12blue\"  align=right>Password : </TD>\r\n");
      out.write("                            <TD height=25 colSpan=2 align=left><INPUT TYPE=PASSWORD value=");
      out.print(ag_pwd);
      out.write(" NAME=passwd SIZE=30 MAXLENGTH=30 ></TD></TR>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD>&nbsp;</TD>\r\n");
      out.write("                            <TD width=\"5%\"> <input type=\"checkbox\" name=\"checksaveid\" onClick=\"saveid(this.form)\"></TD>\r\n");
      out.write("                            <TD class=\"fontfamilyverdana smalltext11\" \r width=\"73%\">Remember Me </TD></TR>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD>&nbsp;</TD>\r\n");
      out.write("                            <TD colSpan=2>\r\n");
      out.write("                              <TABLE border=0 cellSpacing=0 cellPadding=0 width=60>\r\n");
      out.write("                                <TBODY>\r\n");
      out.write("                                <TR>\r\n");
      out.write("                                <TD align=middle><INPUT TYPE=BUTTON VALUE=\"Login\" ONCLICK=\"JavaScript:Login()\"> \r\n");
      out.write("                                <!--INPUT value=LOGIN type=hidden name=action > \r\n");
      out.write("                                <INPUT type=hidden name=uid> <INPUT type=hidden name=red-->\r\n");
      out.write("                                </TD>\r\n");
      out.write("                                </TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD>&nbsp;</TD>\r\n");
      out.write("                            <TD class=\"fontfamilyverdana smalltext11\" \r\n");
      out.write("                              colSpan=2><a class=\"fontfamilyverdana smalltext11\" href=\"mailto:scm@ffb.net.au?subject=SCM Request for lost user password\">Forgot your password?</A></TD></TR></TBODY></TABLE></FORM></TD></TR>\r\n");
      out.write("                              </TBODY></TABLE></DIV><B class=lightbluecorner><B class=lightbluecorner5></B><B class=lightbluecorner4></B><B class=lightbluecorner3></B>\r\n");
      out.write("                              \t<B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B>\r\n");
      out.write("                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("                    <TBODY>\r\n");
      out.write("                    <TR>\r\n");
      out.write("                      <TD height=5></TD></TR></TBODY></TABLE><B \r class=lightbluecorner><B class=lightbluecorner1><B></B></B><B class=lightbluecorner2><B></B></B>\r\n");
      out.write("                      \t<B class=lightbluecorner3></B><B class=lightbluecorner4></B><B class=lightbluecorner5></B></B>\r\n");
      out.write("                  <DIV class=lightbluecornerfg><!-- content goes here -->\r\n");
      out.write("                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("                    <TBODY>\r\n");
      out.write("                    <TR>\r\n");
      out.write("                      <TD vAlign=top>\r\n");
      out.write("                        <TABLE border=0 cellSpacing=3 cellPadding=0 width=\"87%\"  align=center>\r\n");
      out.write("                          <TBODY>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD height=19 colSpan=3 align=middle><SPAN \r class=\"fontfamilyverdana normal12blue\"><IMG border=0 alt=Help src=\"/login/easy.gif\" >Easy to access? </SPAN></TD></TR>\r\n");
      out.write("                          <TR>\r\n");
      out.write("                            <TD height=39 vAlign=top colSpan=3 align=middle><a class=\"fontfamilyverdana smalltext11\" href=\"JavaScript:bookmark()\">Add&nbsp;to my favorite sites</a>\n");
      out.write("                  </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV><Bclass=lightbluecorner><B class=lightbluecorner5></B><B class=lightbluecorner4></B><B class=lightbluecorner3></B>\r\n");
      out.write("                  \t<B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B></TD></TR></TBODY></TABLE></DIV>\r\n");
      out.write("                  \t\t<B class=whitecornerlightbluebg><B class=whitecornerlightbluebg5></B>\r\n");
      out.write("                  \t\t\t<B class=whitecornerlightbluebg4></B><B class=whitecornerlightbluebg3></B><B class=whitecornerlightbluebg2><B></B></B>\r\n");
      out.write("                  \t\t\t<B  class=whitecornerlightbluebg1><B></B></B></B></DIV></TD></TR></TBODY></TABLE></DIV><B class=lightbluecorner><B class=lightbluecorner5></B>\r\n");
      out.write("                  \t\t\t\t<B  class=lightbluecorner4></B><B class=lightbluecorner3></B><B class=lightbluecorner2><B></B></B><B class=lightbluecorner1><B></B></B></B></DIV></TD></TR>\r\n");
      out.write("                  \t\t\t\t\t</TBODY></TABLE>\r\n");
      out.write("</TR>\r\n");
      out.write("</TBODY>\r\n");
      out.write("</TABLE>\r\r\n");
      out.write("<TABLE WIDTH=794 HEIGHT=50 align=center>\r\n");
      out.write("\t  <tr><TD>\r\n");
      out.write("    <font size=\"1\"><br>\r\n");
      out.write("      <font face=\"Century Gothic\" color=\"#585858\" >\r\n");
      out.write("      Supply Chain Management(SCM) solution optimises your supply chain and improves your business processes.\r\n");
      out.write("      SCM is a powerful tool allowing the delivery of the right product, to the right place at the right time and at the right price. \r\n");
      out.write("      As the internet matured into a viable commercial platform, SCM evolved into what is now known as e-SCM.  \r\n");
      out.write("      Web based supply chain management systems permit companies to optimize business processes both within and outside of their company walls. \r\n");
      out.write("</font></font></td>\r\n");
      out.write("   </TD>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <br>\r\n");
      out.write("</table>\r\n");
      out.write(" ");

out.println(CopyRightLogo());

      out.write("\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>\r\n");
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
