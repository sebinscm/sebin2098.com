package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import java.util.ArrayList;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


private void login_history(String adminid, String password, String ipaddress, String loginname, Connection conn ){

	String sql = "INSERT INTO user_02t(scmid, password, ipaddress, loginname, logintime) " +
		" VALUES('" + adminid + "', '" + password + "','" + ipaddress + "','" + loginname + "', sysdate )";

	try{
		Statement stmt = conn.createStatement();
		int iRet = stmt.executeUpdate(sql);
		stmt.close();
	}catch( SQLException e ) {
	}
}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/common/CommonVars.jsp");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\n");

// MY SQL DB
//String _mysqlJdbcDriver = "com.mysql.jdbc.Driver";
//String _urlLogin = "jdbc:mysql://10.2.1.247:3306";
//String _userLogin = "user";
//String _pwLogin = "password";

// MS-SQL DB
//String _mssqlJdbcDriver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
//String _urlFutura = "jdbc:microsoft:sqlserver://10.2.1.228:1433";
//String _userFutura = "user";
//String _pwFutura = "password";


// Management Notice Upload path
String _ManagementNoticeUploadUrl = "/admin/notice/upload";

// Uplod
//String _uploadPath = "../../var/tmp";
String _uploadPath = "C:/SCM_MYSQL/ROOT/var/tmp";
String _uploadPath2 = "C:/SCM_MYSQL/ROOT/var/tmp";
long _maxFileSize = 50*1024*1024;

// SCM Image Path
String _SCMIMGURL = "http://www.sebin2098.com/images/";

// style image path
String _styleImgURL = "/images";

// Fault return invoice File URL
String _faultReturnInvoiceFileURL = "/images/Return";

// Memo °ü·Ã º¯¼ö
String _memoDataUrl = "/memo/upload";


// Spec Sheet path
String _specSheetUrl = "/spec_sheet_files";

// Notice URL
// Notice
String _noticeDataUrl = "/notice_new/upload";


// Sample Image Url
String _sampleImageUrl = "/images/SAMPLE_IMAGE";

// barcode file Image Url
String _barcodeFileUrl = "/images/Barcode";

// Invoice file path
String _invoiceFileUrl = "/payment/inv_files";

// shipment file path
String _shipmentFileUrl = "/ordermanagement/shipment_upload";

// SMTP MAIL SERVER
String SMTP_SERVER = "smtp.gmail.com";
String SMTP_USER ="scm@sebin2098.com";
String SMTP_PASSWORD ="gavi1004";

// System Admin Mail Address
String _systemAdminEmail = "scm@sebin2098.com";
String _systemAdminName = "SCM Administrator";

//  MU rate
double _MURate = 0.25;

// Ex-Factory Price Rate
double _EXRate = 0.04;


// Ex-Factory Price Rate 
double _EXRate2 = 0.04;


      out.write('\n');

Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
int iRet = 0;
String sql = "";

String ipaddress = request.getRemoteAddr();
String adminid = request.getParameter("adminid");
String input_pw = request.getParameter("passwd");
if (adminid == null) adminid = "";
if (input_pw == null) input_pw = "";

String adminname = "";
String db_pw_enc = "";
String input_pw_enc = "";
String db_pw = "";
String admintype = "";
String admingroup = "";
int pw_interval = 0;
String approval = "";
String adminclass = "";
String admin_email="";
try {
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  //////////////////////////////////////////////////////////////////////////
  // check id, pw from admin ID
  sql = " select  password "
      + " from    admin_01t "
      + " where   adminid = '" + adminid + "' ";

  //out.println(sql);
  //if (true) return; 
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet <= 0) {
    response.sendRedirect("nouser.jsp");
    return;
  }

  int j = 0;
  db_pw_enc = matrix.getRowData(0).getData(j++);
  if (!db_pw_enc.equals(input_pw)) {
    response.sendRedirect("./nouser.jsp");
    return;
  }


  sql = " SELECT adminname, admintype, admingroup, approval, adminclass,email " +
        " FROM admin_01t " +
        " WHERE adminid = '" + adminid + "' " ;


  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet <= 0) {
    response.sendRedirect("nouser.jsp");
    return;
  }

  j = 0;
  adminname = matrix.getRowData(0).getData(j++);
  admintype = matrix.getRowData(0).getData(j++);
  admingroup = matrix.getRowData(0).getData(j++);
  approval= matrix.getRowData(0).getData(j++);
  adminclass = matrix.getRowData(0).getData(j++);
  admin_email = matrix.getRowData(0).getData(j++);
  login_history(adminid, input_pw, ipaddress ,adminname, conn);  
  session.setMaxInactiveInterval(4*60*60);
  session.putValue("adminid", adminid);
  session.putValue("adminname", adminname);
  session.putValue("admintype", admintype);
  session.putValue("admingroup", admingroup);
  session.putValue("approval", approval);
  session.putValue("adminclass", adminclass);
  session.putValue("admin_email", admin_email);
  response.sendRedirect("index2.jsp");

} catch (Exception e) {
  System.out.println("Exception login : " + e.getMessage());
  throw e;
} finally {  
		if (conn != null) {conn.close();}		
}

      out.write('\n');
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
