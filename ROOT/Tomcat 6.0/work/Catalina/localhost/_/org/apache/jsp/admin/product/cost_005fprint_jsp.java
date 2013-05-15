package org.apache.jsp.admin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import java.net.*;
import java.text.*;
import dbconn.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;

public final class cost_005fprint_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\r\n");

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

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String po_no = request.getParameter("po_no_selected");
String style_no = request.getParameter("style_selected");
String buyer_id = request.getParameter("buyer_selected");

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");


request.setCharacterEncoding("euc-kr"); 
String fromUrl = request.getParameter("fromUrl");
if (fromUrl == null) fromUrl = request.getHeader("Referer");
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
int iRet = 0;
int iRet2 = 0;
String strSep = "|!^";
String outS = "";
String outSub1="&nbsp;";
String outSub2="&nbsp;";
String outSub3="&nbsp;";
String outSub4="&nbsp;";
String outSub5="&nbsp;";
String outSub6="&nbsp;";
String update_flag="";

String sql = "";
String sql2 = "";
String today = DateUtil.getToday("yyyy/MM/dd");

String buyer_code="";
String supplier_code ="";
String subsupplier_code="";
String sgr_code ="";
String pgr_code ="";
String season_code ="";
String  pono         ="";
String  style          ="";
String  season         ="";
String  sgr            ="";
String  pgr            ="";
String  reorder_seq    ="";
String  sub_supplier   ="";
String  buyer          ="";
String  supplier       ="";
String  main_width     ="";
double main_qty       =0d;
double main_unit_price=0d;
double main_total    =0d;
String  main_text      ="";
double  color_qty     =0d;   
String  color_width    ="";
double color_unit_price=0d;   
double color_total   =0d;   
String  color_text     ="";
double  inner_qty      =0d;   
String  inner_width    ="";
double inner_unit_price=0d;   
String  inner_text     ="";
double inner_total  =0d;   
double make_price     =0d;   
String  make_text     ="";
String  sub1_width     ="";
double  sub1_qty       =0d;   
double  sub1_unit_price=0d;   
double  sub1_total   =0d;   
String  sub1_text      ="";
String  sub2_width     ="";
double sub2_qty       =0d;   
double sub2_unit_price=0d;   
double sub2_total    =0d;   
String  sub2_text      ="";
String  sub3_width     ="";
double sub3_qty       =0d;   
double sub3_unit_price=0d;   
double sub3_total    =0d;   
String  sub3_text      ="";
String  sub4_width     ="";
double  sub4_qty       =0d;   
double  sub4_unit_price=0d;   
double  sub4_total    =0d;   
String  sub4_text      ="";
String  sub5_width     ="";
double  sub5_qty      =0d;   
double  sub5_unit_price=0d;   
double  sub5_total    =0d;   
String  sub5_text      ="";

String  sub6_width     ="";
double  sub6_qty       =0d;   
double  sub6_unit_price=0d;   
double  sub6_total   =0d;   
String  sub6_text      ="";

String  sub7_width     ="";
double  sub7_qty      =0d;   
double  sub7_unit_price=0d;   
double  sub7_total    =0d;   
String  sub7_text      ="";

String  sub8_width     ="";
double sub8_qty       =0d;   
double sub8_unit_price=0d;   
double sub8_total    =0d;   
String  sub8_text      ="";

String  sub9_width     ="";
double  sub9_qty       =0d;   
double  sub9_unit_price=0d;   
double  sub9_total    =0d;   
String  sub9_text      ="";


double  cost_price    =0d;   
double rrp_price   =  0d;
double  profit        =0d;   
String  content        ="";
String  status         ="";
String  supname       ="";
double  unit_price = 0d;
double  total_price  =0d;   
String subcode1 ="";
String subcode2 ="";
String subcode3 ="";
String subcode4 ="";
String subcode5 ="";
String subcode6 ="";
String scode  = "";
String sname  = "";

Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  
  // get PO basic info
	sql = " select  a.reorder_seq,ifnull(a.vendor_price,0), ifnull(a.local_price,0), ifnull(a.total_qty,0) * ifnull(a.vendor_price,0) , b.name, "
	             + " a.supplier, a.buyer,a.subsupplier,a.sgr,a.pgr,a.season "
			      + " from   purchase_order a left outer join login_01t  b "
			      + "                              on (a.subsupplier = b.id and b.user_type = 'P' ) "
	             + " where a.order_no = '"+po_no+"' " 
	             + "       and a.style = '" + style_no +"' "
	             + "       and a.buyer = '" + buyer_id +"' ";
	//out.println(sql);
	//if (true) return;	            
	iRet = dataProcess.RetrieveData(sql, matrix, conn);	
	reorder_seq  = matrix.getRowData(0).getData(0);
	unit_price  = Double.parseDouble(matrix.getRowData(0).getData(1));
	rrp_price  = Double.parseDouble(matrix.getRowData(0).getData(2));
