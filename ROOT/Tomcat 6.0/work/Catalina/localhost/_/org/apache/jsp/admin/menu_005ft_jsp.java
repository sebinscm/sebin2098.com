package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;

public final class menu_005ft_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/admin/login_check.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

int iRet = 0;

Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
String sql = "";

String adminTypeName = "";
String adminGroupName = "";
String adminClassName = "";
String user_level="";
if (_adminclass.equals("1") ) user_level = "User access Level-1";
if (_adminclass.equals("2") ) user_level = "User access Level-2";
  
try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // Read Menu List
  sql = " select  (select code_name from vg_common_code where code = '" + _admintype + "' and type = 'USER_TYPE'), "
      + "         (select code_name from vg_common_code where code = '" + _admingroup + "' and type = 'USER_GROUP'), "
       + "         (select code_name from vg_common_code where code = '" + _adminclass + "' and type = 'USER_CLASS') "
      + " from    dual ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    
    adminTypeName   = matrix.getRowData(0).getData(j++);
    adminGroupName  = matrix.getRowData(0).getData(j++);
    adminClassName  = matrix.getRowData(0).getData(j++);
  }

} catch (Exception e) {
  System.out.println("Exception menu_t : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("</head>\n");
      out.write("             \t\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" background=\"/img/bgimage1.gif\">\n");
      out.write("<table width=\"100%\" height=\"25\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"white\" >\t\n");
      out.write("<!--TR bgcolor=#FAAC58-->\n");
      out.write("<TR bgcolor=#F0F388>\n");
      out.write("\t<td width=77% align='left'><font size=2 face=\"Century Gothic\" >&nbsp;&nbsp; Welcome to Administrator Site</font></td> \t\n");
      out.write("\t<td width=13% height=\"17\" align=\"right\" class=\"help_top_menu\"><a href=\"/terms.html\" target=\"_bottom\" ><font size=2 face=\"Century Gothic\" >Terms & Condition | </font></a></font></td>\n");
      out.write("  <td width=5% height=\"17\" align=\"right\" class=\"help_top_menu\"><a href=\"/disclaimer.html\" target=\"_bottom\"><font size=2 face=\"Century Gothic\" >Disclamier</font></a></font>&nbsp;&nbsp;</td>\n");
      out.write("  <td width=5% height=\"17\" align=\"right\" class=\"help_top_menu\"><a href=\"./logout.jsp\" target=\"_top\"><img src=\"/img/logout.gif\"><font size=2 face=\"Century Gothic\">Logout &nbsp;&nbsp;&nbsp;</a></font></td>  \t\n");
      out.write("</TR> \n");
      out.write("</table>\n");
      out.write("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("  <tr>\n");
      out.write("    <!--td valign=\"top\" width=\"100%\" background=\"/img/bgimg3.gif\"-->\n");
      out.write("\t  <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("        <tr>\n");
      out.write("          <!--td width=\"206\"  height=\"70\" rowspan=\"2\" class=\"top_logo\"><a href=\"/admin/index2.jsp\" target=\"_top\"><img src=\"/img/header_2.gif\"></a></td-->\n");
      out.write("          <td width=\"452\" ><font size=4 face=\"Century Gothic\" color=\"Yellow\"> &nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("            <a href='/admin/index2.jsp' style=\"text-decoration:none;color=yellow\" target=\"_top\">S.C.M Administration</a> </font><br>\n");
      out.write("          \t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color=\"white\" face=\"Century Gothic\" size=2> &copy;Copyright 2011 SEBIN TRADING ENTERPRISE CO,.LTD</font></td>\n");
      out.write("          <td valign=\"top\">\n");
      out.write("\t\t    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("              <!--tr>\n");
      out.write("                <td height=\"17\" align=\"right\" class=\"help_top_menu\"><a href=\"./logout.jsp\" target=\"_top\"><img src=\"/img/logout.gif\"><font size=2 face=\"Century Gothic\" color=\"White\">Logout</font></a></font></td>\n");
      out.write("                <td width=\"10\"></td>\n");
      out.write("              </tr-->\n");
      out.write("              <tr>\n");
      out.write("              \t<td height=\"30\" align=\"right\" valign=\"bottom\" class=\"help_top_menu\"><font size=2 face=\"Century Gothic\" color=\"White\">");
      out.print( adminTypeName );
      out.write(" | </font><font size=2 face=\"Century Gothic\" color=\"yellow\">");
      out.print(adminGroupName);
      out.write("</font></td> \t\t\n");
      out.write("                <!--td height=\"30\" align=\"right\">\n");
      out.write("                </td-->\n");
      out.write("                <td width=\"10\"></td>\n");
      out.write("              </tr>\n");
      out.write("              <tr>\n");
      out.write("                <td height=\"17\" align=\"right\" valign=\"bottom\" class=\"help_top_menu\"><font size=2 face=\"Century Gothic\" color=\"white\">");
      out.print(user_level);
      out.write(' ');
      out.write('|');
      out.write(' ');
      out.print(adminClassName);
      out.write(' ');
      out.write('|');
      out.write(' ');
      out.print( _adminid );
      out.write(" | </font> <font size=2 face=\"Century Gothic\" color=yellow>");
      out.print( _adminname );
      out.write("</font></td>\n");
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
