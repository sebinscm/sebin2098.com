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

public final class shipment_005fedit_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/admin/login_check.jsp");
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

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");

String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String ag_po_no = request.getParameter("ag_po_no");
String invoice_no = request.getParameter("invoice_no");
String supplier_id = request.getParameter("supplier_id");
String buyer_id = request.getParameter("buyer_id");
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_invoice_no == null) ag_invoice_no = "";
if (ag_po_no == null) ag_po_no = "";
if (invoice_no == null) invoice_no = "";
if (supplier_id == null) supplier_id = "";
if (buyer_id == null) buyer_id = "";

String supplier_name = "";
String buyer_name = "";
String issue_date = "";
String shipping_port = "";
String handover_date = "";
String shipping_type = "";
String nominated_forwarder = "";
String bl_filename = "";
String iv_filename = "";
String pl_filename = "";
String shippingPortOptions = "";
String nominatedForwarderOptions = "";
String shippingTypeOptions = "";

int total_order_qty = 0;
double total_amount = 0.0;

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
DataProcess dataProcess = null;

String outS = "";
String sql = "";

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  matrix3 = new dbconn.MatrixDataSet();
  matrix4 = new dbconn.MatrixDataSet();
  matrix5 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // read shipment header info
  sql = " select  l.name, date_format(s.issue_date, '%Y/%m/%d'), "
      + "         s.shipping_port, date_format(s.handover_date, '%Y/%m/%d'), s.shipping_type, "
      + "         s.nominated_forwarder, s.bl_filename, s.iv_filename, s.pl_filename, m.name "
      + " from    shipment_01t s "
      + "         left outer join login_01t l "
      + "           on ( s.supplier_id = l.id ) "
      + "         left outer join login_01t m " 
      + "           on ( s.buyer_id = m.id )  "   
      + " where   s.invoice_no = '" + invoice_no + "' "
      + " and     s.buyer_id = '" + buyer_id + "' ";
  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  // read shipment details
  sql = " select  po_no, style_no, season, trans_type, order_qty,total_amount "
      + " from    shipment_02t "
      + " where   invoice_no = '" + invoice_no + "' "
      + " and     buyer_id = '" + buyer_id + "' "
      + " order by po_no ";
  //out.println(sql);
  dataProcess.RetrieveData(sql, matrix2, conn);

  // read shipping port list
  sql = " select  a.code, a.code_name, b.code_name "
      + " from    vg_common_code a "
      + "         left outer join vg_common_code b "
      + "           on ( a.related_code = b.code "
      + "           and b.type = 'COUNTRY_CODE' ) "
      + " where   a.type = 'SHIPPING_PORT' "
      + " and     a.use_yn = 'Y' "
      + " order by b.code_name, a.code_name ";

  dataProcess.RetrieveData(sql, matrix3, conn);

  // read nominated forwarder list
  sql = " select  a.code, a.code_name, b.code_name "
      + " from    vg_common_code a "
      + "         left outer join vg_common_code b "
      + "           on ( a.related_code = b.code "
      + "           and b.type = 'COUNTRY_CODE' ) "
      + " where   a.type = 'FORWARDER' "
      + " and     a.use_yn = 'Y' "
      + " order by case when a.code = '99' then 1 else 0 end, b.code_name, a.code_name ";

  dataProcess.RetrieveData(sql, matrix4, conn);

  // read trans type list
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'DELIVERY_TYPE' "
      + " and     use_yn = 'Y' "
      + " order by code_name ";

  dataProcess.RetrieveData(sql, matrix5, conn);

} catch (Exception e) {
  System.out.println("Exception shipment_edit_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

// set shipment header info
if (iRet > 0) {
  int j = 0;
  supplier_name = matrix.getRowData(0).getData(j++);
  issue_date = matrix.getRowData(0).getData(j++);
  shipping_port = matrix.getRowData(0).getData(j++);
  handover_date = matrix.getRowData(0).getData(j++);
  shipping_type = matrix.getRowData(0).getData(j++);
  nominated_forwarder = matrix.getRowData(0).getData(j++);
  bl_filename = matrix.getRowData(0).getData(j++);
  iv_filename = matrix.getRowData(0).getData(j++);
  pl_filename = matrix.getRowData(0).getData(j++);
  buyer_name = matrix.getRowData(0).getData(j++);
  // set shipping port options
  boolean isFound = false;
  
  for (int i = 0; i < matrix3.getRowCount(); i++) {
    int k = 0;
    String code = matrix3.getRowData(i).getData(k++);
    String portName = matrix3.getRowData(i).getData(k++);
    String countryName = matrix3.getRowData(i).getData(k++);
  
    if (!isFound && shipping_port.equals(code)) {
      shippingPortOptions += "<option value='" + code + "' selected>" + countryName + " - " + portName + "</option>";
      isFound = true;
    } else {
      shippingPortOptions += "<option value='" + code + "'>" + countryName + " - " + portName + "</option>";
    }
  }
  
  if (!isFound) {
    shippingPortOptions += "<option value='" + shipping_port + "' selected>" + shipping_port + "</option>";
  }
  
  // set nominated forwarder options
  isFound = false;
  
  for (int i = 0; i < matrix4.getRowCount(); i++) {
    int k = 0;
    String code = matrix4.getRowData(i).getData(k++);
    String forwarderName = matrix4.getRowData(i).getData(k++);
    String countryName = matrix4.getRowData(i).getData(k++);
  
    if (!isFound && nominated_forwarder.equals(code)) {
      nominatedForwarderOptions += "<option value='" + code + "' selected>" + countryName + " - " + forwarderName + "</option>";
      isFound = true;
    } else {
      nominatedForwarderOptions += "<option value='" + code + "'>" + countryName + " - " + forwarderName + "</option>";
    }
  }
  
  if (!isFound) {
    nominatedForwarderOptions += "<option value='" + nominated_forwarder + "' selected>" + nominated_forwarder + "</option>";
  }
  
  // set shipping type options
  isFound = false;
  
  for (int i = 0; i < matrix5.getRowCount(); i++) {
    int k = 0;
    String code = matrix5.getRowData(i).getData(k++);
    String codeName = matrix5.getRowData(i).getData(k++);
  
    if (!isFound && shipping_type.equals(code)) {
      shippingTypeOptions += "<option value='" + code + "' selected>" + codeName + "</option>";
      isFound = true;
    } else {
      shippingTypeOptions += "<option value='" + code + "'>" + codeName + "</option>";
    }
  }
  
  if (!isFound) {
    shippingTypeOptions += "<option value='" + shipping_type + "' selected>" + shipping_type + "</option>";
  }
}

// set shipment details
for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String po_no = matrix2.getRowData(i).getData(j++);
  String style_no = matrix2.getRowData(i).getData(j++);
  String brand = matrix2.getRowData(i).getData(j++);
  String trans_type = matrix2.getRowData(i).getData(j++);
  int order_qty = Integer.parseInt(matrix2.getRowData(i).getData(j++));
  double t_amount = Double.parseDouble(matrix2.getRowData(i).getData(j++));

  total_order_qty += order_qty;
  total_amount += t_amount;

  outS += "<tr align='center' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          //"<td><input type='checkbox' name='po_no' value='" + po_no + "'></td>" +
          "<input type='hidden' name='po_no' value='" + po_no + "'>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + po_no + "</td>" +
          "<td>" + style_no + "</td>" +
          "<td>" + brand + "</td>" +
          "<td>" + trans_type + "</td>" +
          "<td align='right'>" + StringUtil.formatNumber(order_qty, QTY_FORMAT) + "</td>" +
          "<td align='right'>" + StringUtil.formatNumber(total_amount, MONEY_FORMAT) + "</td>" +
          "</tr>";
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnAddPOs(frm) {\n");
      out.write("  var winAddPOs = window.open(\"\",\"winAddPOs\", \"toolbar=no,menubar=no,resizable=no,scrollbars=yes,width=860,height=700\");\n");
      out.write("\n");
      out.write("  if (winAddPOs) {\n");
      out.write("    frm.target = winAddPOs.name;\n");
      out.write("    frm.actionFlag.value = 'AP';\n");
      out.write("    frm.action = './shipment_issue_list.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("    winAddPOs.focus();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDeletePOs(frm) {\n");
      out.write("  if (frm.po_no) {\n");
      out.write("    var isSelected = false;\n");
      out.write("    \n");
      out.write("    if (frm.po_no.length) {\n");
      out.write("      for (var i = 0; i < frm.po_no.length; i++) {\n");
      out.write("        if (frm.po_no[i].checked) {\n");
      out.write("          isSelected = frm.po_no[i].checked;\n");
      out.write("          break;\n");
      out.write("        }\n");
      out.write("      }\n");
      out.write("    } else {\n");
      out.write("      isSelected = frm.po_no.checked;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    if (!isSelected) {\n");
      out.write("      alert('Select POs you want to delete.');\n");
      out.write("      return;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    if (confirm('Do you want to delete the selected POs from this shipment?')) {\n");
      out.write("      frm.target = self.name;\n");
      out.write("      frm.actionFlag.value = 'DP';\n");
      out.write("      frm.action = './shipment_po_update.jsp';\n");
      out.write("      frm.submit();\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnUpdateHeader(frm)\n");
      out.write("{\n");
      out.write("  if (confirm('Do you want to update this shipment?')) {\n");
      out.write("    frm.target = self.name;\n");
      out.write("    frm.action = './shipment_header_update.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSelect(frm) {\n");
      out.write("  if (frm.po_no) {\n");
      out.write("    if (frm.po_no.length) {\n");
      out.write("      for (var i = 0; i < frm.po_no.length; i++) {\n");
      out.write("        frm.po_no[i].checked = frm.tmpCheck.checked;\n");
      out.write("      }\n");
      out.write("    } else {\n");
      out.write("      frm.po_no.checked = frm.tmpCheck.checked;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnBack(frm) {\n");
      out.write("  frm.target = self.name;\n");
      out.write("  frm.action = 'shipment_view.jsp';\n");
      out.write("  frm.submit();\n");
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
      out.write("  <td width=\"*\" class=\"left_title\">Modify Shipment </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE WIDTH='99%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<TR>\n");
      out.write("  <td><font color=blue></font></td>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\"><b>Shipment Header Info.</b></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE WIDTH='99%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM NAME='frmMain' METHOD='POST' enctype='multipart/form-data'>\n");
      out.write("<input type='hidden' name='ag_month' value='");
      out.print( ag_month );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_year' value='");
      out.print( ag_year );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_invoice_no' value='");
      out.print( ag_invoice_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='invoice_no' value='");
      out.print( invoice_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='supplier_id' value='");
      out.print( supplier_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("<TR>\n");
      out.write("  <TD width='15%' class='table_header_center'>Buyer Name</TD>\n");
      out.write("  <TD width='18%' class='table_bg_bright'>");
      out.print( buyer_name );
      out.write("</TD>\n");
      out.write("  <TD width='18%' class='table_header_center'>Buyer ID</TD>\n");
      out.write("  <TD width='22%' class='table_bg_bright'>");
      out.print( buyer_id );
      out.write("</TD>\n");
      out.write("  <TD width='15%' class='table_header_center'>Issue Date</TD>\n");
      out.write("  <TD width='12%' class='table_bg_bright'>");
      out.print( issue_date );
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>Invoice No</TD>\n");
      out.write("  <TD class='table_bg_bright'>");
      out.print( invoice_no );
      out.write("</TD>\n");
      out.write("  <TD class='table_header_center'>Shipping Port(*)</TD>\n");
      out.write("  <TD class='table_bg_bright'><select name='shipping_port'>");
      out.print( shippingPortOptions );
      out.write("</select></TD>\n");
      out.write("  <TD class='table_header_center'>Handover Date(*)</TD>\n");
      out.write("  <TD class='table_bg_bright'><input type='text' name='handover_date' value='");
      out.print( handover_date );
      out.write("' size='10' value='' style='cursor:hand' readonly\n");
      out.write("    onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\"></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>Shipping Type(*)</TD>\n");
      out.write("  <TD class='table_bg_bright'><select name='shipping_type'>");
      out.print( shippingTypeOptions );
      out.write("</select></TD>\n");
      out.write("  <TD class='table_header_center'>Nominated Forwarder(*)</TD>\n");
      out.write("  <TD class='table_bg_bright'><select name='nominated_forwarder'>");
      out.print( nominatedForwarderOptions );
      out.write("</select></TD>\n");
      out.write("  <TD class='table_header_center'>&nbsp;</TD>\n");
      out.write("  <TD class='table_bg_bright'>&nbsp;</TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>B/L or AWB File(*)</TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='2'><a href=\"javascript:fnDownload('");
      out.print( bl_filename );
      out.write("');\">");
      out.print( bl_filename );
      out.write("</a></TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='3'><input type='file' name='bl_filename' size='50' maxlength='300'></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>Invoice File(*)</TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='2'><a href=\"javascript:fnDownload('");
      out.print( iv_filename );
      out.write("');\">");
      out.print( iv_filename );
      out.write("</a></TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='3'><input type='file' name='iv_filename' size='50' maxlength='300'></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>Packing List File(*)</TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='2'><a href=\"javascript:fnDownload('");
      out.print( pl_filename );
      out.write("');\">");
      out.print( pl_filename );
      out.write("</a></TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='3'><input type='file' name='pl_filename' size='50' maxlength='300'></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("\t<TD width='15%' class='table_header_center'>Supplier Name</TD>\n");
      out.write("  <TD width='18%' class='table_bg_bright'>");
      out.print( supplier_name );
      out.write("</TD>\n");
      out.write("  <TD width='18%' class='table_header_center'>Supplier ID</TD>\n");
      out.write("  <TD width='22%' class='table_bg_bright'>");
      out.print( supplier_id );
      out.write("</TD>\n");
      out.write("</TR>\t\n");
      out.write("</form>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\"><b>Shipment PO List</b></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<form name='formDetail' method='post'>\n");
      out.write("<input type='hidden' name='ag_month' value='");
      out.print( ag_month );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_year' value='");
      out.print( ag_year );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_invoice_no' value='");
      out.print( ag_invoice_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='invoice_no' value='");
      out.print( invoice_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='supplier_id' value='");
      out.print( supplier_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='actionFlag'>\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("  <TD width='4%'><!--input type='checkbox' name='tmpCheck' onclick='fnSelect(this.form);'--></TD>\n");
      out.write("  <TD width='6%'>No</TD>\n");
      out.write("  <TD width='15%'>PO No.</TD>\n");
      out.write("  <TD width='15%'>Style No.</TD>\n");
      out.write("  <TD width='15%'>Trans. Type</TD>\n");
      out.write("  <TD width='15%'>Order Qty</TD>\n");
      out.write("  <TD width='15%'>Total Amount</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("  <td colspan='5'>TOTAL</td>\n");
      out.write("  <td align='right'>");
      out.print( StringUtil.formatNumber(total_order_qty, QTY_FORMAT) );
      out.write("</td>\n");
      out.write("  <td align='right'>");
      out.print( StringUtil.formatNumber(total_amount, MONEY_FORMAT) );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("</TABLE>\n");
      out.write("\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\">\n");
      out.write("    <input type='button' value='Shipment Header수정' onclick='fnUpdateHeader(document.frmMain);'>\n");
      out.write("    <input type='button' value=' Back ' onclick='fnBack(this.form);'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
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
