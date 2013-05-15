package org.apache.jsp.admin.buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import common.util.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;

public final class original_005fsample_005fin_005fout_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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


// getPageList : return Paging String
String getPageList(int currentPage, int totalCount, int pageSize, int pageBlockSize) {
  int iTmp = (currentPage - 1)/pageBlockSize;
  int iBlockBegin = iTmp*pageBlockSize + 1;
  int iBlockEnd = iBlockBegin + pageBlockSize - 1;
  int iTotalPage = (totalCount - 1)/pageSize + 1;

  String pageList = "";

  // Ã¹ÆäÀÌÁö, ÀÌÀü ÆäÀÌÁö ÀÌµ¿
  if (currentPage > 1) {
    pageList += "<a href='javascript:fnGoPage(1);'>[First]</a>&nbsp;"
              + "<a href='javascript:fnGoPage("+ (currentPage - 1) + ");'>[Prev]</a>&nbsp;";
  } else {
    pageList += "[First]&nbsp;[Prev]&nbsp;";
  }

  // ÀÌÀü ºí·Ï ÀÌµ¿
  if (iBlockBegin > pageBlockSize) {
    pageList += "<a href='javascript:fnGoPage(" + (iBlockBegin - 1) + ");'>...</a>&nbsp;";
  } else {
    pageList += "...&nbsp;";
  }

  // Block Paging
  for (int i = iBlockBegin; i <= iBlockEnd && i <= iTotalPage; i++) {
    if (i == currentPage) {
      pageList += "<b>" + i + "</b>&nbsp;";
    } else {
      pageList += "<a href='javascript:fnGoPage(" + i + ");'>" + i + "</a>&nbsp;";
    }
  }

  // ´ÙÀ½ ºí·Ï ÀÌµ¿
  if (iBlockEnd < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ (iBlockEnd + 1) + ");'>...</a>&nbsp;";
  } else {
    pageList += "...&nbsp;";
  }

  // ´ÙÀ½ ÆäÀÌÁö ÀÌµ¿
  if (currentPage < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ (currentPage + 1) + ");'>[Next]</a>&nbsp;";
  } else {
    pageList += "[Next]&nbsp;";
  }

  // ¸¶Áö¸· ÆäÀÌÁö ÀÌµ¿
  if (currentPage < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ iTotalPage + ");'>[Last]</a>";
  } else {
    pageList += "[Last]";
  }

  return pageList;
}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(5);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/common/calendar/calendar.htm");
    _jspx_dependants.add("/common/getPageList.jsp");
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


      out.write("\n");
      out.write("<!--%@ include file=\"/common/getSupplierNameOptions.jsp\" %-->\n");
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
      out.write('\n');
      out.write('\n');

String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String fromUrl = "/admin/buyer/original_sample_in_out_list.jsp";
String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchStyleNo = request.getParameter("searchStyleNo");
String searchStatus = request.getParameter("statusOptions");
//String searchNotReceivedOnly = request.getParameter("searchNotReceivedOnly");
//String styleNo="-";
/*
String adminClass = "";
if (_admingroup.equals("B") && !_brand.equals("") && !_adminclass.equals("")) {
  adminClass = String.valueOf(Integer.parseInt(_brand)*2 - (_adminclass.equals("1") ? 1 : 0));
}
*/
if (searchStatus == null) searchStatus = "";

if (curPage == null) curPage = "1";
if (pageSize == null) pageSize = "20";
//if (searchItemClass == null) searchItemClass = adminClass;
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

// paging 관련 변수
int iCurPage = 1;
int iPageSize = 20;
int iTotalPage = 1;
int iPageBlockSize = 10;
int iTotalCnt = 0;
int iBeginRownum = 0;
int iEndRownum = 0;
String pageList = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
int iRet6 = 0;
int iRet7 = 0;
String strSep = "|!^";
String outS = "";
String sql = "";
String cntSql = "";
String mainSql = "";
String conditionSql = "";
String sql2 = "";
String sql3 = "";
String sql4 = "";
String sql5 = "";
String sql6 = "";
String sql7 = "";
try {
  iCurPage = Integer.parseInt(curPage);
  iPageSize = Integer.parseInt(pageSize);
} catch (NumberFormatException ne) {}


Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix1 = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
MatrixDataSet matrix6 = null;
MatrixDataSet matrix7 = null;
DataProcess dataProcess = null;

