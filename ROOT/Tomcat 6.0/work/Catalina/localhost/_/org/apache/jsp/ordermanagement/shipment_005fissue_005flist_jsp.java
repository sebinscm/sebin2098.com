package org.apache.jsp.ordermanagement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import dbconn.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;

public final class shipment_005fissue_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
int iRet = 0;
int iRet2 = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

// for creating a delivery note
String ag_buyer = request.getParameter("ag_buyer");

String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
if (ag_buyer == null || ag_buyer.equals("")  ) ag_buyer = "-";
if (ag_from_date == null) ag_from_date = "";
if (ag_to_date == null) ag_to_date = "";
if (ag_po_no == null) ag_po_no = "";

//out.println("buyer="+ag_from_date);

// adding POs
String fromUrl = request.getParameter("fromUrl");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String invoice_no = request.getParameter("invoice_no");
//String buyer_id = request.getParameter("buyer_id");
//String supplier_id = request.getParameter("supplier_id");
String actionFlag = request.getParameter("actionFlag");
if (fromUrl == null) fromUrl = request.getHeader("Referer");
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_invoice_no == null) ag_invoice_no = "";
if (invoice_no == null) invoice_no = "";
//if (supplier_id == null) supplier_id = "";
//if (ag_buyer == null) ag_buyer = "";
if (actionFlag == null) actionFlag = "";

// variables
String sql_po_no = "";
String buyer_id="";
if (!ag_po_no.equals("")) {
  sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
}

// read data
sql = " select  a.order_no, "
    + "         a.style, "
    + "         a.season, "
    + "         date_format(a.ex_factory_date, '%Y/%m/%d'),  "
    + "         a.trans_type, "    
    + "         a.total_qty, "
    + "         (a.total_qty * a.vendor_price) po_amount ,"
    + "         format(a.vendor_price,2), a.buyer,a.buyer_name,a.sgr "
    + " from    purchase_order a " 
    + " where   a.backorder_flag = 'N' "
    + " and     a.order_status between '73' and '73' "
    + " and     a.trans_type = 'FOB' "
    + (!ag_buyer.equals("") ? " and    a.buyer='" + ag_buyer + "' " : "")
    + (!ag_from_date.equals("") ? " and     a.ex_factory_date >= str_to_date('" + ag_from_date + "', '%Y/%m/%d') " : "")
    + (!ag_to_date.equals("") ? " and     a.ex_factory_date <= str_to_date('" + ag_to_date + "', '%Y/%m/%d') " : "")
    + (!ag_po_no.equals("") ? " and    upper(a.order_no) in upper(" + ag_po_no + ") " : "")
    + " order by a.order_no ";
//out.println(sql);
// query for buyer list
String sql2 = " select id, name from login_01t  where user_type = 'B' order by id ";

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  dataProcess = new DataProcess();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();
  // buyer list
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception shipment_issue_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  String season = matrix.getRowData(i).getData(j++);
  String shipping_date = matrix.getRowData(i).getData(j++);
  String trans_type = matrix.getRowData(i).getData(j++);
  int order_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
   double total_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
   double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String buyer = matrix.getRowData(i).getData(j++);
  String buyer_name = matrix.getRowData(i).getData(j++);
  String sgr = matrix.getRowData(i).getData(j++);
  buyer_id = buyer;
  String link_po_no = "<a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</a>";
  if (fromUrl.indexOf("shipment_edit_form.jsp") >= 0) {
    link_po_no = po_no;
  }

  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          " <td><input type='checkbox' name='po_no' value='"+ po_no + "'>" +
          " <td>" + (i+1) + "</td>" +
          " <td>" + buyer + "</td><input type='hidden' name='buyer_id' value='"+buyer_id+"'>" +
          " <td>" + buyer_name + "</td>" +        
          " <td>" + link_po_no + "</td>" +
          " <td>" + sgr+ "</td>" +
          " <td>" + style_no + "</td>" +
          " <td>" + season + "</td>" +
          " <td>" + shipping_date + "</td>" +
          " <td>" + trans_type + "</td>" +
          " <td align='right'> " + StringUtil.formatNumber(unit_price, MONEY_FORMAT) + " </td>" +   
          " <td align='right'> " + StringUtil.formatNumber(order_qty, QTY_FORMAT) + " </td>" +
          " <td align='right'> " + StringUtil.formatNumber(total_amount, MONEY_FORMAT) + " </td>" +
          "</tr>";
}

