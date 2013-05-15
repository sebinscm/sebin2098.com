package org.apache.jsp.ordermanagement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class buyer_005forder_005fstatus_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\n");
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
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String strSep = "|!^";
String fromUrl = "buyer_order_status_list.jsp";
String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
//String ag_buyer = request.getParameter("ag_buyer");

if (ag_supplier == null) ag_supplier = "";
if (ag_season == null) ag_season = "";
if (ag_date_type == null) ag_date_type = "CD";
if (ag_from_date == null || ag_to_date == null) {
  ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -60, "yyyy/MM/dd");
  ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";
//if (ag_buyer == null) ag_buyer = "";

Connection conn = null;

MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
DataProcess dataProcess = null;
String sql = "";
String sql2 = "";
String sql3 = "";
String sql4 = "";
String sql5 = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
String outS = "";
String statusList="";

// query for po list
sql = " select  a.order_no, "
    + "             a.style, "
    + "             a.season, "
    + "          a.order_date, "
    + "          a.buyer_name, "
    + "         a.supplier_name, "
    + "         a.order_status, "
    + "         date_format(a.created, '%Y/%m/%d'),total_qty, "
    + "         date_format(a.initial_del_date, '%Y/%m/%d'),a.sgr,a.buyer,b.code_name "
    + " from   purchase_order a LEFT OUTER JOIN vg_common_code b ON (  a.order_status = b.code and type='ORDER_STATUS' and b.use_yn='Y'  )  " 
    + " where   backorder_flag = 'N' " ;

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    String sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
    sql += " and    upper(a.order_no)  in upper(" + sql_po_no + ") " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    upper(a.style) like upper('" + ag_style_no + "%' )" ;
  }
  
} else {
  if (!ag_supplier.equals("")) {
    sql += " and    a.supplier = '" + ag_supplier + "' ";
  }

  if (!ag_season.equals("")) {
    sql += " and    upper(a.season) = upper('" + ag_season + "') ";
  }

//  if (!ag_buyer.equals("")) {
    sql += " and    a.buyer = '" + scmid + "' ";
 // }
  
  String tmpDate = "";
  if (ag_date_type.equals("DD")) {
    tmpDate = "a.delivery_date";
  } else if (ag_date_type.equals("AD")) {
    tmpDate = "a.arrival_date";
  } else if (ag_date_type.equals("CD")) {
    tmpDate = "a.created";
  } else if (ag_date_type.equals("OD")) {
    tmpDate = "a.order_date";
  }

  sql += " and " + tmpDate + "  BETWEEN  str_to_date('" + ag_from_date + "', '%Y/%m/%d') "
       + " and  str_to_date('" + ag_to_date + "',  '%Y/%m/%d') ";
}

sql += " order by ";

if ( ag_orderby.equals("1"))  {
  sql += " a.order_no ";
}
else if ( ag_orderby.equals("2"))  {
  sql += " a.supplier, a.order_no ";
}
else if ( ag_orderby.equals("3"))  {
  sql += " a.buyer, a.order_no ";
}
else if ( ag_orderby.equals("4"))  {
  sql += " a.arrival_date, a.order_no " ;
}
else if ( ag_orderby.equals("5"))  {
  sql += " a.delivery_date, a.order_no " ;
}
else if ( ag_orderby.equals("6"))  {
  sql += " a.delivery_date,a.supplier, a.order_no " ;
}
//out.println(sql);

// query for supplier list
sql2 = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' "
      + " order by id asc";

// query for buyer list
sql3 = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' "
      + " order by id asc";

// read user brand code info
//sql5 =  " select code,code_name from vg_common_code " +
//          " where type = 'BRAND' " +
//          " and     use_yn = 'Y' " +
//          "  order by code ";
          