// read from session
//String _InOutSgr = (String) session.getAttribute("_InOutSgr");
String _InOutInputDate = (String) session.getAttribute("_InOutInputDate");
String _InOutItemGroup = (String) session.getAttribute("_InOutItemGroup");

//if (_InOutSgr == null) _InOutSgr = "";
if (_InOutInputDate == null) _InOutInputDate = "";
if (_InOutItemGroup == null) _InOutItemGroup = "";

// set query
cntSql =  " select count(*) from VG_SAMPLE_IN_OUT a, VG_COMMON_CODE b  "
            + " where a.status=b.code and b.type='ORDER_STATUS' " ; 

mainSql = " select  a.sequence_no, a.sample_no, a.item_class, date_format(a.input_date, '%Y/%m/%d'), "
        + "         a.item_group, a.qty, a.season, upper(a.buyer), a.supplier,  "
        + "          date_format(a.sending_date, '%Y/%m/%d'),  date_format(a.return_date, '%Y/%m/%d'),"
        + "         ifnull(a.remarks,' '), a.style_no, a.status, b.code_name, ifnull(a.comments,' '), c.name "
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
//out.println(mainSql+conditionSql);
// read PGR code
sql2 = " select  code, code_name "
     + " from   vg_common_code "
     + " where  type = 'PGR' "
     + " and     use_yn ='Y' " 
     + " order by code ";


// ORDER STATUS
 sql3 = " select code,code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y'  and code between '00' and '30' and code not in ('22','24','35') order by sort_order ";
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

// set Season
sql7 = " select  code, code_name "
     + " from   vg_common_code "
     + " where  type = 'SEASON' "
     + " and     use_yn ='Y' " 
     + " order by sort_order ";

