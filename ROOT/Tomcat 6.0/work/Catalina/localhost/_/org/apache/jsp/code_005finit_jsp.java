package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;
import common.*;
import dbconn.*;

public final class code_005finit_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"error.jsp", true, 8192, true);
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
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

String password = request.getParameter("password");
String oldPassword = "";
String goURL="";
String sql = "";
boolean isSucceeded = false;
String strMsg = "";
int iCnt = 0;

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
PreparedStatement pstmt = null;

try {

  if (password.equals("1111")) {
    throw new UserDefinedException("The new password is not acceptable. Please try again!");
  }

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 
  conn = ds.getConnection();	
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  // read old password
  sql = " select  passwd "
      + " from    login_01t "
      + " where   id = '" + scmid + "' ";
  
  iCnt = dataProcess.RetrieveData(sql, matrix, conn);

  if (iCnt > 0) {
    oldPassword = matrix.getRowData(0).getData(0);
  } else {
    throw new UserDefinedException("Buyer information not found!");
  }

  if (password.equals(oldPassword)) {
    throw new UserDefinedException("The new password is not acceptable. Please try again!");
  }

  // update
  int idx = 0;
  conn.setAutoCommit(false);

  sql = " update  login_01t "
      + " set     passwd = ?, pw_date = sysdate() "
      + " where   id = ? ";

  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++idx, password);
  pstmt.setString(++idx, scmid);

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
  strMsg = "System error occured. Ask to the system administrator.";
  System.out.println("Exception code_initpass : " + e.getMessage());
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}
 
if (isSucceeded) {
  strMsg = "your new password has been changed successfully!";
  goURL="/index2.jsp";
} else {
  strMsg = " New password error! Please check your new password! \\n" + strMsg;	
   goURL = "/initpass2.html";
}	

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name=\"form1\" method=\"post\" action='");
      out.print( goURL );
      out.write("' >\n");
      out.write("<input type='hidden' name='ag_id' value='");
      out.print( scmid );
      out.write("'>\t\n");
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
