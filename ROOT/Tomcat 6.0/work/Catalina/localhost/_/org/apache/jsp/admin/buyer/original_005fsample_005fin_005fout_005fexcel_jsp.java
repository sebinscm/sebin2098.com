package org.apache.jsp.admin.buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class original_005fsample_005fin_005fout_005fexcel_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/admin/login_check.jsp");
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

response.setHeader("Content-Disposition", "attachment; filename=Original_Sample_In_Out.xls;");
response.setHeader("Content-Description", "JSP Generated Data");

String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchStatus = request.getParameter("statusOptions");
String searchStyleNo = request.getParameter("searchStyleNo");
String withImage = request.getParameter("withImage");

int iRet = 0;
String outS = "";
String sql = "";
if (searchStatus == null) searchStatus = "";
if (searchSampleNo == null) { 
    searchSampleNo = "";
} else {
	searchSampleNo = searchSampleNo.trim();
}	    
if (searchStyleNo == null) { 
    searchStyleNo = "";
} else {
	searchStyleNo = searchStyleNo.trim();
}	   
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

// set query
sql =  " select  a.sequence_no, a.sample_no, a.item_class,date_format(a.input_date, '%Y/%m/%d'), "
        + "         a.item_group, a.qty, a.season, upper(a.buyer), a.supplier,  "
        + "         date_format(a.sending_date, '%Y/%m/%d'), date_format(a.return_date, '%Y/%m/%d'), "
        + "         ifnull(a.remarks,' '), a.style_no, a.status, b.code_name "
        + " from    VG_SAMPLE_IN_OUT a, VG_COMMON_CODE b " 
        + "         where a.status=b.code and b.type='ORDER_STATUS' ";    

if (searchStyleNo.equals("")) {
	if (searchSampleNo.equals("")) {
			  sql += " and a.input_date between str_to_date('" + searchFromDate + "', '%Y/%m/%d') "
			               + "         and  str_to_date('" + searchToDate + "', '%Y/%m/%d') ";
			
			  if (!searchSupplier.equals("")) {
			    sql += " and    a.supplier = '" + searchSupplier + "' ";
			  }
			  
			  if (!searchItemGroup.equals("")) {
			    sql += " and    a.item_group = '" + searchItemGroup + "' ";
			  }
			
			  if (!searchBuyer.equals("")) {
			    sql += " and    upper(a.buyer) = '" + searchBuyer + "' ";
			  }
	} else {  
	  sql += " and a.sample_no like upper('%" + searchSampleNo+ "%')";
	}
} else {
	 sql += "  and a.style_no like upper('%" + searchStyleNo+ "%')";
}	
if (!searchItemClass.equals("")) {
  sql += " and    a.item_class = " + searchItemClass;
}
 if (!searchStatus.equals("")) {
      sql  += " and   status = '" + searchStatus + "' ";
  
  } 

sql += " order by str_to_date(a.input_date, '%Y/%m/%d') desc, a.sample_no desc ";
out.println(sql);

try {

  dataProcess = new DataProcess();
  matrix = new MatrixDataSet();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception /admin/buyer/original_sample_in_out_excel.jsp : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) { 
    conn.close();
  }
}

// print out history list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String sequenceNo     = matrix.getRowData(i).getData(j++);
  String sampleNo       = matrix.getRowData(i).getData(j++);    
  String item_class     = matrix.getRowData(i).getData(j++);
  //String itemClassNm    = matrix.getRowData(i).getData(j++);
  String inputDate      = matrix.getRowData(i).getData(j++);
  String item_group     = matrix.getRowData(i).getData(j++);
  //String itemGroupNm    = matrix.getRowData(i).getData(j++);
  String qty            = matrix.getRowData(i).getData(j++);
  String season          = matrix.getRowData(i).getData(j++);
  //String placeNm        = matrix.getRowData(i).getData(j++);
  String buyer          = matrix.getRowData(i).getData(j++);
  String supplier       = matrix.getRowData(i).getData(j++);
  //String supplierNm     = matrix.getRowData(i).getData(j++);
  String sendingDate    = matrix.getRowData(i).getData(j++);
  String returnDate     = matrix.getRowData(i).getData(j++);
  String remarks        = matrix.getRowData(i).getData(j++);
  String styleNo        = matrix.getRowData(i).getData(j++);
  String order_status        = matrix.getRowData(i).getData(j++);
  String status_name        = matrix.getRowData(i).getData(j++);
  // set image
  String imgUrl = "";
  if (returnDate.equals("0000/00/00") ) returnDate ="";
  if (withImage.equals("Y")) {
    File imgFile = new File(application.getRealPath(_sampleIamgeUrl) + File.separator + sampleNo + ".jpg");

    if (imgFile.exists()) {
      imgUrl = "<img src='http://" + request.getServerName() + _sampleIamgeUrl + "/" + sampleNo + ".jpg' width='33' height='51'>";
    }
  }

   outS += "<tr align='center' >"
        + " <td align='left'>" + sampleNo + "</td>"
        + " <td>" + inputDate + "</td>"
        + " <td>" + item_class + "</td>"
//      + " <td align='left'>" + item_group + "</td>"
        + " <td>" + item_group + "</td>"
        + " <td>" + qty + "</td>"
        + " <td>" + season + "</td>"
        + " <td align='left'>" + buyer + "</td>"
        + " <td align='left'>" + supplier + "</td>"
        + " <td align='left'>" + status_name + "</td>"
        + " <td>" + sendingDate + "</td>"
        + " <td>" + returnDate + "</td>"
//        + " <td align='left'>" + remarks + "</td>"
        + " <td>" + styleNo + "</td>"
        + (withImage.equals("Y") ? "<td>" + imgUrl + "</td>" : "")    
        + "</tr>";   
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<table width=\"1500\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr align='center'>\n");
      out.write("  <td>Sample No</td>\n");
      out.write("  <td>Date</td>\n");
      out.write("  <td>PGR</td>\n");
      out.write("  <!--td>Group Name</td-->\n");
      out.write("  <td>SGR</td>\n");
      out.write("  <td>Qty</td>\n");
      out.write("  <td>Season</td>\n");
      out.write("  <td>Buyer ID</td>\n");
      out.write("  <td>Supplier ID</td>\n");
      out.write("  <td>Status</td>\n");
      out.write("  <td>Sending Date</td>\n");
      out.write("  <td>Receiving Date</td>\n");
      out.write("  <!--td width='14%'>Remarks</td-->\n");
      out.write("  <td>Style No</td>\n");
      out.write("  ");

if (withImage.equals("Y")) {

      out.write("\n");
      out.write("  <td>Image</td>\n");

}

      out.write("\n");
      out.write("</tr>\n");
      out.print( outS );
      out.write("\n");
      out.write("</table>\n");
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
