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

public final class product_005fmanagement_jsp extends org.apache.jasper.runtime.HttpJspBase
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
          " where type='ORDER_STATUS' and use_yn='Y' and code >'30' order by sort_order ";          

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
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	
   // PO Status list
  
  for (int k = 0; k < iRet4; k++) {
	  int l = 0;
	  String code = matrix4.getRowData(k).getData(l++);
	  String code_name = matrix4.getRowData(k).getData(l++);
	  statusList  += "<option value=\"" + code + "\"";    
	    if ( po_status.equals(code) ) {
	       statusList  += " SELECTED ";  
	    }
	    statusList += ">" + code_name + "</option>";
	} 
  //if (po_status.compareTo("70") < 0) {
 //     if (cus_delivery_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_delivery_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   } else if (cus_arrival_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_arrival_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   } else if (cus_departure_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_departure_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   } else if (cus_cutoff_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_cutoff_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   } else if (cus_handover_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_handover_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   }
    
  //}

  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"
        + " <td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" 
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + "  <td><input type='hidden' name='po_no' value='" + po_no + "'>" + order_date + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + total_qty + "</td>"
        + " <td>" + imgUrl + "</td>"
        + " <td><select name=ag_po_status>" + statusList + "</select></td>" ;
    

    String   cus_order_date_input = "";
    String   cus_delivery_date_input = "";
    String   cus_arrival_date_input = "";
    String   cus_received_date_input = "";
    String   contract_date_input = "";               
    String   fit_confirm_date_input = "";            
    String   pp_confirm_date_input = "";              
    String   pp_requested_date_input = "";                
    String   mat_order_date_input = "";              
    String   mat_in_date_input = "";                  
    String   acc_order_date_input = "";               
    String   acc_in_date_input = "";                  
    String   cutting_date_input = "";                      
    String   running_date_input = "";                      
    String   top_sent_date_input = "";                    
    String   top_confirm_date_input = "";                 
    String   packing_date_input = "";   
    String   inhouse_date_input = "";  
    String   go_date_input = "";  
    String   col_date_input = "";  
    String   col_in_date_input = "";  
    String   pp_in_date_input = ""; 
    

    //cus_order_date_input = "<input type='text' name='order_date' size='10' value='" + order_date + "' style='cursor:hand' readonly"
    //                        + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'ORDER');\">X</a>";
    
    cus_delivery_date_input  = "<input type='text' name='delivery_date' size='10' value='" + delivery_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'DELIVERY');\">X</a>";
    

    cus_arrival_date_input = "<input type='text' name='arrival_date' size='10' value='" + arrival_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'ARRIVAL');\">X</a>";
    
    cus_received_date_input = "<input type='text' name='received_date' size='10' value='" + received_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'RECEIVED');\">X</a>";
    
    contract_date_input = "<input type='text' name='contract_date' size='10' value='" + contract_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'CONTACTED');\">X</a>";     
                            
    fit_confirm_date_input = "<input type='text' name='fit_confirm_date' size='10' value='" + fit_confirm_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'FITCONFIRM');\">X</a>";   
                            
    pp_confirm_date_input = "<input type='text' name='pp_confirm_date' size='10' value='" + pp_confirm_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PPCONFIRM');\">X</a>";    
                            
    pp_requested_date_input = "<input type='text' name='pp_requested' size='10' value='" + pp_requested + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PPREQUEST');\">X</a>";
                            
    mat_order_date_input = "<input type='text' name='mat_order_date' size='10' value='" + mat_order_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'MAT');\">X</a>";     
                            
    mat_in_date_input = "<input type='text' name='mat_in_date' size='10' value='" + mat_in_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'MATIN');\">X</a>";       
                            
    acc_order_date_input = "<input type='text' name='acc_order_date' size='10' value='" + acc_order_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'ACC');\">X</a>";    
    acc_in_date_input = "<input type='text' name='acc_in_date' size='10' value='" + acc_in_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'ACCIN');\">X</a>";        
    cutting_date_input = "<input type='text' name='cutting' size='10' value='" + cutting + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'CUTTING');\">X</a>";      
    running_date_input = "<input type='text' name='running' size='10' value='" + running + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'RUNNING');\">X</a>";      
    top_sent_date_input = "<input type='text' name='top_sent' size='10' value='" + top_sent + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'TOPSENT');\">X</a>";       
    top_confirm_date_input = "<input type='text' name='top_confirm' size='10' value='" + top_confirm + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'TOPCONFIRM');\">X</a>";    
    packing_date_input = "<input type='text' name='packing_date' size='10' value='" + packing_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PACKING');\">X</a>";    
    inhouse_date_input = "<input type='text' name='inhouse_date' size='10' value='" + inhouse_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'INHOUSE');\">X</a>"; 
    go_date_input = "<input type='text' name='go_date' size='10' value='" + go_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'GO');\">X</a>";                                                          
    col_date_input = "<input type='text' name='col_date' size='10' value='" + col_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'COL');\">X</a>";  
    col_in_date_input = "<input type='text' name='col_in_date' size='10' value='" + col_in_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'COLIN');\">X</a>"; 
    pp_in_date_input = "<input type='text' name='pp_in_date' size='10' value='" + pp_in_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PPIN');\">X</a>";                             
    
    outS += " <td nowrap>" + inhouse_date_input     + "</td>"
          + " <td nowrap>" + cus_delivery_date_input     + "</td>"
          + " <td nowrap>" + contract_date_input     + "</td>"
          + " <td nowrap>" + go_date_input     + "</td>"
          + " <td nowrap>" + subsupplier_name     + "</td>"
          + " <td nowrap>" + fit_confirm_date_input     + "</td>"
          + " <td nowrap>" + pp_in_date_input    + "</td>" 
          + " <td nowrap>" + pp_confirm_date_input     + "</td>"
          + " <td nowrap>" + pp_requested_date_input + "</td>"
          + " <td nowrap>" + mat_order_date_input   + "</td>"
          + " <td nowrap>" + mat_in_date_input   + "</td>"           
          + " <td nowrap>" + col_date_input    + "</td>" 
          + " <td nowrap>" + col_in_date_input    + "</td>" 
          + " <td nowrap>" + acc_order_date_input    + "</td>" 
          + " <td nowrap>" + acc_in_date_input    + "</td>" 
          + " <td nowrap>" + cutting_date_input    + "</td>" 
          + " <td nowrap>" + running_date_input    + "</td>" 
          + " <td nowrap>" + top_sent_date_input    + "</td>" 
          + " <td nowrap>" + top_confirm_date_input   + "</td>" 
          + " <td nowrap>" + packing_date_input   + "</td>" 
          + " <td nowrap>" + cus_arrival_date_input    + "</td>"
          + " <td nowrap>" + cus_received_date_input     + "</td>" ;

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

