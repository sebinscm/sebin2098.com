package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;
import java.util.*;
import dbconn.*;
import common.util.*;

public final class invoice_jsp extends org.apache.jasper.runtime.HttpJspBase
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

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

//for go back list
String ag_buyer = request.getParameter("ag_buyer");
String ag_supplier = request.getParameter("ag_supplier");
String ag_po_no = request.getParameter("ag_po_no");
String ag_orderby = request.getParameter("ag_orderby");

String po_no[] = request.getParameterValues("po_no");
String inv_no = request.getParameter("inv_no");
String sdate = DateUtil.getToday("yyyy/MM/dd");

String po_nos = "";
if (po_no != null) {
  for (int i = 0; i < po_no.length; i++) {
    if (i > 0) po_nos += ",";
    po_nos += "'" + po_no[i] + "'";
  }
}

int tot_qty = 0;
//double tot_price_amt = 0.0d;
//double tot_air_price_amt = 0.0d;
double tot_amt = 0.0d;

Statement stmt = null;
ResultSet rs   = null;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

String sql  = "";
int iRet = 0;
String outS = "";

// set sql
//sql = " select  a.order_no, concat(a.sgr,a.style) , a.vendor_price,  "
//    + "         a.trans_type, a.total_qty, a.total_qty * a.vendor_price, po_type  "
//    + " from    purchase_order a "
//    + " where   a.backorder_flag = 'N' "
//    + " and     a.order_no in (" + po_nos + ") "
//    + " and     a.buyer = '" + ag_buyer + "' "
//    + " and     a.supplier = '" + ag_supplier + "' "
//    + " and     a.order_status between '75' and '90' "
//    + " order by a.order_no ";
sql =  " select a.order_no, concat(a.sgr,a.style) , a.vendor_price,  "
        + "  a.trans_type, b.order_qty, b.total_amount, a.po_type  "
        + " from purchase_order a LEFT OUTER JOIN shipment_02t b on ( a.order_no = b.po_no and a.buyer = b.buyer_id ) "
        + " where a.backorder_flag = 'N' and a.order_status between '75' and '85' "
        + " and     a.order_no in (" + po_nos + ") "
        + " and     a.supplier = '" + ag_supplier + "' "
        + " and       a.buyer = '" + ag_buyer + "' "
        + " order by a.order_no ";

//out.println(sql);

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

// print out
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String check_pono = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  double vendor_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String trans_type = matrix.getRowData(i).getData(j++);
   int total_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
   double total_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
   String deltype = matrix.getRowData(i).getData(j++); 
  //double net_price = vendor_price - disc_price;
  //double net_price_sum = net_price*total_qty;
  //double air_price_sum = air_cost*total_qty;
  //double amount_sum = (net_price_sum + air_price_sum)*1.1;

  tot_qty += total_qty;
  //tot_price_amt += net_price_sum;
  //tot_air_price_amt += air_price_sum;
  tot_amt += total_amount;

  outS += "<tr class='table_bg_bright'>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=2 NAME=seq VALUE=' "+ (i+1) +"' ></td>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=20 NAME=check_pono VALUE='" + check_pono + "'></td>"
        + " <td align=center><input readonly TYPE=TEXT SIZE=15 NAME=a_style_no VALUE='" + style_no + "'></td>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=5 NAME=a_qty VALUE='" + total_qty + "'></td>"
        + " <td align=right ><INPUT readonly TYPE=TEXT SIZE=8 NAME=a_price VALUE='" + StringUtil.formatNumber(vendor_price, MONEY_FORMAT) + "'></td>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=5 NAME=trans_type VALUE='"+trans_type+"'></td>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=5 NAME=del_type VALUE='"+deltype+"'></td>"
        + " <td align=right >"+"$" + StringUtil.formatNumber(total_amount, MONEY_FORMAT) + "</td>"
        + "</tr>";
}

