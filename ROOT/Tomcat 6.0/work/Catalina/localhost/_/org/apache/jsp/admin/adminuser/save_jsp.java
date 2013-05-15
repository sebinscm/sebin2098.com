package org.apache.jsp.admin.adminuser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.*;
import dbconn.*;

public final class save_jsp extends org.apache.jasper.runtime.HttpJspBase
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

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

request.setCharacterEncoding("euc-kr"); 
String adminId = request.getParameter("adminId");
String adminName = request.getParameter("adminName");
String password = request.getParameter("password");
String adminType = request.getParameter("adminType");
String adminGroup = request.getParameter("adminGroup");
String approval = request.getParameter("approval");
String adminClass = request.getParameter("adminClass");
String email = request.getParameter("email");
String actionFlag = request.getParameter("actionFlag");

String sql = "";
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
PreparedStatement pstmt = null;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // insert/update/delete 처리...
  int idx = 1;
  conn.setAutoCommit(false);

  // actionFlag에 따라 처리함.
  if (actionFlag.equals("I")) {

    // insert...
    sql = " insert into admin_01t "
        + " ( "
        + "   adminid, adminname, password, admintype, admingroup, approval, adminclass,email "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, ?, ?, ?, ?, ?,? "
        + " ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminId);
    pstmt.setString(idx++, adminName);
    pstmt.setString(idx++, password);
    pstmt.setString(idx++, adminType);
    pstmt.setString(idx++, adminGroup);
    pstmt.setString(idx++, approval);
    pstmt.setString(idx++, adminClass);
    pstmt.setString(idx++, email);

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  admin_01t "
        + " set "
        + "   adminname = ?, "
        + "   admintype = ?, "
        + "   admingroup = ?, "
        + "   approval = ?, "
        + "   email = ?, "
        + "   adminclass = ? "
        + " where   adminid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminName);
    pstmt.setString(idx++, adminType);
    pstmt.setString(idx++, adminGroup);
    pstmt.setString(idx++, approval);
    pstmt.setString(idx++, email);
    pstmt.setString(idx++, adminClass);
    pstmt.setString(idx++, adminId);

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  from admin_01t "
        + " where   adminid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminId);

  } else if (actionFlag.equals("P")) {

    // initialize password..
    sql = " update  admin_01t "
        + " set     password = '1111' "
        + " where   adminid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminId);

  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  // execute ...
  iCnt = pstmt.executeUpdate();

  if (iCnt != 1) {
    throw new UserDefinedException("Check your data.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /admin/adminuser/save : " + e.getMessage());
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

// 결과 메시지 처리
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"./list.jsp\">\n");
      out.write("</form>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("  alert('");
      out.print( strMsg );
      out.write("');\n");
      out.write("  document.form1.submit();\n");
      out.write("</script>\n");
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
