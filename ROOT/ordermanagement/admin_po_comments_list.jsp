<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;


String seqno = "";
String outS = "";
int    iRet = 0;

String seqNo     = "" ;  
String orderNo       = "" ;  
String supplier_remarks        = "";
String buyer_remarks         = "";
String supplier_id        = "";
String buyer_id          = "";
String supplier_updated    = "";
String buyer_updated    = "";


String day = "";
String color_code ="";
int color_count = 0;

String fromUrl = "/ordermanagement/admin_order_list.jsp";
String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");

String po_no = request.getParameter("po_no_selected");
//set sql
String sql = " select  seqno,order_no, supplier_remarks,buyer_remarks, supplier_id,buyer_id,date_format(supplier_updated, '%Y/%m/%d'), "
        + "        date_format(buyer_updated, '%Y/%m/%d')  "
        + " from    PO_COMMENTS   "
        + "         where order_no = '"+po_no+"' " 
        + " order by seqno ";     
//out.println(sql);
try {

  matrix = new MatrixDataSet();
   dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData( sql, matrix, conn);
  

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
   seqNo     = matrix.getRowData(i).getData(j++);   
   orderNo       = matrix.getRowData(i).getData(j++);       
   supplier_remarks        = matrix.getRowData(i).getData(j++);
   buyer_remarks        = matrix.getRowData(i).getData(j++);
   supplier_id       = matrix.getRowData(i).getData(j++);
   buyer_id          = matrix.getRowData(i).getData(j++);
   supplier_updated   = matrix.getRowData(i).getData(j++);
   buyer_updated   = matrix.getRowData(i).getData(j++);
   
   
    
    if( color_count > 0 ) {
      color_code = "#EEEEE0";
      color_count = 0;
    }else {
      color_code = "#FFFFF0";
      color_count = 1;
    }

    outS += "<tr bgcolor=" + color_code + ">" +
            "<td align=center > <font size=2>" + seqNo   + " </font></td>" +         
            "<td align=center > <font size=2>" + orderNo + " </font></td>" +
            "<td align=center > <font size=2><TEXTAREA  cols=70 rows=10  >"+ supplier_remarks+"</TEXTAREA></font></td>" +
            "<td align=center > <font size=2>" + supplier_id  + " </font></td>" +
            "<td align=center > <font size=2>" +  supplier_updated  + " </font></td>" + 
            "<td align=center > <font size=2><TEXTAREA  cols=70 rows=10  >"+ buyer_remarks+"</TEXTAREA></font></td>" +
            "<td align=center > <font size=2>" + buyer_id  + " </font></td>" +
            "<td align=center > <font size=2>" +  buyer_updated  + " </font></td>" + 
            "</tr>";
  } //end of for
} else {
	 outS += "<td align=center colspan=8 > <font size=2> No comment found. </font></td>" ;
}	//end of if


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
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/btnCategories.gif"></td>
  <td width="*" class="left_title">PO Comment History</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE width=900 border='0' align='center'>
<FORM NAME=frmMain action="original_sample_list.jsp" METHOD=POST >
	<INPUT TYPE=HIDDEN NAME=fromUrl VALUE= '<%= fromUrl %>' >
	<INPUT TYPE=HIDDEN NAME=pono VALUE='<%=po_no%>' >	
	<INPUT TYPE=HIDDEN NAME=ag_orderby value='<%= ag_orderby %>'>
    <INPUT TYPE=HIDDEN NAME=ag_status value='<%= ag_status %>'>
   <INPUT TYPE=HIDDEN NAME=ag_po_no value='<%= ag_po_no %>'>
   <INPUT TYPE=HIDDEN NAME=ag_style_no value='<%= ag_style_no %>'>
   <INPUT TYPE=HIDDEN NAME=ag_supplier value='<%= ag_supplier %>'>
   <INPUT TYPE=HIDDEN NAME=ag_from_date value='<%= ag_from_date %>'>
   <INPUT TYPE=HIDDEN NAME=ag_to_date value='<%= ag_to_date %>'>		
<tr>
  <td height='15'></td>
</tr>
</table>

<TABLE width='100%' border=0 cellpadding=0 cellspacing=1 align='center' class='table_bg'>
<tr class='table_header_center'>
<TD width='20' ><FONT size=2>Seq No. </FONT></TD>
<TD width='50'><FONT size=2>PO No. </FONT></TD>
<TD width='70'><FONT size=2>Remarks</FONT></TD>
<TD width='50'<FONT size=2>user ID </FONT></TD>
<TD width='50'><FONT size=2>Updated </FONT></TD>
<TD width='70'><FONT size=2>Buyer Remarks</FONT></TD>
<TD width='50'><FONT size=2>Buyer ID </FONT></TD>
<TD width='50'><FONT size=2>Updated </FONT></TD>
</tr>
<%=outS%>
</FORM>
</TABLE>
<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='Go back' onclick='fnBack(this.form);'>
  </td>
</tr>
</table>
<%
out.println(CopyRightLogo());
%>
</BODY>
</HTML>
