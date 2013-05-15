<%@page import="java.sql.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
int iRet = 0;
String strSep = "|!^";
String outS = "";
String sql = "";

Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix1 = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
// read dsk inspector list
sql = " select  i.code, i.name, i.user_type, c1.code_name, i.origin, c2.code_name, i.use_yn "
    + " from    vg_inspector i "
    + "         left outer join vg_common_code c1 "
    + "           on i.user_type = c1.code "
    + "           and c1.type = 'USER_TYPE' "
    + "         left outer join vg_common_code c2 "
    + "           on i.origin = c2.code "
    + "           and c2.type = 'USER_BRAND' "
    + (_adminid == null ? " where  i.user_type = '" + _admintype + "' " : "")
    + " order by c1.sort_order, i.code ";

try {

  matrix = new dbconn.MatrixDataSet();
  matrix1 = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  // read user type code info
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'USER_TYPE' ";
  
  if (_adminid != null) {
    sql += " and    related_code not in ('H', 'S') "
         + " and    code <> related_code ";
  } else {
    sql += " and    code = '" + _admintype + "' ";
  }

  sql += " and    use_yn = 'Y' "
       + " order by sort_order ";

  dataProcess.RetrieveData(sql, matrix1, conn);
  
  // read user brand code info
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'USER_BRAND' "
      + " and     use_yn = 'Y' "
      + " order by sort_order ";

  dataProcess.RetrieveData(sql, matrix2, conn);

} catch (Exception e) {
  System.out.println("Exception in /apess/inspector_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String inspectorId = matrix.getRowData(i).getData(j++);
  String inspectorName = matrix.getRowData(i).getData(j++);
  String inspectorType = matrix.getRowData(i).getData(j++);
  String inspectorTypeName = matrix.getRowData(i).getData(j++);
  String origin = matrix.getRowData(i).getData(j++);
  String originName = matrix.getRowData(i).getData(j++);
  String useYn = matrix.getRowData(i).getData(j++);

  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  String strLink = "<a href=\"javascript:fnSetData('"
                  + inspectorId + strSep
                  + StringUtil.replaceScriptString(inspectorName) + strSep
  //                + inspectorType + strSep
  //                + origin + strSep
                  + useYn
                  + "')\">" + inspectorId + "</a>";

  String useYnName = "";
  if (useYn.equals("Y")) useYnName = "YES";
  else if (useYn.equals("N")) useYnName = "NO";
  else useYnName = useYn;

  outS += "<tr align='center' style='background-color:" + bgColor + ";'>"
        + " <td>" + strLink + "</td>"
        + " <td align='left'>" + inspectorName + "</td>"
 //       + " <td>" + inspectorTypeName + "</td>"
 //       + " <td>" + originName + "</td>"
        + " <td>" + useYnName + "</td>"
        + "</tr>";
}

// print user type options
String userTypeOptions = "<option value=''></option>";

for (int i = 0; i < matrix1.getRowCount(); i++) {
  int j = 0;
  String code = matrix1.getRowData(i).getData(j++);
  String codeName = matrix1.getRowData(i).getData(j++);

  userTypeOptions += "<option value='" + code + "'>" + codeName + "</option>";
}

// print user brand options
String userBrandOptions = "<option value=''></option>";

for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String code = matrix2.getRowData(i).getData(j++);
  String codeName = matrix2.getRowData(i).getData(j++);

  userBrandOptions += "<option value='" + code + "'>" + codeName + "</option>";
}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=javascript src="/common/js/util.js"></script>
<script language="javascript">
function fnNew(frm) {
  frm.reset();
  frm.inspectorId.readOnly = false;
  frm.inspectorId.style.backgroundColor = '#ffffff';
  frm.inspectorId.focus();
}

