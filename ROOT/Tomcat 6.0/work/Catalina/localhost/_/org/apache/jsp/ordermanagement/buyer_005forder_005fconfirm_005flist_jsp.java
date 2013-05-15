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

public final class buyer_005forder_005fconfirm_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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

String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String fromUrl="./buyer_order_confirm_list.jsp";

String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");

if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";


Connection conn = null;

MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
DataProcess dataProcess = null;
String sql = "";

int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
String outS = "";
String statusList="";

// query for po list
sql = " select  order_no, "
    + "             style, "
    + "             season, "
    + "          order_date, "
    + "          buyer_name, "
    + "         supplier_name, "
    + "         order_status, "
    + "         date_format(created, '%Y/%m/%d'),total_qty, "
    + "         date_format(initial_del_date,'%Y/%m/%d'),sgr,ifnull(buyer_comments,' ') "
    + " from   purchase_order "
    + " where   backorder_flag = 'N' and order_status='40' " ;    // PO-Confirm요청

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    String sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
    sql += " and    upper(order_no)  in upper(" + sql_po_no + ") " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    upper(style) like upper('" + ag_style_no + "%' )" ;
  }
  
} else {
   sql += " and    buyer = '" + scmid + "' ";
  
}

sql += " order by ";

if ( ag_orderby.equals("1"))  {
  sql += " order_no ";
}
else if ( ag_orderby.equals("2"))  {
  sql += " supplier, order_no ";
}
else if ( ag_orderby.equals("3"))  {
  sql += " buyer, order_no ";
}
else if ( ag_orderby.equals("4"))  {
  sql += " arrival_date, order_no " ;
}
else if ( ag_orderby.equals("5"))  {
  sql += " delivery_date, order_no " ;
}
else if ( ag_orderby.equals("6"))  {
  sql += " delivery_date,supplier, order_no " ;
}
//out.println(sql);
  

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
  String  buyer_comments = matrix.getRowData(i).getData(j++);
  String colour_code = "#FFFFF0";
  // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	  

  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
         + " <td><input type='checkbox' name='po_no' value='" + po_no + "'></td>"
        + " <td>" + (i+1) + "</td>"
        + " <td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" 
        + " <td>" + sgr + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td>" + imgUrl + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + supplier + "</td><input type='hidden' name='buyer' value='"+ supplier +"' >"        
        + " <td>" + total_qty + "</td>"
        + " <td>" +init_delivery_date+ "</td>"
//        + " <td><select name=ag_po_status>" + statusList + "</select></td>"
        + " <td><textarea  name='remarks' cols='50' rows='5' style='width:100%;' >"+buyer_comments+"</textarea></td>" ;
      editableCnt++;


  outS += "</tr>";
}



      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnSubmit(frm)\n");
      out.write("{\n");
      out.write("\t\n");
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
      out.write("\n");
      out.write("function fnView(po_no_selected) {\n");
      out.write("  frmMain.po_no_selected.value = po_no_selected;\n");
      out.write("  frmMain.action = \"./buyer_po_details.jsp\";\n");
      out.write("  frmMain.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnViewPop_up(po_no_selected) {\n");
      out.write("\tvar win = window.open('', \"winPrint\", \"toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900\");\n");
      out.write("    frmMain.po_no_selected.value = po_no_selected;\n");
      out.write("    if (win) {\n");
      out.write("\t    frmMain.action = \"./buyer_po_detail_popup.jsp\";\n");
      out.write("\t    frmMain.target = win.name;\n");
      out.write("\t    frmMain.submit();\n");
      out.write("   }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSave(frm) {\n");
      out.write("    // check date \n");
      out.write("     if (!jf_ChkRadioOrCheckBox(frm.po_no)) {\n");
      out.write("         alert('Select PO to be Confirmed!');\n");
      out.write("        return;\n");
      out.write("     }\n");
      out.write("      if (confirm(\"Do you confirm the PO?\")) {\n");
      out.write("        frm.action = './buyer_order_confirm_save.jsp';\n");
      out.write("        frm.target = this.name;\n");
      out.write("        frm.submit();\n");
      out.write("      }\n");
      out.write("\n");
      out.write("\n");
      out.write("}\n");
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
      out.write("  <td width=\"3%\"><img src=\"/img/icon_tasks.jpg\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">PO Confirmation </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("1) Search Query\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM name='frmMain' ACTION=\"buyer_order_confirm_list.jsp\" METHOD=POST>\n");
      out.write("\t<input type='hidden' name='po_no_selected'>\n");
      out.write("\t<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("    <input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\n");
      out.write("    <input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("    <input type='hidden' name='fromUrl' value='");
      out.print( fromUrl );
      out.write("'>\n");
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
      out.write("    <td width=\"28%\" class=\"table_bg_bright_center\" colspan='6'><INPUT TYPE='BUTTON' VALUE=\"Search\" ONCLICK='fnSubmit(this.form)'>\n");
      out.write("    \t<!--input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td-->\n");
      out.write("</tr>\n");
      out.write("</form>\n");
      out.write("</table>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</td></tr></table>\n");
      out.write("2) Search Result:<br>\n");
      out.write("1. Select PO to be confirmed.<br>\n");
      out.write("2. Click 'Confirm' Button. After PO is confirmed, the PO will be taken away from the search result list.<br>\n");
      out.write("3. The confirmed PO can be found by PO status on PO History menu.<br>\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\"><tr><td>\n");
      out.write("<TABLE border=0 width=99% CELLPADDING=0 CELLSPACING=1 class=\"table_bg\">\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("<input type='hidden' name='fromUrl' value='");
      out.print( fromUrl );
      out.write("'>\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("  <td colspan='10'>PO Details</td>\n");
      out.write("  <td colspan='2'>Order Confirm</td>\n");
      out.write("</tr>\n");
      out.write("<TR class=\"table_header_center\">\n");
      out.write("<TD>Select</TD>\n");
      out.write("  <TD>No</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("  <TD>SGR</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Season</TD>\n");
      out.write("  <TD>Image</TD>\n");
      out.write("  <TD>Buyer</TD>\n");
      out.write("  <TD>Supplier</TD>\n");
      out.write("  <TD>Total QTY</TD>\n");
      out.write("  <TD>Delivery Schedule</TD>\n");
      out.write("  <TD width='30%'>Comments</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td align='center' class='table_bg_bright' colspan='21'><input type='button' value='Confirm' onclick='fnSave(this.form);'>\n");
      out.write("    <input type='reset' value='Reset'></td>\n");
      out.write("</tr>\n");
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
