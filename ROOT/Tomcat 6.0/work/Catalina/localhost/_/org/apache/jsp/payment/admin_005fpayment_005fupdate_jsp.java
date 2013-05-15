package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import dbconn.*;
import javax.naming.*;
import javax.sql.*;
import common.*;

public final class admin_005fpayment_005fupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
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

request.setCharacterEncoding("euc-kr"); 
String ag_supplier = request.getParameter("ag_supplier");
String ag_supplier_type = request.getParameter("ag_supplier_type");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
String buyer_id = request.getParameter("buyer_id");
String passwd = request.getParameter("passwd");
String actionFlag = request.getParameter("actionFlag");
String seq_no[] = request.getParameterValues("seq_no");

String pay_amt = request.getParameter("pay_amt");
String pay_date = request.getParameter("pay_date");
String pay_comment = request.getParameter("pay_comment");
String claim_amt = request.getParameter("claim_amt");
String claim_date = request.getParameter("claim_date");
String claim_comment = request.getParameter("claim_comment");
String close_yn = request.getParameter("close_yn");
if ( pay_amt == "" || pay_amt == null ) pay_amt ="0"; 
if ( claim_amt == "" || claim_amt == null ) claim_amt ="0"; 
 if ( !pay_date.equals("") )  pay_date = pay_date.substring(0,4)+"/"+pay_date.substring(5,7)+"/"+pay_date.substring(8,10); 
 if ( !claim_date.equals("") )  claim_date = claim_date.substring(0,4)+"/"+claim_date.substring(5,7)+"/"+claim_date.substring(8,10);
 
int iRet = 0;
int iRet2 = 0;
String sql = "";
String sql2 = "";
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
PreparedStatement pstmt = null;
DataProcess dataProcess = null;
MatrixDataSet matrix = null;
int iCnt = 0;
String nextUrl = "";
String attach_file = "";

try {   
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
   matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
    // update invoice info
  conn.setAutoCommit(false);
  String tmp_seq_no = "";
  if (seq_no != null) {
    for (int i = 0; i < seq_no.length; i++) {
      if (i > 0) tmp_seq_no += ",";
      tmp_seq_no += "'" + seq_no[i] + "'";
    }
  }
  int j = 0;
  int rcnt = 0;
  if (actionFlag.equals("ADD")) {
	       // check next seqno for insert record
	      sql = " select count(*) from payment_01t where invoice_no = '" + inv_no + "' "
	      	           +  " and supplier =  '" + sup_id + "' "
	                  + " and buyer = '" + buyer_id + "' ";
	      dataProcess.RetrieveData(sql, matrix, conn);  
	      rcnt =  Integer.parseInt(matrix.getRowData(0).getData(0));    
	      int next_seqno = 1;    
	      if ( rcnt > 0 ) {
			      sql = " select ifnull(max(seq_no)+1,0)  from payment_01t where invoice_no = '" + inv_no + "' "
			          +  " and supplier =  '" + sup_id + "' "
			           + " and buyer = '" + buyer_id + "' ";
		         iRet = dataProcess.RetrieveData(sql, matrix, conn);      
		        next_seqno   =  Integer.parseInt(matrix.getRowData(0).getData(0));
          } 	
    // read POs info and add POs to invoice
    sql = " insert  into payment_01t "
        + "         ( invoice_no, seq_no, supplier, buyer, pay_amt,pay_date , pay_comment, "
        + "           claim_amount , claim_date, claim_comment , close_yn, updated , updated_id ) "
        + "  values ( upper(?) , ?, ?, ?, ?, str_to_date(?, '%Y/%m/%d') ,? , "
        + "               ?, str_to_date(?, '%Y/%m/%d') , ?, ?, sysdate(), ?) " ;
    j = 0;

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, inv_no);
    pstmt.setString(++j, next_seqno+"");
    pstmt.setString(++j, sup_id);
    pstmt.setString(++j, buyer_id);
    pstmt.setString(++j, pay_amt);
    pstmt.setString(++j, pay_date);
    pstmt.setString(++j, pay_comment);
    pstmt.setString(++j, claim_amt);
    pstmt.setString(++j, claim_date);
    pstmt.setString(++j, claim_comment);
    pstmt.setString(++j, close_yn);
    pstmt.setString(++j, _adminid);
    pstmt.executeUpdate();
    pstmt.close();
    
    // update invoice status(C) completed & pai date if closed the payment amount
    if ( close_yn.equals("Y") ) {
	    sql = " update  invoice_01t "
	        + " set     status = 'C' ,"
	        + "           paid_date = sysdate() " 
	        + " where  upper(invoice_no) =upper('" + inv_no + "')  ";
	    
	    pstmt = conn.prepareStatement(sql);
	    pstmt.executeUpdate();
	    pstmt.close();
	    sql = " update  purchase_order "
	        + " set     order_status = '99' "   // Payment완료
	        + " where  upper(payment_no) = upper('" + inv_no + "')  ";
	    
	    pstmt = conn.prepareStatement(sql);
	    pstmt.executeUpdate();
	    pstmt.close();
    }

  } else if (actionFlag.equals("DEL")) {

    // delete POs from invoice
    sql = " delete from payment_01t "
        + " where   invoice_no = ? "
        + " and     seq_no in (" + tmp_seq_no + ") "
        + " and     buyer = ?  " 
        + " and     supplier = ? ";

    j = 0;
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, inv_no);
    pstmt.setString(++j, buyer_id);
    pstmt.setString(++j, sup_id);
    pstmt.executeUpdate();
    pstmt.close();

    // update invoice status
    sql = " update  invoice_01t "
        + " set     status = 'R', " //Invoice작성
        + "           paid_date = str_to_date('', '%Y/%m/%d') " //Invoice no clear
        + " where   invoice_no = '" + inv_no + "' "
        +  " and sup_id =  '" + sup_id + "' "
	    + " and buyer_id = '" + buyer_id + "' ";;
    
    pstmt = conn.prepareStatement(sql);
    pstmt.executeUpdate();
    pstmt.close();

  } else {
  
    throw new UserDefinedException("The action is unknown.");

  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception invoice_edit_save : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }

  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// delete attach file
if (actionFlag.equals("D") && isSucceeded && !attach_file.equals("")) {
  try {
    File file = new File(application.getRealPath(_invoiceFileUrl) + File.separator + attach_file);
    if (file.exists()) { file.delete(); }
  } catch (Exception e) {}
}

// result message
if (isSucceeded) {
  strMsg = "The data are successfully processed.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
}

// set Next Url
nextUrl = "./payment_edit_form.jsp";
if (actionFlag.equals("ADD") && isSucceeded) {
  nextUrl = "./payment_edit_form.jsp";
}
if (actionFlag.equals("DEL") && isSucceeded) {
  nextUrl = "./payment_edit_form.jsp";
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<head>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_supplier_type' value='");
      out.print( ag_supplier_type );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_month' value='");
      out.print( ag_month );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_year' value='");
      out.print( ag_year );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_search_inv_no' value='");
      out.print( ag_search_inv_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='inv_no' value='");
      out.print( inv_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='sup_id' value='");
      out.print( sup_id );
      out.write("'>\n");
      out.write("</form>\n");
      out.write("<script language='javascript'>\n");
      out.write("alert(\"");
      out.print( strMsg );
      out.write("\");\n");
      out.write("form1.action = '");
      out.print( nextUrl );
      out.write("';\n");
      out.write("form1.submit();\n");
      out.write("</script>\n");
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
