package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class initpass_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/login_check.jsp");
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
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;


response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String scmid = "";
String scmnm = "";
String usertype = "";
String usergroup = "";
String scmsupid = "";
String _buyer_email ="";
String _supplier_email="";

try{
  scmid = (String) session.getAttribute("scmid");


  if (scmid == null || scmid.length() == 0 || scmid.equals("null") ) {     
    response.sendRedirect("/login_first.html");
    return;
  }
  

  scmnm = (String) session.getAttribute("scmnm");
  scmsupid = (String) session.getAttribute("scmsupid");
  usertype = (String) session.getAttribute("usertype");
  if (usertype == null) usertype = "";

  usergroup = (String) session.getAttribute("usergroup");
  if (usergroup == null) usergroup = "";
  _buyer_email = (String) session.getAttribute("buyer_email");
  _supplier_email = (String) session.getAttribute("supplier_email");
  
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/login_first.html");
  return;
}

      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');

String id = request.getParameter("id");

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<SCRIPT for=\"document\" event=\"onkeypress\">\n");
      out.write("if (window.event.keyCode==13)\n");
      out.write("{\n");
      out.write("        ChangePW()\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\n");
      out.write("function init()\n");
      out.write("{\n");
      out.write("  frmPass.password.focus();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function Reset()\n");
      out.write("{\n");
      out.write("  frmPass.reset();\n");
      out.write("}\n");
      out.write("function Cancel()\n");
      out.write("{\n");
      out.write("  history.back();\n");
      out.write("}\n");
      out.write("function ChangePW()\n");
      out.write("{\n");
      out.write("  var check = frmPass.password.value;\n");
      out.write("  if( check.length < 1 ) {\n");
      out.write("    alert('New password must be at least 1 characters.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  if( frmPass.password.value == '1111' || frmPass.password.value == '1234' ) {\n");
      out.write("    alert('Your new password is not allowed for security reason! Please input new password with strong word.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  if( frmPass.password.value == frmPass.confirm.value ) {\n");
      out.write("    frmPass.submit();\n");
      out.write("  }else {\n");
      out.write("    alert('New Password and retype password must be same.');\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>\n");
      out.write("</HEAD>\n");
      out.write("<BODY ONLOAD=\"init();\" bgcolor=\"white\" TOPMARGIN=5 LEFTMARGIN=5>\n");
      out.write("<center>\n");
      out.write("<TABlE width=\"679\" height=\"83\">\n");
      out.write("<TR><TD width=\"671\" height=\"79\"></TD>\n");
      out.write("</TABLE>\n");
      out.write("<FORM NAME=\"frmPass\" ACTION=\"code_initpass.jsp\" METHOD=POST>\n");
      out.write("<input type='hidden' name='id' value='");
      out.print( id );
      out.write("'>\n");
      out.write("<TABLE WIDTH=681 height=\"288\" >\n");
      out.write("<TR> <TD height=\"284\" width=\"673\">\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n");
      out.write("  <tr>\n");
      out.write("    <td width=\"23%\" rowspan=\"4\"><img border=\"0\" src=\"img/pass.jpg\" width=\"143\" height=\"155\"></td>\n");
      out.write("    <td width=\"46%\" colspan=\"2\">\n");
      out.write("      <p align=\"center\"><b><font size=\"2\" face=\"Verdana\" color=\"#0000FF\">Please input your new password.</font></b></td>\n");
      out.write("    <td width=\"31%\" rowspan=\"4\"></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td width=\"22%\">\n");
      out.write("      <p align=\"center\"><FONT SIZE=2>Buyer ID</font></td>\n");
      out.write("    <td width=\"24%\">\n");
      out.write("      <p align=\"center\"><FONT SIZE=2>");
      out.print( id );
      out.write("</font></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td width=\"22%\">\n");
      out.write("      <p align=\"center\"><FONT SIZE=2>New password</font></td>\n");
      out.write("    <td width=\"24%\">\n");
      out.write("      <p align=\"center\"><INPUT TYPE=\"password\" NAME=\"password\" SIZE=18 MAXLENGTH=10></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td width=\"22%\">\n");
      out.write("      <p align=\"center\"><FONT SIZE=2>Confirm passoword</td>\n");
      out.write("      <td width=\"24%\">\n");
      out.write("        <p align=\"center\"><INPUT TYPE=\"password\" NAME=\"confirm\" SIZE=18 MAXLENGTH=10></td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("      <td width=\"50%\" colspan=\"3\">\n");
      out.write("        <p align=\"center\"><INPUT TYPE=BUTTON VALUE=\"Apply\" ONCLICK=\"JavaScript:ChangePW()\"> <INPUT TYPE=BUTTON VALUE=\"Cancel\" ONCLICK=\"JavaScript:Cancel()\">\n");
      out.write("      </td>\n");
      out.write("    </tr>\n");
      out.write("  </table>\n");
      out.write("\n");
      out.write("</TD></TR>\n");
      out.write("</FORM>\n");
      out.write("</TABLE>\n");
      out.write("<CENTER>\n");

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