// print buyer list
//String buyerList = "<option value=''>-</option>";
String buyerList = "";
for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String buyerid = matrix2.getRowData(i).getData(j++);
  String buyernm = matrix2.getRowData(i).getData(j++);

  buyerList += "<option value='"+ buyerid + "'" 
                + (ag_buyer.equals(buyerid) ? " selected" : "") + ">" 
                + buyerid + "-" + buyernm + "</option>";
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnSubmit(frm)\n");
      out.write("{\n");
      out.write("  frm.ag_po_no.value = jf_SkipSpaces(frm.ag_po_no.value);\n");
      out.write("  frm.action = './shipment_issue_list.jsp'\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnClearDate(obj)\n");
      out.write("{\n");
      out.write("  obj.value = '';\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnView(po_no) {\n");
      out.write("  var win = window.open('', \"winPrint\", \"toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900\");\n");
      out.write("    frmMain.po_no_selected.value = po_no;\n");
      out.write("    if (win) {\n");
      out.write("\t    frmMain.action = \"./po_detail_popup.jsp\";\n");
      out.write("\t    frmMain.target = win.name;\n");
      out.write("\t    frmMain.submit();\t\n");
      out.write("\t }\n");
      out.write("  //frmMain.po_no_selected.value = po_no;\n");
      out.write("  //frmMain.action = \"./po_detail_popup.jsp\";\n");
      out.write("  //frmMain.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnIssue(frm) {\n");
      out.write("  var isChecked = false;\n");
      out.write("\n");
      out.write("  if (frm.po_no) {\n");
      out.write("    if (frm.po_no.length) {\n");
      out.write("      for (var i = 0; i < frm.po_no.length; i++) {\n");
      out.write("        if (frm.po_no[i].checked) {\n");
      out.write("          isChecked = true;\n");
      out.write("          break;\n");
      out.write("        }\n");
      out.write("      }\n");
      out.write("    } else {\n");
      out.write("      if (frm.po_no.checked) isChecked = true;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!isChecked) {\n");
      out.write("    alert('Select PO to create Shipment!');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (confirm('Do you want to add the selected POs to shipment?')) {\n");

if (fromUrl != null && fromUrl.indexOf("shipment_edit_form.jsp") >= 0) {

      out.write("\n");
      out.write("    frm.target = opener.name;\n");
      out.write("    frm.action = './shipment_po_update.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("    top.close();\n");

} else {

      out.write("\n");
      out.write("    frm.action = './shipment_issue_form.jsp';\n");
      out.write("    frm.submit();\n");

}

      out.write("\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"900\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/btnCategories.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Create Shipment - Step 1</td>\n");
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
      out.write("\t<TR>\n");
      out.write("  <td><font color=blue>* Create Shipment - Step 1 : Select target PO first to create Shipment. </font></td>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <td><font color=blue>1)To create Shipment, please select target PO then click \"Create\" button. </font></td>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <td><font color=blue>2)Following PO list are able to create Shipment. (PO status '73:Production Complete'). When the shipment has been created, PO status will be changed to '75: shipment created' and will be discarded from the list autocatically. </font></td>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("1) Search Query\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE WIDTH='99%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n");
      out.write("<form NAME='frmMain' METHOD='POST'>\n");
      out.write("<input type='hidden' name='po_no_selected'>\n");
      out.write("<TR>\n");
      out.write("  <TD width='5%' class='table_header_center'>Buyer</TD>\n");
      out.write("  <TD width='20%' class='table_bg_bright' >\n");
      out.write("    <SELECT NAME='ag_buyer'>\n");
      out.write("      ");
      out.print( buyerList );
      out.write("\n");
      out.write("    </SELECT>    \n");
      out.write("  </td>\t\n");
      out.write("  <TD width='15%' class='table_header_center'>Shipping Date</TD>\n");
      out.write("  <TD width='25%' class='table_bg_bright'><input type='text' name='ag_from_date' size='10' value='");
      out.print( ag_from_date );
      out.write("' style='cursor:hand' readonly\n");
      out.write("    onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\"><a href=\"javascript:fnClearDate(frmMain.ag_from_date)\">X</a>\n");
      out.write("    ~\n");
      out.write("    <input type='text' name='ag_to_date' size='10' value='");
      out.print( ag_to_date );
      out.write("' style='cursor:hand' readonly\n");
      out.write("    onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\"><a href=\"javascript:fnClearDate(frmMain.ag_to_date)\">X</a></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>    \t\n");
      out.write("  <TD width='15%' class='table_header_center'>PO No.</TD>\n");
      out.write("  <TD width='25%' class='table_bg_bright'><input type=text name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("' size='30' maxlength='200'></TD>\n");
      out.write("  <td  class='table_bg_bright_center' colspan='3'><INPUT TYPE=BUTTON VALUE=\"Search\" ONCLICK=\"fnSubmit(this.form)\">\n");
      out.write("    <input type='reset' value='Reset'></TD>\n");
      out.write("</TR>\n");
      out.write("</form>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<form name='form2' method='post'>\t\n");
      out.write("<input type='hidden' name='fromUrl' value='");
      out.print( fromUrl );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_month' value='");
      out.print( ag_month );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_year' value='");
      out.print( ag_year );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_invoice_no' value='");
      out.print( ag_invoice_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='invoice_no' value='");
      out.print( invoice_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='actionFlag' value='");
      out.print( actionFlag );
      out.write("'>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\"><input type='button' value='");
      out.print( fromUrl.indexOf("shipment_edit_form.jsp") >= 0 ? "PO add to Shipment" : "Create Shipment" );
      out.write("' onclick='fnIssue(this.form);'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("2) Shipment target PO list\n");
      out.write("<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("  <TD>&nbsp;</TD>\n");
      out.write("  <TD>No</TD>\n");
      out.write("   <TD>Buyer Code</TD>\n");
      out.write("  <TD>Buyer Name</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("    <TD>SGR</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Season</TD>\n");
      out.write("  <TD>Shipping Date</TD>\n");
      out.write("  <TD>Trans. Type</TD>\n");
      out.write("   <TD>Unit Price</TD>\n");
      out.write("  <TD>Order Qty</TD>\n");
      out.write("  <TD>Total Amount</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\"><input type='button' value='");
      out.print( fromUrl.indexOf("shipment_edit_form.jsp") >= 0 ? "PO add to Shipment " : "Create Shipment" );
      out.write("' onclick='fnIssue(this.form);'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
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
