<%@page import="java.sql.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
int iRet = 0;
String strSep = "|!^";
String outS = "";
String sql = "";

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;


try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // Sub Supplier List
  sql = " select  seqno,size_01,size_02 ,size_03,size_04 ,size_05,size_06 ,size_07,size_08  "
       + " from    size_label order by seqno  " ;

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception /codes/size_list : " + e.getMessage());
  throw e;
} finally {
   if (conn != null) {conn.close();}	
}

for (int i = 0; i < iRet; i++) {
  int j = 0;

  String seqno         = matrix.getRowData(i).getData(j++);
  String size_01       = matrix.getRowData(i).getData(j++);
  String size_02       = matrix.getRowData(i).getData(j++);
  String size_03       = matrix.getRowData(i).getData(j++);
  String size_04       = matrix.getRowData(i).getData(j++);
  String size_05       = matrix.getRowData(i).getData(j++);
  String size_06       = matrix.getRowData(i).getData(j++);
  String size_07       = matrix.getRowData(i).getData(j++);
  String size_08       = matrix.getRowData(i).getData(j++);

  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  String strLink = "<a href=\"javascript:fnSetData('" 
                       + seqno+ strSep + 
                       + size_01+ strSep + 
                       + size_02+ strSep + 
                       + size_03+ strSep + 
                       + size_04+ strSep + 
                       + size_05+ strSep + 
                       + size_06+ strSep + 
                       + size_07+ strSep + 
                       + size_08+ strSep +                         
                        "')\">" + seqno + "</a>";

  outS += "<tr align='center' style='background-color:" + bgColor + ";'>"
        + " <td>" + strLink + "</td>"
        + " <td align='left'>" + size_01 + "</td>"
        + " <td align='left'>" + size_02 + "</td>"
        + " <td align='left'>" + size_03 + "</td>"
        + " <td align='left'>" + size_04 + "</td>"
        + " <td align='left'>" + size_05 + "</td>"
        + " <td align='left'>" + size_06 + "</td>"
        + " <td align='left'>" + size_07 + "</td>"
        + " <td align='left'>" + size_08 + "</td>" 
        + "</tr>";
}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=javascript src="/common/js/util.js"></script>
<script language="javascript">
function fnSearch(frm) {
  frm.action = './size_list.jsp';
  frm.submit();
}

function fnNew(frm) {
  frm.reset();
  frm.id.focus();
}

function fnSave(frm) {
  if (!jf_IsNumeric(frm.seqno.value)) {
    alert('Input size label code. Numbers are only accepted.');
    frm.seqno.select();
    return;
  }  

  if (confirm('Do you really want to save these data?')) {
    frm.action = './size_save.jsp';
    frm.submit();
  }
}

function fnDelete(frm) {
  if (!frm.seqno.value ) {
    alert('Select an item you want to delete.');
    return;
  }

  if (confirm('Do you really want to delete the selected item?')) {
    frm.actionFlag.value = 'D';
    frm.action = './size_save.jsp';
    frm.submit();
  }
}

function fnSetData(strParams) {
  var params = strParams.split('<%= strSep %>');
  var j = 0;

  with (document.form2) {
    seqno.value = params[j++];
    subname.value = params[j++];
    id.readOnly = true;
    id.style.backgroundColor = '#e8e8e8';
    actionFlag.value = 'U';
  }
}
</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>

<table width='99%' border='0' cellspacing='0' cellpadding='0'>
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/title_icon.gif'></td>
  <td width='*' class='left_title'>Size Label관리</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
</table>
<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<form name='form2' method='post'>
<input type='hidden' name='actionFlag' value='I'>
<input type='hidden' name='searchId' value='<%= searchId %>'>
<tr>
  <td width='25%' class='table_header_center'>Code(*)</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='id' size='5' maxlength='5'></td>
  <td width='25%' class='table_header_center'>Size01</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='size01' size='5' maxlength='5'></td>
    <td width='25%' class='table_header_center'>Size02</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='size02' size='5' maxlength='5'></td>
    <td width='25%' class='table_header_center'>Size03</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='size03' size='5' maxlength='5'></td>
    <td width='25%' class='table_header_center'>Size04</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='size04' size='5' maxlength='5'></td>
    <td width='25%' class='table_header_center'>Size05</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='size05' size='5' maxlength='5'></td>
    <td width='25%' class='table_header_center'>Size06</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='size06' size='5' maxlength='5'></td>
    <td width='25%' class='table_header_center'>Size07</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='size07' size='5' maxlength='5'></td>
    <td width='25%' class='table_header_center'>Size08</td>
  <td width='25%' class='table_bg_bright'><input type='text' name='size08' size='5' maxlength='5'></td>
</tr>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='New' onclick='fnNew(this.form);'>
    <input type='button' value='Save' onclick='fnSave(this.form);'>
    <input type='button' value='Delete' onclick='fnDelete(this.form);'>
  </td>
</tr>
<tr>
  <td height='15'></td>
</tr>
</table>
<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<tr class='table_header_center'>
  <td width='15%'>Ciode</td>
  <td width='45%'>생산업체명</td>
</tr>
<%= outS %>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='New' onclick='fnNew(this.form);'>
    <input type='button' value='Save' onclick='fnSave(this.form);'>
    <input type='button' value='Delete' onclick='fnDelete(this.form);'>
  </td>
</tr>
</table>
</form>
<%
out.println(CopyRightLogo());
%>
</tr></td></table>
</body>
</html>