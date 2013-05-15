<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.text.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

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


String seqno = request.getParameter("sample_no_selected");
String seqNo     = "" ;  
String sequenceNo     = "";
String sampleNo       = "" ;  
String supplier_remarks        = "";
String buyer_remarks         = "";
String supplier_id        = "";
String buyer_id          = "";
String supplier_updated    = "";
String buyer_updated    = "";
String modified_date = "";
String sample_status ="";
String season ="";
String item_class = "";
String style_no = "";
String modifier ="";
String item_group ="";
String sending_date ="";
String return_date ="";

String day = "";
String color_code ="";
int color_count = 0;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;


int iRet = 0;
String outS = "";

// query for po list
String sql = " select  sequence_no, sample_no, remarks, supplier,buyer, "
        + "        date_format(MODIFIED_DATE, '%Y/%m/%d'),STATUS ,SEASON,ITEM_CLASS,STYLE_NO,MODIFIER,  "
        + "         ITEM_GROUP,date_format(sending_date, '%Y/%m/%d'),date_format(RETURN_DATE, '%Y/%m/%d') "
        + " from    SAMPLE_HISTORY   "
        + "         where sample_no = '"+seqno+"' " 
        + " order by sequence_no "; 


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
   sequenceNo     = matrix.getRowData(i).getData(j++);
   sampleNo       = matrix.getRowData(i).getData(j++);       
   supplier_remarks        = matrix.getRowData(i).getData(j++);
   supplier_id       = matrix.getRowData(i).getData(j++);
   buyer_id          = matrix.getRowData(i).getData(j++);
   //supplier_updated   = matrix.getRowData(i).getData(j++);
   //buyer_updated   = matrix.getRowData(i).getData(j++);
   modified_date = matrix.getRowData(i).getData(j++);
	 sample_status =matrix.getRowData(i).getData(j++);
	 season =matrix.getRowData(i).getData(j++);
   item_class = matrix.getRowData(i).getData(j++);
   style_no = matrix.getRowData(i).getData(j++);
   modifier =matrix.getRowData(i).getData(j++);
   item_group =matrix.getRowData(i).getData(j++);
   sending_date =matrix.getRowData(i).getData(j++);
   return_date =matrix.getRowData(i).getData(j++);
   
    
    if( color_count > 0 ) {
      color_code = "#EEEEE0";
      color_count = 0;
    }else {
      color_code = "#FFFFF0";
      color_count = 1;
    }
 
  
  outS += "<tr bgcolor=" + color_code + ">" +
            "<td align=center > <font size=2>" + sequenceNo  + " </font></td>" +         
            "<td align=center > <font size=2>" + sampleNo + " </font></td>" +
            "<td align=center > <font size=2>" + modifier + " </font></td>" + 
            "<td align=center > <font size=2>" + modified_date + " </font></td>" + 
            "<td align=center > <font size=2>" + sample_status + " </font></td>" + 
            "<td align=center > <font size=2>" + item_group + " </font></td>" + 
            "<td align=center > <font size=2>" + item_class + " </font></td>" + 
            "<td align=center > <font size=2>" + season + " </font></td>" +  
            "<td align=center > <font size=2>" + sending_date + " </font></td>" +    
            "<td align=center > <font size=2>" + return_date + " </font></td>" +   
            "<td align=center > <font size=2><TEXTAREA  cols=50 rows=5  >"+ supplier_remarks+"</TEXTAREA></font></td>" +
            "<td align=center > <font size=2>" + supplier_id  + " </font></td>" +
 //           "<td align=center > <font size=2>" +  supplier_updated  + " </font></td>" + 
 //           "<td align=center > <font size=2><TEXTAREA  cols=50 rows=5  >"+ buyer_remarks+"</TEXTAREA></font></td>" +
            "<td align=center > <font size=2>" + buyer_id  + " </font></td>" +
 //           "<td align=center > <font size=2>" +  buyer_updated  + " </font></td>" + 
            "</tr>";
}


%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>

function fnBack(frm) {
  //frm.action = "<%= fromUrl %>";
  //frm.target = this.name;
  //frm.submit();
  history.back();
}

</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/btnCategories.gif"></td>
  <td width="*" class="left_title">SAMPLE MODIFY History</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td>
<TABLE width='99%' border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<form name='frmMain' method='post'>
<input type='hidden' name='searchBuyer' value='<%= searchBuyer %>'>
  <input type='hidden' name='searchItemClass' value='<%= searchItemClass %>'>
  <input type='hidden' name='searchSupplier' value='<%= searchSupplier %>'>
  <input type='hidden' name='searchItemGroup' value='<%= searchItemGroup %>'>
  <input type='hidden' name='searchSampleNo' value='<%= searchSampleNo %>'>
  <input type='hidden' name='statusOptions' value='<%= searchStatus %>'>
  <input type='hidden' name='searchStyleNo' value='<%= searchStyleNo %>'>
  <input type='hidden' name='sequence_no' >
   <input type='hidden' name='buyer_id' >
   <input type='hidden' name='sample_no' >
<TR class='table_header_center'>
<TD width=10%><FONT size=2>Seq No. </FONT></TD>
<TD width=10%><FONT size=2>Sample# </FONT></TD>
<TD width=3%><FONT size=2>Update User</FONT></TD>
<TD width=3%><FONT size=2>Updated</FONT></TD>
<TD width=3%><FONT size=2>Status</FONT></TD>
<TD width=3%><FONT size=2>Item Group</FONT></TD>
<TD width=3%><FONT size=2>Item Class</FONT></TD>
<TD width=3%><FONT size=2>Season</FONT></TD>
<TD width=3%><FONT size=2>Sent Date</FONT></TD>	
<TD width=3%><FONT size=2>Return Date</FONT></TD>	
<TD width=3%><FONT size=2>Remarks</FONT></TD>
<TD width=3%><FONT size=2>Supplier ID </FONT></TD>
<TD width=3%><FONT size=2>Buyer ID </FONT></TD>
</TR>
<%= outS %>
</TABLE>
</td></tr></table>
<br>
<table width='1000' border='0'  cellspacing='0' cellpadding='0'>
<tr>
	<td align=center>
    <input type='button' value='Go back' onclick='fnBack(this.form);'>
   </td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe width="0" height="0" name="hidenFrame"></iframe>
</form>
</BODY>
</HTML>
