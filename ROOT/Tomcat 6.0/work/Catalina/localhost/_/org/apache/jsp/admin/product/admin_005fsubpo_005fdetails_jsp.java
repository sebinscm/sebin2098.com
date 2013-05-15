package org.apache.jsp.admin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class admin_005fsubpo_005fdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/admin/login_check.jsp");
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
      out.write('\n');
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
String po_no = request.getParameter("po_no_selected");
request.setCharacterEncoding("euc-kr"); 

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String fromUrl = "admin_subpo_details.jsp";
//String fromUrl = request.getParameter("fromUrl");
//if (fromUrl == null) fromUrl = request.getHeader("Referer");
//out.println(fromUrl);
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String subdata = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
String strSep = "|!^";
String outS = "";
String outS3 = "";

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
String local_price="";
String init_delivery_date   = "";
String trans_type   = "";
String order_status   = "";
String currency   = "";
String brand    = "";
String buyer = "";
String supplier = "";
String subsupplier   = "";
String delivery_date   = "";
String ship_type="";
String reorder_seq="";
String size_1    = "";
String size_2    = "";
String size_3    = "";
String size_4    = "";
String size_5    = "";
String size_6    = "";  
String order_comments = "";
String total_qty = "";
String order_date = "";
String ship_date = "";
String amend_date   = "";
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

// for subpo details
String[] scol = new String[5];
String[] sqty1 = new String[6];
String[] sqty2 = new String[6];
String[] sqty3 = new String[6];
String[] sqty4 = new String[6];
String[] sqty5 = new String[6];
String[] sqty6 = new String[6];
String[]  ssiztotal_qty = new String[6];

// for subpo details default values
String[] ncol = new String[5];
String[] nqty1 = new String[6];
String[] nqty2 = new String[6];
String[] nqty3 = new String[6];
String[] nqty4 = new String[6];
String[] nqty5 = new String[6];
String[] nqty6 = new String[6];
String[] nsiztotal_qty = new String[6];

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

// initialize array
for (int i = 0; i < scol.length; i++) {
  scol[i] = "";
}
for (int i = 0; i < sqty1.length; i++) {
  sqty1[i] = "";
}
for (int i = 0; i < sqty2.length; i++) {
  sqty2[i] = "";
}
for (int i = 0; i < sqty3.length; i++) {
  sqty3[i] = "";
}
for (int i = 0; i < sqty4.length; i++) {
  sqty4[i] = "";
}
for (int i = 0; i < sqty5.length; i++) {
  sqty5[i] = "";
}
for (int i = 0; i < sqty6.length; i++) {
  sqty6[i] = "";
}
for (int i = 0; i <  ssiztotal_qty.length; i++) {
   ssiztotal_qty[i] = "";
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
	      + "  date_format(AMEND_DATE,'%Y/%m/%d'),format(LOCAL_PRICE,2) "
	      + " from purchase_order "
	      + " where order_no = '"+po_no+"' ";
  //out.println(sql);	      
  iRet = dataProcess.RetrieveData(sql, matrix, conn);	  
  //out.println(iRet);	
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
		  order_comments = matrix.getRowData(i).getData(j++);
		  order_comments = toHtml(order_comments);
		  total_qty = matrix.getRowData(i).getData(j++);	
		  order_date = matrix.getRowData(i).getData(j++);
		  ship_date = matrix.getRowData(i).getData(j++);
		  ship_type = matrix.getRowData(i).getData(j++);
		  reorder_seq = matrix.getRowData(i).getData(j++);	
		 amend_date = matrix.getRowData(i).getData(j++);	
		 local_price = matrix.getRowData(i).getData(j++); 				
	 }	        
 }
 if ( init_delivery_date.equals("0000/00/00") )  init_delivery_date ="";
 if (delivery_date.equals("0000/00/00") ) delivery_date ="";
 if (order_date.equals("0000/00/00") ) order_date ="";
 if (ship_date.equals("0000/00/00") ) ship_date ="";
  if (amend_date.equals("0000/00/00") ) amend_date ="";
 
 // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='110' height='169'>";
	}
	
// get buyer code
  sql = " select  id, name "
      + " from    login_01t  "
      + " where   user_type = 'B'  and id='"+buyer+"' "
      + " order by id asc";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    bid  = matrix.getRowData(i).getData(0);
    bname  = matrix.getRowData(i).getData(1);    
  }	
 // get supplier code
