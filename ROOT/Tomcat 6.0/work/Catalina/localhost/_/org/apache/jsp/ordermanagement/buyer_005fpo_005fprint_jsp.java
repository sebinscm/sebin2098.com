package org.apache.jsp.ordermanagement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class buyer_005fpo_005fprint_jsp extends org.apache.jasper.runtime.HttpJspBase
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


private String toHtml(String source)
{
    String nl="\n";
    String br="<br>";

    for( int index=0; (index= source.indexOf(nl, index)) >=0 ; index += br.length() )
        source = source.substring(0, index) + br + source.substring( index + nl.length() );
    return source;

}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(4);
    _jspx_dependants.add("/login_check.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
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
      out.write('\n');
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
String po_no = request.getParameter("pono");

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");


request.setCharacterEncoding("euc-kr"); 

String fromUrl = request.getParameter("fromUrl");
if (fromUrl == null) fromUrl = request.getHeader("Referer");
String DATE_FORMAT = "yyyy/MM/dd HH:mm";
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String page_title = "";

String print_date = DateUtil.getFmtDateString(new java.util.Date(), DATE_FORMAT);
int iRet = 0;
int iRet2 = 0;
String strSep = "|!^";
String outS = "";

String sql = "";
String today = DateUtil.getToday("yyyy/MM/dd");

String buyer_addr1 = "";
String buyer_addr2 = "";
String buyer_fax = "";
String buyer_phone = "";

String supplier_addr1 = "";
String supplier_addr2 = "";
String supplier_fax = "";
String supplier_phone = "";
String bid ="";
String bname="";
String sid="";
String sname="";
String pgrcode="";
String pgrname="";
String sgrcode="";
String sgrname="";
String mcode="";
String mname="";
String curcode="";
String curname="";
String subid="";
String subname="";
String pono = "";
String style_no  = "";
String season   = "";
String sgr   = "";
String pgr   = "";
String fabric   = "";
String itemtext   = "";
String sup_style_no   = "";
String unitprice   = "";
String init_delivery_date   = "";
String trans_type   = "";
String order_status   = "";
String currency   = "";
String brand    = "";
String buyer = "";
String supplier = "";
String subsupplier   = "";
String delivery_date   = "";
String reorder_seq   = "";
String ship_type="";
String amend_date   = "";
String buyerconfirm_text ="";
String size_1    = "";
String size_2    = "";
String size_3    = "";
String size_4    = "";
String size_5    = "";
String size_6    = "";  
String comments = "";
String total_qty = "";
String order_date = "";
String ship_date = "";
int last_cnt=0;
// for po details
String[] col = new String[5];
String[] qty1 = new String[6];
String[] qty2 = new String[6];
String[] qty3 = new String[6];
String[] qty4 = new String[6];
String[] qty5 = new String[6];
String[] qty6 = new String[6];
String[]  siztotal_qty = new String[6];
// initialize array
for (int i = 0; i < col.length; i++) {
  col[i] = "";
}
for (int i = 0; i < qty1.length; i++) {
  qty1[i] = "";
}
for (int i = 0; i < qty2.length; i++) {
  qty2[i] = "";
}
for (int i = 0; i < qty3.length; i++) {
  qty3[i] = "";
}
for (int i = 0; i < qty4.length; i++) {
  qty4[i] = "";
}
for (int i = 0; i < qty5.length; i++) {
  qty5[i] = "";
}
for (int i = 0; i < qty6.length; i++) {
  qty6[i] = "";
}
for (int i = 0; i <  siztotal_qty.length; i++) {
   siztotal_qty[i] = "";
}
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
 // Select PO master  
  sql = "  Select ORDER_NO ,  STYLE , SEASON ,  SGR ,  PGR  , "
	      + "   FABRIC, ITEM_TEXT, SUP_STOCK_CODE, format(vendor_price,2) , date_format(INITIAL_DEL_DATE, '%Y/%m/%d'), "
	      + "   TRANS_TYPE , ORDER_STATUS ,CURRENCY_CODE, BRAND , "
	      + "   BUYER,SUPPLIER  , SUBSUPPLIER, date_format(DELIVERY_DATE, '%Y/%m/%d'), "
	      + "   SIZC_1,SIZC_2,SIZC_3,SIZC_4,SIZC_5,SIZC_6, "
	      + "   COMMENTS,TOTAL_QTY,date_format(ORDER_DATE, '%Y/%m/%d'),date_format(ARRIVAL_DATE, '%Y/%m/%d'),PO_TYPE,REORDER_SEQ, "
	      + "  date_format(AMEND_DATE,'%Y/%m/%d'),buyer_comments "
	      + " from purchase_order "
	      + " where order_no = '"+po_no+"' ";
//out.println(sql);	      
  iRet = dataProcess.RetrieveData(sql, matrix, conn);	  
  if ( iRet > 0 ) {    
	  for (int i = 0; i < iRet; i++) {
		  int j = 0;
		  pono = matrix.getRowData(i).getData(j++);
		  style_no  = matrix.getRowData(i).getData(j++);
		  season   = matrix.getRowData(i).getData(j++);
		  sgr   = matrix.getRowData(i).getData(j++);
		  pgr   = matrix.getRowData(i).getData(j++);
		  fabric   = matrix.getRowData(i).getData(j++);
		  itemtext   = matrix.getRowData(i).getData(j++); 
		  sup_style_no   = matrix.getRowData(i).getData(j++);
		  unitprice   = matrix.getRowData(i).getData(j++);
		  init_delivery_date   = matrix.getRowData(i).getData(j++);
		  trans_type   = matrix.getRowData(i).getData(j++);
		  order_status   = matrix.getRowData(i).getData(j++); 
		  currency   = matrix.getRowData(i).getData(j++); 
		  brand    = matrix.getRowData(i).getData(j++);
		  buyer = matrix.getRowData(i).getData(j++);
		  supplier = matrix.getRowData(i).getData(j++);
		  subsupplier   = matrix.getRowData(i).getData(j++);
		  delivery_date   = matrix.getRowData(i).getData(j++);
		  size_1    = matrix.getRowData(i).getData(j++);
		  size_2    = matrix.getRowData(i).getData(j++);
		  size_3    = matrix.getRowData(i).getData(j++);
		  size_4    = matrix.getRowData(i).getData(j++);
		  size_5    = matrix.getRowData(i).getData(j++);
		  size_6    = matrix.getRowData(i).getData(j++);		  
		  comments = matrix.getRowData(i).getData(j++);
		  comments = toHtml(comments);
		  total_qty = matrix.getRowData(i).getData(j++);	
		  order_date = matrix.getRowData(i).getData(j++);
		  ship_date = matrix.getRowData(i).getData(j++);
		  ship_type = matrix.getRowData(i).getData(j++);		
		  reorder_seq = matrix.getRowData(i).getData(j++);
		  amend_date = matrix.getRowData(i).getData(j++);				
		   buyerconfirm_text  = matrix.getRowData(i).getData(j++);
	 }	        
 }
   if ( Integer.parseInt(order_status) > 40 ) {
      page_title="PURCHASE ORDER";
   } else {
   	  page_title="<font color=blue>Pre-PURCHASE ORDER</font>";
   	}   
 // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='110' height='169'>";
	}
 // get buyer code
