package org.apache.jsp.admin.codes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.*;
import dbconn.*;

public final class code_005fsave_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write("\r\n");
      out.write("\r\n");

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
request.setCharacterEncoding("euc-kr"); 
boolean isSucceeded = true;
String strMsg = "";
String searchCatalogType = request.getParameter("searchCatalogType");

// Database 처리
if (isSucceeded) {

  String sql = "";
  Connection conn = null;
  PreparedStatement pstmt = null;

  String actionFlag = request.getParameter("actionFlag");
  String catalogCode = request.getParameter("catalogCode");
  String catalogName = request.getParameter("catalogName");
  String catalogType = request.getParameter("catalogType");
  String sort_order = request.getParameter("sort_order");
  String useYn = request.getParameter("useYn");
  String related_code = request.getParameter("related_code");
  String catalogDesc = request.getParameter("catalogDesc"); 
  try {
    Context ic = new InitialContext(); 
	  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	  conn = ds.getConnection();

    int idx = 0;
    conn.setAutoCommit(false);

    if (actionFlag.equals("U")) {

      // update ...
      sql = " UPDATE  vg_common_code "
          + " SET     CODE_NAME  = ?, "
          + "         TYPE  = ?, "
          + "         DESCRIPTION = ?, "
          + "         USE_YN = ?, "
          + "         SORT_ORDER = ?, " 
          + "         RELATED_CODE = ?, "
          + "         MODIFIER      = ?, "
          + "         MODIFIED_DATE   = SYSDATE() "
          + " WHERE   CODE = ? "
          + " AND     TYPE = ? ";
      
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, catalogName);
      pstmt.setString(++idx, catalogType);
      pstmt.setString(++idx, catalogDesc);
      pstmt.setString(++idx, useYn);
      pstmt.setString(++idx, sort_order);
      pstmt.setString(++idx, related_code);
      pstmt.setString(++idx, _adminid);
      pstmt.setString(++idx, catalogCode);      
      pstmt.setString(++idx, catalogType);
    } else if (actionFlag.equals("I")) {

      // insert ...
      sql = " INSERT INTO vg_common_code"
          + " ( "
          + "   CODE,  CODE_NAME,  TYPE,   DESCRIPTION,  USE_YN,  SORT_ORDER, "
          + "   RELATED_CODE, MODIFIER, MODIFIED_DATE "
          + " ) "
          + " VALUES "
          + " ( ?,  ?,  ?,  ?,  'Y',  ?,  ?,  ?, SYSDATE() ) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, catalogCode);
      pstmt.setString(++idx, catalogName);
      pstmt.setString(++idx, catalogType);
      pstmt.setString(++idx, catalogDesc);
      pstmt.setString(++idx, sort_order);
      pstmt.setString(++idx, related_code);
      pstmt.setString(++idx, _adminid);      

    } else if (actionFlag.equals("D")) {

      // insert ...
      sql = " DELETE FROM vg_common_code "
          + " WHERE   code = ? "
          + " AND     TYPE = ? ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, catalogCode);
      pstmt.setString(++idx, catalogType);
    }

    // execute ...
    pstmt.executeUpdate();
    conn.commit();
  } catch (SQLException se) {
    try {
        conn.rollback();
    } catch (Exception ex) {}

    isSucceeded = false;
    strMsg = "Check your data. If there is any data using this code, you can't update or delete this data.";
    System.out.println("Exception COMMON CODE save : " + se.getMessage());
    
  } catch (Exception e) {
    try {
        conn.rollback();
    } catch (Exception ex) {}
    

    System.out.println("Exception COMMON CODE save : " + e.getMessage());
    throw e;
  } finally {
    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }

    if (conn != null) {
      try { conn.setAutoCommit(true); } catch (Exception e) {}
      if (conn != null) {conn.close();}	
    }
  }

}

// 결과 메시지 처리
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"./code_list.jsp\">\r\n");
      out.write("<input type=\"hidden\" name=\"searchCatalogType\" value=\"");
      out.print( searchCatalogType );
      out.write("\">\r\n");
      out.write("</form>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("  alert(\"");
      out.print( strMsg );
      out.write("\");\r\n");
      out.write("  document.form1.submit();\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