function fnSave(frm) {
  if (!jf_ChkValue(frm.inspectorId.value)) {
    alert('Enter Inspector ID.');
    frm.inspectorId.select();
    return;
  }

  if (!jf_ChkValue(frm.inspectorName.value)) {
    alert('Enter Inspector Name.');
    frm.inspectorName.select();
    return;
  }

  if (frm.inspectorName.value.indexOf('"') >= 0) {
    alert('Double quotes(") are not accepted in Inspector Name.');
    frm.inspectorName.select();
    return;
  }

  //if (frm.userType.selectedIndex == 0) {
  //  alert('Enter Location.');
  //  frm.userType.focus();
  //  return;
  //}

  //if (frm.origin.selectedIndex == 0) {
 //   alert('Enter Brand.');
 //   frm.origin.focus();
 //   return;
 // }

  if (frm.useYn.selectedIndex == 0) {
    alert('Enter Use Y/N.');
    frm.useYn.focus();
    return;
  }

  if (confirm('Do you really want to save these data?')) {
    frm.action = './inspector_save.jsp';
    frm.submit();
  }
}

function fnDelete(frm) {
  if (frm.actionFlag.value != 'U' || !frm.inspectorId.value) {
    alert('Select an item you want to delete.');
    return;
  }

  if (confirm('Do you really want to delete the selected item?')) {
    frm.actionFlag.value = 'D';
    frm.action = './inspector_save.jsp';
    frm.submit();
  }
}

function fnSetData(strParams) {
  var params = strParams.split('<%= strSep %>');
  var j = 0;

  with (document.form1) {
    inspectorId.value = params[j++];
    inspectorName.value = params[j++];
    //jf_fnSetSelectOption(userType, params[j++]);
    //jf_fnSetSelectOption(origin, params[j++]);
    jf_fnSetSelectOption(useYn, params[j++]);

    actionFlag.value = 'U';
    inspectorId.readOnly = true;
    inspectorId.style.backgroundColor = '#e8e8e8';
  }
}
</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>

<table width='99%' border='0' cellspacing='0' cellpadding='0' align="center">
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/title_icon.gif'></td>
  <td width='*' class='left_title'>Inspector Management</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>

<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<form name='form1' method='post'>
<input type='hidden' name='actionFlag' value='I'>
<tr>
  <td width='20%' class='table_header_center'>Inspector ID(*)</td>
  <td width='30%' class='table_bg_bright'><input type='text' name='inspectorId' size='30' maxlength='10'></td>
  <td width='20%' class='table_header_center'>Inspector Name(*)</td>
  <td width='30%' class='table_bg_bright'><input type='text' name='inspectorName' size='30' maxlength='100'></td>
</tr>
<!--tr>
  <td class='table_header_center'>Location(*)</td>
  <td class='table_bg_bright'><select name='userType'><%= userTypeOptions %></select></td>
  <td class='table_header_center'>Brand(*)</td>
  <td class='table_bg_bright'><select name='origin'><%= userBrandOptions %></select></td>
</tr-->
<tr>
  <td class='table_header_center'>Use Y/N(*)</td>
  <td class='table_bg_bright'><select name='useYn'>
    <option></option>
    <option value='Y'>YES</option>
    <option value='N'>NO</option></select></td>
  <td class='table_header_center'> </td>
  <td class='table_bg_bright'> </td>
</tr>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
  	<%
  	   if ( _adminclass.equals("1")) {
     %>
    <input type='button' value='New' onclick='fnNew(this.form);' class="button_default">
    <input type='button' value='Save' onclick='fnSave(this.form);' class="button_default">
    <input type='button' value='Delete' onclick='fnDelete(this.form);' class="button_default">
      <% } %>
  </td>
</tr>
<tr>
  <td height='5'></td>
</tr>
</table>

<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td></td>
  <td align='right'>Total : <%= iRet %></td>
</tr>
</table>
<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<tr class='table_header_center'>
  <td>Inspector ID</td>
  <td>Inspector Name</td>
  <!--td>Location</td>
  <td>Brand</td-->
  <td>Use Y/N</td>
</tr>
<%= outS %>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
  	 <%
  	   if ( _adminclass.equals("1")) {
     %>
    <input type='button' value='New' onclick='fnNew(this.form);' class="button_default">
    <input type='button' value='Save' onclick='fnSave(this.form);' class="button_default">
    <input type='button' value='Delete' onclick='fnDelete(this.form);' class="button_default">
      <% } %>
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