sql = "  select  a.id, a.name,a.phone1,a.fax, concat(a.addr1,' ',a.addr2) as addr , " +
          "  concat(a.surburb,' ',a.state,' ',b.code_name) as addr2   " +
          "  from    login_01t a LEFT OUTER JOIN vg_common_code b ON ( a.country = b.code and b.type='COUNTRY_CODE') " +
          " where   a.user_type = 'B'  and a.id='"+buyer+"' " ;

      

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    bid  = matrix.getRowData(i).getData(0);
    bname  = matrix.getRowData(i).getData(1);    
    buyer_phone = matrix.getRowData(i).getData(2);
    buyer_fax = matrix.getRowData(i).getData(3);
    buyer_addr1 = matrix.getRowData(i).getData(4);
    buyer_addr2 = matrix.getRowData(i).getData(5);
    
  }
  // get supplier code
sql = "  select  a.id, a.name,a.phone1,a.fax, concat(a.addr1,' ',a.addr2) as addr , " +
          "  concat(a.surburb,' ',a.state,' ',b.code_name) as addr2   " +
          "  from    login_01t a LEFT OUTER JOIN vg_common_code b ON ( a.country = b.code and b.type='COUNTRY_CODE') " +
          " where   a.user_type = 'S'  and a.id='"+supplier+"' ";
    
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    sid  = matrix.getRowData(i).getData(0);
    sname  = matrix.getRowData(i).getData(1);
    supplier_phone = matrix.getRowData(i).getData(2);
    supplier_fax = matrix.getRowData(i).getData(3);
    supplier_addr1 = matrix.getRowData(i).getData(4);
    supplier_addr2 = matrix.getRowData(i).getData(5);
   } 
     // get PGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'PGR' and code='"+pgr+"' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
     pgrcode  = matrix.getRowData(i).getData(0);
     pgrname  = matrix.getRowData(i).getData(1);
   }     
  // get SGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SGR'  and code='"+sgr+"' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
     sgrcode  = matrix.getRowData(i).getData(0);
     sgrname  = matrix.getRowData(i).getData(1);   
  }
  // get MATERIAL code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'MATERIAL' and code='"+fabric+"' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
     mcode  = matrix.getRowData(i).getData(0);
     mname  = matrix.getRowData(i).getData(1);
   }   
   // get Currency code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'CURRENCY' and code='"+currency+"' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    curcode  = matrix.getRowData(i).getData(0);
    curname  = matrix.getRowData(i).getData(1);    
  }
  // get SUBsupplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'P' and id='"+subsupplier+"' "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    subid  = matrix.getRowData(i).getData(0);
    subname  = matrix.getRowData(i).getData(1);    
  } 
 
 
 // Select PO details
  sql = " select  colour,total_qty,sqty_1,sqty_2,sqty_3,sqty_4,sqty_5,sqty_6 "
      + " from    purchase_order_line "
      + " where order_no = '"+po_no+"' ";

  iRet2 = dataProcess.RetrieveData(sql, matrix, conn);
  // set po lines 
  if ( iRet2 > 0 ) {   
	  for (int i = 0; i < iRet2; i++) {
	    int k = 0;
	    col[i] = matrix.getRowData(i).getData(k++);
	    siztotal_qty[i] = matrix.getRowData(i).getData(k++);
	    qty1[i] = matrix.getRowData(i).getData(k++);
	    qty2[i] = matrix.getRowData(i).getData(k++);
	    qty3[i] = matrix.getRowData(i).getData(k++);
	    qty4[i] = matrix.getRowData(i).getData(k++);
	    qty5[i] = matrix.getRowData(i).getData(k++);
	    qty6[i] = matrix.getRowData(i).getData(k++);    
	 
       if ( i == 0 ) {
        last_cnt = 1;   
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	    if ( i == 1 ) {
	     last_cnt = 2; 
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	    if ( i == 2 ) {
	     last_cnt = 3; 
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	    if ( i == 3 ) {
	      last_cnt = 4;  
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	    if ( i == 4 ) {
	      last_cnt = 5;   
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	          
	  } 
	  
	}
   
} catch (Exception e) {
  System.out.println("Exception /admin/account/supplier : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\t\n");
      out.write("<title>");
      out.print( page_title );
      out.write("</title>\n");
      out.write("<link href='style_print.css' rel='stylesheet' type='text/css'>\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("\n");
      out.write(" function fnBack(frm) {\n");
      out.write("  //frm.po_no_selected.value = jf_AllTrim(frm.po_no.value);\n");
      out.write("  frm.action = frm.fromUrl.value;\n");
      out.write("  //frm.target = this.name;\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write(" </SCRIPT> \t\n");
      out.write("</head>\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' onload='window.print();'>\n");
      out.write("<table width='650' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<FORM name='frmMain'  METHOD=POST>\n");
      out.write("<input type='hidden' name='po_no_selected' value='");
      out.print( po_no );
      out.write("' >\t\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("    <input type='hidden' name='ag_status' value='");
      out.print( ag_status );
      out.write("'>\n");
      out.write("   <input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("   <input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\n");
      out.write("   <input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\n");
      out.write("   <input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("   <input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\n");
      out.write("   <input type='hidden' name='fromUrl' value='");
      out.print( fromUrl );
      out.write("'>\t\n");
      out.write("<tr><td>\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' align='right'><img src='/img/sebin_mid.jpg'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0'>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' height='10'><hr width='100%' size='1' noshade></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");

 if ( Integer.parseInt(order_status) < 43 ) {

      out.write("\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n");
      out.write("<tr valign='top'>\n");
      out.write("  <td width='54%'><span class='font_title'>");
      out.print( page_title );
      out.write("</span>\n");
      out.write("    <br><span class='font_subtitle'><br>P.O. #[");
      out.print( po_no );
      out.write("]</span>\n");
      out.write("    <span class='font_small_1'><br>DATE: ");
      out.print( print_date );
      out.write("</span>\n");
      out.write("    <span class='font_small_1_bold'><br>VENDOR: ");
      out.print( sname );
      out.write("</span></td>\n");
      out.write("  <td width='46%'><span class='font_subtitle'>SEBIN ENTERPRISE CO,. LTD.</span>\n");
      out.write("    <span class='font_small_1'><br>Room#401 No.10 Building,#20-22,Chigang West Road Chigang West Road,HaiZhu District,Guangzhou CHINA\n");
      out.write("    <br>Phone +86.20.2837.6200 FAX +86.20.2837.6200\n");
      out.write("    <br>http://www.sebin2098.com</span></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width='100%' border='1' bordercolor='black' cellspacing='0' cellpadding='2'>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' class='font_small_2'>**\n");
      out.write("    <ul>\n");
      out.write("      <li>This is Pre-Purchase Order only, NOT OFFICIAL PO until it is confirmed.\n");
      out.write("      <li>This Pre-Purchase Order means, its status is Pro forma Purchase Order. \n");
      out.write("      <li>THE OFFICIAL PO IS ONLY AFTER CONFIRMED!!</li>\n");
      out.write("    </ul>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");

} else {

      out.write("\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n");
      out.write("<tr valign='top'>\n");
      out.write("  <td width='54%'><span class='font_title'>");
      out.print( page_title );
      out.write("</span>\n");
      out.write("    <br><span class='font_subtitle'><br>P.O. #[");
      out.print( po_no );
      out.write("]</span>\n");
      out.write("    <span class='font_small_1'><br>DATE: ");
      out.print( print_date );
      out.write("</span></td>\n");
      out.write("  <td width='46%'><span class='font_subtitle'>");
      out.print( bname );
      out.write("</span>\n");
      out.write("    <span class='font_small_1'><br>");
      out.print( buyer_addr1);
      out.write(',');
      out.print( buyer_addr2);
      out.write("\n");
      out.write("    <br>Phone: ");
      out.print(buyer_phone);
      out.write(" FAX: ");
      out.print(buyer_fax);
      out.write("\n");
      out.write("    <br>&nbsp;</span></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0'>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' height='16'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0'>\n");
      out.write("<tr>\n");
      out.write("  <td valign='top' width='54%'><table width='100%' border='0' cellspacing='0' cellpadding='2'>\n");
      out.write("    <tr>\n");
      out.write("      <td width='17%' valign='top' class='font_small_1_bold'>VENDOR</td>\n");
      out.write("      <td width='83%' valign='top' class='font_small_1'>");
      out.print( sname );
      out.write("\n");
      out.write("        <br>");
      out.print( supplier_addr1 );
      out.write(',');
      out.print( supplier_addr2 );
      out.write("\n");
      out.write("        <br>Phone ");
      out.print( supplier_phone );
      out.write(" Fax ");
      out.print( supplier_fax );
      out.write("\n");
      out.write("        <br>SUPPLIER ID: ");
      out.print( sid );
      out.write("\n");
      out.write("      </td>\n");
      out.write("    </tr>\n");
      out.write("  </table></td>\n");
      out.write("  <td valign='top' width='46%'><table width='100%' border='0' cellspacing='0' cellpadding='2'>\n");
      out.write("    <tr>\n");
      out.write("      <td width='14%' valign='top' class='font_small_1_bold'>SHIP<br>TO</td>\n");
      out.write("      <td width='86%' valign='top' class='font_small_1'>");
      out.print(bname);
      out.write("\n");
      out.write("        <br>");
      out.print( buyer_addr1);
      out.write(',');
      out.print( buyer_addr2);
      out.write("\n");
      out.write("        <br>Phone ");
      out.print(buyer_phone);
      out.write(" FAX ");
      out.print(buyer_fax);
      out.write("\n");
      out.write("      </td>\n");
      out.write("    </tr>\n");
      out.write("  </table></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");

}

      out.write("\n");
      out.write("\n");
      out.write("<table width='650' border='0' bordercolor='black' cellspacing='0' cellpadding='0'>\n");
      out.write("<tr><td>\n");
      out.write("<table width='100%' border='1' cellspacing='1' cellpadding='2' align='center' bordercolor='black' >\n");
      out.write("  <tr class='table_header'>\n");
      out.write("    <td width=\"21%\" height=\"16\" >*PO#</td>\n");
      out.write("    <td width=\"21%\" height=\"16\" >*Style#</td>\n");
      out.write("    <td width=\"23%\" height=\"16\" >*Buyer</td>\n");
      out.write("    <td width=\"35%\" colspan=\"2\" height=\"16\" >Supplier</td>\n");
      out.write("  </tr>\n");
      out.write("  <tr class='table_list_center'>\n");
      out.write("    <td width=\"21%\" height=\"23\" >");
      out.print(po_no);
      out.write("</td>\n");
      out.write("    <td width=\"21%\" height=\"23\" >");
      out.print(style_no);
      out.write("</td>\n");
      out.write("    <td width=\"23%\" height=\"23\" >");
      out.print(bname);
      out.write("</td>\n");
      out.write("    <td width=\"35%\" colspan=\"2\" height=\"23\" >");
      out.print(sname);
      out.write("</td>\n");
      out.write("  </tr>\n");
      out.write("  <tr class='table_header'>\n");
      out.write("    <td width=\"21%\" height=\"16\" >*Product Group</td>\n");
      out.write("    <td width=\"21%\" height=\"16\" >*Sub group</td>\n");
      out.write("    <td width=\"23%\" height=\"16\" >*Unit Price</td>\n");
      out.write("    <td width=\"19%\" height=\"16\" >Order date</td>\n");
      out.write("    <td width=\"16%\" height=\"16\" >Delivery date</td>\n");
      out.write("  </tr>\n");
      out.write("  <tr class='table_list_center'>\n");
      out.write("    <td width=\"21%\" height=\"23\" >");
      out.print(pgrname);
      out.write("</td>\n");
      out.write("    <td width=\"21%\" height=\"23\" >");
      out.print(sgrname);
      out.write("</td>\n");
      out.write("    <td width=\"23%\" height=\"23\" >");
      out.print(unitprice);
      out.write(" &nbsp;&nbsp;");
      out.print(curname);
      out.write("</td>\n");
      out.write("    <td width='19%' >");
      out.print( order_date );
      out.write("</td>\n");
      out.write("    <td width='16%' >");
      out.print( delivery_date );
      out.write("</td>\n");
      out.write("  </tr>\n");
      out.write("  <tr class='table_header'>\n");
      out.write("    <td width=\"21%\" height=\"22\" >Ship type</td>\n");
      out.write("    <td width=\"21%\" height=\"22\" >Ship date</td>\n");
      out.write("    <td width=\"23%\" height=\"22\" >*Season</td>\n");
      out.write("    <td width=\"19%\" height=\"22\" >SubID</td>\n");
      out.write("    <td width=\"16%\" height=\"22\" >Work Sheet#</td>\n");
      out.write("  </tr>\n");
      out.write("  <tr class='table_list_center'>\n");
      out.write("    <td width=\"21%\" height=\"27\" >");
      out.print(trans_type);
      out.write("</td>\n");
      out.write("    <td width='21%' >");
      out.print( ship_date );
      out.write("</td>\n");
      out.write("    <td width=\"23%\" height=\"27\" >");
      out.print(season);
      out.write("</td>\n");
      out.write("    <td width=\"19%\" height=\"27\" >");
      out.print(subid);
      out.write("</td>\n");
      out.write("    <td width=\"16%\" height=\"27\" >");
      out.print( sup_style_no );
      out.write("</td>\n");
      out.write("  </tr>\n");
      out.write("  <tr class='table_header'>\n");
      out.write("    <td width=\"21%\" height=\"22\" >Material</td>\n");
      out.write("    <td width=\"21%\" height=\"22\" >BRAND</td>\n");
      out.write("    <td width=\"23%\" height=\"22\" >Shipping Type</td>\n");
      out.write("    <td width=\"19%\" height=\"22\" >Re-order SEQ</td>\n");
      out.write("    <td width=\"16%\" height=\"22\" >Amend Date</td>\n");
      out.write("  </tr>\n");
      out.write("  <tr class='table_list_center'>\n");
      out.write("    <td width=\"21%\" height=\"27\" >");
      out.print(mname);
      out.write("</td>\n");
      out.write("    <td width='21%' height=\"27\" >");
      out.print( brand );
      out.write("</td>\n");
      out.write("    <td width=\"23%\" height=\"27\" >");
      out.print(ship_type);
      out.write("</td>\n");
      out.write("    <td width=\"19%\" height=\"27\" >");
      out.print(reorder_seq);
      out.write("</td>\n");
      out.write("    <td width=\"16%\" height=\"27\" >");
      out.print( amend_date );
      out.write("</td>\n");
      out.write("  </tr>\n");
      out.write("  \n");
      out.write("  <tr class='table_header'>\n");
      out.write("    <td width=\"21%\" height=\"28\" >*Item text</td>\n");
      out.write("    <td width=\"79%\" colspan=\"4\" height=\"28\" >");
      out.print( itemtext );
      out.write("</td>\n");
      out.write("  </tr>  \n");
      out.write(" <tr class='table_header'>\n");
      out.write("    <td width=\"21%\" height=\"28\" >Buyer Confirmed text</td>\n");
      out.write("    <td width=\"79%\" colspan=\"4\" height=\"28\" >");
      out.print( buyerconfirm_text  );
      out.write("</td>\n");
      out.write("  </tr>    \n");
      out.write("  <tr class='table_list_center' >  \t \n");
      out.write("  \t<td  align='center'>");
      out.print( imgUrl );
      out.write("</td>    \n");
      out.write("    <td width=\"79%\" colspan=\"4\" height=\"202\" align='left' VALIGN=TOP>");
      out.print( comments );
      out.write("</td>\n");
      out.write("  </tr>  \n");
      out.write("</table>\n");
      out.write("<table width='650' border='1' cellspacing='1' cellpadding='2' align='center' bordercolor='black'>\n");
      out.write("  <tr class='table_header'>\n");
      out.write("    <td width=\"20%\" rowspan=\"2\" height=\"38\">*Color</td>\n");
      out.write("    <td width=\"67%\" colspan=\"6\" height=\"16\">*Size</td>\n");
      out.write("    <td width=\"13%\" rowspan=\"2\" height=\"38\">TOTAL</td>\n");
      out.write("  </tr>\n");
      out.write("  <tr class='table_header'>\n");
      out.write("    <td width=\"11%\" height=\"21\"><font size=\"2\">");
      out.print( size_1 );
      out.write("</font></td>\n");
      out.write("    <td width=\"11%\" height=\"21\"><font size=\"2\">");
      out.print( size_2 );
      out.write("</font></td>\n");
      out.write("    <td width=\"11%\"  height=\"21\"><font size=\"2\">");
      out.print( size_3 );
      out.write("</font></td>\n");
      out.write("    <td width=\"11%\" height=\"21\"><font size=\"2\">");
      out.print( size_4 );
      out.write("</font></td>\n");
      out.write("    <td width=\"11%\" height=\"21\"><font size=\"2\">");
      out.print( size_5 );
      out.write("</font></td>\n");
      out.write("    <td width=\"12%\" height=\"21\"><font size=\"2\">");
      out.print( size_6 );
      out.write("</font></td>\n");
      out.write("  </tr>\n");
      out.print(outS);
      out.write("                                               \n");
      out.write("</table>\n");
      out.write("</tr></td>\n");
      out.write("</table>\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align='center'>\n");
      out.write("    <input type='button' value='Back' onclick='fnBack(this.form);'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</FORM>\n");
      out.write("</table>\n");
      out.write("</body>\n");
      out.write("\n");
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
