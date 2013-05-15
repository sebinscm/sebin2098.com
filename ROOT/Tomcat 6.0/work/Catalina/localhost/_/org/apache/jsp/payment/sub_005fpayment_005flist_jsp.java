package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import common.*;
import dbconn.*;

public final class sub_005fpayment_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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


response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String QTY_FORMAT = "#####0";
String MONEY_FORMAT = "#####0.00";

String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");
//out.println(ag_from_date);
if (ag_supplier == null) ag_supplier = "";
if (ag_season == null) ag_season = "";
if (ag_date_type == null) ag_date_type = "CD";

if (ag_from_date == null && ag_to_date == null) {
   ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -30, "yyyy/MM/dd");
   ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
//out.println(ag_from_date);
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";
if (ag_buyer == null) ag_buyer = "";

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
    + "         b.code_name, "
    + "         date_format(a.order_date, '%Y/%m/%d'),ifnull(a.total_qty,0), "
    + "         date_format(a.delivery_date,'%Y/%m/%d'),a.sgr,ifnull(a.local_price,0),"
    + "         ifnull(a.sub_payment,0), ifnull(a.sub_paid,0), "
    + "         ifnull(a.sub_charge,0), a.sub_comment,  "
    + "         date_format(a.sub_paydate,'%Y/%m/%d'), "
    + "         ifnull(d.subqty,'0'), (ifnull(d.subqty,0) * ifnull(a.local_price,0)), "
    + "         date_format(a.sub_paydate2,'%Y/%m/%d'),ifnull(a.sub_paid2,0), "
    + "         date_format(a.sub_paydate3,'%Y/%m/%d'),ifnull(a.sub_paid3,0), "
    + "         ifnull(a.sub_payment,0) - (  ifnull(a.sub_paid,0) +  ifnull(a.sub_paid2,0) +  ifnull(a.sub_paid3,0) + ifnull(a.sub_charge,0) ) "
    + " from   purchase_order a LEFT OUTER JOIN vg_common_code b ON ( a.order_status = b.code and b.type='ORDER_STATUS' and b.use_yn='Y') "
    + "                                     LEFT OUTER JOIN ( select sum(c.total_qty) subqty ,c.order_no  from subpurchase_order_line c group by order_no ) d on ( a.order_no = d.order_no ) "
    + " where   a.backorder_flag = 'N' " ;

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

  if (!ag_buyer.equals("")) {
    sql += " and    a.buyer = '" + ag_buyer + "' ";
  }
  
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

  sql += " and " + tmpDate + " between   str_to_date('" + ag_from_date + "', '%Y/%m/%d') "
       + " and  str_to_date('" + ag_to_date + "', '%Y/%m/%d') ";
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
   int     total_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  String delivery_date = matrix.getRowData(i).getData(j++);
  String  sgr = matrix.getRowData(i).getData(j++);
  double local_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double sub_payment = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double sub_paid = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double sub_charge = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String  sub_comment = matrix.getRowData(i).getData(j++);  
  String  sub_paydate = matrix.getRowData(i).getData(j++); 
  int     subtotal_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double sub_totalamount = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String  sub_paydate2 = matrix.getRowData(i).getData(j++);
  double sub_paid2 = Double.parseDouble(matrix.getRowData(i).getData(j++)); 
  String  sub_paydate3 = matrix.getRowData(i).getData(j++);
  double sub_paid3 = Double.parseDouble(matrix.getRowData(i).getData(j++)); 
  double sub_balance = Double.parseDouble(matrix.getRowData(i).getData(j++));

  String  pay_date_input  = "<input type='text' name='sub_paydate' size='10' value='" + sub_paydate + "' style='cursor:hand' readonly"
                                    + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PAID');\">X</a>";
  String  pay_date_input2  = "<input type='text' name='sub_paydate2' size='10' value='" + sub_paydate2 + "' style='cursor:hand' readonly"
                                    + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PAID2');\">X</a>";
   String  pay_date_input3  = "<input type='text' name='sub_paydate3' size='10' value='" + sub_paydate3 + "' style='cursor:hand' readonly"
                                    + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PAID3');\">X</a>";                                    
   String colour_code = "";
   if (i%2 == 0) {
    colour_code = "#FFFFF0";
  } else {
    colour_code = "#EEEEE0";
  }
 // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	

  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"        
        + " <td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" 
        + " <td>" + imgUrl + "</td>"
        + " <td>" + sgr + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td><input type='hidden' name='po_no' value='" + po_no + "'>" + buyer + "</td>"
//     + " <td>" + supplier + "</td>"        
        + " <td>" + StringUtil.formatNumber(total_qty, QTY_FORMAT) + "</td>"
        + " <td>" + po_status + "</td>"
