package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.net.*;
import java.text.*;
import dbconn.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;

public final class buyer_005fpayment_005fdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String today = DateUtil.getToday("yyyy/MM/dd");
int iRet = 0;
int iRet2 = 0;
Connection conn = null;
Connection connVGMain = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";
String outS2 = "";
String sql2 = "";

String ag_supplier = request.getParameter("ag_supplier");
String ag_supplier_type = request.getParameter("ag_supplier_type");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
String buyer_id = request.getParameter("buyer_id");
//out.println(inv_no);
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
String invoice_status="";
int total_qty = 0;
String closed_msg="";
double total_net_price_sum = 0d;
double total_air_price_sum = 0d;
double total_amount = 0d;

double total_paid_sum = 0d;
double total_claim_sum = 0d;
double total_balance_sum = 0d;

boolean isEditable = false;

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // check whether this invoice can be editable
  int iCnt = 0;
 
  sql = " select  count(b.po_no) "
      + " from    invoice_01t a "
      + "         inner join invoice_02t b "
      + "           on ( a.invoice_no = b.invoice_no "
      + "           and a.sup_id = b.sup_id "
      + "           and a.buyer_id = b.buyer_id ) "
      + " where   a.invoice_no = '" + inv_no + "' "
      + " and     a.sup_id = '" + sup_id + "' "
      + " and     a.buyer_id = '" + scmid + "' " 
      + " and     b.po_no in ( "
      + "           select  order_no "
      + "           from    purchase_order "
      + "           where   order_status = '90' "
      + "         ) ";

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    iCnt = Integer.parseInt(matrix.getRowData(0).getData(0));   
  }

  // read invoice header info
  sql = " select date_format(invoice_date,'%Y/%m/%d'), " +
        "        file_name, " +
        "        date_format(updated,'%Y/%m/%d'), status " +
        "   from invoice_01t " +
        "  where invoice_no = '" + inv_no + "'" +
        "    and buyer_id = '" + scmid   + "'" +        
        "    and sup_id = '" + sup_id   + "'";

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    issue_date = matrix.getRowData(0).getData(j++);
    attached_file = matrix.getRowData(0).getData(j++);
    update_date = matrix.getRowData(0).getData(j++);
    invoice_status = matrix.getRowData(0).getData(j++);
  }
  // check invoice status is closed
  if (invoice_status.equals("C") ) {
      closed_msg = " 해당  Invoice번호의 Payment가 완료되었습니다!";
  } else {
      isEditable = true;
  }   
  
  // read invoice details info
  sql = " select po_no, " +
        "        style_no, " +
        "        qty, " +
        "        price, " +
        "        qty * price, seq " +
        "   from invoice_02t " +
        "  where invoice_no = '" + inv_no + "'"  +
        "    and buyer_id = '" + scmid   + "'" +   
        "    and sup_id = '" + sup_id   + "'"  +
        "  order by po_no asc ";

  //out.println(sql); if (true) return;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
  sql2 = " select  SEQ_NO,INVOICE_NO,    "
						+" date_format(pay_date,'%Y/%m/%d'),      "
						+" PAY_AMT,       "
						+" PAY_COMMENT,   "
						+" CLOSE_YN,      "
						+" CLAIM_AMOUNT,  "
						+" CLAIM_COMMENT, "
						+" date_format(claim_date,'%Y/%m/%d'),    "
						+" date_format(updated,'%Y/%m/%d'),       "
						+" UPDATED_ID     "
			+ " from payment_01t       "			
			+ " where invoice_no = '" + inv_no + "'" 
	       + "          and buyer = '" + scmid   + "'" 
	       + "          and supplier = '" + sup_id   + "'"  
	       + "          order by pay_date "; 
   iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);
   //out.println(sql2);


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

  total_qty += qty;
  total_amount += total_price;

  outS += "<tr align='right' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td align='center'>" + seqno + "</td>" +
          "<td align='center'>" + po_no + "</td>" +
          "<td align='center'>" + style_no + "</td>" +
          "<td>" + StringUtil.formatNumber(qty, QTY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(unit_price, MONEY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>" +
          "</tr>" ;
}

for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String seq_no = matrix2.getRowData(i).getData(j++);
  String invoice_no = matrix2.getRowData(i).getData(j++);
  String pay_date = matrix2.getRowData(i).getData(j++);
  double pay_amt = Double.parseDouble(matrix2.getRowData(i).getData(j++));
  String pay_comment = matrix2.getRowData(i).getData(j++);
  String close_yn = matrix2.getRowData(i).getData(j++);
  double claim_amt = Double.parseDouble(matrix2.getRowData(i).getData(j++));
  String claim_comment = matrix2.getRowData(i).getData(j++);
  String claim_date = matrix2.getRowData(i).getData(j++);
  String updated = matrix2.getRowData(i).getData(j++);
  String updated_id = matrix2.getRowData(i).getData(j++);

  total_paid_sum += pay_amt;
  total_claim_sum += claim_amt; 

  outS2 +=  "<tr align='right' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +                 
                 "<td align='center'>" + invoice_no + "</td>" +   
		          "<td>$" + StringUtil.formatNumber(pay_amt, MONEY_FORMAT) + "</td>" +
		          "<td align='center'>" + pay_date + "</td>" +
		           "<td align='center'>" + pay_comment + "</td>" +
		           "<td>$" + StringUtil.formatNumber(claim_amt, MONEY_FORMAT) + "</td>" +
		          "<td align='center'>" + claim_date + "</td>" +
		          "<td align='center'>" + claim_comment + "</td>" +
		          "<td align='center'>" + close_yn + "</td>" +
		          "<td align='center'>" + updated + "</td>" +
		          "<td align='center'>" + updated_id + "</td>" +
		          "</tr>" ;
}
   total_balance_sum = (total_amount -total_paid_sum+total_claim_sum);
   outS2 +=  "<tr align='right' bgcolor='#F6CECE'><td align='center'>&nbsp;</td><td align='center'>입금계</td>" +
                  "<td>$" + StringUtil.formatNumber( total_paid_sum, MONEY_FORMAT) + "</td>" +
                  "<td align='center'>&nbsp;</td>" +
                 "<td align='center'>Claim계</td>" +
                 "<td>$" + StringUtil.formatNumber( total_claim_sum, MONEY_FORMAT) + "</td>" +                 
                  "<td align='center'>잔금계</td>" +
                 "<td align='center'>$" + StringUtil.formatNumber(total_balance_sum, MONEY_FORMAT) +"</td>" +
                 "<td colspan='3'>&nbsp;</td>" +
                 "</tr>";

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/validate2.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("\n");
      out.write("function fnList(frm) {\n");
      out.write("  frm.target = self.name;\n");
      out.write("  frm.action = './buyer_payment_search.jsp';\n");
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
      out.write("<table width=\"850\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\"> Payment 상세내역 조회</td>\n");
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
      out.write("  <td width=\"100%\">Invoice Header</td>\n");
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
      out.write("</FORM>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\">Invoice Detail List</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE width='95%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<TR class='table_header_center'>\n");
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
      out.write("  <td colspan='3'>Total</td>\n");
      out.write("  <td align='right'>");
      out.print( StringUtil.formatNumber(total_qty, QTY_FORMAT) );
      out.write("</td>\n");
      out.write("  <TD>&nbsp;</TD>\n");
      out.write("  <td align='right'>$");
      out.print( StringUtil.formatNumber(total_amount, MONEY_FORMAT) );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='attachPath' value='");
      out.print( _invoiceFileUrl );
      out.write("'>\n");
      out.write("<input type='hidden' name='attachFile'>\n");
      out.write("<input type='hidden' name='attachRealFile'>\n");
      out.write("</form>\n");
      out.write("</TABLE>\n");
      out.write("<tr><td>\n");
      out.write("</TABLE>\t\n");
      out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>[ Buyer대금결재 현황 ]</b> <font color=red> ");
      out.print( closed_msg);
      out.write("</font><br>\n");
      out.write("\n");
      out.write("<TABLE width='100%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
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
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='actionFlag'>\t\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("  \n");
      out.write("  <TD>Invoice번호</TD>\n");
      out.write("  <TD>입금금액</TD>\n");
      out.write("  <TD>입급일자</TD>\n");
      out.write("  <TD>비고</TD>\n");
      out.write("  <TD>Claim금액</TD>\n");
      out.write("  <TD>Claim일자</TD>\n");
      out.write("  <TD>비고</TD>\n");
      out.write("  <TD>마감여부</TD>\n");
      out.write("  <TD>입력일자</TD>\n");
      out.write("  <TD>입력자</TD>\n");
      out.write("</TR>\n");
      out.print( outS2 );
      out.write("\t\n");
      out.write(" <tr>\n");
      out.write("  <td  align=center colspan='10'>   \n");
      out.write("    <input type='button' value='Go To List' onclick='fnList(this.form);'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
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
