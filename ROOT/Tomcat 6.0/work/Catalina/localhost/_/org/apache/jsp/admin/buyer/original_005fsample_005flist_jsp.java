package org.apache.jsp.admin.buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import common.util.*;

public final class original_005fsample_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\n");

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

      out.write('\n');
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
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix1 = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
MatrixDataSet matrix6 = null;
DataProcess dataProcess = null;

String sequenceNo     = "";
String sampleNo      = "";
String item_class    = "";

String inputDate       = "";
String item_group_name      = "";

String qty            = "";
String season          = "";
String buyer           = "";
String buyer_id           = "";
String supplier          = "";

String sendingDate    = "";
String returnDate     = "";
String remarks         = "";
String styleNo         = "";
String order_status    = "";  
String status_name    = "";   
String remarks2        = "";
String buyer_name     = "";   

String seqno = "";
String outS = "";
int    iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
int iRet6 = 0;
int    rcnt = 0;
String sql2 = "";
String sql3 = "";
String sql4 = "";
String sql5 = "";
String sql6 = "";
String cntSql = "";
String mainSql = "";
String conditionSql = "";
String file_name1="";
String file_name2="";
String file_name3="";

String day = "";
String color_code ="";
int color_count = 0;

String fromUrl = "/admin/buyer/original_sample_list.jsp";
String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchStyleNo = request.getParameter("searchStyleNo");
String searchStatus = request.getParameter("statusOptions");
String _InOutInputDate = (String) session.getAttribute("_InOutInputDate");
String _InOutItemGroup = (String) session.getAttribute("_InOutItemGroup");

//if (_InOutSgr == null) _InOutSgr = "";
if (_InOutInputDate == null) _InOutInputDate = "";
if (_InOutItemGroup == null) _InOutItemGroup = "";
if (searchStatus == null) searchStatus = "";
if (searchItemClass == null) searchItemClass = "";
if (searchFromDate == null || searchToDate == null) {
  searchFromDate = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -30, "yyyy/MM/dd");
  searchToDate = DateUtil.getToday("yyyy/MM/dd");
}
if (searchSupplier == null) searchSupplier = "";
if (searchItemGroup == null) searchItemGroup = "";
//if (searchBuyer == null) searchBuyer = (_admingroup.equals("B") ? _adminname.toUpperCase() : "");
if (searchBuyer == null) searchBuyer = "";
if (searchSampleNo == null) { 
    searchSampleNo = "";
} else {
	searchSampleNo = searchSampleNo.trim();
}	    
if (searchStyleNo == null) { 
    searchStyleNo = "";
} else {
	searchStyleNo = searchStyleNo.trim();
}	   

//set sql
mainSql = " select  a.sequence_no, a.sample_no, a.item_class, date_format(a.input_date, '%Y/%m/%d'), "
        + "         a.item_group, a.qty, a.season, upper(a.buyer), a.supplier,  "
        + "          date_format(a.sending_date, '%Y/%m/%d'),  date_format(a.return_date, '%Y/%m/%d'),"
        + "         ifnull(a.remarks,' '), a.style_no, a.status, b.code_name, ifnull(a.comments,' '), c.name,a.afile1_name,a.afile2_name,a.afile3_name "
        + " from    VG_SAMPLE_IN_OUT a LEFT OUTER JOIN VG_COMMON_CODE b  ON (a.status=b.code and b.type='ORDER_STATUS')  " 
        + "                                              LEFT OUTER JOIN login_01t c ON ( a.buyer = c.id )  "
        + "         where a.sequence_no > 0  ";     

if (searchStyleNo.equals("")) {
	if (searchSampleNo.equals("")) {
			  conditionSql = " and a.input_date between str_to_date('" + searchFromDate + "', '%Y/%m/%d')  "
			               + "         and  str_to_date('" + searchToDate + "', '%Y/%m/%d') ";
			
			  if (!searchSupplier.equals("")) {
			    conditionSql += " and    a.supplier = '" + searchSupplier + "' ";
			  }
			  
			  if (!searchItemGroup.equals("")) {
			    conditionSql += " and    a.item_group = '" + searchItemGroup + "' ";
			  }
			
			  if (!searchBuyer.equals("")) {
			    conditionSql += " and    upper(a.buyer) = '" + searchBuyer + "' ";
			  }
	} else {  
	  conditionSql = " and a.sample_no like upper('%" + searchSampleNo+ "%')";
	}
} else {
	 conditionSql = "  and a.style_no like upper('%" + searchStyleNo+ "%')";
}	
if (!searchItemClass.equals("")) {
  conditionSql += " and    a.item_class = " + searchItemClass;
}
 if (!searchStatus.equals("")) {
      conditionSql  += " and   status = '" + searchStatus + "' ";
  
  } 

