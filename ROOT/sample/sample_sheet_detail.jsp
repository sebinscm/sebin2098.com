<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

int iRet = 0;
Connection conn = null;
Connection connVGMain = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

String fromUrl = "/sample/sample_sheet_list.jsp";
String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchStyleNo = request.getParameter("searchStyleNo");
String searchStatus = request.getParameter("statusOptions");

String sequence_no = request.getParameter("sequence_no");
String sample_no = request.getParameter("sample_no");
String buyer_id = scmid;

if (sequence_no == null) sequence_no = "";
if (sample_no == null) sample_no = "";
if (buyer_id == null) buyer_id = "";

String attached_file1 = "";
String attached_file2 = "";
String attached_file3 = "";
String modified  = "&nbsp;";
String send_date = "&nbsp;";
String return_date = "&nbsp;";
String created  = "&nbsp;";
String buyer_name ="";
String modifier ="";
String remarks ="";
String comments ="";

boolean isEditable = false;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

    // read invoice header info
  sql = " select date_format(a.modified_date, '%Y/%m/%d'), " +
        "        a.afile1_name, a.afile2_name, a.afile3_name, " +
        "        date_format(a.sending_date, '%Y/%m/%d'),date_format(a.return_date, '%Y/%m/%d'),c.name ," +
        "        date_format(a.input_date, '%Y/%m/%d'), a.modifier,a.remarks, a.comments "  +
        "   from VG_SAMPLE_IN_OUT a  LEFT OUTER JOIN login_01t c ON ( a.buyer = c.id )  " +
        "   where a.sequence_no = '" + sequence_no   + "'";

 // out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    modified = matrix.getRowData(0).getData(j++);
    attached_file1 = matrix.getRowData(0).getData(j++);
    attached_file2 = matrix.getRowData(0).getData(j++);
    attached_file3 = matrix.getRowData(0).getData(j++);
    send_date = matrix.getRowData(0).getData(j++);
    return_date = matrix.getRowData(0).getData(j++);
    buyer_name = matrix.getRowData(0).getData(j++);
    created = matrix.getRowData(0).getData(j++);    
    modifier= matrix.getRowData(0).getData(j++);   
    remarks = matrix.getRowData(0).getData(j++);    
    comments= matrix.getRowData(0).getData(j++);   
  }

    
} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice_edit_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE=JavaScript>

function fnList(frm) {
  //frm.target = self.name;
  frm.action = './sample_sheet_list.jsp';
  frm.submit();
}

function fnDownload(file) {
  with (document.form2) {
    attachFile.value = file;
    attachRealFile.value = file;
    action = '/common/download.jsp';
    target = 'hiddenFrm';
    submit();
  }
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Sample Sheet Details</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><b>Sample Detail</b></td>
</tr>
</table>
<TABLE WIDTH='95%' border="0" cellspacing="1" cellpadding="0" align="center" class="table_bg">
<FORM NAME='frmMain' METHOD='POST' enctype="multipart/form-data">
  
<TR>
  <TD width='150' class='table_header_center'>Sample No.</TD>
  <TD width='200' class='table_bg_bright'><%= sample_no %></TD>
  <TD width='100' class='table_header_center'> Updated</TD>
  <TD width='150' class='table_bg_bright'><%= modified %></TD>
   <TD width='100' class='table_header_center'>Sent date</TD>
  <TD width='100' class='table_bg_bright'><%= send_date %></TD>
</TR>
<TR>
  <TD width='150' class='table_header_center'>Buyer</TD>
  <TD width='200' class='table_bg_bright'><%= buyer_name %></TD>
  <TD width='100' class='table_header_center'> Created</TD>
  <TD width='150' class='table_bg_bright'><%= created %></TD>
   <TD width='200' class='table_header_center'>Updated D</TD>
  <TD width='100' class='table_bg_bright'><%= modifier %></TD>
</TR>
<TR>
  <TD width='150' class='table_header_center'>Sample Sheet</TD>
  <TD width='200' class='table_bg_bright' colspan=2 ><a href="javascript:fnDownload('<%= attached_file1 %>');"><%= attached_file1 %></a></TD> 
   </TR>
 <TR>
   <TD width='150' class='table_header_center'>Request Sheet</TD>
  <TD  width='200'class='table_bg_bright' colspan=2><a href="javascript:fnDownload('<%= attached_file2 %>');"><%= attached_file2 %></a></TD>
  </TR>
  <TR>
  <TD width='150' class='table_header_center'>Amend Sheet</TD>
  <TD width='200' class='table_bg_bright' colspan=2><a href="javascript:fnDownload('<%= attached_file3 %>');"><%= attached_file3 %></a></TD>
</TR>
  <TR>
   <TD  class='table_header_center' colspan=3>Supplier comments</TD>
   <TD  class='table_header_center'colspan=3 >Buyer comments</TD>
 </TR>
 
   <TR>
  <TD class='table_header_center' colspan=3><textarea  name="remarks" cols="70" rows="15" ><%= remarks %></textarea></td>
  <TD class='table_header_center' colspan=3><textarea  name="comments" cols="70" rows="15" ><%= comments %></textarea></td>
   </TR>

</FORM>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" align='center'>
<form name='form1' method='post'>
 <input type='hidden' name='searchFromDate' value='<%= searchFromDate %>'>
  <input type='hidden' name='searchToDate' value='<%= searchToDate %>'>
  <input type='hidden' name='searchItemClass' value='<%= searchItemClass %>'>
  <input type='hidden' name='searchSupplier' value='<%= searchSupplier %>'>
  <input type='hidden' name='searchItemGroup' value='<%= searchItemGroup %>'>
  <input type='hidden' name='searchSampleNo' value='<%= searchSampleNo %>'>
  <input type='hidden' name='statusOptions' value='<%= searchStatus %>'>
  <input type='hidden' name='searchStyleNo' value='<%= searchStyleNo %>'>
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%">
    <input type='button' value='Go To List' onclick='fnList(this.form);'>
  </td>
</tr>
<tr>
  <td width="100%" height="10"></td>
</tr>
</form>
<form name='form2' method='post'>
<input type='hidden' name='attachPath' value='<%= _specSheetUrl  %>'>
<input type='hidden' name='attachFile'>
<input type='hidden' name='attachRealFile'>
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>
</BODY>
</HTML>
