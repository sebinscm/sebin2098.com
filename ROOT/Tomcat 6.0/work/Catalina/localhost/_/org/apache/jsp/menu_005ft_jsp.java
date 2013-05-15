package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menu_005ft_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/login_check.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" background=\"/img/bgimage1.gif\">\n");
      out.write("<table width=\"100%\" height=\"25\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"white\" >\t\n");
      out.write("\n");
      out.write("<TR bgcolor=#F0F388>\n");
      out.write("\t<td width=77% align='left'><font size=2 face=\"Century Gothic\" >&nbsp;&nbsp; Welcome to Buyer Site</font></td> \t\n");
      out.write("\t<td width=13% height=\"17\" align=\"right\" class=\"help_top_menu\"><a href=\"/terms.html\" target=\"_bottom\" ><font size=2 face=\"Century Gothic\" >Terms & Condition | </font></a></font></td>\n");
      out.write("  <td width=5% height=\"17\" align=\"right\" class=\"help_top_menu\"><a href=\"/disclaimer.html\" target=\"_bottom\" ><font size=2 face=\"Century Gothic\" >Disclamier</font></a></font>&nbsp;&nbsp;</td>\n");
      out.write("  <td width=5% height=\"17\" align=\"right\" class=\"help_top_menu\"><a href=\"./logout.jsp\" target=\"_top\"><img src=\"/img/logout.gif\"><font size=2 face=\"Century Gothic\">Logout &nbsp;&nbsp;&nbsp;</a></font></td>  \t\n");
      out.write("</TR> \n");
      out.write("</table>\t\n");
      out.write("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("  <tr>\n");
      out.write("    <!--td valign=\"top\" width=\"100%\" background=\"/img/bgimage.gif\"-->\n");
      out.write("\t  <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("        <tr>\n");
      out.write("          <!--td width=\"206\"  height=\"70\" rowspan=\"2\"><a href=\"/memo/\" target=\"main\"><img src=\"/img/bgimg4.gif\"></a></td-->\n");
      out.write("          <td width=\"452\" ><font size=4 face=\"Century Gothic\" color=\"Yellow\"> &nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("            <a href='/index2.jsp' style=\"text-decoration:none;color=yellow\" target=\"_top\">Supply Chain Management</a> </font><br>\n");
      out.write("          \t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color=\"white\" face=\"Century Gothic\" size=2> &copy;Copyright 2011 Sebin Trading Enterprise Co,.Ltd</font></td>\n");
      out.write("          <td valign=\"top\">\n");
      out.write("\t\t    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("              <!--tr>\n");
      out.write("                <td height=\"17\" align=\"right\" class=\"help_top_menu\">\n");
      out.write("                 <a href=\"./logout.jsp\" target=\"_top\"><img src=\"/img/logout.gif\"><font size=2 face=\"Century Gothic\" color=\"White\">Logout</font></a></td>\n");
      out.write("                <td width=\"10\"></td>\n");
      out.write("              </tr-->\n");
      out.write("              <tr>\n");
      out.write("                <td height=\"30\" align=\"right\"></td>\n");
      out.write("                <td width=\"10\"></td>\n");
      out.write("              </tr>\n");
      out.write("              <tr>\n");
      out.write("                <td height=\"17\" align=\"right\" valign=\"bottom\" class=\"help_top_menu\"><font size=2 face=\"Century Gothic\" color=\"White\">BUYER:&nbsp;&nbsp;");
      out.print( scmnm );
      out.write(' ');
      out.write('[');
      out.print( scmid );
      out.write("]</font></td>\n");
      out.write("                <td width=\"10\"></td>\n");
      out.write("              </tr>\n");
      out.write("            </table></td>\n");
      out.write("        </tr>\n");
      out.write("      </table>\n");
      out.write("      <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("        <tr>\n");
      out.write("          <td height=\"13\" background=\"/img/line.gif\"></td>\n");
      out.write("        </tr>\n");
      out.write("      </table></td>\n");
      out.write("  </tr>\n");
      out.write("</table>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
