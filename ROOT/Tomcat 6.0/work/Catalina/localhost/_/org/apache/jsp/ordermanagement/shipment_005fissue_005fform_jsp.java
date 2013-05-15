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

public final class shipment_005fissue_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/bottom_line.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
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
String today = DateUtil.getToday("yyyy/MM/dd");

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_buyer = request.getParameter("ag_buyer");
String ag_po_no = request.getParameter("ag_po_no");
String[] po_no = request.getParameterValues("po_no");
if (ag_from_date == null) ag_from_date = "";
if (ag_to_date == null) ag_to_date = "";
String buyer_id=request.getParameter("buyer_id");
String buyer_nm="";
String supplier_id="";
String supplier_nm="";
int total_order_qty = 0;
double grand_total_amount = 0.0;

//out.println("buyer="+buyer_id);

String tmp_po_noes = "";
for (int i = 0; i < po_no.length; i++) {
  if (i > 0) tmp_po_noes += ",";
  tmp_po_noes += "'" + po_no[i] + "'";
}
// read data
sql = " select  a.order_no, "
    + "         a.style, "
    + "         a.season, "
    + "         date_format(a.ex_factory_date, '%Y/%m/%d'), "
    + "         a.trans_type, "    
    + "         a.total_qty, "
    + "         (a.total_qty * a.vendor_price) po_amount ,"
    + "         format(a.vendor_price,2), a.buyer, a.buyer_name,a.supplier,a.supplier_name "
    + " from    purchase_order a " 
    + " where   a.backorder_flag = 'N' "
    + " and     a.order_status between '73' and '73' "
    + " and     a.trans_type = 'FOB' "
    + (!buyer_id.equals("") ? " and    a.buyer='" + buyer_id + "' " : "")
    + (!ag_from_date.equals("") ? " and     a.ex_factory_date >= str_to_date('" + ag_from_date + "', '%Y/%m/%d') " : "")
    + (!ag_to_date.equals("") ? " and     a.ex_factory_date <= str_to_date('" + ag_to_date + "', '%Y/%m/%d') " : "")
    + " and    a.order_no in (" + tmp_po_noes + ") " 
    + " order by a.order_no ";

//out.println(sql);


try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();

  // read po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();

  // read shipping port list
  sql = " select  a.code, a.code_name, b.code_name "
      + " from    vg_common_code a "
      + "         left outer join vg_common_code b "
      + "           on ( a.related_code = b.code "
      + "           and b.type = 'COUNTRY_CODE' ) "
      + " where   a.type = 'SHIPPING_PORT' "
      + " and     a.use_yn = 'Y' "
      + " order by b.code_name, a.code_name ";

  dataProcess.RetrieveData(sql, matrix2, conn);

  // read nominated forwarder list
  sql = " select  a.code, a.code_name, b.code_name "
      + " from    vg_common_code a "
      + "         left outer join vg_common_code b "
      + "           on ( a.related_code = b.code "
      + "           and b.type = 'COUNTRY_CODE') "
      + " where   a.type = 'FORWARDER' "
      + " and     a.use_yn = 'Y' "
      + " order by case when a.code = '99' then 1 else 0 end, b.code_name, a.code_name ";

  dataProcess.RetrieveData(sql, matrix3, conn);

  // read trans type list
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'TRANS_TYPE' "
      + " and     use_yn = 'Y' "
      + " order by code_name ";

  dataProcess.RetrieveData(sql, matrix4, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception shipment_issue_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }  
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String tmp_po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  String season = matrix.getRowData(i).getData(j++);
  String shipping_date = matrix.getRowData(i).getData(j++);
  String trans_type = matrix.getRowData(i).getData(j++);
  int order_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
   double total_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
   double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String buyer = matrix.getRowData(i).getData(j++);
  String buyer_name = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String supplier_name = matrix.getRowData(i).getData(j++);
  buyer_id =buyer;
  buyer_nm=buyer_name;   
  supplier_id = supplier;
  supplier_nm = supplier_name;
  total_order_qty += order_qty;
  grand_total_amount += total_amount;

  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + tmp_po_no + "<input type='hidden' name='po_no' value='" + tmp_po_no + "'></td>" +
          "<td>" + style_no + "<input type='hidden' name='style_no' value='" + style_no + "'></td>" +
          "<td>" + season + "<input type='hidden' name='season' value='" + season + "'></td>" +
          " <td>" + shipping_date + "<input type='hidden' name='shipping_date' value='" + shipping_date + "'></td>" +
          "<td>" + trans_type + "<input type='hidden' name='trans_type' value='" + trans_type + "'></td>" +
          " <td align='right'> " + StringUtil.formatNumber(unit_price, MONEY_FORMAT) +
          "<td align='right'>" + StringUtil.formatNumber(order_qty, QTY_FORMAT) +
          "<td align='right'>" + StringUtil.formatNumber(total_amount, MONEY_FORMAT) +
          "<td align='right'><input type='text' size='10' maxlength='10' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);' name='unit_price' class='input_text_right' value='" + unit_price + "'></td>" + 
          "<td align='right'><input type='text' size='10' maxlength='10' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);' name='order_qty' class='input_text_right' value='" + order_qty + "'></td>" +
          "<td align='right'><input type='text' size='10' maxlength='10' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);' name='total_amount' class='input_text_right' value='" + total_amount + "'></td>" +
          "</tr>" ;
}