outS += "<tr class='table_bg_bright'> " +
        "<td bgcolor=e6e6fa align=center > Total </td>" +
        "<td bgcolor=e6e6fa align=center >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=center >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=center > " + StringUtil.formatNumber(tot_qty, QTY_FORMAT)   + "</td>" +
        "<td bgcolor=e6e6fa align=right  >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=right  >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=right  >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=right  >"+"$" + StringUtil.formatNumber(tot_amt, MONEY_FORMAT) + "</td>" +
        "</tr>";

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnClearDate(obj)\n");
      out.write("{\n");
      out.write("  obj.value = '';\n");
      out.write("}\t\n");
      out.write("function Save(form)\n");
      out.write("{\n");
      out.write("  if (!form.invoice_no.value) {\n");
      out.write("    alert('Input Invoice No.');\n");
      out.write("    form.invoice_no.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!form.filename.value) {\n");
      out.write("    alert('Input valid Attached Invoice File.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  var idx;\n");
      out.write("  var fName = form.filename.value;\n");
      out.write("\n");
      out.write("  idx = fName.lastIndexOf(\"\\\\\");\n");
      out.write("  if (idx < 0) idx = fName.lastIndexOf(\"/\");\n");
      out.write("\n");
      out.write("  fName = fName.substr(idx+1);\n");
      out.write("  idx = fName.lastIndexOf(\".\");\n");
      out.write("  if (idx >= 0) fName = fName.substring(0, idx);\n");
      out.write("\n");
      out.write("  if (form.invoice_no.value.toUpperCase() != fName.toUpperCase()) {\n");
      out.write("    alert('첨부된 Invoice화일이름과 Invoice번호가 같아야 합니다!.\\첨부화일 이름을 체크하세요!');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (confirm('Invoice를 생성 하시겠습니까?')) {\n");
      out.write("    form.action = 'invoice_update.jsp';\n");
      out.write("    form.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function ValidateCharacters(Value)\n");
      out.write("{\n");
      out.write("  bRetVal=true;\n");
      out.write("\n");
      out.write("  for (i=0; i<Value.length; i++)\n");
      out.write("  {\n");
      out.write("    if ('1234567890.'.lastIndexOf(Value.substr(i,1))==-1)\n");
      out.write("    {\n");
      out.write("      bRetVal=false;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  return bRetVal;\n");
      out.write("}\n");
      out.write("\n");
      out.write("function Back(form)\n");
      out.write("{\n");
      out.write("  form.action  = \"invoice_confirm_search.jsp\";\n");
      out.write("  form.submit();\n");
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
      out.write("  <td width=\"*\" class=\"left_title\">Invoice생성 2단계 - Invoice생성 및 발송</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" >\n");
      out.write("<FORM NAME=frmMain METHOD=POST enctype=\"multipart/form-data\">\n");
      out.write("<input type='hidden' name='ag_buyer' value='");
      out.print( ag_buyer );
      out.write("'>\t\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\t\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" ><font color=red>* 첨부할 Invoice file의 이름은 반드시 Invoice번호와 동일하게 만들어 첨부하세요.\n");
      out.write("    <br> 주) Invoice번호나 이름에는 중간에 공란을 허용하지 않습니다.\n");
      out.write("    <br>예) Invoice Number &quot;00018201&quot; - File name &quot;00018201.pdf&quot;.\n");
      out.write("   </td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE width=95% border=0 align='center' class=\"table_bg\">\n");
      out.write("<tr>\n");
      out.write("<TD width='21%' class='table_header_center'>Invoice No </TD>\n");
      out.write("<td width='29%' class='table_bg_bright'><INPUT TYPE=TEXT size=15 maxlength='15' NAME='invoice_no' VALUE=''>\n");
      out.write("  <font color='red'>(Max Length : 15)</font></td>\n");
      out.write("<TD width='25%' class='table_header_center'>Issue Date</TD>\n");
      out.write("<td width='30%' class='table_bg_bright'>\n");
      out.write("    <input type='text' name='invoice_date' size='10' value='");
      out.print( sdate );
      out.write("' style='cursor:hand' readonly\n");
      out.write("    onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write(" </td>   \n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td class='table_header_center'> Invoice File첨부</td>\n");
      out.write("<td colspan=\"3\" class='table_bg_bright'><INPUT TYPE=FILE  NAME=filename SIZE=60></td>\n");
      out.write("</tr>\n");
      out.write("</TABLE>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" class='table_bg_bright'>Invoice 상세내역 List</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE width=95% border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("<TD align=center >Seq</TD>\n");
      out.write("<TD align=center >PO#</TD>\n");
      out.write("<TD align=center >Item#</TD>\n");
      out.write("<TD align=center >Qty</TD>\n");
      out.write("<TD align=center > Unit Price </TD>\n");
      out.write("<TD align=center >Shipping Type</TD>\n");
      out.write("<TD align=center >Delivery Type</TD>\n");
      out.write("<TD align=center > Amount (GST Inc) </TD>\n");
      out.write("</TR>\n");
      out.print(outS);
      out.write("\n");
      out.write("<tr> <td colspan=12  class='table_bg_bright' align=center>\n");
      out.write("<INPUT TYPE=BUTTON VALUE=' Invoice 생성 '   ONCLICK=JavaScript:Save(document.frmMain)>\n");
      out.write("<INPUT TYPE=BUTTON VALUE='Back'   ONCLICK=JavaScript:Back(document.form1)>\n");
      out.write("</td></tr>\n");
      out.write("</TABLE>\n");
      out.write("</FORM>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</td></tr></table>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("<input type='hidden' name='ag_buyer' value='");
      out.print( ag_buyer );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("</form>\n");
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