// print user brand options
//String brandList = "<option value=''>All</option>";

//for (int i = 0; i < matrix5.getRowCount(); i++) {
//  int j = 0;
//  String code = matrix5.getRowData(i).getData(j++);
//  String codeName = matrix5.getRowData(i).getData(j++);
//  brandList += "<option value='"+ code + "'" 
//             + (ag_brand.equals(code) ? " selected" : "") + ">" 
//             + codeName + "</option>";
// 
//}



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
      out.write("  // frm.target = hidenFrame.name;\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnExcel(frm) {\n");
      out.write("  if (confirm(\"Do you want to download these data as an excel file?\"))\n");
      out.write("  {\n");
      out.write("    frm.action=\"./product_list_excel.jsp\";\n");
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
      out.write("\n");
      out.write("function fnSave(frm) {\n");
      out.write("  \n");
      out.write("      if (confirm(\"Are you sure to save these data?\")) {\n");
      out.write("        frm.action = './product_update.jsp';\n");
      out.write("        frm.target = this.name;\n");
      out.write("        frm.submit();\n");
      out.write("      }\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnClearDate(idx, dateType) {\n");
      out.write("  with (document.form2) {\n");
      out.write("    if (po_no.length) {\n");
      out.write("\t      if (dateType == 'CONTACTED') {\n");
      out.write("\t        contract_date[idx].value = '';      \n");
      out.write("\t      } else if (dateType == 'DELIVERY') {\n");
      out.write("\t        delivery_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'FITCONFIRM') {\n");
      out.write("\t        fit_confirm_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'PPCONFIRM') {\n");
      out.write("\t        pp_confirm_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'PPREQUEST') {\n");
      out.write("\t        pp_requested[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'MAT') {\n");
      out.write("\t        mat_order_date[idx].value = ''; \n");
      out.write("\t      } else if (dateType == 'ARRIVAL') {\n");
      out.write("\t        arrival_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'MATIN') {\n");
      out.write("\t        mat_in_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'ACC') {\n");
      out.write("\t        acc_order_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'ACCIN') {\n");
      out.write("\t        acc_in_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'CUTTING') {\n");
      out.write("\t        cutting[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'RUNNING') {\n");
      out.write("\t        running[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'MAT') {\n");
      out.write("\t        mat_order_date[idx].value = ''; \n");
      out.write("\t      } else if (dateType == 'TOPSENT') {\t      \t\n");
      out.write("\t        top_sent[idx].value = '';  \n");
      out.write("\t      } else if (dateType == 'TOPCONFIRM') {\n");
      out.write("\t          top_confirm[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'PACKING') {\n");
      out.write("\t        packing_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'INHOUSE') {\n");
      out.write("\t        inhouse_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'GO') {\n");
      out.write("\t        go_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'COL') {\n");
      out.write("\t        col_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'COLIN') {\n");
      out.write("\t        col_in_date[idx].value = '';\n");
      out.write("\t      } else if (dateType == 'PPIN') {\n");
      out.write("\t        pp_in_date[idx].value = '';  \n");
      out.write("\t      } else if (dateType == 'RECEIVED') {\n");
      out.write("\t        received_date[idx].value = '';\n");
      out.write("\t      }\n");
      out.write("    } else {\n");
      out.write("\t      if (dateType == 'CONTACTED') {\n");
      out.write("\t        contract_date.value = '';      \n");
      out.write("\t      } else if (dateType == 'DELIVERY') {\n");
      out.write("\t        delivery_date.value = '';\n");
      out.write("\t      } else if (dateType == 'FITCONFIRM') {\n");
      out.write("\t        fit_confirm_date.value = '';\n");
      out.write("\t      } else if (dateType == 'PPCONFIRM') {\n");
      out.write("\t        pp_confirm_date.value = '';\n");
      out.write("\t      } else if (dateType == 'PPREQUEST') {\n");
      out.write("\t        pp_requested.value = '';\n");
      out.write("\t      } else if (dateType == 'MAT') {\n");
      out.write("\t        mat_order_date.value = ''; \n");
      out.write("\t      } else if (dateType == 'ARRIVAL') {\n");
      out.write("\t        arrival_date.value = '';\n");
      out.write("\t      } else if (dateType == 'MATIN') {\n");
      out.write("\t        mat_in_date.value = '';\n");
      out.write("\t      } else if (dateType == 'ACC') {\n");
      out.write("\t        acc_order_date.value = '';\n");
      out.write("\t      } else if (dateType == 'ACCIN') {\n");
      out.write("\t        acc_in_date.value = '';\n");
      out.write("\t      } else if (dateType == 'CUTTING') {\n");
      out.write("\t        cutting.value = '';\n");
      out.write("\t      } else if (dateType == 'RUNNING') {\n");
      out.write("\t        running.value = '';\n");
      out.write("\t      } else if (dateType == 'MAT') {\n");
      out.write("\t        mat_order_date.value = ''; \n");
      out.write("\t      } else if (dateType == 'TOPSENT') {\t      \t\n");
      out.write("\t        top_sent[idx].value = '';  \n");
      out.write("\t      } else if (dateType == 'TOPCONFIRM') {\n");
      out.write("\t          top_confirm.value = '';\n");
      out.write("\t      } else if (dateType == 'PACKING') {\n");
      out.write("\t        packing_date.value = '';\n");
      out.write("\t      } else if (dateType == 'INHOUSE') {\n");
      out.write("\t        inhouse_date.value = '';\n");
      out.write("\t      } else if (dateType == 'GO') {\n");
      out.write("\t        go_date.value = '';\n");
      out.write("\t      } else if (dateType == 'COL') {\n");
      out.write("\t        col_date.value = '';\n");
      out.write("\t      } else if (dateType == 'COLIN') {\n");
      out.write("\t        col_in_date.value = '';\n");
      out.write("\t      } else if (dateType == 'PPIN') {\n");
      out.write("\t        pp_in_date.value = '';  \n");
      out.write("\t      } else if (dateType == 'RECEIVED') {\n");
      out.write("\t        received_date.value = '';\n");
      out.write("\t      }\n");
      out.write("    }\n");
      out.write("  }\n");
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
      out.write("  <td width=\"*\" class=\"left_title\">Production Status</td>\n");
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
      out.write("<FORM name='frmMain' ACTION=\"product_management.jsp\" METHOD=POST>\n");
      out.write("\t<input type='hidden' name='po_no_selected'>\n");
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
      out.write("* Click 'X' to reset the date. After you input the data, Click 'Save' button to complete updating.\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\"><tr><td>\n");
      out.write("<TABLE border=0 width=99% CELLPADDING=0 CELLSPACING=1 class=\"table_bg\">\n");
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
      out.write("'>\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("  <td colspan='8'>PO Detail. </td>\n");
      out.write("  <td> Order Status</td>\n");
      out.write("  <td colspan='2'>DELIVERY</td>\n");
      out.write("  <td colspan='3'>CONTRACT</td>\n");
      out.write("  <td>FIT Sample</td>\n");
      out.write("  <td colspan='3'>PP Sample</td>\n");
      out.write("  <td colspan='2'>Primary Fabric</td>\n");
      out.write("  <td colspan='2'>Coloring</td>\n");
      out.write("  <td colspan='2'>Decoration</td>\n");
      out.write("  <td colspan='2'>Sewing</td>\n");
      out.write("  <td colspan='2'>TOP</td>\n");
      out.write("  <td colspan='4'>Complete/Shipping</td>\n");
      out.write("</tr>\n");
      out.write("<TR class=\"table_header_center\">\n");
      out.write("  <TD>No</TD>\n");
      out.write("  <TD>PO No.</TD>\n");
      out.write("  <TD>Style No.</TD>\n");
      out.write("  <TD>Season</TD>\n");
      out.write("  <TD>Order Date</TD>\n");
      out.write("  <TD>Buyer</TD>\n");
      out.write("  <TD>Total QTY</TD>\n");
      out.write("  <TD>Image</TD>\n");
      out.write("  <TD>PO Status</TD>\n");
      out.write("  <td>Inhouse </td>\n");
      out.write("  <td>Delivery</td>\n");
      out.write("  <td>Contract Date </td>\n");
      out.write("  <td>Release Date </td>\n");
      out.write("  <td>Contractor </td>\n");
      out.write("  <td>FIT Confirm</td>\n");
      out.write("  <td>PP Stocked</td>\n");
      out.write("  <td>PP Confirm</td>\n");
      out.write("  <td>PP  </td>\n");
      out.write("  <td>Order Fabric </td>\n");
      out.write("  <td>Stock Fabric </td>          \n");
      out.write("  <td>Order Coloring </td>\n");
      out.write("  <td>Stock Coloring </td>\n");
      out.write("  <td>Order Decoration </td>\n");
      out.write("  <td>Stock Decoration </td>\n");
      out.write("  <td>Cutting  </td>\n");
      out.write("  <td>Putting </td>\n");
      out.write("  <td>Dispatch TOP </td>\n");
      out.write("  <td>Confirm TOP </td>\n");
      out.write("  <td>Packing </td>\n");
      out.write("  <td>Shipping Date </td>\n");
      out.write("  <td>Arrival Date </td>\n");
      out.write("  </TR>\n");
      out.print( outS );
      out.write('\n');

if (_admingroup.equals("A")) {

      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td align='center' class='table_bg_bright' colspan='16'><input type='button' value='Save' onclick='fnSave(this.form);'>\n");
      out.write("    <input type='reset' value='Reset'>\n");
      out.write("    </td><td align='center' class='table_bg_bright' colspan='15'><input type='button' value='Save' onclick='fnSave(this.form);'>\n");
      out.write("    <input type='reset' value='Reset'></td>\n");
      out.write("</tr>\n");

}

      out.write("\n");
      out.write("</form>\n");
      out.write("</TABLE>\n");
      out.write("</td></tr></table>\n");
      out.write("\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>\n");

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
