package org.apache.jsp.memo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class welcome_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/memo/../bottom_line.jsp");
    _jspx_dependants.add("/memo/../login_check.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("<HTML>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<TABLE border=0 WIDTH=95% CELLPADDING=0 CELLSPACING=0 align='center'>\n");
      out.write("<TR HEIGHT=22><TD BGCOLOR=#000080>&nbsp;<FONT color=white > Subject : <B>Welcome to the Supply Chain Management.</B></FONT></TD>\n");
      out.write("</TR><TR HEIGHT=250 VALIGN=TOP>\n");
      out.write("<TD>\n");
      out.write("<p style=\"line-height:120%; margin-top:0px; margin-bottom:0px;\"><br><br>Welcome!.<br>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("Welcom to SEBIN Supply Chain Management<br>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("Improvements across the supply chain has been achieved by using workflow automation, performance management, advanced planning engines and order management.<br>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("As a result, many of the unnecessary and lengthy delays seen in the previous processes are virtually eliminated.<br>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("Efficient planning and sourcing to fullfil purchase orders are now possible at any time across the entire supply chain.<br>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("An indepth manual is available by clicking on 'How to use?'.<br>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("Please contact the Administrator should you have any problems or queries in using our SCM System.<br>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("Thank you again for your services.<br>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("SCM Administrator<br>\n");
      out.write("</font></p>\n");
      out.write("\n");
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("\n");
      out.write("</td></tr></table>\n");
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
