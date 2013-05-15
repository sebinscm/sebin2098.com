package org.apache.jsp.ordermanagement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.net.*;
import javax.naming.*;
import javax.sql.*;
import java.text.*;
import common.util.*;
import dbconn.*;

public final class buyer_005fpurchase_005forder_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"/error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write('\r');
      out.write('\n');
      out.write('\n');
      out.write('\r');
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


      out.write('\r');
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
      out.write("\r\n");
      out.write("\r\n");

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
int iRet = 0;
String strSep = "|!^";
String outS = "";
String outS01 = "";
String outS02 = "";
String outS03 = "";
String outS04 = "";
String outS05 = "";
String outS06 = "";
String outS07 = "";
String outS08 = "";
String outS09 = "";
String sql = "";
String fromUrl = "buyer_po_edit.jsp";
String today = DateUtil.getToday("yyyy/MM/dd");
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
 // get buyer code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' and delete_yn='N' and id='" + scmid + "' "
      + " order by id asc";

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String bid  = matrix.getRowData(i).getData(0);
    String bname  = matrix.getRowData(i).getData(1);
    outS01  += "<option value=\"" + bid + "\"";    
    outS01  += ">" + bname +"-"+bid+ "</option>";
  }
  // get supplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' and delete_yn='N' "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String sid  = matrix.getRowData(i).getData(0);
    String sname  = matrix.getRowData(i).getData(1);
    outS02  += "<option value=\"" + sid + "\"";    
    outS02  += ">" + sname + "</option>";
  } 
     // get PGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'PGR' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String pgrcode  = matrix.getRowData(i).getData(0);
    String pgrname  = matrix.getRowData(i).getData(1);
    outS03  += "<option value=\"" + pgrcode + "\"";    
    outS03  += ">" + pgrname + "</option>";
  }
  // get SGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SGR' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String sgrcode  = matrix.getRowData(i).getData(0);
    String sgrname  = matrix.getRowData(i).getData(1);
    outS04  += "<option value=\"" + sgrcode + "\"";    
    outS04  += ">" + sgrname + "</option>";
  }
  // get MATERIAL code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'MATERIAL' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String mcode  = matrix.getRowData(i).getData(0);
    String mname  = matrix.getRowData(i).getData(1);
    outS05  += "<option value=\"" + mcode + "\"";    
    outS05  += ">" + mname + "</option>";
  }
  
   // get Currency code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'CURRENCY' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String curcode  = matrix.getRowData(i).getData(0);
    String curname  = matrix.getRowData(i).getData(1);
    outS06  += "<option value=\"" + curcode + "\"";    
    outS06  += ">" + curname + "</option>";
  }
  // get SUBsupplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'P' and delete_yn='N'  "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String subid  = matrix.getRowData(i).getData(0);
    String subname  = matrix.getRowData(i).getData(1);
    outS07  += "<option value=\"" + subid + "\"";    
    outS07  += ">" + subname + "</option>";
  } 
  // get SEASON code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SEASON' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String season_code  = matrix.getRowData(i).getData(0);
    String season_name  = matrix.getRowData(i).getData(1);
    outS08  += "<option value=\"" + season_code + "\"";    
    outS08  += ">" + season_name + "</option>";
  }
  // get Ship type
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SHIP_TYPE' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String ship_code  = matrix.getRowData(i).getData(0);
    String ship_name  = matrix.getRowData(i).getData(1);
    outS09  += "<option value=\"" + ship_code + "\"";    
    outS09  += ">" + ship_name + "</option>";
  }
  
} catch (Exception e) {
  System.out.println("Exception /admin/account/supplier : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Purchase Order</title>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/validate2.js\"></script>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\r\n");
      out.write("function fnSave(frm) { \r\n");
      out.write("  if (!frm.styno.value) {\r\n");
      out.write("    alert('Input style number!');\r\n");
      out.write("    frm.styno.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (!frm.buyer.value) {\r\n");
      out.write("    alert('Input Buyer!');\r\n");
      out.write("    frm.buyer.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("   if (!frm.pgr.value) {\r\n");
      out.write("    alert('Input PGR!');\r\n");
      out.write("    frm.pgr.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("   if (!frm.sgr.value) {\r\n");
      out.write("    alert('Input SGR!');\r\n");
      out.write("    frm.sgr.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (!frm.unitprice.value) {\r\n");
      out.write("    alert('Input Unit Price!');\r\n");
      out.write("    frm.unitprice.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("  if (!frm.itemtext.value) {\r\n");
      out.write("    alert('Input Item text!');\r\n");
      out.write("    frm.itemtext.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("   if (!frm.reorder.value) {\r\n");
      out.write("    alert('Input reorder SEQ!');\r\n");
      out.write("    frm.reorder.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (!frm.size1.value) {\r\n");
      out.write("    alert('Input at least one or more Size code!');\r\n");
      out.write("    frm.size1.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (!frm.col_1.value) {\r\n");
      out.write("    alert('Input at least one or more color and quantity!');\r\n");
      out.write("    frm.col_1.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (confirm('Do you really want to save these data?')) { \r\n");
      out.write("    frm.action = './buyer_order_input.jsp';\r\n");
      out.write("    frm.submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function Change() {\r\n");
      out.write("  num1 = form1.aqty_1.value;\r\n");
      out.write("  if( num1.length == 0 ) {\r\n");
      out.write("    num1 = \"0\";\r\n");
      out.write("    form1.aqty_1.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num2 = form1.aqty_2.value;\r\n");
      out.write("  if( num2.length == 0 ) {\r\n");
      out.write("    num2 = \"0\";\r\n");
      out.write("    form1.aqty_2.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num3 = form1.aqty_3.value;\r\n");
      out.write("  if( num3.length == 0 ) {\r\n");
      out.write("    num3 = \"0\";\r\n");
      out.write("    form1.aqty_3.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num4 = form1.aqty_4.value;\r\n");
      out.write("  if( num4.length == 0 ) {\r\n");
      out.write("    num4 = \"0\";\r\n");
      out.write("    form1.aqty_4.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("   num5 = form1.aqty_5.value;\r\n");
      out.write("  if( num5.length == 0 ) {\r\n");
      out.write("    num5 = \"0\";\r\n");
      out.write("    form1.aqty_5.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num6 = form1.aqty_6.value;\r\n");
      out.write("  if( num6.length == 0 ) {\r\n");
      out.write("    num6 = \"0\";\r\n");
      out.write("    form1.aqty_6.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)\r\n");
      out.write("                  + eval(num6) \r\n");
      out.write("  form1.aqtytot.value = tmpTotal;\r\n");
      out.write("}\r\n");
      out.write("function Change2() {\r\n");
      out.write("  num1 = form1.bqty_1.value;\r\n");
      out.write("  if( num1.length == 0 ) {\r\n");
      out.write("    num1 = \"0\";\r\n");
      out.write("    form1.bqty_1.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num2 = form1.bqty_2.value;\r\n");
      out.write("  if( num2.length == 0 ) {\r\n");
      out.write("    num2 = \"0\";\r\n");
      out.write("    form1.bqty_2.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num3 = form1.bqty_3.value;\r\n");
      out.write("  if( num3.length == 0 ) {\r\n");
      out.write("    num3 = \"0\";\r\n");
      out.write("    form1.bqty_3.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num4 = form1.bqty_4.value;\r\n");
      out.write("  if( num4.length == 0 ) {\r\n");
      out.write("    num4 = \"0\";\r\n");
      out.write("    form1.bqty_4.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("   num5 = form1.bqty_5.value;\r\n");
      out.write("  if( num5.length == 0 ) {\r\n");
      out.write("    num5 = \"0\";\r\n");
      out.write("    form1.bqty_5.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num6 = form1.bqty_6.value;\r\n");
      out.write("  if( num6.length == 0 ) {\r\n");
      out.write("    num6 = \"0\";\r\n");
      out.write("    form1.bqty_6.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)\r\n");
      out.write("                  + eval(num6) \r\n");
      out.write("  form1.bqtytot.value = tmpTotal;\r\n");
      out.write("}\r\n");
      out.write("function Change3() {\r\n");
      out.write("  num1 = form1.cqty_1.value;\r\n");
      out.write("  if( num1.length == 0 ) {\r\n");
      out.write("    num1 = \"0\";\r\n");
      out.write("    form1.cqty_1.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num2 = form1.cqty_2.value;\r\n");
      out.write("  if( num2.length == 0 ) {\r\n");
      out.write("    num2 = \"0\";\r\n");
      out.write("    form1.cqty_2.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num3 = form1.cqty_3.value;\r\n");
      out.write("  if( num3.length == 0 ) {\r\n");
      out.write("    num3 = \"0\";\r\n");
      out.write("    form1.cqty_3.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num4 = form1.cqty_4.value;\r\n");
      out.write("  if( num4.length == 0 ) {\r\n");
      out.write("    num4 = \"0\";\r\n");
      out.write("    form1.cqty_4.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("   num5 = form1.cqty_5.value;\r\n");
      out.write("  if( num5.length == 0 ) {\r\n");
      out.write("    num5 = \"0\";\r\n");
      out.write("    form1.cqty_5.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num6 = form1.cqty_6.value;\r\n");
      out.write("  if( num6.length == 0 ) {\r\n");
      out.write("    num6 = \"0\";\r\n");
      out.write("    form1.cqty_6.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)\r\n");
      out.write("                  + eval(num6) \r\n");
      out.write("  form1.cqtytot.value = tmpTotal;\r\n");
      out.write("}\r\n");
      out.write("function Change4() {\r\n");
      out.write("  num1 = form1.dqty_1.value;\r\n");
      out.write("  if( num1.length == 0 ) {\r\n");
      out.write("    num1 = \"0\";\r\n");
      out.write("    form1.dqty_1.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num2 = form1.dqty_2.value;\r\n");
      out.write("  if( num2.length == 0 ) {\r\n");
      out.write("    num2 = \"0\";\r\n");
      out.write("    form1.dqty_2.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num3 = form1.dqty_3.value;\r\n");
      out.write("  if( num3.length == 0 ) {\r\n");
      out.write("    num3 = \"0\";\r\n");
      out.write("    form1.dqty_3.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num4 = form1.dqty_4.value;\r\n");
      out.write("  if( num4.length == 0 ) {\r\n");
      out.write("    num4 = \"0\";\r\n");
      out.write("    form1.dqty_4.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("   num5 = form1.dqty_5.value;\r\n");
      out.write("  if( num5.length == 0 ) {\r\n");
      out.write("    num5 = \"0\";\r\n");
      out.write("    form1.dqty_5.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num6 = form1.dqty_6.value;\r\n");
      out.write("  if( num6.length == 0 ) {\r\n");
      out.write("    num6 = \"0\";\r\n");
      out.write("    form1.dqty_6.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)\r\n");
      out.write("                  + eval(num6) \r\n");
      out.write("  form1.dqtytot.value = tmpTotal;\r\n");
      out.write("}\r\n");
      out.write("function Change5() {\r\n");
      out.write("  num1 = form1.eqty_1.value;\r\n");
      out.write("  if( num1.length == 0 ) {\r\n");
      out.write("    num1 = \"0\";\r\n");
      out.write("    form1.eqty_1.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num2 = form1.eqty_2.value;\r\n");
      out.write("  if( num2.length == 0 ) {\r\n");
      out.write("    num2 = \"0\";\r\n");
      out.write("    form1.eqty_2.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  num3 = form1.eqty_3.value;\r\n");
      out.write("  if( num3.length == 0 ) {\r\n");
      out.write("    num3 = \"0\";\r\n");
      out.write("    form1.eqty_3.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num4 = form1.eqty_4.value;\r\n");
      out.write("  if( num4.length == 0 ) {\r\n");
      out.write("    num4 = \"0\";\r\n");
      out.write("    form1.eqty_4.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("   num5 = form1.eqty_5.value;\r\n");
      out.write("  if( num5.length == 0 ) {\r\n");
      out.write("    num5 = \"0\";\r\n");
      out.write("    form1.eqty_5.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write(" num6 = form1.eqty_6.value;\r\n");
      out.write("  if( num6.length == 0 ) {\r\n");
      out.write("    num6 = \"0\";\r\n");
      out.write("    form1.eqty_6.value = \"0\";\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)\r\n");
      out.write("                  + eval(num6) \r\n");
      out.write("  form1.eqtytot.value = tmpTotal;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function ValidCh(Value)\r\n");
      out.write("{\r\n");
      out.write("   bRetVal = true;\r\n");
      out.write("\r\n");
      out.write("   for (i=0; i<Value.length; i++)\r\n");
      out.write("   {\r\n");
      out.write("       if ('1234567890.'.lastIndexOf(Value.substr(i,1)) == -1)\r\n");
      out.write("           bRetVal = false;\r\n");
      out.write("   }\r\n");
      out.write("   return bRetVal;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function displayLeng( sz, id )\r\n");
      out.write("{\r\n");
      out.write("    var form = document.form1;\r\n");
      out.write("    var obj  = document.getElementById( id );\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    if (form[id].value.length > sz)\r\n");
      out.write("    {\r\n");
      out.write("        if (event.keyCode != '8') //백스페이스는 지우기작업시 바이트 체크하지 않기 위해서\r\n");
      out.write("        {\r\n");
      out.write("            alert( 'Up to '+sz+' characters can be put.');\r\n");
      out.write("        }\r\n");
      out.write("        form[id].value = form[id].value.substring(0, sz);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    document.getElementById(id+'_bytes').innerHTML = form[id].value.length+\" characters\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\t\r\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='3%'><img src='/img/btnPO.gif'></td>\r\n");
      out.write("  <td width='*' class='left_title'>BUYER : Pre-Purchase Order</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='10' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width='840' border='0' cellspacing='0' cellpadding='0'>\r\n");
      out.write("<tr><td>\r\n");
      out.write("* (*)marked data must be filled. <br>\r\n");
      out.write("* Style Number must be numeric only. <br>\r\n");
      out.write("* The PO number will be generated automatically when you create new order as \"SubGroup Code+Stylenumber\". \t\r\n");
      out.write("<table width='100%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\r\n");
      out.write("<form name=\"form1\" method=\"post\">\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=input_flag VALUE='INSERT' >\t\r\n");
      out.write("\t<input type='hidden' name='fromUrl' value='");
      out.print( fromUrl );
      out.write("'>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center'>*PO#</td>\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center'>*Style Number</td>\r\n");
      out.write("    <td width=\"23%\" height=\"16\" class='table_header_center'>*Buyer</td>\r\n");
      out.write("    <td width=\"35%\" colspan=\"2\" height=\"16\" class='table_header_center'>Supplier</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'>Auto-Gen<!--input type='text' name='pono' size='15' maxlength='15' class='input_text' disabled='true'--></td>\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'><input type='text'  name='styno' size='10' maxlength='10' class='input_text'></td>\r\n");
      out.write("    <td width=\"23%\" height=\"23\" class='table_bg_bright'><select name=\"buyer\" >");
      out.print(outS01);
      out.write("</select></td>\r\n");
      out.write("    <td width=\"35%\" colspan=\"2\" height=\"23\" class='table_bg_bright'><select name=\"supplier\">");
      out.print(outS02);
      out.write("</select></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center'>*Product Group</td>\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center'>*Sub group</td>\r\n");
      out.write("    <td width=\"23%\" height=\"16\" class='table_header_center'>*Unit Price</td>\r\n");
      out.write("    <td width=\"19%\" height=\"16\" class='table_header_center'>Order Date</td>\r\n");
      out.write("    <td width=\"16%\" height=\"16\" class='table_header_center'>Arrival Date</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'><select name=\"pgr\">");
      out.print(outS03);
      out.write("</select></td>\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'><select name=\"sgr\">");
      out.print(outS04);
      out.write("</select></td>\r\n");
      out.write("    <td width=\"23%\" height=\"23\" class='table_bg_bright'><input type='text' onblur=\"extractNumber(this,2,false);\" onkeyup=\"extractNumber(this,2,false);\" onkeypress=\"return blockNonNumbers(this, event, true, false);\"  name='unitprice' size='10' maxlength='10' class='input_text_right'>\r\n");
      out.write("    \t   &nbsp;&nbsp;<select name=\"currency\">");
      out.print(outS06);
      out.write("</select></td>\r\n");
      out.write("    <td width='19%' class=\"table_bg_bright\"><input type='text' name='orderdate' value='");
      out.print( today );
      out.write("' size='12' readonly class='input_text'>\r\n");
      out.write("    <img src=\"/img/calendar.gif\" style=\"cursor:hand\" align=\"absmiddle\" onclick=\"javascript:popFrame.fPopCalendar(this, document.form1.orderdate, document.all['popCal'], 'RIGHT', event);\"></td>\r\n");
      out.write("\r\n");
      out.write("    <td width='16%' class=\"table_bg_bright\"><input type='text' name='deliverydate'  size='12' readonly class='input_text'>\r\n");
      out.write("    <img src=\"/img/calendar.gif\" style=\"cursor:hand\" align=\"absmiddle\" onclick=\"javascript:popFrame.fPopCalendar(this, document.form1.deliverydate, document.all['popCal'], 'RIGHT', event);\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center'>Ship type</td>\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center'>Material</td>\r\n");
      out.write("    <td width=\"23%\" height=\"22\" class='table_header_center'>*Season</td>\r\n");
      out.write("    <td width=\"19%\" height=\"22\" class='table_header_center'>BRAND</td>\r\n");
      out.write("    <td width=\"16%\" height=\"22\" class='table_header_center'>Shipping Type</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"27\" class='table_bg_bright'><select name=\"shiptype\">");
      out.print(outS09);
      out.write("</select></td>\r\n");
      out.write("    <td width='21%' class=\"table_bg_bright\"><select name=\"material\">");
      out.print(outS05);
      out.write("</select></td>\r\n");
      out.write("    <td width=\"23%\" height=\"27\" class='table_bg_bright'><SELECT NAME=season>");
      out.print(outS08);
      out.write("</SELECT></td>\r\n");
      out.write("    <td width=\"19%\" height=\"27\" class='table_bg_bright'><input type='text' name='brand' size='20' maxlength='20' class='input_text'></td>\r\n");
      out.write("    <td width=\"16%\" height=\"27\" class='table_bg_bright'><SELECT NAME=deltype>\r\n");
      out.write("      <OPTION VALUE=\"SHIP\">SHIP</OPTION>\r\n");
      out.write("      <OPTION VALUE=\"AIR\">AIR</OPTION>\r\n");
      out.write("      </SELECT></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center'>Re-Order SEQ</td>\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center'></td>\r\n");
      out.write("    <td width=\"23%\" height=\"22\" class='table_header_center'></td>\r\n");
      out.write("    <td width=\"19%\" height=\"22\" class='table_header_center'></td>\r\n");
      out.write("    <td width=\"16%\" height=\"22\" class='table_header_center'></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"27\" class='table_bg_bright'><input type='text' name='reorder' size='10' maxlength='10' class='input_text'></td>\r\n");
      out.write("    <td width='21%' height=\"27\" class=\"table_bg_bright\"></td>\r\n");
      out.write("    <td width=\"23%\" height=\"27\" class='table_bg_bright'></td>\r\n");
      out.write("    <td width=\"19%\" height=\"27\" class='table_bg_bright'></td>\r\n");
      out.write("    <td width=\"16%\" height=\"27\" class='table_bg_bright'></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  \r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"28\" class='table_header_center'>*Item text</td>\r\n");
      out.write("    <td width=\"79%\" colspan=\"4\" height=\"28\" class='table_bg_bright'><input type='text' name='itemtext' size='100' maxlength='100' class='input_text'></td>\r\n");
      out.write("  </tr>  \r\n");
      out.write("  <tr class=\"table_header_center\">  \t \r\n");
      out.write("  \t<td class='table_list_no_height' align='center'>Comments<br>(Max. 4000 Characters)</td>    \r\n");
      out.write("    <td width=\"79%\" colspan=\"4\" height=\"202\" class='table_bg_bright'><TEXTAREA id=chk1 onkeyup='displayLeng(4000,\"chk1\");' name=\"contents\" cols=\"100\" rows=\"14\"></TEXTAREA><div name='chk1_bytes' id='chk1_bytes'></div></td>\r\n");
      out.write("  </tr>  \r\n");
      out.write("</table>\r\n");
      out.write("<table width='840' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" rowspan=\"2\" class='table_header_center' height=\"38\">*Color</td>\r\n");
      out.write("    <td width=\"67%\" colspan=\"6\" class='table_header_center' height=\"16\">*Size</td>\r\n");
      out.write("    <td width=\"13%\" rowspan=\"2\" class='table_header_center' height=\"38\">TOTAL</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"21\"><font size=\"2\"><input type='text' name='size1' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"21\"><font size=\"2\"><input type='text' name='size2' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center'  height=\"21\"><font size=\"2\"><input type='text' name='size3' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"21\"><font size=\"2\"><input type='text' name='size4' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"21\"><font size=\"2\"><input type='text' name='size5' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"12%\" class='table_header_center' height=\"21\"><font size=\"2\"><input type='text' name='size6' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" height=\"16\" class='table_bg_bright'><input type='text' name='col_1' size='20' maxlength='15' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='aqty_1'  onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='aqty_2'  onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='aqty_3'  onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='aqty_4'  onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='aqty_5'  onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change()\"></td>\r\n");
      out.write("    <td width=\"12%\" height=\"16\" class='table_bg_bright'><input type='text' name='aqty_6' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change()\"></td>\r\n");
      out.write("    <td width=\"13%\" height=\"16\" class='table_bg_bright'><input type='text' name='aqtytot' size='5' maxlength='5' class='input_text' readonly ></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" height=\"16\" class='table_bg_bright'><input type='text' name='col_2' size='20' maxlength='15' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='bqty_1' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change2()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='bqty_2' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change2()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='bqty_3' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change2()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='bqty_4' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change2()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='bqty_5' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change2()\"></td>\r\n");
      out.write("    <td width=\"12%\" height=\"16\" class='table_bg_bright'><input type='text' name='bqty_6' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change2()\"></td>\r\n");
      out.write("    <td width=\"13%\" height=\"16\" class='table_bg_bright'><input type='text' name='bqtytot' size='5' maxlength='5' class='input_text' readonly></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" height=\"16\" class='table_bg_bright'><input type='text' name='col_3' size='20' maxlength='15' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='cqty_1' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change3()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='cqty_2' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change3()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='cqty_3' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change3()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='cqty_4' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change3()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='cqty_5' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change3()\"></td>\r\n");
      out.write("    <td width=\"12%\" height=\"16\" class='table_bg_bright'><input type='text' name='cqty_6' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change3()\"></td>\r\n");
      out.write("    <td width=\"13%\" height=\"16\" class='table_bg_bright'><input type='text' name='cqtytot'  size='5' maxlength='5' class='input_text' readonly ></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" height=\"16\" class='table_bg_bright'><input type='text' name='col_4' size='20' maxlength='15' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='dqty_1' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change4()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='dqty_2' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change4()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='dqty_3' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change4()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='dqty_4' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change4()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='dqty_5' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change4()\"></td>\r\n");
      out.write("    <td width=\"12%\" height=\"16\" class='table_bg_bright'><input type='text' name='dqty_6' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change4()\"></td>\r\n");
      out.write("    <td width=\"13%\" height=\"16\" class='table_bg_bright'><input type='text' name='dqtytot' size='5' maxlength='5' class='input_text' readonly></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" height=\"16\" class='table_bg_bright'><input type='text' name='col_5' size='20' maxlength='15' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='eqty_1' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change5()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='eqty_2' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change5()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='eqty_3' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change5()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='eqty_4' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change5()\"></td>\r\n");
      out.write("    <td width=\"11%\" height=\"16\" class='table_bg_bright'><input type='text' name='eqty_5' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change5()\"></td>\r\n");
      out.write("    <td width=\"12%\" height=\"16\" class='table_bg_bright'><input type='text' name='eqty_6' onkeypress=\"return jf_EventNumberCheck();\" size='5' maxlength='5' class='input_text' onBlur=\"Change5()\"></td>\r\n");
      out.write("    <td width=\"13%\" height=\"16\" class='table_bg_bright'><input type='text' name='eqtytot'  size='5' maxlength='5' class='input_text' readonly></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <!--tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" class='table_header_center' height=\"16\">Grand Total</td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"16\"><input type='text' name='tqty_1' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"16\"><input type='text' name='tqty_2' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"16\"><input type='text' name='tqty_3' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"16\"><input type='text' name='tqty_4' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"16\"><input type='text' name='tqty_5' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>\r\n");
      out.write("    <td width=\"12%\" class='table_header_center' height=\"16\"><input type='text' name='tqty_6' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>\r\n");
      out.write("    <td width=\"13%\" class='table_header_center' height=\"16\"><input type='text' name='tqty_7' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>\r\n");
      out.write("  </tr-->                                                       \r\n");
      out.write("</table>\r\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td align='center'>\r\n");
      out.write("    <input type='button' value='Save' onclick='fnSave(this.form);'>\r\n");
      out.write("  </td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");

out.println(CopyRightLogo());

      out.write("\r\n");
      out.write("</tr></td>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
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
