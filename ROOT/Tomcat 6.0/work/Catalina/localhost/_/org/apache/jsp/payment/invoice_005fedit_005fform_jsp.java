package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import dbconn.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;

public final class invoice_005fedit_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

int iRet = 0;
Connection conn = null;
Connection connVGMain = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

String ag_supplier = request.getParameter("ag_supplier");
String ag_supplier_type = request.getParameter("ag_supplier_type");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String chk_status = request.getParameter("chk_status");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
String buyer_id = request.getParameter("buyer_id");
//out.println(chk_status);
//out.println(sup_id);
//out.println(buyer_id);

if (ag_supplier == null) ag_supplier = "";
if (ag_supplier_type == null) ag_supplier_type = "";
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_search_inv_no == null) ag_search_inv_no = "";
if (inv_no == null) inv_no = "";
if (sup_id == null) sup_id = "";

String issue_date = "";
String attached_file = "";
String update_date = "";
int total_qty = 0;
double total_net_price_sum = 0d;
double total_air_price_sum = 0d;
double total_amount = 0d;
boolean isEditable = false;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // check whether this invoice can be editable
  int iCnt = 0;
 
  sql = " select  count(b.po_no) "
      + " from    invoice_01t a "
      + "         inner join invoice_02t b "
      + "           on a.invoice_no = b.invoice_no "
      + "           and a.sup_id = b.sup_id "
      + "           and a.buyer_id = b.buyer_id "
      + " where   a.invoice_no = '" + inv_no + "' "
      + " and     a.sup_id = '" + sup_id + "' "
      + " and     a.buyer_id = '" + buyer_id + "' " 
      + " and     b.po_no in ( "
      + "           select  order_no "
      + "           from    purchase_order "
      + "           where   order_status = '90' "
      + "         ) ";

 //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    iCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
    if (iCnt > 0) isEditable = true;
  }

  // read invoice header info
  sql = " select date_format(invoice_date, '%Y/%m/%d'), " +
        "        file_name, " +
        "        date_format(updated, '%Y/%m/%d') " +
        "   from invoice_01t " +
        "  where invoice_no = '" + inv_no + "'" +
        "    and buyer_id = '" + buyer_id   + "'" +        
        "    and sup_id = '" + sup_id   + "'";

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    issue_date = matrix.getRowData(0).getData(j++);
    attached_file = matrix.getRowData(0).getData(j++);
    update_date = matrix.getRowData(0).getData(j++);
  }

  // read invoice details info
  sql = " select po_no, " +
        "        style_no, " +
        "        qty, " +
        "        price, " +
        "        qty * price,  seq " +
        "   from invoice_02t " +
        "  where upper(invoice_no) = upper('" + inv_no + "') "  +
        "    and buyer_id = '" + buyer_id   + "'" +   
        "    and sup_id = '" + sup_id   + "'"  +
        "  order by po_no ";

  //out.println(sql); 
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice_edit_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  int qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double total_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String seqno = matrix.getRowData(i).getData(j++);
  //double net_price = unit_price - disc_price;
  //double net_price_sum = qty*net_price;
  //double air_price_sum = qty*air_price;
  //double amount = (net_price_sum + air_price_sum)*1.1;

  total_qty += qty;
  //total_net_price_sum += net_price_sum;
  //total_air_price_sum += air_price_sum;
  total_amount += total_price;

  outS += "<tr align='right' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td align='center'>" +
            (isEditable && _adminid != null ? "<input type='checkbox' name='po_no' value='" + po_no + "'>" : "") + "</td>" +
          "<td align='center'>" + seqno + "</td>" +
          "<td align='center'>" + po_no + "</td>" +
          "<td align='center'>" + style_no + "</td>" +
          "<td>" + StringUtil.formatNumber(qty, QTY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(unit_price, MONEY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>" +
          "</tr>" ;
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("\n");
      out.write("function fnSendInv(frm)\n");
      out.write("{\n");
      out.write("  if (confirm('해당 Invoice번호로 해당Buyer에게 대금청구 처리를 하시겠습니다?')) {\n");
      out.write("    frm.target = self.name;\n");
      out.write("    frm.action = './invoice_edit_save.jsp';\n");
      out.write("    frm.actionFlag.value = 'SD';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnAddPOs(frm) {\n");
      out.write("  var winAddPOs = window.open(\"\",\"winAddPOs\", \"toolbar=no,menubar=no,resizable=no,scrollbars=yes,width=950,height=700\");\n");
      out.write("\n");
      out.write("  if (winAddPOs) {\n");
      out.write("    frm.target = winAddPOs.name;\n");
      out.write("    frm.actionFlag.value = 'AP';\n");
      out.write("    frm.action = './invoice_confirm_search.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("    winAddPOs.focus();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDeletePOs(frm) {\n");
      out.write("  if (frm.po_no) {\n");
      out.write("    var isSelected = false;\n");
      out.write("\n");
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
      out.write("\n");
      out.write("    if (!isSelected) {\n");
      out.write("      alert('Select POs you want to delete.');\n");
      out.write("      return;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    if (confirm('등록된 Invoice에서 선택한  PO를 삭제하시겠습니끼?')) {\n");
      out.write("      frm.target = self.name;\n");
      out.write("      frm.actionFlag.value = 'DP';\n");
      out.write("      frm.action = './invoice_edit_save.jsp';\n");
      out.write("      frm.submit();\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnUpdate(frm)\n");
      out.write("{\n");
      out.write("  if (!frm.new_invoice_file.value) {\n");
      out.write("    alert('Input new invoice file name.');\n");
      out.write("    //frm.new_invoice_file.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  var idx;\n");
      out.write("  var fName = frm.new_invoice_file.value;\n");
      out.write("\n");
      out.write("  idx = fName.lastIndexOf(\"\\\\\");\n");
      out.write("  if (idx < 0) idx = fName.lastIndexOf(\"/\");\n");
      out.write("  \n");
      out.write("  fName = fName.substr(idx+1);\n");
      out.write("  idx = fName.lastIndexOf(\".\");\n");
      out.write("  if (idx >= 0) fName = fName.substring(0, idx);\n");
      out.write("\n");
      out.write("  if (frm.inv_no.value.toUpperCase() != fName.toUpperCase() ) {\n");
      out.write("    alert('새로 변경할 Invoice화일이름('+fName+')이 Invoice번호( '+frm.inv_no.value+' )와 다릅니다. 화일이름과 Invoice번호가 같아야 합니다.\\nNew Invoice File이름을 체크하세요!');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("  if (confirm('새로운 Invoice화일로 변경하시겠습니까?')) {\n");
      out.write("    frm.target = self.name;\n");
      out.write("    frm.action = './invoice_edit_update.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDelete(frm)\n");
      out.write("{\n");
      out.write("  if (confirm('해당 Invoice번호를 전체를  삭제 하시겠습니까?')) {\n");
      out.write("    frm.target = self.name;\n");
      out.write("    frm.action = './invoice_edit_save.jsp';\n");
      out.write("    frm.actionFlag.value = 'D';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDelete(frm)\n");
      out.write("{\n");
      out.write("  if (confirm('해당 Invoice번호를 전체를  삭제 하시겠습니까?')) {\n");
      out.write("    frm.target = self.name;\n");
      out.write("    frm.action = './invoice_edit_save.jsp';\n");
      out.write("    frm.actionFlag.value = 'D';\n");
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
      out.write("function fnList(frm) {\n");
      out.write("  frm.target = self.name;\n");
      out.write("  frm.action = './");
      out.print( _adminid != null ? "invoice_search" : "invoice_search" );
      out.write(".jsp';\n");
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
      out.write("  <td width=\"*\" class=\"left_title\">Invoice Details</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\"><b>Invoice Header</b></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE WIDTH='95%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM NAME='frmMain' METHOD='POST' enctype=\"multipart/form-data\">\n");
      out.write("<input type='hidden' name='ag_buyer' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( sup_id );
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
      out.write("<input type='hidden' name='sup_id' value='");
      out.print( sup_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='chk_status' value='");
      out.print( chk_status );
      out.write("'>\n");
      out.write("\n");
      out.write("<TR>\n");
      out.write("  <TD width='150' class='table_header_center'>Invoice번호</TD>\n");
      out.write("  <TD width='*' class='table_bg_bright'>");
      out.print( inv_no );
      out.write("</TD>\n");
      out.write("  <TD width='100' class='table_header_center'>Issue Date</TD>\n");
      out.write("  <TD width='100' class='table_bg_bright'>");
      out.print( issue_date );
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>저장된 Invoice File</TD>\n");
      out.write("  <TD class='table_bg_bright'><a href=\"javascript:fnDownload('");
      out.print( attached_file );
      out.write("');\">");
      out.print( attached_file );
      out.write("</a></TD>\n");
      out.write("  <TD class='table_header_center'>Updated</TD>\n");
      out.write("  <TD class='table_bg_bright'>");
      out.print( update_date );
      out.write("</TD>\n");
      out.write("</TR>\n");

if (chk_status.equals("N") ) {

      out.write("\n");
      out.write("<TR>\n");
      out.write("  <TD class='table_header_center'>변경할 New Invoice File</TD>\n");
      out.write("  <TD class='table_bg_bright' colspan='3'><input type='file' name='new_invoice_file' size='60' maxlength='200'></TD>\n");
      out.write("</TR>\n");

}

      out.write("\n");
      out.write("</FORM>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");

if (chk_status.equals("N") ) {

      out.write("\n");
      out.write("  ** 저장된 Invoice 화일을 다시 변경하려면 변경할 Invoice화일을 찾아서 선택후 ' Invoice File변경' 버튼을 누르세요.\n");
      out.write(" ");

} else {

      out.write(" \t\n");
      out.write("    <font color=red size=2 > * 선택하신 자료는 이미 Invoice 청구신청이 되어 수정이 불가능 합니다. <font>\n");

}

      out.write("\n");
      out.write("<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\"><b>Invoice Detail List</b></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE width='95%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( sup_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_buyer' value='");
      out.print( buyer_id );
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
      out.write("<input type='hidden' name='sup_id' value='");
      out.print( sup_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='chk_status' value='");
      out.print( chk_status );
      out.write("'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='actionFlag'>\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("  <TD><input type='checkbox' name='tmpCheck' onclick='fnSelect(this.form);'></TD>\n");
      out.write("  <TD>Seq.</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Qty</TD>\n");
      out.write("  <TD>Unit Price</TD>\n");
      out.write("  <TD>Amount </TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("  <td colspan='4'>Total</td>\n");
      out.write("  <td align='right'>");
      out.print( StringUtil.formatNumber(total_qty, QTY_FORMAT) );
      out.write("</td>\n");
      out.write("  <TD>&nbsp;</TD>\n");
      out.write("  <td align='right'>$");
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

if (chk_status.equals("N") ) {

      out.write("\n");
      out.write("    <input type='button' value=' Buyer에 대금청구' onclick='fnSendInv(this.form);'>\n");
      out.write("    <input type='button' value=' Invoice에 PO추가 ' onclick='fnAddPOs(this.form);'>\n");
      out.write("    <input type='button' value=' Invoice에서 PO삭제 ' onclick='fnDeletePOs(this.form);'>\n");
      out.write("    <input type='button' value=' Invoice File변경 ' onclick='fnUpdate(document.frmMain);'>\n");
      out.write("    <!--input type='button' value='Delete Invoice' onclick='fnDelete(this.form);'-->\n");

}

if (chk_status.equals("N") ) {

      out.write("\n");
      out.write("     <br>\n");
      out.write("    <input type='button' value=' Invoice전체 삭제 ' onclick='fnDelete(this.form);'>삭제 비밀번호\n");
      out.write("    <input type='password' name='passwd' size='10' maxlength='6'>\n");

}

      out.write("\n");
      out.write("    <input type='button' value='Go To List' onclick='fnList(this.form);'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</form>\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='attachPath' value='");
      out.print( _invoiceFileUrl );
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
