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

public final class buyer_005fpo_005famend_005fdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");


request.setCharacterEncoding("euc-kr"); 
String fromUrl = "buyer_po_amend_details.jsp";
//String fromUrl = request.getParameter("fromUrl");
if (fromUrl == null) fromUrl = request.getHeader("Referer");
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
int iRet = 0;
int iRet2 = 0;
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
String today = DateUtil.getToday("yyyy/MM/dd");

String pono = "";
String style_no  = "";
String season   = "";
String sgr   = "";
String pgr   = "";
String fabric   = "";
String itemtext   = "";
String sup_style_no   = "";
String unitprice   = "";
String amend_date   = "";
String trans_type   = "";
String order_status   = "";
String status_name ="";
String currency   = "";
String brand    = "";
String buyer = "";
String supplier = "";
String subsupplier   = "";
String delivery_date   = "";
String deltype ="";
String local_price="";
String reorder_seq="";
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
	      + "   FABRIC, ITEM_TEXT, SUP_STOCK_CODE, format(VENDOR_PRICE,2) ,  date_format(amend_date, '%Y/%m/%d'), "
	      + "   TRANS_TYPE , ORDER_STATUS ,CURRENCY_CODE, BRAND , "
	      + "   BUYER,SUPPLIER  , SUBSUPPLIER, date_format(delivery_date, '%Y/%m/%d'), "
	      + "   SIZC_1,SIZC_2,SIZC_3,SIZC_4,SIZC_5,SIZC_6, "
	      + "   COMMENTS,TOTAL_QTY,date_format(order_date, '%Y/%m/%d'),date_format(arrival_date, '%Y/%m/%d'),PO_TYPE,format(LOCAL_PRICE,2), REORDER_SEQ "
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
		  amend_date   = matrix.getRowData(i).getData(j++);
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
		  total_qty = matrix.getRowData(i).getData(j++);	
		  order_date = matrix.getRowData(i).getData(j++);
		  ship_date = matrix.getRowData(i).getData(j++);	
		  deltype = matrix.getRowData(i).getData(j++);
		  local_price = matrix.getRowData(i).getData(j++);
		  reorder_seq = matrix.getRowData(i).getData(j++);		
	 }	        
 }
 // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='110' height='169'>";
	}
 // get buyer code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' and delete_yn='N' "
      + " order by id asc";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String bid  = matrix.getRowData(i).getData(0);
    String bname  = matrix.getRowData(i).getData(1);
    outS01  += "<option value=\"" + bid + "\"";  
    if ( buyer.equals(bid) ) {
       outS01  += " SELECTED ";  
    }
    outS01  += ">" + bname + "-"+bid+"</option>";
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
    if ( supplier.equals(sid) ) {
       outS02  += " SELECTED ";  
    }
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
    if ( pgr.equals(pgrcode) ) {
       outS03  += " SELECTED ";  
    }
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
    if ( sgr.equals(sgrcode) ) {
       outS04  += " SELECTED ";  
    }
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
   if ( fabric.equals(mcode) ) {
       outS05  += " SELECTED ";  
    }
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
    if ( currency.equals(curcode) ) {
       outS06  += " SELECTED ";  
    }   
    outS06  += ">" + curname + "</option>";
  }
  // get SUBsupplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'P' and delete_yn='N' "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String subid  = matrix.getRowData(i).getData(0);
    String subname  = matrix.getRowData(i).getData(1);
    outS07  += "<option value=\"" + subid + "\"";
    if ( subsupplier.equals(subid) ) {
       outS07  += " SELECTED ";  
    }    
    outS07  += ">" + subname + "</option>";
  } 
 // get season code
   sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SEASON' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String season_code  = matrix.getRowData(i).getData(0);
    String season_name  = matrix.getRowData(i).getData(1);
    outS08  += "<option value=\"" + season_code + "\"";
    if ( season.equals(season_code) ) {
       outS08  += " SELECTED ";  
    }    
    outS08  += ">" + season_name + "</option>";
  } 
  // get TRANS TYPE code
   sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'TRANS_TYPE' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String trans_code  = matrix.getRowData(i).getData(0);
    String trans_name  = matrix.getRowData(i).getData(1);
    outS09  += "<option value=\"" + trans_code + "\"";
    if ( deltype.equals(trans_code) ) {
       outS09  += " SELECTED ";  
    }    
    outS09  += ">" + trans_name + "</option>";
  } 
   // get order status code
   sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'ORDER_STATUS' "
      + "      and code = '"+order_status+"' " 
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {    
    status_name  = matrix.getRowData(i).getData(1);
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
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name= 'col_1'    value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='aqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 1 ) {
	     last_cnt = 2; 
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_2'  value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='bqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 2 ) {
	     last_cnt = 3; 
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_3'  value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='cqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 3 ) {
	      last_cnt = 4;  
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_4'     value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='dqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 4 ) {
	      last_cnt = 5;   
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_5'     value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='eqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	          
	  } 
	  // 추가 Color 입력을 위한 처리
	  int last_row=0;
	  String add_col="";
	  String add_qty1="";
	  String add_qty2="";
	  String add_qty3="";
	  String add_qty4="";
	  String add_qty5="";
	  String add_qty6="";
	  String add_tot="";
	  last_row = 5-iRet2;
	  	  
	  for ( int i = last_cnt+1; i < 6; i++) {
	        if ( i == 1 ) {
	             add_col="col_1";
				  add_qty1="aqty_1";
				  add_qty2="aqty_2";
				  add_qty3="aqty_3";
				  add_qty4="aqty_4";
				  add_qty5="aqty_5";
				  add_qty6="aqty_6";
				  add_tot="aqtytot";
	        } 
	        if ( i == 2 ) {
	             add_col="col_2";
				  add_qty1="bqty_1";
				  add_qty2="bqty_2";
				  add_qty3="bqty_3";
				  add_qty4="bqty_4";
				  add_qty5="bqty_5";
				  add_qty6="bqty_6";
				  add_tot="bqtytot";
	        } 
	        if ( i == 3 ) {
	             add_col="col_3";
				  add_qty1="cqty_1";
				  add_qty2="cqty_2";
				  add_qty3="cqty_3";
				  add_qty4="cqty_4";
				  add_qty5="cqty_5";
				  add_qty6="cqty_6";
				  add_tot="cqtytot";
	        } 
	        if ( i == 4 ) {
	             add_col="col_4";
				  add_qty1="dqty_1";
				  add_qty2="dqty_2";
				  add_qty3="dqty_3";
				  add_qty4="dqty_4";
				  add_qty5="dqty_5";
				  add_qty6="dqty_6";
				  add_tot="dqtytot";
	        } 
	        if ( i == 5 ) {
	             add_col="col_5";
				  add_qty1="eqty_1";
				  add_qty2="eqty_2";
				  add_qty3="eqty_3";
				  add_qty4="eqty_4";
				  add_qty5="eqty_5";
				  add_qty6="eqty_6";
				  add_tot="eqtytot";
	        } 
	        outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='"+add_col+"'      size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty1+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty2+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty3+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty4+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty5+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty6+"'   onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='"+add_tot+"'  size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	  }
	  // 
  } else {
  	  // color qty data가 없을때 처리      
	  String Nadd_col="";
	  String Nadd_qty1="";
	  String Nadd_qty2="";
	  String Nadd_qty3="";
	  String Nadd_qty4="";
	  String Nadd_qty5="";
	  String Nadd_qty6="";
	  String Nadd_tot="";	  	  	  
	  for ( int i = 1; i < 6; i++) {
	        if ( i == 1 ) {
	            Nadd_col="col_1";
				 Nadd_qty1="aqty_1";
				 Nadd_qty2="aqty_2";
				 Nadd_qty3="aqty_3";
				 Nadd_qty4="aqty_4";
				 Nadd_qty5="aqty_5";
				 Nadd_qty6="aqty_6";
				 Nadd_tot="aqtytot";
	        } 
	        if ( i == 2 ) {
	            Nadd_col="col_2";
				 Nadd_qty1="bqty_1";
				 Nadd_qty2="bqty_2";
				 Nadd_qty3="bqty_3";
				 Nadd_qty4="bqty_4";
				 Nadd_qty5="bqty_5";
				 Nadd_qty6="bqty_6";
				 Nadd_tot="bqtytot";
	        } 
	        if ( i == 3 ) {
	            Nadd_col="col_3";
				 Nadd_qty1="cqty_1";
				 Nadd_qty2="cqty_2";
				 Nadd_qty3="cqty_3";
				 Nadd_qty4="cqty_4";
				 Nadd_qty5="cqty_5";
				 Nadd_qty6="cqty_6";
				 Nadd_tot="cqtytot";
	        } 
	        if ( i == 4 ) {
	            Nadd_col="col_4";
				 Nadd_qty1="dqty_1";
				 Nadd_qty2="dqty_2";
				 Nadd_qty3="dqty_3";
				 Nadd_qty4="dqty_4";
				 Nadd_qty5="dqty_5";
				 Nadd_qty6="dqty_6";
				 Nadd_tot="dqtytot";
	        } 
	        if ( i == 5 ) {
	            Nadd_col="col_5";
				 Nadd_qty1="eqty_1";
				 Nadd_qty2="eqty_2";
				 Nadd_qty3="eqty_3";
				 Nadd_qty4="eqty_4";
				 Nadd_qty5="eqty_5";
				 Nadd_qty6="eqty_6";
				 Nadd_tot="eqtytot";
	        } 
	        outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_col+"'      size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty1+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty2+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty3+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty4+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty5+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty6+"'   onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_tot+"'  size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
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
      out.write("<title>Purchase Order Amendment</title>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/validate2.js\"></script>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\r\n");
      out.write("function fnSave(frm) { \r\n");
      out.write("  if (!frm.styno.value) {\r\n");
      out.write("    alert('Input style no!');\r\n");
      out.write("    frm.styno.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
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
      out.write("  if (!frm.itemtext.value) {\r\n");
      out.write("    alert('Input Item text!');\r\n");
      out.write("    frm.itemtext.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (!frm.size1.value) {\r\n");
      out.write("    alert('Input at least one or more Size type.');\r\n");
      out.write("    frm.size1.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (!frm.col_1.value) {\r\n");
      out.write("    alert('Input at least one or more color and quantity!');\r\n");
      out.write("    frm.col_1.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (confirm('Do you really want to save these data?')) { \r\n");
      out.write("    frm.action = './buyer_order_amend_update.jsp';\r\n");
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
      out.write("  frm.action = \"./buyer_order_amend_input.jsp\";  \r\n");
      out.write("  frm.submit(); \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnPrint(frm) {\r\n");
      out.write("  //var win = window.open('', \"winPrint\", \"toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900\");\r\n");
      out.write("\r\n");
      out.write("  //if (win) {\r\n");
      out.write("    frm.action = './buyer_po_print.jsp';  \r\n");
      out.write("  //  frm.target = win.name;\r\n");
      out.write("    frm.submit();\r\n");
      out.write("  //}\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\t\r\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='3%'><img src='/img/update.jpg'></td>\r\n");
      out.write("  <td width='*' class='left_title'>Buyer Purchase Order Amendment</td>\r\n");
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
      out.write("<font color=red>Note: (*) marked item cannot be edited. PO status( ");
      out.print(order_status);
      out.write(':');
      out.print(status_name );
      out.write("\t)</font>\r\n");
      out.write("<table width='100%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\r\n");
      out.write("<form name=\"form1\" method=\"post\">\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=input_flag VALUE='UPDATE' >\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=pono VALUE='");
      out.print(po_no);
      out.write("' >\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=buyer_id VALUE='");
      out.print(buyer);
      out.write("' >\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=supplier_id VALUE='");
      out.print(supplier);
      out.write("' >\r\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=po_status VALUE='");
      out.print(order_status);
      out.write("' >\t\t\t\t\r\n");
      out.write("\t<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\r\n");
      out.write("    <input type='hidden' name='ag_status' value='");
      out.print( ag_status );
      out.write("'>\r\n");
      out.write("   <input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\r\n");
      out.write("   <input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\r\n");
      out.write("   <input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\r\n");
      out.write("   <input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\r\n");
      out.write("   <input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\t\r\n");
      out.write("\t<input type='hidden' name='fromUrl' value='");
      out.print( fromUrl );
      out.write("'>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"16\" bgcolor=#ABAEB0><font color=white>*PO#</font></td>\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center2'><font color=white>Style#</font></td>\r\n");
      out.write("    <td width=\"23%\" height=\"16\" bgcolor=#ABAEB0><font color=white>*Buyer</font></td>\r\n");
      out.write("    <td width=\"35%\" colspan=\"2\" height=\"16\" bgcolor=#ABAEB0><font color=white>*Supplier</font></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'><input type='text' name='pono' value='");
      out.print(po_no);
      out.write("' size='15' maxlength='15' class='input_text' readonly='true' ></td>\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'><input type='text' name='styno' value='");
      out.print(style_no);
      out.write("' size='15' maxlength='15' class='input_text'></td>\r\n");
      out.write("    <td width=\"23%\" height=\"23\" class='table_bg_bright'><select name=\"buyer\"  disabled>");
      out.print( outS01 );
      out.write("</select></td>\r\n");
      out.write("    <td width=\"35%\" colspan=\"2\" height=\"23\" class='table_bg_bright'><select name=\"supplier\" disabled >");
      out.print(outS02 );
      out.write("</select></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center2'>Product Group</td>\r\n");
      out.write("    <td width=\"21%\" height=\"16\" class='table_header_center2'>Sub group</td>\r\n");
      out.write("    <td width=\"23%\" height=\"16\" class='table_header_center2'>Unit Price</td>\r\n");
      out.write("    <td width=\"19%\" height=\"16\" class='table_header_center2'>Order date</td>\r\n");
      out.write("    <td width=\"16%\" height=\"16\" class='table_header_center2'>Delivery Date</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'><select name=\"pgr\">");
      out.print(outS03 );
      out.write("</select></td>\r\n");
      out.write("    <td width=\"21%\" height=\"23\" class='table_bg_bright'><select name=\"sgr\">");
      out.print(outS04 );
      out.write("</select></td>\r\n");
      out.write("    <td width=\"23%\" height=\"23\" class='table_bg_bright'><input type='text' onblur=\"extractNumber(this,2,false);\" onkeyup=\"extractNumber(this,2,false);\" onkeypress=\"return blockNonNumbers(this, event, true, false);\"  name='unitprice' value='");
      out.print(unitprice);
      out.write("' size='10' maxlength='10' class='input_text' >\r\n");
      out.write("    \t      &nbsp;&nbsp;<select name=\"currency\">");
      out.print(outS06 );
      out.write("</select></td>\r\n");
      out.write("    <td width='19%' class=\"table_bg_bright\"><input type='text' name='orderdate' value='");
      out.print( order_date );
      out.write("' size='12' readonly class='input_text'>\r\n");
      out.write("    <img src=\"/img/calendar.gif\" style=\"cursor:hand\" align=\"absmiddle\" onclick=\"javascript:popFrame.fPopCalendar(this, document.form1.orderdate, document.all['popCal'], 'RIGHT', event);\"></td>\r\n");
      out.write("    <td width='16%' class=\"table_bg_bright\"><input type='text' name='deliverydate' value='");
      out.print( delivery_date );
      out.write("' size='12' readonly class='input_text'>\r\n");
      out.write("    <img src=\"/img/calendar.gif\" style=\"cursor:hand\" align=\"absmiddle\" onclick=\"javascript:popFrame.fPopCalendar(this, document.form1.deliverydate, document.all['popCal'], 'RIGHT', event);\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center2'>Ship type</td>\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center2'>Material</td>\r\n");
      out.write("    <td width=\"23%\" height=\"22\" class='table_header_center2'>Season</td>\r\n");
      out.write("    <td width=\"19%\" height=\"22\" class='table_header_center2'>BRAND</td>\r\n");
      out.write("    <td width=\"16%\" height=\"22\" class='table_header_center2'>Ship Type</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"27\" class='table_bg_bright'><SELECT NAME='shiptype'>\r\n");
      out.write("      <OPTION VALUE=\"FOB\">FOB</OPTION>\r\n");
      out.write("      <OPTION VALUE=\"CIF\">CIF</OPTION>\r\n");
      out.write("      </SELECT></td>\r\n");
      out.write("    <td width='21%' class=\"table_bg_bright\"><select name=\"material\">");
      out.print(outS05 );
      out.write("</select></td>\r\n");
      out.write("    <td width=\"23%\" height=\"27\" class='table_bg_bright'><SELECT NAME=season>");
      out.print(outS08 );
      out.write(" </SELECT></td>\r\n");
      out.write("    <td width=\"19%\" height=\"27\" class='table_bg_bright'><input type='text' value='");
      out.print( brand );
      out.write("' name='brand' size='20' maxlength='20' class='input_text'></td>\r\n");
      out.write("    <td width=\"16%\" height=\"27\" class='table_bg_bright'><SELECT NAME=deltype>");
      out.print(outS09 );
      out.write(" </SELECT></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center2'>Re-order SEQ</td>\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_header_center2'>Amend Date</td>\r\n");
      out.write("    <td width=\"23%\" height=\"22\" class='table_header_center2'></td>\r\n");
      out.write("    <td width=\"19%\" height=\"22\" class='table_header_center2'></td>\r\n");
      out.write("    <td width=\"16%\" height=\"22\" class='table_header_center2'></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"27\" class='table_bg_bright'><input type='text' name='reorder' value='");
      out.print( reorder_seq );
      out.write("' size='10' maxlength='10' class='input_text'></td>\r\n");
      out.write("    <td width=\"21%\" height=\"22\" class='table_bg_bright'>");
      out.print(amend_date );
      out.write("</td>\r\n");
      out.write("    <td width=\"23%\" height=\"22\" class='table_bg_bright'></td>\r\n");
      out.write("    <td width=\"19%\" height=\"22\" class='table_bg_bright'></td>\r\n");
      out.write("    <td width=\"16%\" height=\"22\" class='table_bg_bright'></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  \r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"21%\" height=\"28\" class='table_header_center2'>Item text</td>\r\n");
      out.write("    <td width=\"79%\" colspan=\"4\" height=\"28\" class='table_bg_bright'><input type='text' value='");
      out.print( itemtext );
      out.write("' name='itemtext' size='100' maxlength='100' class='input_text'></td>\r\n");
      out.write("  </tr>  \r\n");
      out.write("  <tr class=\"table_header_center\">  \t \r\n");
      out.write("  \t<td class='table_bg_bright' class='table_list_no_height' align='center'>");
      out.print( imgUrl );
      out.write("</td>    \r\n");
      out.write("    <td width=\"79%\" colspan=\"4\" height=\"202\" class='table_bg_bright'><TEXTAREA name=\"contents\" cols=\"100\" rows=\"14\"  >");
      out.print( comments );
      out.write("</TEXTAREA></td>\r\n");
      out.write("  </tr>  \r\n");
      out.write("</table>\r\n");
      out.write("<table width='840' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"20%\" rowspan=\"2\" class='table_header_center2' height=\"38\">Color</td>\r\n");
      out.write("    <td width=\"67%\" colspan=\"6\" class='table_header_center2' height=\"16\">Size</td>\r\n");
      out.write("    <td width=\"13%\" rowspan=\"2\" class='table_header_center2' height=\"38\">TOTAL</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"table_header_center\">\r\n");
      out.write("    <td width=\"11%\" class='table_header_center2' height=\"21\"><font size=\"2\"><input type='text' value='");
      out.print( size_1 );
      out.write("' name='size1' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center2' height=\"21\"><font size=\"2\"><input type='text' value='");
      out.print( size_2 );
      out.write("' name='size2' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center2'  height=\"21\"><font size=\"2\"><input type='text' value='");
      out.print( size_3 );
      out.write("' name='size3' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center2' height=\"21\"><font size=\"2\"><input type='text' value='");
      out.print( size_4 );
      out.write("' name='size4' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"11%\" class='table_header_center2' height=\"21\"><font size=\"2\"><input type='text' value='");
      out.print( size_5 );
      out.write("' name='size5' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("    <td width=\"12%\" class='table_header_center2' height=\"21\"><font size=\"2\"><input type='text' value='");
      out.print( size_6 );
      out.write("' name='size6' size='10' maxlength='10' class='input_text'></font></td>\r\n");
      out.write("  </tr>\r\n");
      out.print(outS);
      out.write("                                               \r\n");
      out.write("</table>\r\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td align='center'>\r\n");
      out.write("    <input type='button' value='Amend' onclick='fnSave(this.form);'> &nbsp;&nbsp;&nbsp;&nbsp;\r\n");
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
