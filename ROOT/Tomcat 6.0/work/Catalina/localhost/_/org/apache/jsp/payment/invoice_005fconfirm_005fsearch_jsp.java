package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import java.text.*;
import common.util.*;
import dbconn.*;

public final class invoice_005fconfirm_005fsearch_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!-%@ page errorPage=\"/error.jsp\" %-->\n");
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
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
DataProcess dataProcess = null;

String outS = "";
String sql = "";

// for creating invoice
String inv_no = request.getParameter("inv_no");
String ag_supplier = request.getParameter("ag_supplier");
String ag_buyer = request.getParameter("ag_buyer");
String ag_po_no = request.getParameter("ag_po_no");
String ag_orderby = request.getParameter("ag_orderby");
String chk_status = request.getParameter("chk_status");
if (ag_buyer == null) ag_buyer = "";
if (ag_po_no == null) ag_po_no = "";
if (ag_orderby == null) ag_orderby = "1";

String actionFlag = request.getParameter("actionFlag");
if (ag_supplier == null) ag_supplier = "";
if (actionFlag == null) actionFlag = "";


try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  matrix3 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // if this is for Adding POs then set the brand as the same value in the current invoice.
  // read brand info
  //out.println(actionFlag);
  if (actionFlag.equals("AP")) {
    // fix brand
   }

  // read data
 // sql = " select  a.order_no, a.buyer,concat(a.sgr,a.style), a.sup_stock_code, a.total_qty, "
 //     + "         date_format(a.ex_factory_date, '%Y/%m/%d'), a.vendor_price, a.vendor_price * a.total_qty "
//      + " from    purchase_order a "
//      + " where   a.backorder_flag = 'N' "
//      + " and     a.supplier = '" + ag_supplier + "' "
//      + (ag_po_no.equals("") ? "" : " and     a.order_no = " + ag_po_no)
//      + " and     a.order_status between '75' and '85' "
//      + " and     a.buyer = '" + ag_buyer + "' "
//      + " order by a.order_no ";

sql =  " select a.order_no, a.buyer,concat(a.sgr,a.style), a.sup_stock_code, a.total_qty, date_format(a.ex_factory_date, '%Y/%m/%d'), "
        + "  a.vendor_price, a.vendor_price * a.total_qty, ifnull(b.order_qty,0), ifnull(b.total_amount,0)  "
        + " from purchase_order a LEFT OUTER JOIN shipment_02t b on ( a.order_no = b.po_no and a.buyer = b.buyer_id ) "
        + " where a.backorder_flag = 'N' and a.order_status between '75' and '85' "
        + " and     a.supplier = '" + ag_supplier + "' "
        + " and       a.buyer = '" + ag_buyer + "' "
        + " order by a.order_no ";

//out.println(sql);
//if (true) return;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  // read user info
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' "
      + " and     delete_yn = 'N' "
      + " order by id ";

  dataProcess.RetrieveData(sql, matrix2, conn);

 sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' "
      + " and     delete_yn = 'N' "
      + " order by id ";

  dataProcess.RetrieveData(sql, matrix3, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice_confirm_search : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  String supplierStkcd = matrix.getRowData(i).getData(j++);
  int recTtlQty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  String giDate = matrix.getRowData(i).getData(j++);
  double vendor_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double total_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
  int shipQty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double ship_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));

  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
//        "<td>" + (chkNew.equals("0") ? "" : "<IMG src='../board/images/new_6.gif' border='0'>" ) + "</td>" +
          "<td><input type='checkbox' name='po_no' value='" + po_no + "'></td>" +
          "<td>" + (i+1) + "</td>" +
          "<td> " + buyer + "</td>" +
          "<td> " + supplierStkcd + "</td>" +
          "<td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" +
          "<td> " + style_no + "</td>" +
          "<td><font color='red'>" + giDate + "</font></td>" +
          "<td align=right> " + StringUtil.formatNumber(vendor_price, MONEY_FORMAT) + " </td>" +    
          "<td align=right> " + StringUtil.formatNumber(recTtlQty, QTY_FORMAT) + " </td>" +          
          "<td align=right> " + StringUtil.formatNumber(total_amount, MONEY_FORMAT) + " </td>" +
          "<td align=right><input type='hidden' name='shipQty' value='" + shipQty + "'>" + StringUtil.formatNumber(shipQty, QTY_FORMAT) + " </td>" +          
          "<td align=right> " + StringUtil.formatNumber(ship_amount, MONEY_FORMAT) + " </td>" +
          "</tr>" ;
}

// print month year options
String monthYearOptions = "";
java.util.Date tmpDate = new java.util.Date();

/*
for (int i = 0; i < 12; i++) {
  String tmpMonthYear = DateUtil.getFmtDateString(DateUtil.getRelativeDate(tmpDate, 0, -i, 0), "MM/yyyy");
  monthYearOptions += "<option value='" + tmpMonthYear + "' "
                    + (ag_month_year.equals(tmpMonthYear) ? "selected" : "")
                    + ">" + tmpMonthYear + "</option>";
}
*/

// print user Buyer options
String userBuyerOptions = "";

for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String code = matrix2.getRowData(i).getData(j++);
  String codeName = matrix2.getRowData(i).getData(j++);

  userBuyerOptions += "<option value='" + code + "'"
                    + (ag_buyer.equals(code) ? " selected" : "") + ">" + codeName + " : "+code+"</option>";                    
}
// print user Supplier options
String userSupOptions = "";

