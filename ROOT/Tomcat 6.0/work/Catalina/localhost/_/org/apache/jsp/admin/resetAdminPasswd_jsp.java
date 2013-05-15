package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.*;
import dbconn.*;

public final class resetAdminPasswd_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
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
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\n");

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

String password = request.getParameter("password");
String fromURL = request.getParameter("fromURL");
String oldPassword = "";

String sql = "";
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
PreparedStatement pstmt = null;

String targetUrl = "";

try {

  if (password.equals("1111")) {
    throw new UserDefinedException("The new password is not acceptable. Change your password.");
  }

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();

  sql = " select  password "
      + " from    admin_01t "
      + " where   adminid = '" + _adminid + "' ";

  iCnt = dataProcess.RetrieveData(sql, matrix, conn);

  if (iCnt > 0) {
    oldPassword = matrix.getRowData(0).getData(0);
  } else {
    throw new UserDefinedException("Can't find User Information.");
  }

  if (password.equals(oldPassword)) {
    throw new UserDefinedException("The new password is not acceptable. Change your password.");
  }

  // update Ã³¸®...
  int idx = 0;
  conn.setAutoCommit(false);

  sql = " update  admin_01t "
      + " set     password = ?, pw_date = sysdate() "
      + " where   adminid = ? ";

  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++idx, password);
  pstmt.setString(++idx, _adminid);

  iCnt = pstmt.executeUpdate();

  if (iCnt != 1) {
    throw new UserDefinedException("Password update failed.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /admin/resetAdminPasswd : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// °á°ú ¸Þ½ÃÁö Ã³¸®
if (isSucceeded) {
  // where to go?
  if (fromURL.equals("menu")) {
    targetUrl = "";
  } else {
    targetUrl = "/admin/index2.jsp";
  }
  strMsg = "The data are successfully processed.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
  targetUrl = "/admin/resetAdminPasswdForm.jsp";
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("</head>\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"");
      out.print( targetUrl );
      out.write("\">\n");
      out.write("<input type='hidden' name='fromURL' value='");
      out.print( fromURL );
      out.write("'>\n");
      out.write("</form>\n");
      out.write("<script language=\"javascript\">\n");
 if (targetUrl.length() > 0) { 
      out.write("\n");
      out.write("  alert('");
      out.print( strMsg );
      out.write("');\n");
      out.write("  document.form1.submit();\n");
 } 
      out.write("\n");
      out.write("</script>\n");
      out.write("<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>\n");
      out.write("\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='3%'><img src='/img/title_icon.gif'></td>\n");
      out.write("  <td width='*' class='left_title'>Password Change</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='10' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' align='center'><img border=\"0\" src=\"/img/pass.jpg\">\n");
      out.write("    <br><br>\n");
      out.write("    <b>The Password has been changed successfully.</b></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</tr></td></table>\n");
      out.write("</body>\n");
      out.write("</html>");
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
