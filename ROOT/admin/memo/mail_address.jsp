<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
int iRet = 0;
int iCnt = 0;
String outS = "";
String sql = "";
Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // Read supplier list
  sql = " select  upper(name), id,supplier_class "
      + " from    login_01t "
      + " where   IFNULL(delete_yn, 'N') = 'N' "
      + " order by upper(name) ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception /admin/memo/mail_address : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

if (iRet > 0) {
  for (int i = 0; i < iRet; i++) {
    int j = 0;
    String name       = matrix.getRowData(i).getData(j++);
    String id         = matrix.getRowData(i).getData(j++);
    String userGroup  = matrix.getRowData(i).getData(j++);
  
    if (iCnt++ == 0) {
      outS += "<tr class='table_list'>";
    }
    
    outS += "<td><input type='checkbox' name='" + userGroup + "' value=\"" + id + "^" + name + "\"></td>"
          + "<td>" + name + "</td>";
  
    if (iCnt == 2) {
      outS += "</tr>\n";
      iCnt = 0;
    }
  }

  for (int i = iCnt; i < 2; i++) {
    outS += "<td></td><td></td>";
  }

  outS += "</tr>";
}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function fnSet(obj) {
  var objCollection;
  
  if (obj.value == '') {
    objCollection = obj.form.elements;
  } else {
    objCollection = obj.form[obj.value];
  }

  if (objCollection) {
    if (objCollection.length) {
      for (var i = 0; i < objCollection.length; i++) {
        if (objCollection[i].type == 'checkbox' && objCollection[i].name != '_check') {
          objCollection[i].checked = obj.checked;
        }
      }
    } else {
      if (objCollection.type == 'checkbox') {
        objCollection.checked = obj.checked;
      }
    }
  }
}

function fnSend(frm) {
  var ids = "";
  var obj = frm.elements;

  for (var i = 0; i < obj.length; i++) {
    if (obj[i].type == 'checkbox' && obj[i].checked && obj[i].name != '_check') {
      ids += obj[i].value + ";";
    }
  }

  if (ids == "") {
    alert("At least a receiver required.");
    return;
  }

  opener.document.frmMain.receiver.value = ids;
  top.close();
}
</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='5'></td>
</tr>
</table>
<table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<form name='form1' method='post'>
<tr>
  <td class='table_header_center'></td>
  <td class='table_header_center'>Buyer</td>
  <td class='table_header_center'></td>
  <td class='table_header_center'>Buyer</td>
  <td class='table_header_center'></td>
</tr>
<%= outS %>
</table>
<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>    
    <input type='checkbox' name='_check' value='' onclick='fnSet(this);'>Select All
    <br>
    <input type='button' value='OK' onclick='fnSend(this.form);'>
    <input type='reset' value='Reset'>
    <input type='button' value='Cancel' onclick='top.close();'>
  </td>
</tr>
<tr>
  <td height='5'></td>
</tr>
</form>
</table>
</body>
</html>