// set shipping port as select option
String shippingPortOptions = "<option value=''></option>";

for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String code = matrix2.getRowData(i).getData(j++);
  String portName = matrix2.getRowData(i).getData(j++);
  String countryName = matrix2.getRowData(i).getData(j++);

  shippingPortOptions += "<option value='" + code + "'>" + countryName + " - " + portName + "</option>";
}

// set nominated forwarder as select option
String nominatedForwarderOptions = "<option value=''></option>";

for (int i = 0; i < matrix3.getRowCount(); i++) {
  int j = 0;
  String code = matrix3.getRowData(i).getData(j++);
  String forwarderName = matrix3.getRowData(i).getData(j++);
  String countryName = matrix3.getRowData(i).getData(j++);

  nominatedForwarderOptions += "<option value='" + code + "'>" + countryName + " - " + forwarderName + "</option>";
}

// set shipping type as select option
String shippingTypeOptions = "<option value=''></option>";

for (int i = 0; i < matrix4.getRowCount(); i++) {
  int j = 0;
  String code = matrix4.getRowData(i).getData(j++);
  String codeName = matrix4.getRowData(i).getData(j++);

  shippingTypeOptions += "<option value='" + code + "'>" + codeName + "</option>";
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/validate2.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnSave(frm)\n");
      out.write("{\n");
      out.write("  frm.invoice_no.value = jf_AllTrim(frm.invoice_no.value);\n");
      out.write("  \n");
      out.write("  if (!frm.invoice_no.value) {\n");
      out.write("    alert('Enter Invoice No.');\n");
      out.write("    frm.invoice_no.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  var fmt = /[/\\\\?*:|\"<>]+/;\n");
      out.write("  if (fmt.test(frm.invoice_no.value)) {\n");
      out.write("    alert('Invoice No cannot contain any of the following characters:\\n' + '/ \\\\ ? * : | \" < >\\n' + 'Check your Invoice No.');\n");
      out.write("    frm.invoice_no.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!frm.shipping_port.value) {\n");
      out.write("    alert('Enter Shipping Port.');\n");
      out.write("    frm.shipping_port.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!frm.handover_date.value) {\n");
      out.write("    alert('Enter Handover Date.');\n");
      out.write("    frm.handover_date.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!frm.shipping_type.value) {\n");
      out.write("    alert('Enter Shipping Type.');\n");
      out.write("    frm.shipping_type.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!frm.nominated_forwarder.value) {\n");
      out.write("    alert('Enter Nominated Forwarder.');\n");
      out.write("    frm.nominated_forwarder.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!frm.bl_filename.value) {\n");
      out.write("    alert('Enter B/L or AWB File.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!frm.iv_filename.value) {\n");
      out.write("    alert('Enter Invoice File.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!frm.pl_filename.value) {\n");
      out.write("    alert('Enter Packing List File.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  // count sea and air trans type.\n");
      out.write("  var trans_msg = \"\";\n");
      out.write("  var trans_sea_cnt = 0;\n");
      out.write("  var trans_air_cnt = 0;\n");
      out.write("\n");
      out.write("  if (frm.po_no) {\n");
      out.write("    if (frm.trans_type.length) {\n");
      out.write("      for (var i = 0; i < frm.trans_type.length; i++) {\n");
      out.write("        if (frm.trans_type[i].value == 'SEA') trans_sea_cnt++;\n");
      out.write("        else if (frm.trans_type[i].value == 'AIR') trans_air_cnt++;\n");
      out.write("      }\n");
      out.write("    } else {\n");
      out.write("      if (frm.trans_type.value == 'SEA') trans_sea_cnt++;\n");
      out.write("      else if (frm.trans_type.value == 'AIR') trans_air_cnt++;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (trans_sea_cnt > 0 && trans_air_cnt > 0) {\n");
      out.write("    trans_msg = \"There are both SEA and AIR Trans Type in this shipment. Make sure this is correct.\\n\";\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (confirm(trans_msg + 'Do you want to create this shipment?')) {\n");
      out.write("    frm.action = './shipment_issue_save.jsp'\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnBack(frm) {\n");
      out.write("  frm.action = './shipment_issue_list.jsp';\n");
      out.write("  frm.submit();\n");
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
      out.write("  <td width=\"3%\"><img src=\"/img/btnCategories.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Shipment Creation Step 2</td>\n");
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
      out.write("  <td><font color=blue>* Shipment Creation Step 2 - To attach related docs for Shipping.</font></td>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\"><b>Shipment Header</b></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE WIDTH='99%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM NAME='frmMain' METHOD='POST' enctype='multipart/form-data'>\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
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
      out.print( buyer_nm );
      out.write("</TD>\n");
      out.write("  <TD width='18%' class='table_header_center'>Buyer ID</TD>\n");
      out.write("  <TD width='22%' class='table_bg_bright'>");
      out.print( buyer_id );
      out.write("</TD>\n");
      out.write("  <TD width='15%' class='table_header_center'>Issue Date</TD>\n");
      out.write("  <TD width='12%' class='table_bg_bright'>");
      out.print( today );
      out.write("<input type='hidden' name='issue_date' value='");
      out.print( today );
      out.write("'></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>Invoice No(*)</TD>\n");
      out.write("  <TD class='table_bg_bright'><input type='text' name='invoice_no' value='' size='20' maxlength='20'></TD>\n");
      out.write("  <TD class='table_header_center'>Shipping Port(*)</TD>\n");
      out.write("  <TD class='table_bg_bright'><select name='shipping_port'>");
      out.print( shippingPortOptions );
      out.write("</select></TD>\n");
      out.write("  <TD class='table_header_center'>Handover Date(*)</TD>\n");
      out.write("  <TD class='table_bg_bright'><input type='text' name='handover_date' size='10' value='' style='cursor:hand' readonly\n");
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
      out.write("  <TD class='table_bg_bright' colspan='5'><input type='file' name='bl_filename' size='60' maxlength='300'></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>Invoice File(*)</TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='5'><input type='file' name='iv_filename' size='60' maxlength='300'></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>Packing List File(*)</TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='5'><input type='file' name='pl_filename' size='60' maxlength='300'></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD width='15%' class='table_header_center'>Supplier Name</TD>\n");
      out.write("  <TD width='18%' class='table_bg_bright'>");
      out.print( supplier_nm );
      out.write("</TD>\n");
      out.write("  <TD width='18%' class='table_header_center'>Supplier ID</TD>\n");
      out.write("  <TD width='22%' class='table_bg_bright'>");
      out.print( supplier_id );
      out.write("</TD><input type='hidden' name='supplier_id' value='");
      out.print( supplier_id );
      out.write("'>\n");
      out.write("</TR>\t\n");
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
      out.write("<TABLE WIDTH='99%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<TR>\n");
      out.write("  <td><font color=blue>* For about order quantity of PO, actual shipment qty and price should be input on [Actual].</font></td>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("  <TD width='5%'>No</TD>\n");
      out.write("  <TD width='10%'>PO No.</TD>\n");
      out.write("  <TD width='5%'>Style No.</TD>\n");
      out.write("  <TD width='12%'>Season</TD>\n");
      out.write("  <TD width='10%'>Shipping Date</TD>\n");
      out.write("  <TD width='10%'>Trans. Type</TD>\n");
      out.write("   <TD width='5%'>Order Unit Price</TD>\n");
      out.write("  <TD width='5%'>Order Total Qty</TD>\n");
      out.write("  <TD width='10%'>Order Total Amount</TD>\n");
      out.write("  <TD width='5%'>Actual Unit Price</TD>\n");
      out.write("  <TD width='5%'>Actual Total Qty</TD>\n");
      out.write("  <TD width='10%'>Actual Total Amount</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("  <td colspan='7'>TOTAL</td>\n");
      out.write("  <td align='right'>");
      out.print( StringUtil.formatNumber(total_order_qty, QTY_FORMAT) );
      out.write("</td>\n");
      out.write("  <td align='right'>");
      out.print( StringUtil.formatNumber(grand_total_amount, MONEY_FORMAT) );
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
      out.write("    <input type='button' value='Save' onclick='fnSave(this.form);'>\n");
      out.write("    <input type='reset' value='Reset'>\n");
      out.write("    <input type='button' value='Back' onclick='fnBack(document.form2);'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</FORM>\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("</form>\n");
      out.write("</table>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</td></tr></table>\n");
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