conditionSql += " order by str_to_date(a.input_date, '%Y/%m/%d') desc, a.sample_no desc ";

//out.println(mainSql+ conditionSql);
//if (true) return;
sql2 = " select  code, code_name "
     + " from   vg_common_code "
     + " where  type = 'PGR' "
     + " and     use_yn ='Y' " 
     + " order by code ";


// ORDER STATUS
 sql3 = " select code,code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y'  and code between '00' and '30' order by sort_order ";
// set SGR
sql4 = " select  code, code_name "
     + " from   vg_common_code "
     + " where  type = 'SGR' "
     + " and     use_yn ='Y' " 
     + " order by code ";
// Buyer
sql5 = "  select  id,upper(name) "
     + "  from   login_01t "
     + "  where   user_type = 'B' "
     + "  order by name ";
//Supplier
sql6 = "  select  id, name "
     + "  from    login_01t "
     + "  where   user_type = 'S' "
     + "  order by name ";

try {

  matrix = new MatrixDataSet();
  matrix1 = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();
  matrix5 = new MatrixDataSet();
  matrix6 = new MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData( mainSql+ conditionSql, matrix, conn);
  // read item class
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

  // read STATUS
  iRet3 = dataProcess.RetrieveData(sql3, matrix3, conn);

  // read item_group
  iRet4 = dataProcess.RetrieveData(sql4, matrix4, conn);

  // read buyer
  iRet5 = dataProcess.RetrieveData(sql5, matrix5, conn);
  
  // read supplier
  iRet6 = dataProcess.RetrieveData(sql6, matrix6, conn);

} catch (Exception e) {
  System.out.println("Exception invoice_search : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

if (iRet > 0 ) {
  for (int i=0; i < iRet; i++) {
     int j = 0;      
   sequenceNo     = matrix.getRowData(i).getData(j++);
   sampleNo       = matrix.getRowData(i).getData(j++);    
   item_class     = matrix.getRowData(i).getData(j++);
   inputDate      = matrix.getRowData(i).getData(j++);
   item_group_name     = matrix.getRowData(i).getData(j++);
   qty            = matrix.getRowData(i).getData(j++);
   season          = matrix.getRowData(i).getData(j++);
   buyer          = matrix.getRowData(i).getData(j++);
   supplier       = matrix.getRowData(i).getData(j++);
   sendingDate    = matrix.getRowData(i).getData(j++);
   returnDate     = matrix.getRowData(i).getData(j++);
   remarks        = matrix.getRowData(i).getData(j++);
   styleNo        = matrix.getRowData(i).getData(j++);
   order_status        = matrix.getRowData(i).getData(j++);
   status_name        = matrix.getRowData(i).getData(j++);
   remarks2        = matrix.getRowData(i).getData(j++);
   buyer_name        = matrix.getRowData(i).getData(j++);
   file_name1        = matrix.getRowData(i).getData(j++);
   file_name2       = matrix.getRowData(i).getData(j++);
   file_name3        = matrix.getRowData(i).getData(j++);
    
    File imgFile = new File(application.getRealPath(_sampleImageUrl) + File.separator + sampleNo.toLowerCase()  + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _sampleImageUrl + "/" + sampleNo.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _sampleImageUrl + "/noimage.jpg' width='50' height='70'>";
	}	
    
    if( color_count > 0 ) {
      color_code = "#EEEEE0";
      color_count = 0;
    }else {
      color_code = "#FFFFF0";
      color_count = 1;
    }

    outS += "<tr bgcolor=" + color_code + ">" +
            " <td>" + imgUrl + "</td>" +
            "<td align=center > <font size=2><a href=\"javascript:fnView('" + sampleNo + "','" + buyer + "', '" + sequenceNo + "')\">" + sampleNo + "</font></td>" +
            "<td align=center > <font size=2>" +  item_group_name   + " </font></td>" +         
            "<td align=center > <font size=2>" +  season  + " </font></td>" +   
            "<td align=center > <font size=2>" + inputDate + " </font></td>" +
            "<td align=center > <font size=2>" + buyer + " </font></td>" +
            "<td align=center > <font size=2>" + buyer_name + " </font></td>" +
            "<td align=center > <font size=2><a href=\"javascript:fnDownload('" + file_name1 + "');\">" + file_name1 + "</a></font></td> " +
            "<td align=center > <font size=2><a href=\"javascript:fnDownload('" + file_name2 + "');\">" + file_name2 + "</a></font></td> " +
 	         "<td align=center > <font size=2><a href=\"javascript:fnDownload('" + file_name3 + "');\">" + file_name3 + "</a></font></td> " +
            "<td align=center > <font size=2>" + sendingDate + "</font></td>" +
            "<td align=center > <font size=2>" + status_name  + "</font></td>" +
            "<td align=center > <font size=2>" + styleNo + "</font></td>" +
            "</tr>";
  } //end of for
} //end of if

// print out dropdown list
// print PGR
String itemClassOptions = "";
String searchItemClassOptions = "";

//if (adminClass.equals("")) {
  itemClassOptions = "<option></option>";
  searchItemClassOptions = "<option value=''" + (searchItemClass.equals("") ? " selected" : "") + ">All</option>";
//}

for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String itemClass    = matrix2.getRowData(i).getData(j++);
  String itemClassNm  = matrix2.getRowData(i).getData(j++);

  itemClassOptions += "<option value='" + itemClass + "'>" + itemClass + "-" + itemClassNm + "</option>";
  searchItemClassOptions += "<option value='" + itemClass + "'"
              + (searchItemClass.equals(itemClass) ? " selected" : "") + ">" + itemClass + "-" + itemClassNm + "</option>";
}

// order status list
String statusOptions = "<option></option>";
String searchstatusOptions = "<option value=''" + (searchStatus.equals("") ? " selected" : "") + ">All</option>";

for (int i = 0; i < iRet3; i++) {
  int j = 0;
  String code = matrix3.getRowData(i).getData(j++);
  String code_name = matrix3.getRowData(i).getData(j++);
  statusOptions += "<option value='" + code + "'>" + code_name + "</option>";
 
  searchstatusOptions += "<option value='" + code + "'"
                         + (searchStatus.equals(code) ? " selected" : "") + ">" + code_name + "</option>";          
}

// print PGR
String itemGroupOptions = "<option></option>";
String searchItemGroupOptions = "<option value=''" + (searchItemGroup.equals("") ? " selected" : "") + ">All</option>";
for (int i = 0; i < iRet4; i++) {
  int j = 0;
  String item_group    = matrix4.getRowData(i).getData(j++);
  String itemGroupNm  = matrix4.getRowData(i).getData(j++);

  itemGroupOptions += "<option value='" + item_group + "'"
              + (_InOutItemGroup.equals(item_group) ? " selected" : "") + ">" + item_group + "-" + itemGroupNm + "</option>";
  searchItemGroupOptions += "<option value='" + item_group + "'"
              + (searchItemGroup.equals(item_group) ? " selected" : "") + ">" + item_group + "-" + itemGroupNm + "</option>";
}

//print buyer
String buyerOptions = "<option></option>";
String searchBuyerOptions = "<option value=''" + (searchBuyer.equals("") ? " selected" : "") + ">All</option>";
for (int i = 0; i < iRet5; i++) {
  String bid = matrix5.getRowData(i).getData(0);
  String bname = matrix5.getRowData(i).getData(1);

  buyerOptions += "<option value='" + bid + "'"
                + (_adminid.equals(bid) ? " selected" : "") + ">" + bname.toUpperCase() +"-"+bid+ "</option>";
  searchBuyerOptions += "<option value='" + bid + "'"
                      + (searchBuyer.equals(bid) ? " selected" : "") + ">" + bname.toUpperCase() +"-"+bid+ "</option>";
}

// print supplier
String supplierOptions = "<option></option>";
String searchSupplierOptions = "<option value=''" + (searchSupplier.equals("") ? " selected" : "") + ">All</option>";
for (int i = 0; i < iRet6; i++) {
  int j = 0;
  String sid = matrix6.getRowData(i).getData(j++);
  String sname = matrix6.getRowData(i).getData(j++);

  supplierOptions += "<option value='" + sid + "'>" + sname + "</option>";
  searchSupplierOptions += "<option value='" + sid + "'"
                         + (searchSupplier.equals(sid) ? " selected" : "") + ">" + sname + "</option>";
}


      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnDownload(file) {\n");
      out.write("  with (document.form2) {\n");
      out.write("    attachFile.value = file;\n");
      out.write("    attachRealFile.value = file;\n");
      out.write("    action = './download.jsp';\n");
      out.write("    //target = 'hiddenFrm';\n");
      out.write("    submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSearch(frm) { \n");
      out.write("    frm.action=\"./original_sample_list.jsp\";    \n");
      out.write("    frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnView(sampleNo,buyer,sequenceNo) {\n");
      out.write("  document.frmMain.sample_no.value = sampleNo;\n");
      out.write("  document.frmMain.buyer_id.value = buyer;\n");
      out.write("   document.frmMain.sequence_no.value = sequenceNo;\n");
      out.write("  document.frmMain.action = './sample_sheet_edit_form.jsp';\n");
      out.write("  document.frmMain.submit();\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Sample Spec sheet</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE width=900 border='0' align='center'>\n");
      out.write("<FORM NAME=frmMain action=\"original_sample_list.jsp\" METHOD=POST >\n");
      out.write("  <input type='hidden' name='sequence_no' >\n");
      out.write("   <input type='hidden' name='buyer_id' >\n");
      out.write("   <input type='hidden' name='sample_no' >\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write(" Search Query\n");
      out.write("  <table width='1000' border='0' cellspacing='1' cellpadding='2'  class='table_bg'>\n");
      out.write("  <form name='form1' method='post'>\n");
      out.write("  <tr>\n");
      out.write("    <td width='9%' class='table_header_center'>PGR</td>\n");
      out.write("    <td width='21%' class='table_bg_bright'><select name='searchItemClass'>");
      out.print( searchItemClassOptions );
      out.write("</select></td>\n");
      out.write("    <td width='9%' class='table_header_center'>Buyer</td>\n");
      out.write("    <td width='19%' class='table_bg_bright'><select name='searchBuyer'>");
      out.print( searchBuyerOptions );
      out.write("</select></td>\n");
      out.write("    <td width='9%' class='table_header_center'>Date</td>\n");
      out.write("    <td width='24%' class='table_bg_bright'><input type='text' name='searchFromDate' value='");
      out.print( searchFromDate );
      out.write("' size='10' style='cursor:hand'\n");
      out.write("      readonly onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\">\n");
      out.write("      ~\n");
      out.write("      <input type='text' name='searchToDate' value='");
      out.print( searchToDate );
      out.write("' size='10' style='cursor:hand'\n");
      out.write("      readonly onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\"></td>\n");
      out.write("    <td width=\"9%\" class=\"table_bg_bright_center\" rowspan='3'><input type='button' value='Search' onclick='fnSearch(this.form);'></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td class='table_header_center'>SGR</td>\n");
      out.write("    <td class='table_bg_bright' ><select name='searchItemGroup'>");
      out.print( searchItemGroupOptions );
      out.write("</select></td>\n");
      out.write("    <TD width='10%'class='table_header_center'>Status</TD>\n");
      out.write("    <TD width='20%' class='table_bg_bright'> <SELECT NAME='statusOptions'>  ");
      out.print( searchstatusOptions );
      out.write("</SELECT> </td>\n");
      out.write("    <td class='table_header_center'>Sample No</td>\n");
      out.write("    <td class='table_bg_bright'><input type='text' name='searchSampleNo' value='");
      out.print( searchSampleNo );
      out.write("' size='13' maxlength='11'></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td class='table_header_center'>Supplier</td>\n");
      out.write("    <td class='table_bg_bright' colspan='3'><select name='searchSupplier'>");
      out.print( searchSupplierOptions );
      out.write("</select></td>\n");
      out.write("    <td class='table_header_center'>Style No.</td>\n");
      out.write("    <td class='table_bg_bright'><input type='text' name='searchStyleNo' value='");
      out.print( searchStyleNo );
      out.write("' size='13' maxlength='11'></td>\n");
      out.write("  </tr>\n");
      out.write("  </form>\n");
      out.write("</table>\n");
      out.write("* Click the Sample Number from the list to edit the Sample detail. \n");
      out.write("<TABLE width='100%' border=0 cellpadding=0 cellspacing=1 align='center' class='table_bg'>\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("<TD width=5%><FONT size=2>Image </FONT></TD>\n");
      out.write("<TD width=3%><FONT size=2>Sample No. </FONT></TD>\n");
      out.write("<TD width=3%><FONT size=2>SGR</FONT></TD>\n");
      out.write("<TD width=5%><FONT size=2>Season </FONT></TD>\n");
      out.write("<TD width=5%><FONT size=2>Date </FONT></TD>\n");
      out.write("<TD width=5%><FONT size=2>Buyer ID </FONT></TD>\n");
      out.write("<TD width=10%><FONT size=2>Buyer Name </FONT></TD>\n");
      out.write("<TD width=12%><FONT size=2>Sample Sheet </FONT></TD>\n");
      out.write("<TD width=12%><FONT size=2>Request Sheet </FONT></TD>\n");
      out.write("<TD width=12%><FONT size=2>Amend Sheet </FONT></TD>\n");
      out.write("<TD width=5%><FONT size=2>Sending Date  </FONT></TD>\n");
      out.write("<TD width=5%><FONT size=2>Status</FONT></TD>\n");
      out.write("<TD width=3%><FONT size=2>Style No. </FONT></TD>\n");
      out.write("</tr>\n");
      out.print(outS);
      out.write("\n");
      out.write("</FORM>\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='attachPath' value='");
      out.print( _specSheetUrl  );
      out.write("'>\n");
      out.write("<input type='hidden' name='attachFile'>\n");
      out.write("<input type='hidden' name='attachRealFile'>\n");
      out.write("</form>\n");
      out.write("</TABLE>\n");

out.println(CopyRightLogo());

      out.write("\n");
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