try {
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix1 = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();
  matrix5 = new MatrixDataSet();
  matrix6 = new MatrixDataSet();
  matrix7 = new MatrixDataSet();
  dataProcess = new DataProcess();
   conn.setAutoCommit(false);
  // read total count
   dataProcess.RetrieveData(cntSql + conditionSql, matrix1, conn);
   //out.println(cntSql + conditionSql);
   //if (true) return;
   iTotalCnt = Integer.parseInt(matrix1.getRowData(0).getData(0));
   iTotalPage = (iTotalCnt - 1)/iPageSize + 1;   

  if (iCurPage > iTotalPage) {
    iCurPage = iTotalPage;
    curPage = iCurPage + "";
  }

  iBeginRownum = (iCurPage - 1)*iPageSize + 1;
  iEndRownum = iBeginRownum + iPageSize - 1;

  // read original sample history by condition
   sql = "    SELECT T2.* FROM( "
          +"        SELECT @RNUM:=@RNUM+1 AS RM, T1.* "
          +"           FROM(  "
          +            mainSql + conditionSql 
          +  ") AS T1, (SELECT @RNUM:=0 ) R )  AS T2 "
          + "   WHERE RM >= " + iBeginRownum+"  AND RM <= " + iEndRownum;
  
      
  // out.println(sql);
  //if (true) return;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);  
  
  conn.commit();

  // read item class
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

  // read STATUS
  iRet3 = dataProcess.RetrieveData(sql3, matrix3, conn);

  // read item_group
  iRet4 = dataProcess.RetrieveData(sql4, matrix4, conn);
  conn.commit();

  // read buyer
  iRet5 = dataProcess.RetrieveData(sql5, matrix5, conn);
  
  // read supplier
  iRet6 = dataProcess.RetrieveData(sql6, matrix6, conn);
  // read season
  iRet7 = dataProcess.RetrieveData(sql7, matrix7, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }
  System.out.println("Exception in admin_po_status : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// print out history list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  j++;                  // Skip reading rnum
  String sequenceNo     = matrix.getRowData(i).getData(j++);
  String sampleNo       = matrix.getRowData(i).getData(j++);    
  String item_class     = matrix.getRowData(i).getData(j++);
  //String itemClassNm    = matrix.getRowData(i).getData(j++);
  String inputDate      = matrix.getRowData(i).getData(j++);
  String item_group     = matrix.getRowData(i).getData(j++);
  //String itemGroupNm    = matrix.getRowData(i).getData(j++);
  String qty            = matrix.getRowData(i).getData(j++);
  String season          = matrix.getRowData(i).getData(j++);
  //String placeNm        = matrix.getRowData(i).getData(j++);
  String buyer          = matrix.getRowData(i).getData(j++);
  String supplier       = matrix.getRowData(i).getData(j++);
  //String supplierNm     = matrix.getRowData(i).getData(j++);
  String sendingDate    = matrix.getRowData(i).getData(j++);
  String returnDate     = matrix.getRowData(i).getData(j++);
  String remarks        = matrix.getRowData(i).getData(j++);
  String styleNo        = matrix.getRowData(i).getData(j++);
  String order_status        = matrix.getRowData(i).getData(j++);
  String status_name        = matrix.getRowData(i).getData(j++);
  String remarks2        = matrix.getRowData(i).getData(j++);
  String buyer_name        = matrix.getRowData(i).getData(j++);

  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  if (returnDate.equals("0000/00/00") ) returnDate ="";
  // if the sending date is more than 28 day compare to Today and
  // the sample is not received then set the back ground color to red
  if (!sendingDate.equals("") && returnDate.equals("")) {
    String FourWeeksAgo = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -28, "yyyyMMdd");
    
    if ((sendingDate.substring(6)+sendingDate.substring(3, 5)+sendingDate.substring(0, 2)).compareTo(FourWeeksAgo) <= 0) {
      bgColor = "#FF0000";
    }
  }
    File imgFile = new File(application.getRealPath(_sampleImageUrl) + File.separator + sampleNo.toLowerCase()  + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _sampleImageUrl + "/" + sampleNo.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _sampleImageUrl + "/noimage.jpg' width='50' height='70'>";
	}	
  
  //String strLink = "<a href=\"javascript:fnView('" + seqno + "')\">" + StringUtil.convertTextToHtml(title) + "</a>";
  String strLink = "<a href=\"javascript:fnSetData('"  
                 + sequenceNo + strSep
                 + sampleNo + strSep
                 + item_class + strSep
                 + inputDate + strSep
                 + item_group + strSep
                 + qty + strSep
                 + season + strSep
                 + StringUtil.replaceScriptString(buyer) + strSep
                 + supplier + strSep
                 + sendingDate + strSep
                 + returnDate + strSep
                 + styleNo + strSep
                 + order_status + strSep
                 + StringUtil.replace(StringUtil.replaceScriptString(remarks), "\n", "\\n") + strSep
                 + StringUtil.replace(StringUtil.replaceScriptString(remarks2), "\n", "\\n")
                 + "')\">"                  
                 + sampleNo + " </a>";

  if (!styleNo.equals("-")) {
     styleNo = "<a href=\"javascript:fnViewPO('" + styleNo + "')\">"   + styleNo + "</a>";
  }
  
  outS += "<tr align='center' style='background-color:" + bgColor + ";'>"
        + " <td>" + imgUrl + "</td>"
        + " <td align='left'>" + strLink + "</td>"
        + " <td>" + inputDate + "</td>"
        + " <td>" + item_class + "</td>"
        + " <td>" + item_group + "</td>"
        + " <td>" + qty + "</td>"
        + " <td>" + season + "</td>"
        + " <td align='left'>" + buyer + "</td>"
        + " <td align='left'>" + buyer_name + "</td>"
        + " <td align='left'>" + status_name + "</td>"
        + " <td>" + sendingDate + "</td>"
        + " <td>" + returnDate + "</td>"
        + "  <td><a href=\"javascript:fnViewHistory('" + sampleNo + "')\">  View Change History </a></td>"   
        + "  <td><a href=\"javascript:fnViewComments('" + sequenceNo + "')\">  View Comment History </a></td>"
        + " <td>" + styleNo + "</td>"
        + "</tr>";     
}

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

// print season
String seasonOptions = "<option></option>";
for (int i = 0; i < iRet7; i++) {
  int j = 0;
  String seasonid = matrix7.getRowData(i).getData(j++);
  String seasonname = matrix7.getRowData(i).getData(j++);
  seasonOptions += "<option value='" + seasonid + "'>" + seasonname + "</option>";
}