//        + " <td><input type='hidden' name='po_no' value='" + po_no + "'>" + delivery_date + "</td>"
        +  "<td><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(local_price, MONEY_FORMAT) +"' name='local_price' size='10' maxlength='10' class='input_text_right'></td>"      
        + " <td>" + StringUtil.formatNumber(subtotal_qty, QTY_FORMAT) + "</td>" 
        + " <td>" + StringUtil.formatNumber(sub_totalamount, MONEY_FORMAT) + "</td>"          
        +  "<td><font color=blue><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_payment, MONEY_FORMAT)+"' name='sub_payment' size='10' maxlength='10' class='input_text_right'></font></td>"   
        +  "<td><font color=blue><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_paid, MONEY_FORMAT) +"' name='sub_paid' size='10' maxlength='10' class='input_text_right'></font></td>"    
        + " <td>"+ pay_date_input +" </td>"
        +  "<td><font color=blue><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_paid2, MONEY_FORMAT) +"' name='sub_paid2' size='10' maxlength='10' class='input_text_right'></font></td>"    
        + " <td>"+ pay_date_input2 +" </td>"
        +  "<td><font color=blue><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_paid3, MONEY_FORMAT) +"' name='sub_paid3' size='10' maxlength='10' class='input_text_right'></font></td>"    
        + " <td>"+ pay_date_input3 +" </td>"
        + " <td align=right ><font color=red>" + StringUtil.formatNumber(sub_balance, MONEY_FORMAT) + "</font></td>" 
        +  "<td><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_charge, MONEY_FORMAT) +"' name='sub_charge' size='10' maxlength='10' class='input_text_right'></td>"   
        + " <td><TEXTAREA name=sub_comment cols='50' rows='2'  >" +sub_comment+ " </TEXTAREA></td>";

    editableCnt++;


  outS += "</tr>";
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
String buyerList = "<option value=''>All</option>";
for (int i = 0; i < iRet3; i++) {
  int j = 0;
  String buyer_id = matrix3.getRowData(i).getData(j++);
  String buyer_name = matrix3.getRowData(i).getData(j++);

  buyerList += "<option value='"+ buyer_id + "'" 
             + (ag_buyer.equals(buyer_id) ? " selected" : "") + ">" 
             + buyer_name +"-"+buyer_id+ "</option>";
}




      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/validate2.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnClearDate(obj)\n");
      out.write("{\n");
      out.write("  obj.value = '';\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnClearDate(idx, dateType) {\n");
      out.write("  with (document.form2) {\n");
      out.write("    if (po_no.length) {\n");
      out.write("\t      if (dateType == 'PAID') {\n");
      out.write("\t        sub_paydate[idx].value = ''; \n");
      out.write("\t      }\n");
      out.write("\t      if (dateType == 'PAID2') {\n");
      out.write("\t        sub_paydate2[idx].value = ''; \n");
      out.write("\t      }\n");
      out.write("\t      if (dateType == 'PAID3') {\n");
      out.write("\t        sub_paydate3[idx].value = ''; \n");
      out.write("\t      }\n");
      out.write("    } else {\n");
      out.write("\t      if (dateType == 'PAID') {\n");
      out.write("\t        sub_paydate.value = '';  \n");
      out.write("         }\n");
      out.write("         if (dateType == 'PAID2') {\n");
      out.write("\t        sub_paydate2.value = '';  \n");
      out.write("         }\n");
      out.write("         if (dateType == 'PAID3') {\n");
      out.write("\t        sub_paydate3.value = '';  \n");
      out.write("         }\n");
      out.write("   }\n");
      out.write("   }\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("function fnSubmit(frm)\n");
      out.write("{\n");
      out.write("  frm.ag_po_no.value = jf_AllTrim(frm.ag_po_no.value);\n");
      out.write("  frm.ag_style_no.value = jf_AllTrim(frm.ag_style_no.value);\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnExcel(frm) {\n");
      out.write("  if (confirm(\"Do you want to download these data as an excel file?\"))\n");
      out.write("  {\n");
      out.write("    frm.action=\"./admin_order_status_excel.jsp\";\n");
      out.write("    frm.target = hidenFrame.name;\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("function fnView(po_no_selected) {\n");
      out.write("\tvar win = window.open('', \"winPrint\", \"toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900\");\n");
      out.write("    frmMain.po_no_selected.value = po_no_selected;\n");
      out.write("    if (win) {\n");
      out.write("\t    frmMain.action = \"/ordermanagement/po_detail_popup.jsp\";\n");
      out.write("\t    frmMain.target = win.name;\n");
      out.write("\t    frmMain.submit();\n");
      out.write("   }\n");
      out.write("}\n");
      out.write("\n");

if (_admingroup.equals("A")) {

      out.write("\n");
      out.write("function fnSave(frm) {\n");
      out.write("    // check date \n");
      out.write("      if (confirm(\"Are you sure to save these data?\")) {\n");
      out.write("        frm.action = './sub_payment_update.jsp';\n");
      out.write("        frm.target = this.name;\n");
      out.write("        frm.submit();\n");
      out.write("      }\n");
      out.write("\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");

}

      out.write("\n");
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
      out.write("  <td width=\"3%\"><img src=\"/img/btnWindow.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Manufacturer Payment Management</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM name='frmMain' ACTION=\"sub_payment_list.jsp\" METHOD=POST>\n");
      out.write("\t<input type='hidden' name='po_no_selected'>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"10%\" class=\"table_header_center\">Supplier</td>\n");
      out.write("  <td width=\"32%\" class=\"table_bg_bright\"><SELECT NAME='ag_supplier'>");
      out.print( supplierList );
      out.write("</SELECT></td>\n");
      out.write("  <td width=\"10%\" class=\"table_header_center\">SEASON</td>\n");
      out.write("  <td width=\"20%\" class=\"table_bg_bright\"><input type='text' name='ag_season' size='20' maxlength='20' class='input_text'></td>\n");
      out.write("  <td width=\"28%\" class=\"table_bg_bright_center\" colspan='2' rowspan='2'><INPUT TYPE='BUTTON' VALUE=\"Search\" ONCLICK='fnSubmit(this.form)'>\n");
      out.write("   </tr>\n");
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
      out.write("    <input type=\"text\" name=\"ag_from_date\" size=\"10\" value=\"");
      out.print( ag_from_date );
      out.write("\" >\n");
      out.write("    <img src=\"/img/calendar.gif\" style=\"cursor:hand\" align=\"absmiddle\" onclick=\"javascript:popFrame.fPopCalendar(this, document.frmMain.ag_from_date, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write("    ~\n");
      out.write("    <input type=\"text\" name=\"ag_to_date\" size=\"10\" value=\"");
      out.print( ag_to_date );
      out.write("\" >\n");
      out.write("    <img src=\"/img/calendar.gif\" style=\"cursor:hand\" align=\"absmiddle\" onclick=\"javascript:popFrame.fPopCalendar(this, document.frmMain.ag_to_date, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write("    </td>\n");
      out.write("  <td class=\"table_header_center\">Buyer</td>\n");
      out.write("  <td class=\"table_bg_bright\"><SELECT NAME='ag_buyer'>");
      out.print( buyerList );
      out.write("</SELECT></td>\n");
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
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</td></tr></table>\n");
      out.write("* Production Cost and Actual payment could be different.<br>\n");
      out.write("Actual Cost = Pre-payment + Rest of payment.<br>\n");
      out.write("Please double check the Actual Payment!<br>\n");
      out.write("<table width=\"1800\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\"><tr><td>\n");
      out.write("<TABLE border=0 width=100% CELLPADDING=0 CELLSPACING=1 class=\"table_bg\">\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_season' value='");
      out.print( ag_season );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_date_type' value='");
      out.print( ag_date_type );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_buyer' value='");
      out.print( ag_buyer );
      out.write("'\n");
      out.write("<tr class=\"table_header_center\">\n");
      out.write("  <td colspan='8' align=center  class='table_bg_bright'>PO Basic Info</td>\n");
      out.write("  <td colspan='13' align=center class='table_bg_bright' >Manufacturer Payment</td>\n");
      out.write("</tr>\n");
      out.write("<TR class=\"table_header_center\">\n");
      out.write("  <TD>No</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("   <TD>Image</TD>\n");
      out.write("  <TD>SGR</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Season</TD>\n");
      out.write("  <TD>Buyer</TD>\n");
      out.write("  <TD>PO Qty</TD>\n");
      out.write("  <TD>PO Status</TD>\n");
      out.write("  <TD>Unit Price</TD>\n");
      out.write("  <TD>Produce Qty</TD>\n");
      out.write("  <TD>Production Price</TD>\n");
      out.write("  <TD>Actual Payable - Total Price</TD>\n");
      out.write("  <TD>1st-Payable Price</TD>\n");
      out.write("  <TD>1st-Pay Date</TD>\n");
      out.write("  <TD>2nd-Pay Amount</TD>\n");
      out.write("  <TD>2nd-Pay Date</TD>\n");
      out.write("  <TD>3nd-Pay Amount</TD>\n");
      out.write("  <TD>3nd-Pay Date</TD>\n");
      out.write("  <TD >Balance</TD>\n");
      out.write("  <TD>Back Charge</TD>\n");
      out.write("  <TD>Note</TD>  \n");
      out.write("</TR>\n");
      out.print( outS );
      out.write('\n');

if (_admingroup.equals("A")) {

      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td align='center' class='table_bg_bright' colspan='21'><input type='button' value='Save' onclick='fnSave(this.form);'>\n");
      out.write("    <input type='reset' value='Reset'></td>\n");
      out.write("</tr>\n");

}

      out.write("\n");
      out.write("</form>\n");
      out.write("</TABLE>\n");
      out.write("</td></tr></table>\n");
      out.write("\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</td></tr></table>\n");
      out.write("<iframe width=\"0\" height=\"0\" name=\"hidenFrame\"></iframe>\n");
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
