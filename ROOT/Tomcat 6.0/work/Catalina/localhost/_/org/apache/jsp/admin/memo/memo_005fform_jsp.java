package org.apache.jsp.admin.memo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import dbconn.*;

public final class memo_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/admin/memo/../bottom_line.jsp");
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
      			"../error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');
      out.write('\n');

response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String _adminid = "";
String _adminname = "";
String _admintype = "";
String _admingroup = "";
String _approval = "";
String _adminclass = "";
String _adminmail = "";

try{

  _adminid = (String) session.getAttribute("adminid");

  if( _adminid == null || _adminid.length() == 0 || _adminid.equals("null") ) {
    response.sendRedirect("/admin/login_first.html");
    return;
  }

  _adminname = (String) session.getAttribute("adminname");
  _admintype = (String) session.getAttribute("admintype");
  _admingroup = (String) session.getAttribute("admingroup");
  _approval = (String) session.getAttribute("approval");
  _adminclass = (String) session.getAttribute("adminclass");
  _adminmail = (String) session.getAttribute("admin_email");
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/admin/login_first.html");
  return;
}

      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');

 String file_name ="";

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"vbscript\" src=\"/common/board/board.vb\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function ValidateLength(ElementName,DisplayName, MinLength)\n");
      out.write("{\n");
      out.write("  sValue=frmMain.elements(ElementName).value;\n");
      out.write("\n");
      out.write("  if (sValue.length < MinLength )\n");
      out.write("  {\n");
      out.write("    alert(DisplayName + ' must be longer than ' + MinLength + ' characters.');\n");
      out.write("    bRetVal=false;\n");
      out.write("  }\n");
      out.write("  else\n");
      out.write("  {\n");
      out.write("    bRetVal=true;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  return bRetVal;\n");
      out.write("}\n");
      out.write("\n");
      out.write("function recv_window()\n");
      out.write("{\n");
      out.write("    url = \"mail_address.jsp\"\n");
      out.write("    window.open(url,\"receiver\",\"toolbar=no,menubar=no,resizable=yes, scrollbars=yes, width=500,height=600\")\n");
      out.write("}\n");
      out.write("\n");
      out.write("function send(form)\n");
      out.write("{\n");
      out.write("    if( ValidateFields())\n");
      out.write("    {\n");
      out.write("        if(frmMain.siba != null) {\n");
      out.write("            frmMain.contents.value = frmMain.siba.MIMEValue;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        frmMain.action = \"send_memo.jsp\";\n");
      out.write("        frmMain.submit();\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function ValidateFields()\n");
      out.write("{\n");
      out.write("    bRetVal=false;\n");
      out.write("\n");
      out.write("    if (ValidateReceiver(\"receiver\"))\n");
      out.write("    {\n");
      out.write("        if (ValidateLength(\"title\",\"Subject\",1))\n");
      out.write("        {\n");
      out.write("            bRetVal=true;\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("    return bRetVal;\n");
      out.write("}\n");
      out.write("\n");
      out.write("function ValidateReceiver(ElementName)\n");
      out.write("{\n");
      out.write("    sValue=frmMain.elements(ElementName).value;\n");
      out.write("\n");
      out.write("    if (sValue == 'Click Add to select receiver' || sValue.length < 1)\n");
      out.write("    {\n");
      out.write("        alert(\"More than 1 receiver is required.\");\n");
      out.write("        bRetVal=false;\n");
      out.write("    }\n");
      out.write("    else\n");
      out.write("    {\n");
      out.write("        bRetVal=true;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    return bRetVal;\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/icon_ann.jpg\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\"> Create New Buyer Notice</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE width=\"700\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM NAME=frmMain METHOD=POST enctype=\"multipart/form-data\">\n");
      out.write("<input type=\"hidden\" name=\"contents\" value=\"\">\n");
      out.write("  <tr>\n");
      out.write("    <td width=100 class=\"table_header_center\">To:</td>\n");
      out.write("    <td width=600 valign=\"BOTTOM\" class=\"table_bg_bright\">\n");
      out.write("      <input type=\"text\" name=\"receiver\" size=\"90\" value=\"Click Add to select receiver\" readonly onfocus=\"blur(this)\">\n");
      out.write("      <INPUT TYPE=BUTTON VALUE=\" Add \" ONCLICK=\"javascript:recv_window()\">\n");
      out.write("    </td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td class=\"table_header_center\">Title</td>\n");
      out.write("    <td class=\"table_bg_bright\"><input type=\"text\" name=\"title\" size=\"90\" maxlength=100></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td colspan=2 class=\"table_bg_bright\">\n");
      out.write("      <object width=0 height=0 classid=\"clsid:5220cb21-c88d-11cf-b347-00aa00a28331\">\n");
      out.write("      <param name=\"LPKPath\" value=\"/common/board/NamoWe_valleygirl.lpk\">\n");
      out.write("      </object>\n");
      out.write("      <object id=\"siba\" width=700 height=500 classid=\"CLSID:898FD2A4-B75E-11d4-BFF3-0050FC1AFCDD\" codebase=\"/common/board/NamoWe.cab#version=2,1,0,3\">\n");
      out.write("      </object>\n");
      out.write("    </td>\n");
      out.write("  </tr>\n");
      out.write("  <tr><td width=100 class=\"table_header_center\">Attachment </td>\n");
      out.write("    <td colspan=2 class=\"table_bg_bright\"><input type=\"file\" name= \"file_name\" size=\"100\"></td>\n");
      out.write("  </tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" align='center'>\n");
      out.write("    <INPUT TYPE=BUTTON VALUE='Submit' ONCLICK=JavaScript:send(document.frmMain)>\n");
      out.write("    <INPUT TYPE=BUTTON VALUE='Cancel' ONCLICK=JavaScript:this.form.reset();>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</FORM>\n");
      out.write("</table>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</BODY>\n");
      out.write("</HTML>\n");
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
