package org.apache.jsp.admin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import java.text.*;
import common.util.*;
import dbconn.*;

public final class admin_005fsuborder_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String fromUrl = "admin_order_list.jsp";

if (ag_supplier == null) ag_supplier = "";

if (ag_from_date == null && ag_to_date == null) {
   ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -60, "yyyy/MM/dd");
   ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}


if (ag_status == null || ag_status==""  ) ag_status = "";
if (ag_orderby == null) ag_orderby = "1";
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";

MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
DataProcess dataProcess = null;
Connection conn = null;

String sql = "";
String sql2 = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
String outS = "";

// query for po list
sql = " select  a.order_no, "
    + "             a.style, "
    + "             a.season, "
    + "          date_format(a.order_date, '%Y/%m/%d') ,"
    + "          a.buyer_name, "
     + "         a.subsupplier_name, "   
    + "         a.supplier_name, "
    + "         a.order_status, "
    + "         date_format(a.created, '%Y/%m/%d'),ifnull(a.total_qty,0) ,b.code_name,a.sgr, ifnull(a.vendor_price,0),  (a.total_qty * a.vendor_price) total_amount, ifnull(a.local_price,0), ifnull(d.subqty,'0'), (ifnull(d.subqty,0) * ifnull(a.local_price,0)) subtotal_amount  "
    + " from   purchase_order a LEFT OUTER JOIN vg_common_code b ON (  a.order_status = b.code and type='ORDER_STATUS' and b.use_yn='Y')  "
    + "                                      LEFT OUTER JOIN ( select sum(c.total_qty) subqty ,c.order_no  from subpurchase_order_line c group by order_no ) d on ( a.order_no = d.order_no )  " 
    + " where  a.backorder_flag = 'N' " ;

 

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    sql += " and    a.order_no like '" + ag_po_no + "%' " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    a.style like '" + ag_style_no + "%' " ;
  }
} else {
  if (!ag_supplier.equals("")) {
      sql += " and    a.buyer = '" + ag_supplier + "' ";
    }

  sql += " and    a.created between str_to_date('" + ag_from_date + "', '%Y/%m/%d') and str_to_date('" + ag_to_date + "', '%Y/%m/%d') ";

  if (!ag_status.equals("")) {    
      sql += " and    a.order_status = '" + ag_status + "' ";
  } 

}

if ( ag_orderby.equals("1"))  {
   sql += " order by order_date ";
} 
else if ( ag_orderby.equals("2"))  {
   sql += " order by buyer  ";
}
else if ( ag_orderby.equals("3"))  {
   sql += " order by order_no ";
}
else if ( ag_orderby.equals("4"))  {
   sql += " order by delivery_date ";
}
else if ( ag_orderby.equals("5"))  {
   sql += " order by created ";
}
//out.println(sql);

// query for buyer list
sql2 = " select id, name from login_01t  where user_type = 'B' order by name ";
// ORDER STATUS
String sql3 = " select code,code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y' order by sort_order ";
try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

  // supplier list
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);
  
  // order status
  iRet3 = dataProcess.RetrieveData(sql3, matrix3, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in admin_po_status : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
     conn.close();
  }
}

// print po list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no  = matrix.getRowData(i).getData(j++);
  String season   = matrix.getRowData(i).getData(j++);
  String order_date = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String subsupplier = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
  double total_qty = Double.parseDouble(matrix.getRowData(i).getData(j++));   
  String po_status_nm = matrix.getRowData(i).getData(j++);
  String sgr = matrix.getRowData(i).getData(j++);
  double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double total_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double local_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double sub_qty = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double subtotal_price = Double.parseDouble(matrix.getRowData(i).getData(j++)); 
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
        + " <td>" + sgr + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td>" + subsupplier + "</td>"
        + " <td>" + StringUtil.formatNumber(unit_price, MONEY_FORMAT)  + "</td>"
        + " <td>" + StringUtil.formatNumber(total_qty, QTY_FORMAT) + "</td>"
        + " <td>" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>"
        + " <td><font color=blue>" + StringUtil.formatNumber(local_price, MONEY_FORMAT)  + "</font></td>"
        + " <td><font color=blue>" + StringUtil.formatNumber(sub_qty, QTY_FORMAT) + "</font></td>"
        + " <td><font color=blue>" + StringUtil.formatNumber(subtotal_price, MONEY_FORMAT) + "</font></td>"       
        + " <td>" + order_date + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + po_status + "</td>"
        + " <td>" + po_status_nm + "</td>" 
         + " <td>" + created_date + "</td>"
        + " <td>" + imgUrl + "</td>"
        + "</tr>";
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
// order status list
String statusList = "<option value=''>All</option>";

