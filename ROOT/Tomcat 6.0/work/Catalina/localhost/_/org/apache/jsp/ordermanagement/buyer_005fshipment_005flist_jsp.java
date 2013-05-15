package org.apache.jsp.ordermanagement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import common.util.*;

public final class buyer_005fshipment_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants = new java.util.ArrayList(4);
    _jspx_dependants.add("/login_check.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
    _jspx_dependants.add("/common/calendar/calendar.htm");
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
      out.write('\n');
      out.write("<Div id='popCal' style='POSITION:absolute;visibility:hidden;border:1px ridge;width:10'>\n");
      out.write("  <iframe name=\"popFrame\" src=\"/common/calendar/popcjs.htm\" frameborder=\"0\" style=\"border:1 solid #EBF6FD\"  frameborder=\"0\" scrolling=\"no\" width=176 height=215>\n");
      out.write("  </iframe>\n");
      out.write("</DIV>\n");
      out.write("<!--SCRIPT event=onclick() for=document>document.all['popCal'].style.visibility = \"hidden\";</SCRIPT-->\n");
      out.write("<script language='javascript'>\n");
      out.write("function setVisibility() {\n");
      out.write("  document.all['popCal'].style.visibility = 'hidden';\n");
      out.write("}\n");
      out.write("\n");
      out.write("document.onclick = setVisibility;\n");
      out.write("</script>");
      out.write('\n');
      out.write('\n');

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;

String outS = "";
String sql = "";

String ag_buyer_id = scmid;
String buyer_id = scmid;
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_confirm_status = request.getParameter("ag_confirm_status");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String ag_po_no = request.getParameter("ag_po_no");

if (ag_from_date == null || ag_to_date == null) {
  ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -60, "yyyy/MM/dd");
  ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
if (ag_confirm_status == null) ag_confirm_status = "N";
if (ag_invoice_no == null) ag_invoice_no = "";
if (ag_po_no == null) ag_po_no = "";

// set sql
sql = " select  h.buyer_id, l.name, h.confirm_status, date_format(h.confirm_date, '%Y/%m/%d'), "
    + "         date_format(h.issue_date, '%Y/%m/%d'), "
    + "         h.invoice_no, c2.code_name, c1.code_name, date_format(h.handover_date, '%Y/%m/%d'), "
    + "         c4.code_name, c3.code_name, h.shipping_type, h.bl_filename, h.iv_filename, h.pl_filename, h.supplier_id "
    + " from    shipment_01t h "
    + "         left outer join login_01t l "
    + "           on h.buyer_id = l.id "
    + "         left outer join vg_common_code c1 "
    + "           on h.shipping_port = c1.code "
    + "           and c1.type = 'SHIPPING_PORT' "
    + "         left outer join vg_common_code c2 "
    + "           on c1.related_code = c2.code "
    + "           and c2.type = 'COUNTRY_CODE' "
    + "         left outer join vg_common_code c3 "
    + "           on h.nominated_forwarder = c3.code "
    + "           and c3.type = 'FORWARDER' "
    + "         left outer join vg_common_code c4 "
    + "           on c3.related_code = c4.code "
    + "           and c4.type = 'COUNTRY_CODE' "
    + " where   1=1 ";

if (!ag_invoice_no.equals("") || !ag_po_no.equals("")) {
  if (!ag_invoice_no.equals("")) {
    sql += " and     h.invoice_no = '" + ag_invoice_no + "' ";
  }

  if (!ag_po_no.equals("")) {
    sql += " and     (h.invoice_no, h.buyer_id) in ( "
         + "           select  invoice_no, buyer_id "
         + "           from    shipment_02t "
         + "           where   po_no = '" + ag_po_no + "' "
         + "         ) ";
  }
} else {
  sql += " and     h.issue_date between str_to_date('" + ag_from_date + "', '%Y/%m/%d') and str_to_date('" + ag_to_date + "', '%Y/%m/%d') "
       + (!ag_buyer_id.equals("") ? " and     h.buyer_id = '" + ag_buyer_id + "' " : "" )
       + (!ag_confirm_status.equals("") ? " and    h.confirm_status = '" + ag_confirm_status + "' " : "");
}

sql += " order by h.issue_date, l.name, h.invoice_no ";
//out.println(sql);

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
   Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData(sql, matrix, conn); 
  

} catch (Exception e) {
  System.out.println("Exception admin_shipment_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

// print list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String buyerId = matrix.getRowData(i).getData(j++);
  String buyerName = matrix.getRowData(i).getData(j++);
  String confirmStatus = matrix.getRowData(i).getData(j++);
  String confirmDate = matrix.getRowData(i).getData(j++);
  String issueDate = matrix.getRowData(i).getData(j++);
  String invoiceNo = matrix.getRowData(i).getData(j++);
  String portCountryName = matrix.getRowData(i).getData(j++);
  String shippingPortName = matrix.getRowData(i).getData(j++);
  String handoverDate = matrix.getRowData(i).getData(j++);
  String forwarderCountryName = matrix.getRowData(i).getData(j++);
  String forwarderName = matrix.getRowData(i).getData(j++);
  String shippingType = matrix.getRowData(i).getData(j++);
  String blFilename = matrix.getRowData(i).getData(j++);
  String ivFilename = matrix.getRowData(i).getData(j++);
  String plFilename = matrix.getRowData(i).getData(j++);
  String supplierId = matrix.getRowData(i).getData(j++);
  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + buyerId + "</td>" +
          "<td>" + buyerName + "</td>" +
          "<td>" + confirmStatus + "</td>" +
          "<td>" + confirmDate + "</td>" +
          "<td>" + issueDate + "</td>" +
          "<td><a href=\"javascript:fnView('" + invoiceNo + "', '" + buyerId + "','" + supplierId + "')\">" + invoiceNo + "</a></td>" +
          "<td>" + portCountryName + " - " + shippingPortName + "</td>" +
          "<td>" + handoverDate + "</td>" +
          "<td>" + forwarderCountryName + " - " + forwarderName + "</td>" +
          "<td>" + shippingType + "</td>" +
          "<td><a href=\"javascript:fnDownload('" + blFilename + "');\">" + blFilename + "</a></td>" +
          "<td><a href=\"javascript:fnDownload('" + ivFilename + "');\">" + ivFilename + "</a></td>" +
          "<td><a href=\"javascript:fnDownload('" + plFilename + "');\">" + plFilename + "</a></td>" +
          "</tr>";
}



      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnSearch(frm)\n");
      out.write("{\n");
      out.write("  frm.ag_invoice_no.value = jf_AllTrim(frm.ag_invoice_no.value);\n");
      out.write("  frm.ag_po_no.value = jf_AllTrim(frm.ag_po_no.value);\n");
      out.write("  frm.action = './buyer_shipment_list.jsp';\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnView(invoice_no, buyer_id) {\n");
      out.write("  frmMain.invoice_no.value = invoice_no;\n");
      out.write("  frmMain.buyer_id.value = buyer_id;\n");
      out.write("  frmMain.action = \"./buyer_shipment_view.jsp\";\n");
      out.write("  frmMain.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDownload(file) {\n");
      out.write("  with (document.form2) {\n");
      out.write("    attachFile.value = file;\n");
      out.write("    attachRealFile.value = file;\n");
      out.write("    action = '/common/download.jsp';\n");
      out.write("    target = 'hiddenFrm';\n");
      out.write("    submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Shipment List</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE WIDTH='99%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<TR>\n");
      out.write("  <td><font color=blue></font></td>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE WIDTH='99%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM NAME='frmMain' METHOD='POST'>\n");
      out.write("<input type='hidden' name='invoice_no'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("' >\n");
      out.write("<TR>\n");
      out.write(" <TD width='15%' class='table_header_center'>Invoice No.</TD>\n");
      out.write("  <TD width='20%' class='table_bg_bright'><input type='text' name='ag_invoice_no' value='");
      out.print( ag_invoice_no );
      out.write("' size='20' maxlength='20'></TD>\n");
      out.write("  <TD class='table_header_center'>Confirm Status</TD>\n");
      out.write("  <TD class='table_bg_bright'><select name='ag_confirm_status'>\n");
      out.write("    <option value='' ");
      out.print( ag_confirm_status.equals("") ? "selected" : "" );
      out.write(">All</option>\n");
      out.write("    <option value='Y' ");
      out.print( ag_confirm_status.equals("Y") ? "selected" : "" );
      out.write(">Y</option>\n");
      out.write("    <option value='N' ");
      out.print( ag_confirm_status.equals("N") ? "selected" : "" );
      out.write(">N</option>\n");
      out.write("    </select></TD> \n");
      out.write("  <td width='15%' class='table_bg_bright_center' rowspan='3'><INPUT TYPE='BUTTON' VALUE=\"Search\" ONCLICK='fnSearch(this.form)'></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>Issue Date</TD>\n");
      out.write("  <TD class='table_bg_bright'><input type='text' name='ag_from_date' size='10' value='");
      out.print( ag_from_date );
      out.write("' style='cursor:hand' readonly\n");
      out.write("    onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write("    ~\n");
      out.write("    <input type='text' name='ag_to_date' size='10' value='");
      out.print( ag_to_date );
      out.write("' style='cursor:hand' readonly\n");
      out.write("    onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\"></TD>\n");
      out.write("  <TD class='table_header_center'>PO No.</TD>\n");
      out.write("  <TD class='table_bg_bright'><input type='text' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("' size='20' maxlength='20'></TD>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</td></tr></table>\n");
      out.write("* Select Invoice number to see the Shipment detail.\n");
      out.write("<table width=\"1600\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\"><tr><td>\n");
      out.write("<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("  <TD width='1%'>No.</TD>\n");
      out.write("  <TD width='4%'>Buyer ID</TD>\n");
      out.write("  <TD width='10%'>Buyer Name</TD>\n");
      out.write("  <TD width='3%'>Confirm<br>Y/N</TD>\n");
      out.write("  <TD width='4%'>Confirm<br>Date</TD>\n");
      out.write("  <TD width='4%'>Issue<br>Date</TD>\n");
      out.write("  <TD width='8%'>Invoice No.</TD>\n");
      out.write("  <TD width='10%'>Shipping Port</TD>\n");
      out.write("  <TD width='4%'>Handover<br>Date</TD>\n");
      out.write("  <TD width='10%'>Nominated Forwarder</TD>\n");
      out.write("  <TD width='3%'>Shipping<br>Type</TD>\n");
      out.write("  <TD width='13%'>B/L or AWB File</TD>\n");
      out.write("  <TD width='13%'>Invoice File</TD>\n");
      out.write("  <TD width='13%'>Packing List File</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</FORM>\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='attachPath' value='");
      out.print( _shipmentFileUrl );
      out.write("'>\n");
      out.write("<input type='hidden' name='attachFile'>\n");
      out.write("<input type='hidden' name='attachRealFile'>\n");
      out.write("</form>\n");
      out.write("</table>\n");
      out.write("</td></tr></table>\n");
      out.write("\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</td></tr></table>\n");
      out.write("<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>\n");
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