//	total_price  = Double.parseDouble(matrix.getRowData(0).getData(3));
	supname  = matrix.getRowData(0).getData(4);  
    supplier_code  = matrix.getRowData(0).getData(5);  	 
    buyer_code  = matrix.getRowData(0).getData(6);  
    subsupplier_code  = matrix.getRowData(0).getData(7);  
    sgr_code  = matrix.getRowData(0).getData(8);  
    pgr_code  = matrix.getRowData(0).getData(9);  
    season_code  = matrix.getRowData(0).getData(10);  
    
  
 // Select cost master  
  sql =  "  Select ORDER_NO     ,  "
			+"  STYLE           ,  "
			+"  SEASON          ,  "
			+"  SGR             ,  "
			+"  PGR             ,  "
			+"  SUB_SUPPLIER    ,  "
			+"  BUYER           ,  "
			+"  SUPPLIER        ,  "
			+"  MAIN_WIDTH      ,  "
			+"  MAIN_QTY        ,  "
			+"  MAIN_UNIT_PRICE ,  "
			+"  MAIN_total     ,  "
			+"  MAIN_TEXT       ,  "
			+"  COLOR_QTY       ,  "
			+"  COLOR_WIDTH     ,  "
			+"  COLOR_UNIT_PRICE,  "
			+"  COLOR_TOTAL    ,  "
			+"  COLOR_TEXT      ,  "
			+"  INNER_QTY       ,  "
			+"  INNER_WIDTH     ,  "
			+"  INNER_UNIT_PRICE,  "
			+"  INNER_TEXT      ,  "
			+"  INNER_TOTAL    ,  "
			+"  MAKE_PRICE      ,  "
		  +"  MAKE_TEXT      ,  "
			+"  SUB1_WIDTH      ,  "
			+"  SUB1_QTY        ,  "
			+"  SUB1_UNIT_PRICE ,  "
			+"  SUB1_TOTAL     ,  "
			+"  SUB1_TEXT       ,  "
			+"  SUB2_WIDTH      ,  "
			+"  SUB2_QTY        ,  "
			+"  SUB2_UNIT_PRICE ,  "
			+"  SUB2_TOTAL     ,  "
			+"  SUB2_TEXT       ,  "
			+"  SUB3_WIDTH      ,  "
			+"  SUB3_QTY        ,  "
			+"  SUB3_UNIT_PRICE ,  "
			+"  SUB3_TOTAL     ,  "
			+"  SUB3_TEXT       ,  "
			+"  SUB4_WIDTH      ,  "
			+"  SUB4_QTY        ,  "
			+"  SUB4_UNIT_PRICE ,  "
			+"  SUB4_TOTAL     ,  "
			+"  SUB4_TEXT       ,  "
			+"  SUB5_WIDTH      ,  "
			+"  SUB5_QTY        ,  "
			+"  SUB5_UNIT_PRICE ,  "
			+"  SUB5_TOTAL     ,  "
			+"  SUB5_TEXT       ,  "
			+"  SUB6_WIDTH      ,  "
			+"  SUB6_QTY        ,  "
			+"  SUB6_UNIT_PRICE ,  "
			+"  SUB6_TOTAL     ,  "
			+"  SUB6_TEXT       ,  "
			+"  SUB7_WIDTH      ,  "
			+"  SUB7_QTY        ,  "
			+"  SUB7_UNIT_PRICE ,  "
			+"  SUB7_TOTAL     ,  "
			+"  SUB7_TEXT       ,  "
			+"  SUB8_WIDTH      ,  "
			+"  SUB8_QTY        ,  "
			+"  SUB8_UNIT_PRICE ,  "
			+"  SUB8_TOTAL     ,  "
			+"  SUB8_TEXT       ,  "
			+"  SUB9_WIDTH      ,  "
			+"  SUB9_QTY        ,  "
			+"  SUB9_UNIT_PRICE ,  "
			+"  SUB9_TOTAL     ,  "
			+"  SUB9_TEXT       ,  "																
			+"  COST_PRICE      ,  "
			+"  RRP_PRICE       ,  "
			+"  PROFIT          ,  "
			+"  CONTENT         ,  "
			+"  STATUS          ,  "
			+"  SUB1_CODE    ,  "
			+"  SUB2_CODE    ,  "
			+"  SUB3_CODE    ,  "	
			+"  SUB4_CODE    ,  "
			+"  SUB5_CODE    ,  "
			+"  SUB6_CODE    ,  "
			+"  USERID            "
	       + " from cost_01t "
	       + " where order_no = '"+po_no+"' " 
	       + "       and style = '" + style_no +"' "
	       	+ "       and buyer = '" + buyer_id +"' ";
  // out.println(sql);	      
  iRet = dataProcess.RetrieveData(sql, matrix, conn);	  
  if ( iRet > 0 ) { 
      update_flag ="UPDATE";   
	  for (int i = 0; i < iRet; i++) {
		    int j = 0;
		     pono          =matrix.getRowData(i).getData(j++);
		     style          =matrix.getRowData(i).getData(j++);
			 season         =matrix.getRowData(i).getData(j++);
			 sgr            =matrix.getRowData(i).getData(j++);
			 pgr            =matrix.getRowData(i).getData(j++);
			 sub_supplier   =matrix.getRowData(i).getData(j++);
			 buyer          =matrix.getRowData(i).getData(j++);
			 supplier       =matrix.getRowData(i).getData(j++);
			 main_width     =matrix.getRowData(i).getData(j++);
			 main_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 main_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 main_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 main_text      =matrix.getRowData(i).getData(j++);
			 color_qty      =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 color_width    =matrix.getRowData(i).getData(j++);
			 color_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 color_total   =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 color_text     =matrix.getRowData(i).getData(j++);
			 inner_qty      =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 inner_width    =matrix.getRowData(i).getData(j++);
			 inner_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 inner_text     =matrix.getRowData(i).getData(j++);
			 inner_total   =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 make_price     =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 make_text     =matrix.getRowData(i).getData(j++);
			 sub1_width     =matrix.getRowData(i).getData(j++);
			 sub1_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub1_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub1_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub1_text      =matrix.getRowData(i).getData(j++);
			 sub2_width     =matrix.getRowData(i).getData(j++);
			 sub2_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub2_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub2_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub2_text      =matrix.getRowData(i).getData(j++);
			 sub3_width     =matrix.getRowData(i).getData(j++);
			 sub3_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub3_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub3_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub3_text      =matrix.getRowData(i).getData(j++);
			 sub4_width     =matrix.getRowData(i).getData(j++);
			 sub4_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub4_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub4_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub4_text      =matrix.getRowData(i).getData(j++);
			 sub5_width     =matrix.getRowData(i).getData(j++);
			 sub5_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub5_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub5_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub5_text      =matrix.getRowData(i).getData(j++);
			 sub6_width     =matrix.getRowData(i).getData(j++);
			 sub6_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub6_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub6_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub6_text      =matrix.getRowData(i).getData(j++);			 
			 sub7_width     =matrix.getRowData(i).getData(j++);
			 sub7_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub7_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub7_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub7_text      =matrix.getRowData(i).getData(j++);			 
			 sub8_width     =matrix.getRowData(i).getData(j++);
			 sub8_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub8_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub8_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub8_text      =matrix.getRowData(i).getData(j++);			 
			 sub9_width     =matrix.getRowData(i).getData(j++);
			 sub9_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub9_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub9_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub9_text      =matrix.getRowData(i).getData(j++);			 
			 cost_price     =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 total_price      =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 profit         =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 content        =matrix.getRowData(i).getData(j++);
			 status         =matrix.getRowData(i).getData(j++);
			 subcode1 	 =matrix.getRowData(i).getData(j++);
			 subcode2 	 =matrix.getRowData(i).getData(j++);		
			 subcode3 	 =matrix.getRowData(i).getData(j++);		
			 subcode4 	 =matrix.getRowData(i).getData(j++);		
			 subcode5 	 =matrix.getRowData(i).getData(j++);		
			 subcode6 	 =matrix.getRowData(i).getData(j++);		
  } 

	File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
		imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='208' height='302'>";
	}
  } else {
  	  update_flag ="INSERT";   
      outS = " <font color=red size=2> * There is no information of registered production cost. Please register it first.*</font>";
  }
  
         // get SUB code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SUB_MAT' "
      + " order by sort_order asc";
  iRet2 = dataProcess.RetrieveData(sql, matrix2, conn);  
  for (int i = 0; i < iRet2; i++) {
     scode  = matrix2.getRowData(i).getData(0);
     sname  = matrix2.getRowData(i).getData(1); 
     if ( subcode1.equals(scode) ) {
        outSub1  =  sname;  
     }           
   }
   
   
   for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);        
      if ( subcode2.equals(scode) ) {
       outSub2  =  sname; 
      }
  } 
  
 
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);      
      if ( subcode3.equals(scode) ) {
         outSub3  =  sname; 
      }
     
   } 
   
  
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);   
      if ( subcode4.equals(scode) ) {
          outSub4  =  sname;  
     }
     
   } 
   
   
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);    
      if ( subcode5.equals(scode) ) {
        outSub4  =  sname;  
      }
    
   } 
     
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);
       
      if ( subcode6.equals(scode) ) {
        outSub6  =  sname;  
      }       
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
      out.write("<title> </title>\r\n");
      out.write("<link href='style_print.css' rel='stylesheet' type='text/css'>\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/validate2.js\"></script>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\r\n");
      out.write("function fnBack(frm) {\r\n");
      out.write("  frm.action = \"");
      out.print( fromUrl );
      out.write("\";\r\n");
      out.write("  frm.target = this.name;\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' onload='window.print();'>\r\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='10' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width='650' border='0' cellspacing='0' cellpadding='0'>\r\n");
      out.write("<tr><td>\r\n");
      out.write("<table width='100%' border='1' cellspacing='1' cellpadding='2' align='center' bordercolor='black' >\r\n");
      out.write("<form name=\"form1\" method=\"post\">\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=update_flag VALUE='");
      out.print( update_flag );
      out.write("' >\r\n");
      out.write("\t<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\r\n");
      out.write("\t<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\r\n");
      out.write("\t<input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\r\n");
      out.write("\t<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\r\n");
      out.write("\t<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\r\n");
      out.write("\t<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\r\n");
      out.write("\t<input type='hidden' name='fromUrl' value='");
      out.print( fromUrl );
      out.write("'>\r\n");
      out.write("\t<input type='hidden' name='po_no_selected' value='");
      out.print( po_no );
      out.write("' >\r\n");
      out.write("    <input type='hidden' name='style_selected' value='");
      out.print( style_no );
      out.write("' >\r\n");
      out.write("    <input type='hidden' name='buyer_selected' value='");
      out.print( buyer_id );
      out.write("' >\r\n");
      out.write("    <input type='hidden' name='supplier_code' value='");
      out.print( supplier_code );
      out.write("' >\r\n");
      out.write("    <input type='hidden' name='buyer_code' value='");
      out.print( buyer_code );
      out.write("' >\r\n");
      out.write("    <input type='hidden' name='subsupplier_code' value='");
      out.print( subsupplier_code );
      out.write("' >\r\n");
      out.write("    <input type='hidden' name='sgr_code' value='");
      out.print( sgr_code );
      out.write("' >\r\n");
      out.write("    <input type='hidden' name='pgr_code' value='");
      out.print( pgr_code );
      out.write("' >\r\n");
      out.write("    <input type='hidden' name='season_code' value='");
      out.print( season_code );
      out.write("' >\r\n");
      out.write("    \r\n");
      out.write("   <tr >\r\n");
      out.write("\t   <td    align=center colspan='2' ><img src='/img/sebin_mid.jpg' ></td>\r\n");
      out.write("\t   <td  align=center colspan='5'><font size=4 ><b> Producttion Cost Detail </b></font> </td>\r\n");
      out.write("\t   <td    align=right  >Date: ");
      out.print( today );
      out.write(" </td>\r\n");
      out.write("   </tr>\t\t\t\r\n");
      out.write("  <tr class='table_header'>\r\n");
      out.write("    <td width=\"12%\"    height=\"41\"><font face=\"Arial\">Style.No<br>Style No.</font></td>\r\n");
      out.write("    <td width=\"14%\"     height=\"41\">");
      out.print( sgr_code );
      out.print( style_no );
      out.write(" </td>\r\n");
      out.write("     <td width=\"54%\"    height=\"41\" colspan=\"5\"><font face=\"Arial\"> Manufacturer</font></td>\r\n");
      out.write("    <td width=\"15%\"    height=\"41\" rowspan=\"2\"> SEBIN <font face=\"Arial\"></font></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_header'>\r\n");
      out.write("    <td width=\"12%\"    height=\"45\"><font face=\"Arial\"> Manufacturer</font></td>\r\n");
      out.write("    <td width=\"14%\"    height=\"45\">");
      out.print( supname );
      out.write("</td>\r\n");
      out.write("    <td width=\"14%\"    height=\"45\" ><font face=\"Arial\"> Description</font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"45\"><font face=\"Arial\"> Width</font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"45\"><font face=\"Arial\"> Length(m)</font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"45\"><font face=\"Arial\"> Unit Price (Won)</font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"45\"><font face=\"Arial\"> Total (Won)</font></td>   \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"12%\"    ><font face=\"Arial\"> Re-Order SEQ </font></td>\r\n");
      out.write("    <td width=\"14%\"    >&nbsp;");
      out.print( reorder_seq );
      out.write(" </td>\r\n");
      out.write("    <td width=\"14%\"    >&nbsp;<font face=\"Arial\"> Main Fabric </font></td>\r\n");
      out.write("    <td width=\"10%\"    >&nbsp;");
      out.print( main_width );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    >&nbsp;");
      out.print(main_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    >&nbsp;");
      out.print(StringUtil.formatNumber(main_unit_price, MONEY_FORMAT));
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    >&nbsp;");
      out.print( StringUtil.formatNumber(main_total, MONEY_FORMAT) );
      out.write(" </td>\r\n");
      out.write("    <td width=\"15%\"    >&nbsp;");
      out.print( main_text );
      out.write(" </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"26%\"    height=\"225\" rowspan=\"18\" colspan=\"2\"> ");
      out.print( imgUrl );
      out.write("  </td>\r\n");
      out.write("    <td width=\"14%\"    height=\"16\" ><font face=\"Arial\"> Colored Fabric </font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"16\">&nbsp;");
      out.print( color_width );
      out.write("</td>                                                                                                                                                              \r\n");
      out.write("    <td width=\"10%\"    height=\"16\">&nbsp;");
      out.print(color_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"16\">&nbsp;");
      out.print(StringUtil.formatNumber(color_unit_price, MONEY_FORMAT));
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"16\">&nbsp;");
      out.print( StringUtil.formatNumber(color_total, MONEY_FORMAT) );
      out.write("</td>                                                                                                                                                             \r\n");
      out.write("    <td width=\"15%\"    height=\"16\">&nbsp;");
      out.print( color_text );
      out.write(" </td>                                                                                                                                                              \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"16\" ><font face=\"Arial\">Inner Fabric </font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"16\">&nbsp;");
      out.print( inner_width );
      out.write("</td>                                                                                                                                                              \r\n");
      out.write("    <td width=\"10%\"    height=\"16\">&nbsp;");
      out.print(inner_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"16\">&nbsp;");
      out.print(StringUtil.formatNumber(inner_unit_price, MONEY_FORMAT));
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"16\">&nbsp;");
      out.print( StringUtil.formatNumber(inner_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                             \r\n");
      out.write("    <td width=\"15%\"    height=\"16\">&nbsp;");
      out.print( inner_text );
      out.write(" </td>                                                                                                                                                              \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_header'>\r\n");
      out.write("    <td    height=\"16\" colspan=\"6\"><font face=\"Arial\">Sub-Material</font></td>\r\n");
      out.write("   </tr> \r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"16\" > &nbsp;");
      out.print( outSub1 );
      out.write(" </td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub1_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub1_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub1_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub1_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub1_text );
      out.write("  </td>                                                                                                                                                       \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"16\" >&nbsp; ");
      out.print( outSub2 );
      out.write(" </td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub2_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub2_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub2_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub2_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub2_text );
      out.write("  </td>                                                                                                                                                         \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"33\">&nbsp; ");
      out.print( outSub3 );
      out.write(" </td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub3_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub3_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub3_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub3_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub3_text );
      out.write("  </td>                                                                                                                                                         \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"38\" > &nbsp;");
      out.print( outSub4 );
      out.write(" </td>\r\n");
      out.write("     <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub4_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub4_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub4_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub4_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub4_text );
      out.write("  </td>                                                                                                                                                        \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"33\">&nbsp; ");
      out.print( outSub5 );
      out.write(" </td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub5_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub5_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub5_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub5_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub5_text );
      out.write("  </td>                                                                                                                                                         \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("  \t <td width=\"14%\"    height=\"33\">&nbsp; ");
      out.print( outSub6 );
      out.write(" </td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub6_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub6_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub6_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub6_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub6_text );
      out.write(" </td>                                                                                                                                                        \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_header'>\r\n");
      out.write("    <td width=\"14%\"    height=\"16\" colspan=\"6\"><font face=\"Arial\">Misc.</font></td>\r\n");
      out.write("   </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"2%\"    height=\"13\" ><font face=\"Arial\">Washing Cost</font></td>\r\n");
      out.write("        <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub7_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub7_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub7_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub7_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub7_text );
      out.write("  </td>                                                                                                                                                     \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"12%\"    height=\"16\" ><font face=\"Arial\">Dying Cost</font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub8_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub8_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub8_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub8_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub8_text );
      out.write("  </td>                                                                                                                                                          \r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"12%\"    height=\"33\" ><font face=\"Arial\">Wrapping Cost</font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( sub9_width );
      out.write("</td>                                                                                                                                                        \r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print(sub9_qty);
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub9_unit_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"10%\"    height=\"33\">&nbsp;");
      out.print( StringUtil.formatNumber(sub9_total, MONEY_FORMAT) );
      out.write(" </td>                                                                                                                                                       \r\n");
      out.write("    <td width=\"15%\"    height=\"33\">&nbsp;");
      out.print( sub9_text );
      out.write("  </td>                                                                                                                                                        \r\n");
      out.write("  </tr>  \r\n");
      out.write("  <tr class='table_header'>\r\n");
      out.write("    <td width=\"14%\"    height=\"16\" colspan=\"6\"><font face=\"Arial\">Processing Cost</font></td>\r\n");
      out.write("   </tr>\r\n");
      out.write("   <tr class='table_list_center'>\r\n");
      out.write("   \t<td width=\"14%\"    height=\"16\" ><font face=\"Arial\"> Processing Cost </font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"16\" colspan=\"4\" align=\"right\">&nbsp;");
      out.print( StringUtil.formatNumber(make_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"15%\"    height=\"16\">&nbsp;");
      out.print( make_text );
      out.write(" </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"16\" ><font face=\"Arial\">*Product Cost </font></td>\r\n");
      out.write("    <!--td width=\"10%\"    height=\"16\">");
      out.print( StringUtil.formatNumber(unit_price, MONEY_FORMAT) );
      out.write("</td-->\r\n");
      out.write("    <td width=\"10%\"    height=\"16\" colspan=\"4\" align=\"right\">&nbsp;");
      out.print( StringUtil.formatNumber(cost_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"15%\"    height=\"16\">&nbsp; </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"34\" ><font face=\"Arial\">*Profit </font></td>\r\n");
      out.write("    <td width=\"10%\"    height=\"34\" colspan=\"4\" align=\"right\">&nbsp;");
      out.print( StringUtil.formatNumber(profit, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"15%\"    height=\"34\">");
      out.print( content );
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class='table_list_center'>\r\n");
      out.write("    <td width=\"14%\"    height=\"27\" ><font face=\"Arial\">*Final Factory Price </font></td>\r\n");
      out.write("   <!--td width=\"10%\"    height=\"27\"> ");
      out.print( StringUtil.formatNumber(rrp_price, MONEY_FORMAT) );
      out.write("  </td-->\r\n");
      out.write("    <td width=\"10%\"    height=\"27\" colspan=\"4\" align=\"right\">&nbsp; ");
      out.print( StringUtil.formatNumber(total_price, MONEY_FORMAT) );
      out.write("</td>\r\n");
      out.write("    <td width=\"15%\"    height=\"27\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write(" </table>\r\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td align='center'>\r\n");
      out.write("    <input type='button' value='Back' onclick='fnBack(this.form);'>\r\n");
      out.write("  </td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");

out.println(CopyRightLogo());

      out.write("\r\n");
      out.write("</tr></td>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
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