for (int i = 0; i < iRet3; i++) {
  int j = 0;
  String code = matrix3.getRowData(i).getData(j++);
  String code_name = matrix3.getRowData(i).getData(j++);

  statusList += "<option value='"+ code + "'" 
                + (ag_status.equals(code) ? " selected" : "") + ">" 
                + code + "-" + code_name + "</option>";
}


      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnSubmit(frm)\n");
      out.write("{\n");
      out.write("  frm.ag_po_no.value = jf_AllTrim(frm.ag_po_no.value);\n");
      out.write("  frm.ag_style_no.value = jf_AllTrim(frm.ag_style_no.value);\n");
      out.write("  frm.action = \"./admin_suborder_list.jsp\"\n");
      out.write("  //frm.target = hidenFrame.name;\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnView(po_no_selected) {\n");
      out.write("  frmMain.po_no_selected.value = po_no_selected;\n");
      out.write("  frmMain.action = \"./admin_subpo_details.jsp\";\n");
      out.write("  frmMain.submit();\n");
      out.write("}\n");
      out.write("function fnExcel(frm) {\n");
      out.write("  if (confirm(\"Do you want to download these data as an excel file?\"))\n");
      out.write("  {\n");
      out.write("    frm.action=\"./subpo_list_excel.jsp\";\n");
      out.write("    //frm.target = hidenFrame.name;\n");
      out.write("    frm.submit();\n");
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
      out.write("  <td width=\"3%\"><img src=\"/img/image3.jpg\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Contractor Order Management</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("* To create or update Contractor Order, Select the PO from the list below first.\n");
      out.write("<TABLE WIDTH=99% border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM name='frmMain'  METHOD=POST>\n");
      out.write("<input type='hidden' name='po_no_selected'>\n");
      out.write("<TR>\n");
      out.write("  <TD width='10%' class='table_header_center'>Buyer</TD>\n");
      out.write("  <TD width='60%' class='table_bg_bright' colspan='3'>\n");
      out.write("    <SELECT NAME='ag_supplier'>\n");
      out.write("      ");
      out.print( supplierList );
      out.write("\n");
      out.write("    </SELECT>    \n");
      out.write("  </td>\n");
      out.write("  <TD width='30%' class='table_bg_bright_center' colspan='2'><INPUT TYPE=BUTTON VALUE=\"Search\" ONCLICK='fnSubmit(this.form)'></td>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <td width='10%' class='table_header_center'>PO Creation Date</td>\n");
      out.write("  <td width='30%' class='table_bg_bright'>\n");
      out.write("    <input type=\"text\" name=\"ag_from_date\" size=\"10\" value=\"");
      out.print( ag_from_date );
      out.write("\" >\n");
      out.write("    <img src=\"/img/calendar.gif\" style=\"cursor:hand\" align=\"absmiddle\" onclick=\"javascript:popFrame.fPopCalendar(this, document.frmMain.ag_from_date, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write("    ~\n");
      out.write("    <input type=\"text\" name=\"ag_to_date\" size=\"10\" value=\"");
      out.print( ag_to_date );
      out.write("\" >\n");
      out.write("    <img src=\"/img/calendar.gif\" style=\"cursor:hand\" align=\"absmiddle\" onclick=\"javascript:popFrame.fPopCalendar(this, document.frmMain.ag_to_date, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write("  </td>\n");
      out.write("  <TD width='10%'class='table_header_center'>PO Status</TD>\n");
      out.write("  <TD width='20%' class='table_bg_bright'>\n");
      out.write("    <SELECT NAME='ag_status'>\n");
      out.write("      ");
      out.print( statusList );
      out.write("\n");
      out.write("    </SELECT>\n");
      out.write("  </td>\n");
      out.write("  <TD width='10%'class='table_header_center'>Order by</TD>\n");
      out.write("  <TD width='20%' class='table_bg_bright'>\n");
      out.write("    <SELECT NAME='ag_orderby'>\n");
      out.write("    <OPTION value=\"1\" ");
 if(ag_orderby.equals("1")) out.print("SELECTED"); 
      out.write("> Order Date </OPTION>\n");
      out.write("    <OPTION value=\"2\" ");
 if(ag_orderby.equals("2")) out.print("SELECTED"); 
      out.write("> Buyer </OPTION>\n");
      out.write("    <OPTION value=\"3\" ");
 if(ag_orderby.equals("3")) out.print("SELECTED"); 
      out.write("> PO No. </OPTION>\n");
      out.write("    <OPTION value=\"4\" ");
 if(ag_orderby.equals("4")) out.print("SELECTED"); 
      out.write("> Delivery Date </OPTION>\n");
      out.write("    <OPTION value=\"5\" ");
 if(ag_orderby.equals("5")) out.print("SELECTED"); 
      out.write("> Created. Date </OPTION>\n");
      out.write("    </SELECT></TD>\n");
      out.write("</tr>\n");
      out.write("<TR>  \n");
      out.write("  <TD class='table_header_center'>PO#</TD>\n");
      out.write("  <TD class='table_bg_bright'><input type=text name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("' size='10' maxlength='6'></TD>\n");
      out.write("  <TD class='table_header_center'>Style#</TD>\n");
      out.write("  <TD class='table_bg_bright'><input type=text name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("' size='10' maxlength='6'></TD>\n");
      out.write("  <TD colspan=\"2\" class='table_bg_bright_center'><input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td>\n");
      out.write("</TR>\n");
      out.write("</FORM>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</td></tr></table>\n");
      out.write("\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>\n");
      out.write("<TABLE width='100%' border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_status' value='");
      out.print( ag_status );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\t\t\n");
      out.write("<TR class='table_header_center'>\n");
      out.write("  <TD>No</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("  <TD>SGR</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Season</TD>\n");
      out.write("  <TD>Manufacturer</TD>\n");
      out.write("  <TD>Unit Price</TD>\n");
      out.write("  <TD>PO Total Qty</TD>\n");
      out.write("  <TD>PO Total Price</TD>\n");
      out.write("  <TD>Local Price(RMB)</TD>\n");
      out.write("  <TD>Sub-Qty</TD>\n");
      out.write("  <TD>Sub-Total Price(RMB)</TD>\n");
      out.write("  <TD>Order Date</TD>\n");
      out.write("  <TD>Buyer</TD>\n");
      out.write("  <TD>Status Code</TD>\n");
      out.write("  <TD>Status</TD>\n");
      out.write("  <TD>Creation Date</TD>\n");
      out.write("  <TD>Image</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
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
