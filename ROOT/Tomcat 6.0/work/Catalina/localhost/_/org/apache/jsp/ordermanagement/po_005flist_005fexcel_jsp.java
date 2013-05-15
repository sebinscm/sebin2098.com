package org.apache.jsp.ordermanagement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
import common.*;
import javax.naming.*;
import javax.sql.*;
import java.text.*;
import common.util.*;
import dbconn.*;

public final class po_005flist_005fexcel_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


private String convert_to_ksc(String str) {
		String result = null;
		try {
			byte[] rawBytes = str.getBytes("8859_1");
			result = new String(rawBytes, "KSC5601");
		} catch(UnsupportedEncodingException e) {
			System.err.println(e.toString());
		}
		return result;
	}
private String convert_to_ascii(String str) {		
		String result = null;
		try {
			byte[] kscBytes = str.getBytes("KSC5601");
			result = new String(kscBytes, "8859_1");
		} catch(UnsupportedEncodingException e) {
			System.err.println(e.toString());
		}
		return result;
	}	

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
      response.setContentType("application/vnd.ms-excel");
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
      out.write("\n");
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

response.setHeader("Content-Disposition", "attachment; filename=PO_List.xls;");
response.setHeader("Content-Description", "JSP Generated Data");
request.setCharacterEncoding("euc-kr"); 
String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
if (ag_supplier == null) ag_supplier = "";
if (ag_from_date == null || ag_to_date == null) {
  ag_from_date = ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
if (ag_status == null) ag_status = "";
if (ag_orderby == null) ag_orderby = "1";
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql = "";
int iRet = 0;
String outS = "";

// query for po list
sql = " select  order_no, "
    + "             style, "
    + "             season, "
    + "         order_date, "
    + "          buyer_name, "
    + "         supplier_name, "
    + "         case "
    + "           when order_status = '10' then 'Created' "
    + "           when order_status = '20' then 'Requested' "
    + "           when order_status = '30' then 'Confirmed' "
    + "           when order_status = '90' then 'Cancelled' "
    + "           else  order_status "
    + "         end, "
    + "         to_char(created, 'yyyy/mm/dd'),total_qty "
    + " from   purchase_order "
    + " where   backorder_flag = 'N' " ;
 

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    sql += " and    order_no like '" + ag_po_no + "%' " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    style like '" + ag_style_no + "%' " ;
  }
} else {
  if (!ag_supplier.equals("")) {
      sql += " and    buyer = '" + ag_supplier + "' ";
    }

 sql += " and    to_char(created,'yyyymmdd') between to_char(to_date('" + ag_from_date + "', 'yyyy/mm/dd'),'yyyymmdd') and to_char(to_date('" + ag_to_date + "', 'yyyy/mm/dd'),'yyyymmdd') ";

  if (!ag_status.equals("")) {
    if (ag_status.equals("40")) {
      sql += " and    order_status between '10' and '80' ";
    } else {
      sql += " and    order_status = '" + ag_status + "' ";
    }
  } 

}

if ( ag_orderby.equals("1"))  {
   sql += " order by order_date ";
} 
else if ( ag_orderby.equals("2"))  {
   sql += " order by buyer  ";
}
else if ( ag_orderby.equals("3"))  {
   sql += " order by order_no ";
}
else if ( ag_orderby.equals("4"))  {
   sql += " order by delivery_date ";
}
else if ( ag_orderby.equals("5"))  {
   sql += " order by created ";
}

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  conn.commit();

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in po_list_excel : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

// print po list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no  = matrix.getRowData(i).getData(j++);
  String season   = matrix.getRowData(i).getData(j++);
  String order_date = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
  String total_qty = matrix.getRowData(i).getData(j++);   
   outS += "<tr align='center' >"
        + " <td>" + (i+1) + "</td>"
        + " <td>"  + po_no + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
         + " <td>" + total_qty + "</td>"
        + " <td>" + order_date + "</td>"
        + " <td>" + convert_to_ascii(buyer) + "</td>"
        + " <td>" + convert_to_ascii(supplier) + "</td>"
        + " <td>" + po_status + "</td>"
         + " <td>" + created_date + "</td>"
        + "</tr>";
}

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("\t<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>\n");
      out.write("</HEAD>\n");
      out.write("<body>\n");
      out.write("<table width=\"1500\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<TR align='center'>\n");
      out.write("  <TD>No</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Season</TD>\n");
      out.write("  <TD>Total ¼ö·®</TD>\n");
      out.write("  <TD>Order Date</TD>\n");
      out.write("  <TD>Buyer</TD>\n");
      out.write("  <TD>Supplier</TD>\n");
      out.write("  <TD>PO Status</TD>\n");
      out.write("  <TD>Created</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("</TABLE>\n");
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
