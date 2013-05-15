package org.apache.jsp.admin.product;

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

public final class product_005flist_005fexcel_jsp extends org.apache.jasper.runtime.HttpJspBase
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

response.setHeader("Content-Disposition", "attachment; filename=Product_Status.xls;");
response.setHeader("Content-Description", "JSP Generated Data");

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");
if (ag_supplier == null) ag_supplier = "";
if (ag_season == null) ag_season = "";
if (ag_date_type == null) ag_date_type = "CD";
if (ag_from_date == null || ag_to_date == null) {
  ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -6, "yyyy/MM/dd");
  ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";
if (ag_buyer == null) ag_buyer = "";

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql = "";
int iRet = 0;
String outS = "";

// query for po list
sql = " select  order_no, "
    + "             style, "
    + "             season, "
    + "          buyer_name, "
    + "         supplier_name, "
    + "         order_status, "
    + "         date_format(created, '%Y/%m/%d'),total_qty, "
    + "         date_format(order_date,'%Y/%m/%d'), "
    + "         date_format(delivery_date,'%Y/%m/%d'), "
    + "         date_format(arrival_date,'%Y/%m/%d'), "
    + "         date_format(received_date,'%Y/%m/%d'), "
    + "            date_format(CONTRACT_DATE,'%Y/%m/%d'), "  
		+ "		  date_format(FIT_CONFIRM_DATE,'%Y/%m/%d'), " 
		+ "		  date_format(PP_CONFIRM_DATE,'%Y/%m/%d'), " 
		+ "		  date_format(PP_REQUESTED,'%Y/%m/%d'), "     
		+ "		  date_format(MAT_ORDER_DATE,'%Y/%m/%d'), "  
		+ "		  date_format(MAT_IN_DATE,'%Y/%m/%d'), "     
		+ "		  date_format(ACC_ORDER_DATE,'%Y/%m/%d'), "   
		+ "		  date_format(ACC_IN_DATE,'%Y/%m/%d'), "     
		+ "		  date_format(CUTTING,'%Y/%m/%d'), "         
		+ "		  date_format(RUNNING,'%Y/%m/%d'), "          
		+ "		  date_format(TOP_SENT,'%Y/%m/%d'), "         
		+ "		  date_format(TOP_CONFIRM,'%Y/%m/%d'), "       
		+ "	     date_format(PACKING_DATE,'%Y/%m/%d'), " 
	    + "	     date_format(INHOUSE_DATE,'%Y/%m/%d'), " 
	    + "	     date_format(ex_factory_date,'%Y/%m/%d'), " 
	    + "	     date_format(col_order_date,'%Y/%m/%d'), " 
	    + "	     date_format(col_in_date,'%Y/%m/%d'), " 
	    + "	     date_format(pp_in_date,'%Y/%m/%d'), " 
	    + "        subsupplier_name "
    + " from   purchase_order "
    + " where   backorder_flag = 'N' " ;

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    String sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
    sql += " and    order_no in (" + sql_po_no + ") " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    style like '" + ag_style_no + "%' " ;
  }
  
} else {
  if (!ag_supplier.equals("")) {
    sql += " and    supplier = '" + ag_supplier + "' ";
  }

  if (!ag_season.equals("")) {
    sql += " and    season = '" + ag_season + "' ";
  }

  if (!ag_buyer.equals("")) {
    sql += " and    buyer = '" + ag_buyer + "' ";
  }
  
  String tmpDate = "";
  if (ag_date_type.equals("DD")) {
    tmpDate = "delivery_date";
  } else if (ag_date_type.equals("AD")) {
    tmpDate = "arrival_date";
  } else if (ag_date_type.equals("CD")) {
    tmpDate = "created";
  } else if (ag_date_type.equals("OD")) {
    tmpDate = "order_date";
  }

 sql += " and " + tmpDate + "  BETWEEN  str_to_date('" + ag_from_date + "', '%Y/%m/%d') "
       + " and  str_to_date('" + ag_to_date + "',  '%Y/%m/%d') ";
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
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in admin_delivery_status_excel : " + e.getMessage());
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
  String buyer = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
  String total_qty = matrix.getRowData(i).getData(j++); 
  String order_date = matrix.getRowData(i).getData(j++);
  String delivery_date = matrix.getRowData(i).getData(j++);
  String arrival_date = matrix.getRowData(i).getData(j++);
  String received_date = matrix.getRowData(i).getData(j++);
  String contract_date = matrix.getRowData(i).getData(j++);               
  String fit_confirm_date  = matrix.getRowData(i).getData(j++);           
  String pp_confirm_date  = matrix.getRowData(i).getData(j++);            
  String pp_requested = matrix.getRowData(i).getData(j++);                 
  String mat_order_date = matrix.getRowData(i).getData(j++);              
  String mat_in_date = matrix.getRowData(i).getData(j++);                 
  String acc_order_date = matrix.getRowData(i).getData(j++);              
  String acc_in_date = matrix.getRowData(i).getData(j++);                 
  String cutting = matrix.getRowData(i).getData(j++);                     
  String running = matrix.getRowData(i).getData(j++);                     
  String top_sent = matrix.getRowData(i).getData(j++);                     
  String top_confirm = matrix.getRowData(i).getData(j++);                  
  String packing_date = matrix.getRowData(i).getData(j++); 
  String inhouse_date = matrix.getRowData(i).getData(j++); 
  String go_date = matrix.getRowData(i).getData(j++); 
  String col_date = matrix.getRowData(i).getData(j++); 
  String col_in_date = matrix.getRowData(i).getData(j++);
  String pp_in_date = matrix.getRowData(i).getData(j++);  
  String subsupplier_name = matrix.getRowData(i).getData(j++);
  
  if ( order_date.equals("0000/00/00") )  order_date ="";
   if (delivery_date.equals("0000/00/00") ) delivery_date ="";
   if ( arrival_date.equals("0000/00/00") )  arrival_date ="";
   if (received_date.equals("0000/00/00") ) received_date ="";
   
    if ( contract_date.equals("0000/00/00") )  contract_date ="";
   if (fit_confirm_date.equals("0000/00/00") ) fit_confirm_date ="";
   if ( pp_confirm_date.equals("0000/00/00") ) pp_confirm_date ="";
   if (pp_requested.equals("0000/00/00") ) pp_requested ="";
   
   if (  mat_order_date.equals("0000/00/00") )  mat_order_date ="";
   if (mat_in_date.equals("0000/00/00") ) mat_in_date ="";
   if (  acc_order_date.equals("0000/00/00") )   acc_order_date ="";
   if (acc_in_date.equals("0000/00/00") ) acc_in_date ="";
   
   if ( cutting.equals("0000/00/00") )  cutting ="";
   if ( running.equals("0000/00/00") )  running ="";
   if ( top_sent.equals("0000/00/00") )  top_sent ="";
   if ( top_confirm.equals("0000/00/00") )  top_confirm ="";
   
   if ( packing_date.equals("0000/00/00") )  packing_date ="";
   if (inhouse_date.equals("0000/00/00") ) inhouse_date ="";
   if ( go_date.equals("0000/00/00") )  go_date ="";
   if (col_date.equals("0000/00/00") ) col_date ="";
   
   if (col_in_date.equals("0000/00/00") )  col_in_date ="";
   if ( pp_in_date.equals("0000/00/00") )  pp_in_date ="";
   
   String colour_code = "#FFFFF0";
  // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	

 outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"
        + " <td>" + po_no + "</td>" 
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + "  <td>" + order_date + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + total_qty + "</td>"
        + " <td>" + imgUrl + "</td>"
        + " <td>" + po_status  + "</td>"
        + " <td nowrap>" + inhouse_date     + "</td>"
         + " <td nowrap>" + delivery_date    + "</td>"
          + " <td nowrap>" + contract_date     + "</td>"
          + " <td nowrap>" + go_date    + "</td>"
          + " <td nowrap>" + subsupplier_name     + "</td>"
          + " <td nowrap>" + fit_confirm_date     + "</td>"
          + " <td nowrap>" + pp_in_date    + "</td>" 
          + " <td nowrap>" + pp_confirm_date     + "</td>"
          + " <td nowrap>" + pp_requested + "</td>"
          + " <td nowrap>" + mat_order_date   + "</td>"
          + " <td nowrap>" + mat_in_date   + "</td>"           
          + " <td nowrap>" + col_date    + "</td>" 
          + " <td nowrap>" + col_in_date   + "</td>" 
          + " <td nowrap>" + acc_order_date    + "</td>" 
          + " <td nowrap>" + acc_in_date    + "</td>" 
          + " <td nowrap>" + cutting    + "</td>" 
          + " <td nowrap>" + running    + "</td>" 
          + " <td nowrap>" + top_sent   + "</td>" 
          + " <td nowrap>" + top_confirm  + "</td>" 
          + " <td nowrap>" + packing_date   + "</td>" 
          + " <td nowrap>" + arrival_date   + "</td>"
          + " <td nowrap>" + received_date    + "</td>"
          +  "</tr>";
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<table width=\"1700\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("  <td colspan='7'>PO Details</td>\n");
      out.write("  <td colspan='5'>Order Status</td>\n");
      out.write("</tr>\n");
      out.write("<TR class=\"table_header_center\">\n");
      out.write("  <TD>No</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Season</TD>\n");
      out.write("  <TD>오더일자</TD>\n");
      out.write("  <TD>Buyer</TD>\n");
      out.write("  <TD>Total QTY</TD>\n");
      out.write("  <TD>Image</TD>\n");
      out.write("  <TD>PO Status</TD>\n");
      out.write("  <td>Inhouse </td>\n");
      out.write("  <td>Delivery</td>\n");
      out.write("  <td>계약일 </td>\n");
      out.write("  <td>출고일 </td>\n");
      out.write("  <td>하청업체 </td>\n");
      out.write("  <td>FIT 컨펌</td>\n");
      out.write("  <td>PP입고 </td>\n");
      out.write("  <td>PP 컨펌</td>\n");
      out.write("  <td>PP작업지시 </td>\n");
      out.write("  <td>원단발주 </td>\n");
      out.write("  <td>원단입고 </td>          \n");
      out.write("  <td>배색발주 </td>\n");
      out.write("  <td>배색입고 </td>\n");
      out.write("  <td>장식발주 </td>\n");
      out.write("  <td>장식입고 </td>\n");
      out.write("  <td>재단  </td>\n");
      out.write("  <td>투입 </td>\n");
      out.write("  <td>TOP발송 </td>\n");
      out.write("  <td>TOP 컨펌  </td>\n");
      out.write("  <td>패킹 </td>\n");
      out.write("  <td>배뜬는날자 </td>\n");
      out.write("  <td>미국입고 </td>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("</table>\n");
      out.write("</body>\n");
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