sql4 = " select code,code_name  from vg_common_code " +
          " where type='ORDER_STATUS' and use_yn='Y' and code in('45','55','85','999')  order by sort_order ";          

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();
  //matrix5 = new MatrixDataSet();
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

  // supplier list
  
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

  // buyer list
  iRet3 = dataProcess.RetrieveData(sql3, matrix3, conn);

  // brand list
 // iRet5 = dataProcess.RetrieveData(sql5, matrix5, conn);

  iRet4 = dataProcess.RetrieveData(sql4, matrix4, conn); 
  
} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in admin_delivery_status_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
 
}

// print po list
int editableCnt = 0;

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
  String init_delivery_date = matrix.getRowData(i).getData(j++);
  String  sgr = matrix.getRowData(i).getData(j++);
  String  buyer_code = matrix.getRowData(i).getData(j++);
  String  status_name = matrix.getRowData(i).getData(j++);
  String colour_code = "#FFFFF0";
   // PO Status list
  // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	
	
  String strLink = "<a href=\"javascript:fnSetData('"
                  + po_no + strSep
                  + po_status 
                  + "')\">" + po_no + "</a>";

  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"
        + " <td>" + strLink + "</td>"
        + " <td>" + sgr + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + buyer_code + "</td>" 
        + " <td>" + supplier + "</td>"        
        + " <td>" + total_qty + "</td>"
        + " <td>" + status_name + "</td>" 
        + "  <td><a href=\"javascript:fnViewHistory('" + po_no + "')\">  View History </a></td>"  ;
       

    //String cus_init_date_input = "";

    //cus_init_date_input = "<input type='text' name='init_delivery_date' size='10' value='" + init_delivery_date + "' style='cursor:hand' readonly "
    //                              + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\">";    
     
   // outS += " <td nowrap><input type='hidden' name='po_no' value='" + po_no + "'>" + cus_init_date_input + "</td>";
   // outS += " <td nowrap>" + cus_init_date_input + "</td>";
     

    editableCnt++;

  statusList = "";
  outS += "<td>" + imgUrl + "</td></tr>";
}

// print po_status list
//statusList  = "<option value=''>All</option>";
for (int i = 0; i < iRet4; i++) {
  String code = matrix4.getRowData(i).getData(0);
  String code_name = matrix4.getRowData(i).getData(1);
   statusList  += "<option value=\"" + code + "\"";    
   statusList  += ">" + code_name + "</option>";
}

// print supplier list
String supplierList = "<option value=''>All</option>";
for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String supplier_id = matrix2.getRowData(i).getData(j++);
  String supplier_name = matrix2.getRowData(i).getData(j++);

  supplierList += "<option value='"+ supplier_id + "'" 
                + (ag_supplier.equals(supplier_id) ? " selected" : "") + ">" 
                + supplier_id + "-" + supplier_name + "</option>";
}

// print buyer list
//String buyerList = "<option value=''>All</option>";
//for (int i = 0; i < iRet3; i++) {
//  int j = 0;
//  String buyer_id = matrix3.getRowData(i).getData(j++);
//  String buyer_name = matrix3.getRowData(i).getData(j++);

