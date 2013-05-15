package org.apache.jsp;

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


private void login_history(String scmid, String password, String ipaddress, String loginname, Connection conn ){

	String sql = "INSERT INTO user_02t(scmid, password, ipaddress, loginname, logintime) " +
		" VALUES('" + scmid + "', '" + password + "','" + ipaddress + "','" + loginname + "', sysdate() )";

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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--%@ page errorPage=\"error.jsp\" %-->\n");

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
      out.write('\n');


Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
int iRet = 0;
int iRet2 = 0;
String sql = "";
String sql2 = "";
String ipaddress = request.getRemoteAddr();
String scmid = request.getParameter("scmid");
String input_pw = request.getParameter("passwd");
if (scmid == null) scmid = "";
if (input_pw == null) input_pw = "";
String scmsupid="";
String scmnm = "";
String db_pw = "";
String usertype = "";
String usergroup = "";
String supplier_email="";
String buyer_email="";
//int pw_interval = 0;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 
	conn = ds.getConnection();	
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  dataProcess = new DataProcess();
  
  // read buyer login info
  sql = "SELECT upper(name), passwd, user_type,user_group, trim(email) " +
        " FROM login_01t " +
        " WHERE upper(id) = upper('" + scmid + "')  and user_type='B' " +
        " AND   delete_yn = 'N' ";
 // read supplier id info
  sql2 = " SELECT upper(id), upper(name) ,email  " +
        " FROM login_01t " +
        " WHERE user_type='S' " +
        " AND   delete_yn = 'N' ";

  iRet  =  dataProcess.RetrieveData(sql, matrix, conn);
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);
  if( iRet == 0 ) {
    response.sendRedirect("nouser.jsp");
    
  } else {
    int j = 0;
    scmnm = matrix.getRowData(0).getData(j++);
    db_pw = matrix.getRowData(0).getData(j++);
    usertype = matrix.getRowData(0).getData(j++);
    usergroup = matrix.getRowData(0).getData(j++);
    //pw_interval = Integer.parseInt(matrix.getRowData(0).getData(j++));
    buyer_email = matrix.getRowData(0).getData(j++);
    if ( iRet2 > 0 ) {
        scmsupid = matrix2.getRowData(0).getData(0);
        supplier_email = matrix2.getRowData(0).getData(1);
     } else {
        scmsupid = "S1001";
        supplier_email ="scm@sebin2098.com";	
    } 	 
    if( input_pw.equals(db_pw) ) {  // Correct password.

      login_history(scmid, input_pw, ipaddress ,scmnm, conn); 
      session.setMaxInactiveInterval(4*60*60);
      session.putValue("scmid", scmid.toUpperCase());
      session.putValue("scmsupid", scmsupid);
      session.putValue("scmnm", scmnm);
      session.putValue("usertype", usertype);
      session.putValue("usergroup", usergroup);
      session.putValue("buyer_email", buyer_email);
      session.putValue("supplier_email", supplier_email);
      
      //if (db_pw.equals("1111") || pw_interval > 90) {
      if (db_pw.equals("1111") ) {
        response.sendRedirect("initpass2.html");
        return;
      } else {
        response.sendRedirect("index2.jsp");
        return;
      }

    } else {  // wrong password.
      session.invalidate();
      response.sendRedirect("nouser.jsp");
      return;
    }

  }

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