for (int i = 0; i < matrix3.getRowCount(); i++) {
  int j = 0;
  String code = matrix3.getRowData(i).getData(j++);
  String codeName = matrix3.getRowData(i).getData(j++);

  userSupOptions += "<option value='" + code + "'"
                    + (ag_supplier.equals(code) ? " selected" : "") + ">" + codeName + "</option>";
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("\n");
      out.write("function Confirm(form)\n");
      out.write("{\n");
      out.write("  var isChecked = false;\n");
      out.write("   var isChecked2 = false;\n");
      out.write("  if (form.po_no) {\n");
      out.write("    if (form.po_no.length) {\n");
      out.write("      for (var i = 0; i < form.po_no.length; i++) {\n");
      out.write("        if (form.po_no[i].checked) {        \t \n");
      out.write("        \t if(form.shipQty[i].value != 0) {        \t \t\n");
      out.write("               isChecked = true;\n");
      out.write("               isChecked2 = true;\n");
      out.write("               break;\n");
      out.write("            } else {\n");
      out.write("               isChecked2 = false;\t\n");
      out.write("           }\t  \n");
      out.write("        }\n");
      out.write("      }\n");
      out.write("    } else {\n");
      out.write("      if (form.po_no.checked) isChecked = true;\n");
      out.write("      \n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("  if (!isChecked2) {\n");
      out.write("    alert('If selected PO with 0 Shipment Qty or no Shipment information then the invoice cannot be created!');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  if (!isChecked) {\n");
      out.write("    alert('Select POs you want to add to invoice.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (confirm('Do you want to add the shipment into the Invoice from the selected PO?')) {\n");

if (actionFlag.equals("AP")) {

      out.write("\n");
      out.write("    form.target = opener.name;\n");
      out.write("    form.action = './invoice_edit_save.jsp';\n");
      out.write("    form.submit();\n");
      out.write("    top.close();\n");

} else {

      out.write("\n");
      out.write("    form.action = \"./invoice.jsp\";\n");
      out.write("    form.submit();\n");

}

      out.write("\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function submit()\n");
      out.write("{\n");
      out.write("  frmMain.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnView(po_no_selected) {\n");
      out.write("\tvar win = window.open('', \"winPrint\", \"toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900\");\n");
      out.write("    frmMain.po_no_selected.value = po_no_selected;\n");
      out.write("    if (win) {\n");
      out.write("\t    frmMain.action = \"/ordermanagement/po_detail_popup.jsp\";\n");
      out.write("\t    frmMain.target = win.name;\n");
      out.write("\t    frmMain.submit();\n");
      out.write("   }\n");
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
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Create Invoice Step-1 : Search target PO</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE WIDTH=90% border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<FORM NAME=frmMain ACTION=\"invoice_confirm_search.jsp\" METHOD=POST>\n");
      out.write("<input type='hidden' name='actionFlag' value='");
      out.print( actionFlag );
      out.write("'>\n");
      out.write("<input type='hidden' name='po_no_selected'>\n");
      out.write("<input type='hidden' name='inv_no' value='");
      out.print( inv_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='sup_id' value='");
      out.print( ag_supplier );
      out.write("'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( ag_buyer );
      out.write("'>\n");
      out.write("<input type='hidden' name='chk_status' value='");
      out.print( chk_status );
      out.write("'>\n");
      out.write("<TR>\n");
      out.write("  <TD><font color=blue size=2 >* Invoiceable PO target's Order status should be either Create Shipment(75), Ship Item(80), Item Arrive(85). Also, the shipment mube be creatd. </font></TD>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE WIDTH=900 border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n");
      out.write("<TR>\n");
      out.write("  <TD width='12%' class='table_header_center'>Buyer</TD>\n");
      out.write("  <TD width='17%' class='table_bg_bright'><SELECT NAME=ag_buyer ");
      out.print( actionFlag.equals("AP") ? "disabled" : "" );
      out.write('>');
      out.print( userBuyerOptions );
      out.write("</SELECT></TD>\n");
      out.write("  <TD width='12%' class='table_header_center'>Supplier</TD>\n");
      out.write("  <TD width='17%' class='table_bg_bright'><SELECT NAME=ag_supplier ");
      out.print( actionFlag.equals("AP") ? "disabled" : "" );
      out.write('>');
      out.print( userSupOptions );
      out.write("</SELECT></TD>\n");
      out.write("  <TD width='12%' class='table_header_center'>PO#</TD>\n");
      out.write("  <TD width='17%' class='table_bg_bright'><input type=text name=ag_po_no value='");
      out.print( ag_po_no );
      out.write("'></TD>\n");
      out.write("  <TD width='12%' class='table_header_center'>Order by </TD>\n");
      out.write("  <TD width='17%' class='table_bg_bright'>\n");
      out.write("    <SELECT NAME=ag_orderby >\n");
      out.write("    <OPTION value=\"1\"  ");
 if(ag_orderby.equals("1")) out.print("SELECTED");  
      out.write("> PO No.</OPTION>\n");
      out.write("    </SELECT></TD>\n");
      out.write("  <td width='13%' class='table_bg_bright_center'><INPUT TYPE=BUTTON VALUE=\"Search\" ONCLICK=submit(this.form)></TD>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE width=900 border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">&nbsp;</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">No.</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">Buyer</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">Ref#</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">PO No.</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">Style No.</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\"><font color='red'>Shipping Date</font></TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">Unit Price</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">P.O Total Qty</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">P.O Sum Price</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">Shipment Total Qty</TD>\n");
      out.write("<TD align=center bgcolor=\"e6e6fa\">Shipment Sum Price</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" align='center'><INPUT TYPE=BUTTON VALUE=\"Add to invoice\" ONCLICK=\"Confirm(this.form)\"></td>\n");
      out.write("</tr>\n");
      out.write("</FORM>\n");
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