// Paging.
pageList = getPageList(iCurPage, iTotalCnt, iPageSize, iPageBlockSize);

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=javascript src=\"/common/js/util.js\"></script>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("var progressEnd = 9; // set to number of progress <span>'s.\n");
      out.write("var progressColor = 'blue'; // set to progress bar color\n");
      out.write("var progressInterval = 1000; // set to time between updates (milli-seconds)\n");
      out.write("\n");
      out.write("var progressAt = progressEnd;\n");
      out.write("var progressTimer;\n");
      out.write("function progress_clear() {\n");
      out.write("for (var i = 1; i <= progressEnd; i++) document.getElementById('progress'+i).style.backgroundColor = 'transparent';\n");
      out.write("progressAt = 0;\n");
      out.write("}\n");
      out.write("function progress_update() {\n");
      out.write("document.getElementById('showbar').style.visibility = 'visible';\n");
      out.write("progressAt++;\n");
      out.write("if (progressAt > progressEnd) progress_clear();\n");
      out.write("else document.getElementById('progress'+progressAt).style.backgroundColor = progressColor;\n");
      out.write("progressTimer = setTimeout('progress_update()',progressInterval);\n");
      out.write("}\n");
      out.write("function progress_stop() {\n");
      out.write("clearTimeout(progressTimer);\n");
      out.write("progress_clear();\n");
      out.write("document.getElementById('showbar').style.visibility = 'hidden';\n");
      out.write("}\t\n");
      out.write("\t\n");
      out.write("function fnGoPage(page) {\n");
      out.write("  with (document.form3) {\n");
      out.write("    curPage.value = page;\n");
      out.write("    target = this.name;\n");
      out.write("    action = \"./original_sample_in_out_list.jsp\";\n");
      out.write("    submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSearch(frm) {\n");
      out.write("  frm.action=\"./original_sample_in_out_list.jsp\";\n");
      out.write("  frm.target = this.name;\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnNew(frm) {\n");
      out.write("  frm.reset();\n");
      out.write("  frm.sampleNo.disabled = false;\n");
      out.write("  frm.sampleNo.style.backgroundColor = \"white\";\n");
      out.write("  frm.sampleNo.focus();\n");
      out.write("  document.all['popSampleImage'].style.visibility = 'hidden';\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSave(frm) {\n");
      out.write("/*\n");
      out.write("  if (frm.actionFlag.value == 'U') {\n");
      out.write("    if ('");
      out.print( _adminname.toUpperCase() );
      out.write("' != frm.buyer.value) {\n");
      out.write("      alert(\"You can't update this item. The item creator can only update this.\");\n");
      out.write("      return;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("*/\n");
      out.write("  if (!frm.sampleNo.value) {\n");
      out.write("    alert('Input Sample no.');\n");
      out.write("    frm.sampleNo.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  if (!frm.item_class.disabled) {\n");
      out.write("    if (!jf_ChkValue(frm.item_class.value)) {\n");
      out.write("      alert('Select Class.');\n");
      out.write("      frm.item_class.focus();\n");
      out.write("      return;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("  if (frm.season.selectedIndex == 0) {\n");
      out.write("    alert('Select Season code.');\n");
      out.write("    frm.season.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  if (frm.order_status.selectedIndex == 0) {\n");
      out.write("    alert('Select Sample Status.');\n");
      out.write("    frm.order_status.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  if (frm.buyer.selectedIndex == 0) {\n");
      out.write("    alert('Select Buyer.');\n");
      out.write("    frm.buyer.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  \n");
      out.write("  if (!jf_ChkValue(frm.inputDate.value)) {\n");
      out.write("    alert('Input Date.');\n");
      out.write("    frm.inputDate.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!jf_IsNumeric(frm.qty.value)) {\n");
      out.write("    alert('Qty is incorrect. Numbers are only accepted.');\n");
      out.write("    frm.qty.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("\n");
      out.write("/*\n");
      out.write("  if (frm.item_group.selectedIndex == 0) {\n");
      out.write("    alert('Input Group.');\n");
      out.write("    frm.item_group.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("*/\n");
      out.write("\n");
      out.write("  if (frm.remarks.value) {\n");
      out.write("    if (!jf_IsValidStrLength(frm.remarks.value, 4000)) {\n");
      out.write("      alert(\"Check the length of Remarks(Max length : 4000).\");\n");
      out.write("      frm.remarks.focus();\n");
      out.write("      return;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    frm.remarks.value = frm.remarks.value.replace(/\"/g, \"'\");\n");
      out.write("  }\n");
      out.write("  progress_update();\n");
      out.write("  if (confirm('Do you really want to save these data?')) {  \t\n");
      out.write("    frm.action = './original_sample_in_out_save.jsp?step=2&sleep=3';\n");
      out.write("    frm.submit();   \n");
      out.write("    progress_stop();\n");
      out.write("  } else {\n");
      out.write("  \tprogress_stop();\n");
      out.write("  }\t\n");
      out.write("   \n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDelete(frm) {\n");
      out.write("  if (frm.actionFlag.value != 'U' || !frm.sequenceNo.value) {\n");
      out.write("    alert('Select an item you want to delete.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("/*\n");
      out.write("  if ('");
      out.print( _adminname.toUpperCase() );
      out.write("' != frm.buyer.value) {\n");
      out.write("    alert(\"You can't delete this item. The item creator can only delete this.\");\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("*/\n");
      out.write("\n");
      out.write("  if (confirm('Do you really want to delete the selected item?')) {\n");
      out.write("    frm.actionFlag.value = 'D';\n");
      out.write("    frm.action = './original_sample_in_out_save.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSetData(strParams) {\n");
      out.write("  var params = strParams.split('");
      out.print( strSep );
      out.write("');\n");
      out.write("  var j = 0;\n");
      out.write("\n");
      out.write("  with (document.form2) {\n");
      out.write("    sequenceNo.value = params[j++];\n");
      out.write("    sampleNo.value = params[j++];\n");
      out.write("    jf_fnSetSelectOption(item_class, params[j++]);\n");
      out.write("    inputDate.value = params[j++];\n");
      out.write("    jf_fnSetSelectOption(item_group, params[j++]);\n");
      out.write("    qty.value = params[j++];\n");
      out.write("    //season.value= params[j++];\n");
      out.write("    jf_fnSetSelectOption(season, params[j++]);\n");
      out.write("    buyer.selectedIndex = 0;\n");
      out.write("    jf_fnSetSelectOption(buyer, params[j++]);\n");
      out.write("    jf_fnSetSelectOption(supplier, params[j++]);\n");
      out.write("    sendingDate.value = params[j++];\n");
      out.write("    returnDate.value = params[j++];\n");
      out.write("    styleNo.value = params[j++];\n");
      out.write("    jf_fnSetSelectOption(order_status, params[j++]);\n");
      out.write("    remarks.value = params[j++];\n");
      out.write("    remarks2.value = params[j++];\n");
      out.write("\n");
      out.write("    actionFlag.value = 'U';\n");
      out.write("    //item_class.disabled = true;\n");
      out.write("    //place.disabled = true;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  document.all['sampleImage'].src = '");
      out.print( _sampleImageUrl );
      out.write("/' + document.form2.sampleNo.value.toLowerCase() + '.jpg';\n");
      out.write("  document.all['popSampleImage'].style.visibility = 'visible';\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnOpenStyleWin(style_no_selected)\n");
      out.write("{\n");
      out.write("  var url = '/ordermanagement/product_info.jsp';\n");
      out.write("  form2.style_no_selected.value = style_no;\n");
      out.write("  var win = window.open(url, \"styleWin\", \"toolbar=no,menubar=no,resizable=no,scrollbars=yes,width=860,height=600\");\n");
      out.write("  if (win) win.focus();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnViewPO(style_no_selected) {\n");
      out.write("  form3.style_no_selected.value = style_no_selected;\n");
      out.write("  form3.action = \"/ordermanagement/product_info.jsp\";\n");
      out.write("  form3.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnViewHistory(sample_no_selected) {\n");
      out.write("  form3.sample_no_selected.value = sample_no_selected;\n");
      out.write("  form3.action = \"./sample_updated_history_list.jsp\";\n");
      out.write("  form3.submit();\n");
      out.write("}\n");
      out.write("function fnViewComments(seq_no_selected) {\n");
      out.write("  form3.seq_no_selected.value = seq_no_selected;\n");
      out.write("  form3.action = \"./sample_comments_list.jsp\";\n");
      out.write("  form3.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnExcel(frm, withImage) {\n");
      out.write("  if (confirm(\"Do you want to download these data as an excel file?\"))\n");
      out.write("  {\n");
      out.write("    frm.action=\"./original_sample_in_out_excel.jsp\";\n");
      out.write("   frm.target = hidenFrame.name;\n");
      out.write("    frm.withImage.value = withImage;\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function displayLeng( sz, id )\n");
      out.write("{\n");
      out.write("    var form = document.form2;\n");
      out.write("    var obj  = document.getElementById( id );\n");
      out.write("\n");
      out.write("\n");
      out.write("    if (form[id].value.length > sz)\n");
      out.write("    {\n");
      out.write("        if (event.keyCode != '8') //백스페이스는 지우기작업시 바이트 체크하지 않기 위해서\n");
      out.write("        {\n");
      out.write("            alert( sz+'자까지 입력이 가능합니다.');\n");
      out.write("        }\n");
      out.write("        form[id].value = form[id].value.substring(0, sz);\n");
      out.write("    }\n");
      out.write("\n");
      out.write("\n");
      out.write("    document.getElementById(id+'_bytes').innerHTML = form[id].value.length+\" 자\";\n");
      out.write("}\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n");
      out.write("<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>\n");
      out.write("\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td height='15' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='3%'><img src='/img/btnPO.gif'></td>\n");
      out.write("  <td width='*' class='left_title'>Original Sample</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='10' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</td></tr>\n");
      out.write("</table>\n");
      out.write(" Search Query\n");
      out.write("<table width=\"1000\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width='1000'>\n");
      out.write("  <table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
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
      out.write("    <td class='table_header_center'>Style#</td>\n");
      out.write("    <td class='table_bg_bright'><input type='text' name='searchStyleNo' value='");
      out.print( searchStyleNo );
      out.write("' size='13' maxlength='11'></td>\n");
      out.write("  </tr>\n");
      out.write("  </form>\n");
      out.write("  </table>\n");
      out.write("</table>\n");
      out.write("  <table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("  <tr>\n");
      out.write("    <td height='15'>Sample Detail</td>\n");
      out.write("  </tr>\n");
      out.write("  </table>\n");
      out.write("  <table width=\"1000\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">  \t\n");
      out.write("  <tr>\n");
      out.write("  \t<td width='*'>\n");
      out.write("  <table width='100%' border='0' class='table_bg' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("  <tr><td width='10%' class='table_header_center'>Sample Image </td></tr><tr>\n");
      out.write("    <td width='100%' height='170' align='right' class='table_bg_bright' ><div id='popSampleImage' style='position:relative;visibility:hidden;border:0px;'>\n");
      out.write("      <img id='sampleImage' src='' width='110' height='169'>\n");
      out.write("      </div></td>\n");
      out.write("  </tr>\n");
      out.write("  </table>\n");
      out.write("</td><td width='1000'>\n");
      out.write("  <table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
      out.write("  <form name='form2' method='post'>  \t\n");
      out.write("  <input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\">\n");
      out.write("  <input type=\"hidden\" name=\"pageSize\" value=\"");
      out.print( pageSize );
      out.write("\">\n");
      out.write("  <input type='hidden' name='searchFromDate' value='");
      out.print( searchFromDate );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchToDate' value='");
      out.print( searchToDate );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchBuyer' value='");
      out.print( searchBuyer );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchItemClass' value='");
      out.print( searchItemClass );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchSupplier' value='");
      out.print( searchSupplier );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchItemGroup' value='");
      out.print( searchItemGroup );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchSampleNo' value='");
      out.print( searchSampleNo );
      out.write("'>\n");
      out.write("  <input type='hidden' name='statusOptions' value='");
      out.print( searchStatus );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchStyleNo' value='");
      out.print( searchStyleNo );
      out.write("'>\n");
      out.write("  <input type='hidden' name='actionFlag' value='I'>\n");
      out.write("  <input type='hidden' name='sequenceNo' value=''>\n");
      out.write("  <tr>\n");
      out.write("    <td width='10%' class='table_header_center'>Sample No</td>\n");
      out.write("    <td width='11%' class='table_bg_bright'><input type='text' name='sampleNo' size='13' maxlength='11' tabindex='-1' style='background-color : #e8e8e8'></td>\n");
      out.write("    <td class='table_header_center'>Supplier</td>\n");
      out.write("    <td class='table_bg_bright' colspan='3'><select name='supplier'>");
      out.print( supplierOptions );
      out.write("</select></td>   \n");
      out.write("    <td width='9%' class='table_header_center'>Buyer(*)</td>\n");
      out.write("    <td width='28%' class='table_bg_bright'><select name='buyer'>");
      out.print( buyerOptions );
      out.write("</select></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td class='table_header_center'>Date(*)</td>\n");
      out.write("    <td class='table_bg_bright'><input type='text' name='inputDate' value='");
      out.print( _InOutInputDate );
      out.write("' size='10' style='cursor:hand'\n");
      out.write("      readonly onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\"></td>\n");
      out.write("    <td class='table_header_center'>Qty(*)</td>\n");
      out.write("    <td width='9%' class='table_bg_bright'><input type='text' name='qty' value='1' size='5' maxlength='5'></td>\n");
      out.write("    <td width='10%' class='table_header_center'>Season</td>\n");
      out.write("    <td width='13%' class='table_bg_bright'><select name='season'>");
      out.print( seasonOptions);
      out.write("</select></td>\n");
      out.write("    <td class='table_header_center' >Style#</td>\n");
      out.write("    <td class='table_bg_bright' ><input type='text' name='styleNo'  size='20' maxlength='20'></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td class='table_header_center'>SGR</td>\n");
      out.write("    <td class='table_bg_bright' colspan='3'><select name='item_group'>");
      out.print( itemGroupOptions );
      out.write("</select></td>\n");
      out.write("    <td class='table_header_center'>Send. Date</td>\n");
      out.write("    <td class='table_bg_bright'><input type='text' name='sendingDate' size='10' style='cursor:hand'\n");
      out.write("      readonly onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\"></td>\n");
      out.write("     <td class='table_header_center'>Recv. Date</td>\n");
      out.write("    <td class='table_bg_bright'><input type='text' name='returnDate' size='10' style='cursor:hand'\n");
      out.write("      readonly onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);\"></td>  \n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td width='10%' class='table_header_center'>PGR(*)</td>\n");
      out.write("    <td width='32%' class='table_bg_bright' colspan='3'><select name='item_class'>");
      out.print( itemClassOptions );
      out.write("</select></td>\n");
      out.write("    <td class='table_header_center' ></td>\n");
      out.write("  \t <td class='table_bg_bright' ></td>\n");
      out.write("  \t<td width='10%' class='table_header_center'>Status</td>\n");
      out.write("    <td width='32%' class='table_bg_bright' colspan='3'><select name='order_status'>");
      out.print( statusOptions );
      out.write("</select></td>  \n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("  \t<td width='10%' class='table_header_center' rowspan='3'>Comments<br>(to Buyer)</td>\n");
      out.write("  \t<td class='table_bg_bright' colspan='4' rowspan='3'><textarea id=chk1 onkeyup='displayLeng(4000,\"chk1\");' name=\"remarks\" cols=\"20\" rows=\"5\" style=\"width:100%;\"></textarea><div name='chk1_bytes' id='chk1_bytes'></div></td>\n");
      out.write("  \t<td width='10%' class='table_header_center' rowspan='3'>Comments<br>(from Buyer)</td>\n");
      out.write("  \t<td class='table_bg_bright' colspan='3' rowspan='3'><textarea  name=\"remarks2\" readonly cols=\"20\" rows=\"5\" style=\"width:100%;\" ></textarea></td>\n");
      out.write("  </tr>\n");
      out.write("  </table>\n");
      out.write("</td>\n");
      out.write("  \n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15'><font color=red>* When you change the Status to 'Send Sample', 'Edit Sample','Confirm Design', then email about the status will be sent to the buyer automatically.</font></td>\n");
      out.write("</tr>\n");
      out.write("<!--tr>\n");
      out.write("  <td height='15'><font color=red>**  It may take a while to complete sending email to buyer. Please wait until it is done.**</font></td>\n");
      out.write("</tr-->\n");
      out.write("<tr>\n");
      out.write("  <td align='center'>\n");
      out.write("    <input type='button' value='New' onclick='fnNew(this.form);'>\n");
      out.write("    <input type='button' value='Save' onclick='fnSave(this.form);'>\n");
      out.write("    <input type='button' value='Delete' onclick='fnDelete(this.form);'>\n");
      out.write("    <input type='button' value='Excel' onclick=\"fnExcel(document.form3, '');\">\n");
      out.write("     <input type='button' value='Excel with Image' onclick=\"fnExcel(document.form3, 'Y');\">\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='5'></td>\n");
      out.write("</tr>\n");
      out.write("</form>\n");
      out.write("</table>\n");
      out.write("<table align=\"center\"><tr><td>\n");
      out.write("<div id=\"showbar\" style=\"font-size:8pt;padding:2px;border:solid black 1px;visibility:hidden\">\n");
      out.write("<span id=\"progress1\"><font color=red>** It may take a while to complete sending email to buyer. Please wait until it is done.**</font></span>\n");
      out.write("<span id=\"progress2\">&nbsp; &nbsp;</span>\n");
      out.write("<span id=\"progress3\">&nbsp; &nbsp;</span>\n");
      out.write("<span id=\"progress4\">&nbsp; &nbsp;</span>\n");
      out.write("<span id=\"progress5\">&nbsp; &nbsp;</span>\n");
      out.write("<span id=\"progress6\">&nbsp; &nbsp;</span>\n");
      out.write("<span id=\"progress7\">&nbsp; &nbsp;</span>\n");
      out.write("<span id=\"progress8\">&nbsp; &nbsp;</span>\n");
      out.write("<span id=\"progress9\">&nbsp; &nbsp;</span>\n");
      out.write("</div>\n");
      out.write("</td></tr></table>\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<form name='form3' method='post'>\n");
      out.write("<input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\">\n");
      out.write("<input type='hidden' name='searchFromDate' value='");
      out.print( searchFromDate );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchToDate' value='");
      out.print( searchToDate );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchBuyer' value='");
      out.print( searchBuyer );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchItemClass' value='");
      out.print( searchItemClass );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchSupplier' value='");
      out.print( searchSupplier );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchItemGroup' value='");
      out.print( searchItemGroup );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchSampleNo' value='");
      out.print( searchSampleNo );
      out.write("'>\n");
      out.write("<input type='hidden' name='statusOptions' value='");
      out.print( searchStatus );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchStyleNo' value='");
      out.print( searchStyleNo );
      out.write("'>\n");
      out.write("<input type=\"hidden\" name=\"seq_no_selected\" >\n");
      out.write("<input type=\"hidden\" name=\"sample_no_selected\" >\n");
      out.write("<input type=\"hidden\" name=\"style_no_selected\" >\n");
      out.write("<INPUT TYPE=HIDDEN NAME=fromUrl VALUE= '");
      out.print( fromUrl );
      out.write("' >\n");
      out.write("<input type=\"hidden\" name=\"withImage\" value=\"\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"50%\">\n");
      out.write("    Page Size :\n");
      out.write("    <select name=\"pageSize\" onChange=\"fnGoPage(1)\">\n");
      out.write("      <option value=\"20\" ");
      out.print( pageSize.equals("20") ? "selected" : "" );
      out.write(">20</option>\n");
      out.write("      <option value=\"50\" ");
      out.print( pageSize.equals("50") ? "selected" : "" );
      out.write(">50</option>\n");
      out.write("      <option value=\"100\" ");
      out.print( pageSize.equals("100") ? "selected" : "" );
      out.write(">100</option>\n");
      out.write("    </select></td>\n");
      out.write("  <td width=\"*\" align=\"right\" valign=\"bottom\">TOTAL : ");
      out.print( iTotalCnt );
      out.write(", Current Page : ");
      out.print( iCurPage );
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print( iTotalPage );
      out.write("&nbsp;</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</td></tr></table>\n");
      out.write("\n");
      out.write("<table width=\"1220\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>\n");
      out.write("<table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("  <td>Image </td>\n");
      out.write("  <td>Sample No</td>\n");
      out.write("  <td>Date</td>\n");
      out.write("  <td>PGR</td>\n");
      out.write("  <td>SGR</td>\n");
      out.write("  <td>Qty</td>\n");
      out.write("  <td>Season</td>\n");
      out.write("  <td>Buyer ID</td>\n");
      out.write("  <td>Supplier ID</td>\n");
      out.write("  <td>Status</td>\n");
      out.write("  <td>Sending Date</td>\n");
      out.write("  <td>Receiving Date</td>\n");
      out.write("  <td>Updated</td>\n");
      out.write("  <td>Comments</td>\n");
      out.write("  <td>Style No</td>\n");
      out.write("</tr>\n");
      out.print( outS );
      out.write("\n");
      out.write("</table>\n");
      out.write("</td></tr></table>\n");
      out.write("\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" align=\"center\">");
      out.print( pageList );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("</form>\n");
      out.write("</table>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</tr></td></table>\n");
      out.write("<iframe width=\"0\" height=\"0\" name=\"hidenFrame\"></iframe>\n");
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