sql = "  select  a.id, a.name,a.phone1,a.fax, concat(a.addr1,' ',a.addr2) as addr , " +
          "  concat(a.surburb,' ',a.state,' ',b.code_name) as addr2   " +
          "  from    login_01t a LEFT OUTER JOIN vg_common_code b ON ( a.country = b.code and b.type='COUNTRY_CODE') " +
          " where   a.user_type = 'S'  and a.id='"+supplier+"' " ;
 
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
	    
	    ncol[i] = col[i];
	    nsiztotal_qty[i] = siztotal_qty[i];
	    nqty1[i] = qty1[i];
	    nqty2[i] = qty2[i];
	    nqty3[i] = qty3[i];
	    nqty4[i] = qty4[i];
	    nqty5[i] = qty5[i];
	    nqty6[i] = qty6[i];  
       if ( i == 0 ) {
        last_cnt = 1;   
	    outS += "<tr class='table_bg_bright'>"
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
	    outS += "<tr class='table_bg_bright'>"
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
	    outS += "<tr class='table_bg_bright'>"
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
	    outS += "<tr class='table_bg_bright'>"
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
	    outS += "<tr class='table_bg_bright'>"
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
  // set subpo lines 
  sql = " select  colour,total_qty,sqty_1,sqty_2,sqty_3,sqty_4,sqty_5,sqty_6 "
      + " from    subpurchase_order_line "
      + " where order_no = '"+po_no+"' ";
  last_cnt = 0;
  iRet3 = dataProcess.RetrieveData(sql, matrix, conn);
  if ( iRet3 > 0 ) {   
	  for (int i = 0; i < iRet2; i++) {
	    int k = 0;
	    scol[i] = matrix.getRowData(i).getData(k++);
	    ssiztotal_qty[i] = matrix.getRowData(i).getData(k++);
	    sqty1[i] = matrix.getRowData(i).getData(k++);
	    sqty2[i] = matrix.getRowData(i).getData(k++);
	    sqty3[i] = matrix.getRowData(i).getData(k++);
	    sqty4[i] = matrix.getRowData(i).getData(k++);
	    sqty5[i] = matrix.getRowData(i).getData(k++);
	    sqty6[i] = matrix.getRowData(i).getData(k++);    
	 
       if ( i == 0 ) {
        last_cnt = 1;   
	    outS3 += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name= 'col_1'    value='"+scol[i]+"'   			  size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_1'   value='"+sqty1[i]+"'   			  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change1()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_2'   value='"+sqty2[i]+"'  				  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change1()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_3'   value='"+sqty3[i]+"'   			 onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change1()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_4'   value='"+sqty4[i]+"'    			onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change1()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_5'   value='"+sqty5[i]+"'       		onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change1()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_6'    value='"+sqty6[i]+"'            onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change1()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='aqtytot'   value='"+ssiztotal_qty[i]+"'  size='5' maxlength='5' class='input_text_right' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 1 ) {
	     last_cnt = 2; 
	    outS3 += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_2'  value='"+scol[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_1' value='"+sqty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_2' value='"+sqty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_3' value='"+sqty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_4' value='"+sqty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_5' value='"+sqty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_6'  value='"+sqty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change2()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='bqtytot' value='"+ssiztotal_qty[i]+"' size='5' maxlength='5' class='input_text_right' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 2 ) {
	     last_cnt = 3; 
	    outS3 += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_3'  value='"+scol[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_1' value='"+sqty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_2' value='"+sqty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_3' value='"+sqty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_4' value='"+sqty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_5' value='"+sqty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_6'  value='"+sqty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change3()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='cqtytot' value='"+ssiztotal_qty[i]+"' size='5' maxlength='5' class='input_text_right' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 3 ) {
	      last_cnt = 4;  
	    outS3 += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_4'     value='"+scol[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_1' value='"+sqty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_2' value='"+sqty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_3' value='"+sqty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_4' value='"+sqty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_5' value='"+sqty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_6'  value='"+sqty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change4()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='dqtytot' value='"+ssiztotal_qty[i]+"' size='5' maxlength='5' class='input_text_right' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 4 ) {
	      last_cnt = 5;   
	    outS3 += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_5'     value='"+scol[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_1' value='"+sqty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_2' value='"+sqty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_3' value='"+sqty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_4' value='"+sqty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_5' value='"+sqty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_6'  value='"+sqty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text_right' onBlur='Change5()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='eqtytot' value='"+ssiztotal_qty[i]+"' size='5' maxlength='5' class='input_text_right' readonly ></td>"
	          + "</tr>";
	    }
	          
	  } 

	  // 
     } else {
  	  // suborder line color qty data가 없을때 PO의 Default로 setup 처리      
  	  subdata = "<font size=2 color=red > There is no input data on the Manufacturer Order! If there is no data, the PO qty will be default. Please input correct Qty by Color! </font> ";
	  String Nadd_col="";
	  String Nadd_qty1="";
	  String Nadd_qty2="";
	  String Nadd_qty3="";
	  String Nadd_qty4="";
	  String Nadd_qty5="";
	  String Nadd_qty6="";
	  String Nadd_tot="";	  	   	  	  
	  for ( int i = 0; i < iRet2 ; i++) {
	        if ( i == 0 ) {
	            Nadd_col="col_1";
				 Nadd_qty1="aqty_1";
				 Nadd_qty2="aqty_2";
				 Nadd_qty3="aqty_3";
				 Nadd_qty4="aqty_4";
				 Nadd_qty5="aqty_5";
				 Nadd_qty6="aqty_6";
				 Nadd_tot="aqtytot";
	        } 
	        if ( i == 1 ) {
	            Nadd_col="col_2";
				 Nadd_qty1="bqty_1";
				 Nadd_qty2="bqty_2";
				 Nadd_qty3="bqty_3";
				 Nadd_qty4="bqty_4";
				 Nadd_qty5="bqty_5";
				 Nadd_qty6="bqty_6";
				 Nadd_tot="bqtytot";
	        } 
	        if ( i == 2 ) {

	            Nadd_col="col_3";
				 Nadd_qty1="cqty_1";
				 Nadd_qty2="cqty_2";
				 Nadd_qty3="cqty_3";
				 Nadd_qty4="cqty_4";
				 Nadd_qty5="cqty_5";
				 Nadd_qty6="cqty_6";
				 Nadd_tot="cqtytot";
	        } 
	        if ( i == 3 ) {
	            Nadd_col="col_4";
				 Nadd_qty1="dqty_1";
				 Nadd_qty2="dqty_2";
				 Nadd_qty3="dqty_3";
				 Nadd_qty4="dqty_4";
				 Nadd_qty5="dqty_5";
				 Nadd_qty6="dqty_6";
				 Nadd_tot="dqtytot";
	        } 
	        if ( i == 4 ) {
	            Nadd_col="col_5";
				 Nadd_qty1="eqty_1";
				 Nadd_qty2="eqty_2";
				 Nadd_qty3="eqty_3";
				 Nadd_qty4="eqty_4";
				 Nadd_qty5="eqty_5";
				 Nadd_qty6="eqty_6";
				 Nadd_tot="eqtytot";
	        } 
	  
	        outS3 += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_col+"'     value='"+ncol[i]+"'   			  	 size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty1+"'   value='"+nqty1[i]+"'   	onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+(i+1)+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty2+"'   value='"+nqty2[i]+"'  		onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+(i+1)+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty3+"'   value='"+nqty3[i]+"'   	onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+(i+1)+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty4+"'   value='"+nqty4[i]+"'    	onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+(i+1)+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty5+"'   value='"+nqty5[i]+"'      onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+(i+1)+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty6+"'   value='"+nqty6[i]+"'       onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+(i+1)+"()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_tot+"'  	  value='"+nsiztotal_qty[i]+"' 	size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
         }	
     }    
} catch (Exception e) {
  System.out.println("Exception /admin/account/supplier : " + e.getMessage());
  throw e;
} finally {
 if (conn != null) {
    try { conn.close(); } catch (SQLException e) { ; }
    conn = null;
    }
}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Purchase Order Detail</title>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/validate2.js\"></script>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\r\n");
      out.write("function fnSave(frm) { \r\n");
      out.write("  if (!frm.col_1.value) {\r\n");
      out.write("    alert('Input at least one or more Color and Qty!');\r\n");
      out.write("    frm.col_1.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (confirm('Do you really want to save these data?')) {   \t\r\n");
      out.write("    frm.action = './admin_suborder_input.jsp';\r\n");
      out.write("    frm.submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function Change1() {\r\n");
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
      out.write("function fnBack(frm) {\r\n");
      out.write("  frm.action = \"");
      out.print( fromUrl );
      out.write("\";\r\n");
      out.write("  frm.target = this.name;\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("function fnList(frm)\r\n");
      out.write("{ \r\n");
      out.write("  frm.action = \"./admin_suborder_list.jsp\";  \r\n");
      out.write("  frm.submit(); \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnPrint(frm) {\r\n");
      out.write("  //var win = window.open('', \"winPrint\", \"toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900\");\r\n");
      out.write("\r\n");
      out.write("  //if (win) {\r\n");
      out.write("    frm.action = './admin_subpo_print.jsp';  \r\n");
      out.write("   // frm.target = win.name;\r\n");
      out.write("    frm.submit();\r\n");
      out.write("  //}\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\t\r\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='3%'><img src='/img/update.jpg'></td>\r\n");
      out.write("  <td width='*' class='left_title'>Contractor Order</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='10' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width='600' border='0' cellspacing='0' cellpadding='0'>\r\n");
      out.write("<tr><td>\r\n");
      out.write("Purchase Order History\t\r\n");
      out.write("<table width='100%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\r\n");
      out.write("<form name=\"form1\" method=\"post\">\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=fromUrl VALUE= '");
      out.print( fromUrl );
      out.write("' >\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=input_cnt VALUE='");
      out.print(iRet2);
      out.write("' >\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=pono VALUE='");
      out.print(po_no);
      out.write("' >\t\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=ag_orderby value='");
      out.print( ag_orderby );
      out.write("'>\r\n");
      out.write("    <INPUT TYPE=HIDDEN NAME=ag_status value='");
      out.print( ag_status );
      out.write("'>\r\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_po_no value='");
      out.print( ag_po_no );
      out.write("'>\r\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_style_no value='");
      out.print( ag_style_no );
      out.write("'>\r\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_supplier value='");
      out.print( ag_supplier );
      out.write("'>\r\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_from_date value='");
      out.print( ag_from_date );
      out.write("'>\r\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_to_date value='");
      out.print( ag_to_date );
      out.write("'>\t\t\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center'>PO#</td>\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center'>Style#</td>\r\n");
      out.write("    <td width=\"23%\" height=\"16\" class='table_header_center'>Buyer</td>\r\n");
      out.write("    <td width=\"35%\" colspan=\"2\" height=\"16\" class='table_header_center'>Supplier</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'>");
      out.print(po_no);
      out.write("'</td>\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'>");
      out.print(style_no);
      out.write("</td>\r\n");
      out.write("    <td width=\"23%\" height=\"23\" class='table_bg_bright'>");
      out.print( bname );
      out.write("</td>\r\n");
      out.write("    <td width=\"35%\" colspan=\"2\" height=\"23\" class='table_bg_bright'>");
      out.print(sname );
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center'>Product Group</td>\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center'>Sub group</td>\r\n");
      out.write("    <td width=\"23%\" height=\"16\" class='table_header_center'>Unit Price</td>\r\n");
      out.write("    <td width=\"19%\" height=\"16\" class='table_header_center'>Order date</td>\r\n");
      out.write("    <td width=\"16%\" height=\"16\" class='table_header_center'>Delivery Date</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'>");
      out.print(pgrname );
      out.write("</td>\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'>");
      out.print(sgrname );
      out.write("</td>\r\n");
      out.write("    <td width=\"23%\" height=\"23\" class='table_bg_bright'>");
      out.print(unitprice);
      out.write("  &nbsp;&nbsp;");
      out.print(curname );
      out.write("</td>\r\n");
      out.write("    <td width='19%' class=\"table_bg_bright\">");
      out.print( order_date );
      out.write("</td>\r\n");
      out.write("    <td width='16%' class=\"table_bg_bright\">");
      out.print( delivery_date );
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center'>Ship type</td>\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center'>Material</td>\r\n");
      out.write("    <td width=\"23%\" height=\"22\" class='table_header_center'>Season</td>\r\n");
      out.write("    <td width=\"19%\" height=\"22\" class='table_header_center'>Manufacturer</td>\r\n");
      out.write("    <td width=\"16%\" height=\"22\" class='table_header_center'>Task#</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"27\" class='table_bg_bright'>");
      out.print(ship_type );
      out.write("</td>\r\n");
      out.write("    <td width='21%' class=\"table_bg_bright\">");
      out.print(mname );
      out.write("</td>\r\n");
      out.write("    <td width=\"23%\" height=\"27\" class='table_bg_bright'>");
      out.print(season );
      out.write("</td>\r\n");
      out.write("    <td width=\"19%\" height=\"27\" class='table_bg_bright'>");
      out.print(subname );
      out.write("</td>\r\n");
      out.write("    <td width=\"16%\" height=\"27\" class='table_bg_bright'>");
      out.print( sup_style_no );
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center'>BRAND</td>\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center'>Shipping Type</td>\r\n");
      out.write("    <td width=\"23%\" height=\"22\" class='table_header_center'>Local Price</td>\r\n");
      out.write("    <td width=\"19%\" height=\"22\" class='table_header_center'>Re-order SEQ</td>\r\n");
      out.write("    <td width=\"16%\" height=\"22\" class='table_header_center'>Amend Date</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"27\" class='table_bg_bright'>");
      out.print( brand );
      out.write("</td>\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_bg_bright'>");
      out.print(ship_type );
      out.write(" </td>\r\n");
      out.write("    <td width=\"23%\" height=\"22\" class='table_bg_bright'>");
      out.print(local_price);
      out.write("</td>\r\n");
      out.write("    <td width=\"19%\" height=\"22\" class='table_bg_bright'>");
      out.print( reorder_seq );
      out.write("</td>\r\n");
      out.write("    <td width=\"16%\" height=\"22\" class='table_bg_bright'>");
      out.print( amend_date );
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  \r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"28\" class='table_header_center'>*Item text</td>\r\n");
      out.write("    <td width=\"79%\" colspan=\"4\" height=\"28\" class='table_bg_bright'>");
      out.print( itemtext );
      out.write("</td>\r\n");
      out.write("  </tr>  \r\n");
      out.write("  <tr class=\"table_header_center\">  \t \r\n");
      out.write("  \t<td class='table_bg_bright' class='table_list_no_height' align='center'>");
      out.print( imgUrl );
      out.write("</td>    \r\n");
      out.write("    <td width=\"79%\" colspan=\"4\" class='table_bg_bright' height=\"202\" align='left' VALIGN=TOP>");
      out.print( order_comments );
      out.write("</td>\r\n");
      out.write("  </tr>  \r\n");
      out.write("</table>\r\n");
      out.write("<table width='600' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" rowspan=\"2\" class='table_header_center' height=\"38\">Color</td>\r\n");
      out.write("    <td width=\"67%\" colspan=\"6\" class='table_header_center' height=\"16\">Size</td>\r\n");
      out.write("    <td width=\"13%\" rowspan=\"2\" class='table_header_center' height=\"38\">TOTAL</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"21\"><font size=\"2\">");
      out.print( size_1 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"21\"><font size=\"2\">");
      out.print( size_2 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center'  height=\"21\"><font size=\"2\">");
      out.print( size_3 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"21\"><font size=\"2\">");
      out.print( size_4 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center' height=\"21\"><font size=\"2\">");
      out.print( size_5 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"12%\" class='table_header_center' height=\"21\"><font size=\"2\">");
      out.print( size_6 );
      out.write("</font></td>\r\n");
      out.write("  </tr>\r\n");
      out.print(outS);
      out.write("                                               \r\n");
      out.write("</table>\r\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td ><font color=blue><b> Input Order Qty by Color</b></font></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td >");
      out.print( subdata );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width='600' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" rowspan=\"2\" bgcolor=yellow height=\"38\">Color</td>\r\n");
      out.write("    <td width=\"67%\" colspan=\"6\" bgcolor=yellow height=\"16\">Size</td>\r\n");
      out.write("    <td width=\"13%\" rowspan=\"2\" bgcolor=yellow height=\"38\">TOTAL</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"11%\" bgcolor=yellow height=\"21\"><font size=\"2\">");
      out.print( size_1 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"11%\" bgcolor=yellow height=\"21\"><font size=\"2\">");
      out.print( size_2 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"11%\" bgcolor=yellow  height=\"21\"><font size=\"2\">");
      out.print( size_3 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"11%\" bgcolor=yellow height=\"21\"><font size=\"2\">");
      out.print( size_4 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"11%\" bgcolor=yellow height=\"21\"><font size=\"2\">");
      out.print( size_5 );
      out.write("</font></td>\r\n");
      out.write("    <td width=\"12%\" bgcolor=yellow height=\"21\"><font size=\"2\">");
      out.print( size_6 );
      out.write("</font></td>\r\n");
      out.write("  </tr>\r\n");
      out.print(outS3);
      out.write("                                               \r\n");
      out.write("</table>\r\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td align='center'>\r\n");
      out.write("    <input type='button' value='Save' onclick='fnSave(this.form);'> &nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("    <input type='button' value='PO Print' onclick='fnPrint(this.form)'> &nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("    <input type='button' value='PO List' onclick='fnList(this.form);'>\r\n");
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