//  buyerList += "<option value='"+ buyer_id + "'" 
//             + (ag_buyer.equals(buyer_id) ? " selected" : "") + ">" 
//             + buyer_name +"-"+buyer_id+ "</option>";
//}




      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnSetData(strParams) {\n");
      out.write("  var params = strParams.split('");
      out.print( strSep );
      out.write("');\n");
      out.write("  var j = 0;\n");
      out.write("\n");
      out.write("  with (document.form2) {\n");
      out.write("    po_no.value = params[j++];\n");
      out.write("    jf_fnSetSelectOption(po_status_list, params[j++]);\n");
      out.write("  }\n");
      out.write("}\t\n");
      out.write("function fnSubmit(frm)\n");
      out.write("{\n");
      out.write("  frm.ag_po_no.value = jf_AllTrim(frm.ag_po_no.value);\n");
      out.write("  frm.ag_style_no.value = jf_AllTrim(frm.ag_style_no.value);\n");
      out.write("  //frm.target = hidenFrame.name;\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnExcel(frm) {\n");
      out.write("  if (confirm(\"Do you want to download these data as an excel file?\"))\n");
      out.write("  {\n");
      out.write("    frm.action=\"./buyer_order_status_excel.jsp\";\n");
      out.write("    frm.target = hidenFrame.name;\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("function fnViewHistory(po_no_selected) {\n");
      out.write("  frmMain.po_no_selected.value = po_no_selected;\n");
      out.write("  frmMain.action  = \"./buyer_po_status_updated_history.jsp\";\n");
      out.write("  frmMain.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnView(po_no_selected) {\n");
      out.write("  frmMain.po_no_selected.value = po_no_selected;\n");
      out.write("  frmMain.action = \"./buyer_po_details_screen.jsp\";\n");
      out.write("  frmMain.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSave(frm) {\n");
      out.write("  if (!frm.po_no.value) {\n");
      out.write("    alert('Select PO number to update the status!');\n");
      out.write("    return;\n");
      out.write("  }\t\n");
      out.write("  if (confirm('Do you want to update the PO( '+frm.po_no.value+' ) Status?')) {      \t\n");
      out.write("        frm.action = './buyer_order_status_save.jsp';\n");
      out.write("        frm.target = this.name;\n");
      out.write("        frm.submit();\n");
      out.write("      } \n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
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
      out.write("  <td width=\"3%\"><img src=\"/img/icon_tasks.jpg\"> </td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Buyer Order Status </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM name='frmMain' ACTION=\"admin_order_status_list.jsp\" METHOD=POST>\n");
      out.write("\t<input type='hidden' name='po_no_selected'>\n");
      out.write("   <input type='hidden' name='po_status_selected'>\n");
      out.write("\t<input type='hidden' name='fromUrl' value='");
      out.print( fromUrl );
      out.write("'>\t\n");
      out.write("<tr>\n");
      out.write("  <td width=\"10%\" class=\"table_header_center\">Supplier</td>\n");
      out.write("  <td width=\"32%\" class=\"table_bg_bright\"><SELECT NAME='ag_supplier'>");
      out.print( supplierList );
      out.write("</SELECT></td>\n");
      out.write("  <td width=\"10%\" class=\"table_header_center\">SEASON</td>\n");
      out.write("  <td width=\"20%\" class=\"table_bg_bright\"><input type='text' name='ag_season' size='20' maxlength='20' class='input_text'></td>\n");
      out.write("  <td width=\"28%\" class=\"table_bg_bright_center\" colspan='2' rowspan='2'><INPUT TYPE='BUTTON' VALUE=\"Search\" ONCLICK='fnSubmit(this.form)'>\n");
      out.write("    <input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">Date</td>\n");
      out.write("  <td class=\"table_bg_bright\"><select name='ag_date_type'>\n");
      out.write("  \t <option value='CD' ");
      out.print( ag_date_type.equals("CD") ? "selected" : "" );
      out.write(">Created Date</option>\n");
      out.write("    <option value='OD' ");
      out.print( ag_date_type.equals("OD") ? "selected" : "" );
      out.write(">Order Date</option>\n");
      out.write("    <option value='DD' ");
      out.print( ag_date_type.equals("DD") ? "selected" : "" );
      out.write(">Delivery Date</option>\n");
      out.write("    <option value='AD' ");
      out.print( ag_date_type.equals("AD") ? "selected" : "" );
      out.write(">Arrival Date</option>    \n");
      out.write("    </select><br>From\n");
      out.write("    <input type='text' name='ag_from_date' size='10' value='");
      out.print( ag_from_date );
      out.write("' style='cursor:hand' readonly  onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write("     To\n");
      out.write("    <input type='text' name='ag_to_date' size='10' value='");
      out.print( ag_to_date );
      out.write("' style='cursor:hand' readonly    onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write("    </td>\n");
      out.write("  <td class=\"table_header_center\">Buyer ID</td>\n");
      out.write("  <td class=\"table_bg_bright\">");
      out.print( scmid );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">PO#</td>\n");
      out.write("  <td class=\"table_bg_bright\"><input type=text name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("' size='40' maxlength='200'></td>\n");
      out.write("  <td class=\"table_header_center\">Style#</td>\n");
      out.write("  <td class=\"table_bg_bright\"><input type=text name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("' size='10' maxlength='6'></td>\n");
      out.write("  <td width=\"10%\" class=\"table_header_center\">Order by</td>\n");
      out.write("  <td width=\"18%\" class=\"table_bg_bright\"><SELECT NAME='ag_orderby'>\n");
      out.write("    <OPTION value=\"1\" ");
 if(ag_orderby.equals("1")) out.print("SELECTED"); 
      out.write(">PO No.</OPTION>\n");
      out.write("    <OPTION value=\"2\" ");
 if(ag_orderby.equals("2")) out.print("SELECTED"); 
      out.write(">Supplier</OPTION>\n");
      out.write("    <OPTION value=\"3\" ");
 if(ag_orderby.equals("3")) out.print("SELECTED"); 
      out.write(">Buyer</OPTION>\n");
      out.write("    <OPTION value=\"4\" ");
 if(ag_orderby.equals("4")) out.print("SELECTED"); 
      out.write(">Ship Date</OPTION>\n");
      out.write("    <OPTION value=\"5\" ");
 if(ag_orderby.equals("5")) out.print("SELECTED"); 
      out.write(">Delivery Date</OPTION>\n");
      out.write("    <OPTION value=\"6\" ");
 if(ag_orderby.equals("6")) out.print("SELECTED"); 
      out.write(">Delivery Date+Supplier</OPTION>\n");
      out.write("    </SELECT></td>\n");
      out.write("</tr>\n");
      out.write("</form>\n");
      out.write("</table>\n");
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("* Select PO number below to edit PO Status.\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"table_bg\">\n");
      out.write("<form name='form2' method='post' >\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("' >\n");
      out.write("<input type='hidden' name='ag_season' value='");
      out.print( ag_season );
      out.write("' >\n");
      out.write("<input type='hidden' name='ag_date_type' value='");
      out.print( ag_date_type );
      out.write("' >\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("' >\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("' >\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("' >\n");
      out.write("<input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("' >\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("' >\n");
      out.write("<tr >\n");
      out.write("  <td width='50' bgcolor=yellow align=center>PO#</td>\n");
      out.write("  <td width='100' class='table_bg_bright'><input type='text' name='po_no' size='30' maxlength='10' readonly ></td>\n");
      out.write("  <td width='150' bgcolor=yellow align=center >PO Status(*)</td>\n");
      out.write("  <td width='150' class='table_bg_bright'><select name=\"po_status_list\">");
      out.print( statusList );
      out.write("</select></td>\n");
      out.write("  <td align='center' class='table_bg_bright'> <input type='button' value='Update' onclick='fnSave(this.form);'> </td>\n");
      out.write("\n");
      out.write("</tr>\n");
      out.write("<tr >\n");
      out.write("  <td colspan=5 class='table_bg_bright'>** If you change the PO Status to \"PO-confirm\", the confirmation email will be sent to the Supplier. System may be slow down while it is processed.</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE border=0 width=100% border='0' cellspacing='1' cellpadding='1' align='left' class='table_bg'>\n");
      out.write("<!--tr class='table_header_center'>\n");
      out.write("  <td colspan='8'>PO Details</td>\n");
      out.write("  <td colspan='6'>Order Status</td>\n");
      out.write("</tr-->\n");
      out.write("<TR class=\"table_header_center\">\n");
      out.write("  <TD>No</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("  <TD>SGR</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Season</TD>\n");
      out.write("  <TD>Buyer</TD>\n");
      out.write("  <TD>Buyer ID</TD>\n");
      out.write("  <TD>Supplier</TD>\n");
      out.write("  <TD>Total QTY</TD>\n");
      out.write("  <TD>PO Status</TD>\n");
      out.write("  <TD></TD>\n");
      out.write("  <TD>Image</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<iframe width=\"0\" height=\"0\" name=\"hidenFrame\"></iframe>\n");
      out.write("</form></BODY>\n");
      out.write("</HTML>");
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
