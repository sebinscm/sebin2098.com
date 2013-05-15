<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
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
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // Read Admin User List
  sql = " select  adminid, adminname, rpad('*', lengthb(password), '*'), admintype, "
      + "         admingroup, brand, adminclass,email "
      + " from    admin_01t "
      + " where   admintype = 'H' "
      + " order by admingroup, brand desc, adminclass, adminid ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception /admin/adminuser/list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

for (int i = 0; i < iRet; i++) {
  int j = 0;

  String adminId    = matrix.getRowData(i).getData(j++);
  String adminName  = matrix.getRowData(i).getData(j++);
  String password   = matrix.getRowData(i).getData(j++);
  String adminType  = matrix.getRowData(i).getData(j++);
  String adminGroup = matrix.getRowData(i).getData(j++);
  String brand      = matrix.getRowData(i).getData(j++);
  String adminClass = matrix.getRowData(i).getData(j++);
  String email      = matrix.getRowData(i).getData(j++);

  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  String strLink = "<a href=\"javascript:fnSetData('"
                  + adminId + strSep
                  + StringUtil.replaceScriptString(adminName) + strSep
                  + StringUtil.replaceScriptString(password) + strSep
                  + adminType + strSep
                  + adminGroup + strSep
                  + brand + strSep
                  + adminClass+ strSep
                  + email
                  + "')\">" + adminId + "</a>";

  String adminTypeName = "";
  if (adminType.equals("H")) adminTypeName = "본사";

  String adminGroupName = "";
  if (adminGroup.equals("A")) adminGroupName = "시스템관리자";
  else if (adminGroup.equals("B")) adminGroupName = "PO관리자";
  else if (adminGroup.equals("S")) adminGroupName = "일반사용자";

  String brandName = "";
  if (brand.equals("1")) brandName = "의류";
  else if (brand.equals("2")) brandName = "악세사리";

  String adminClassName = "";
  if (adminClass.equals("1")) adminClassName = "입력";
  else if (adminClass.equals("2")) adminClassName = "조회";

  outS += "<tr align='center' style='background-color:" + bgColor + ";'>"
        + " <td>" + strLink + "</td>"
        + " <td align='left'>" + adminName + "</td>"
        + " <td>" + adminTypeName + "</td>"
        + " <td>" + adminGroupName + "</td>"
        + " <td>" + brandName + "</td>"
        + " <td>" + adminClassName + "</td>"
        + " <td>" + email + "</td>"
        + "</tr>";
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
  frm.adminId.readOnly = false;
  frm.adminId.style.backgroundColor = '#ffffff';
  frm.password.readOnly = false;
  frm.password.style.backgroundColor = '#ffffff';
  frm.adminId.focus();
}

function fnSave(frm) {
  if (!jf_IsNumeric(frm.adminId.value)) {
    alert('Input Admin ID. Numbers are only accepted.');
    frm.adminId.select();
    return;
  }

  if (!jf_ChkValue(frm.adminName.value)) {
    alert('Input Admin Name.');
    frm.adminName.select();
    return;
  }

  if (frm.adminName.value.indexOf('"') >= 0) {
    alert('Double quotes(") are not accepted in Admin Name.');
    frm.adminName.select();
    return;
  }

  if (!frm.password.value) {
    alert('Input Password.');
    frm.password.select();
    return;
  }

  if (frm.password.value.indexOf('"') >= 0) {
    alert('Double quotes(") are not accepted in Password.');
    frm.password.select();
    return;
  }

  if (frm.adminType.selectedIndex == 0) {
    alert('Input Type!');
    frm.adminType.focus();
    return;
  }

  if (frm.adminGroup.selectedIndex == 0) {
    alert('Input Admin Group.');
    frm.adminGroup.focus();
    return;
  }
  if ( !frm.email.value) {
  	alert('Input email');
    frm.email.select();
    return;
  } else {
  	var email = frm.email.value.split(',');
    for(i=0; i<email.length; i++) {
      if(email[i].value != '') {
        var emailEx1 = /^([A-Za-z0-9]{0,1})([A-Za-z0-9]{1,15})([A-Za-z0-9-_.]{0,1})([A-Za-z0-9]{1,15})([A-Za-z0-9]{0,1})(@{1})([A-Za-z0-9_]{1,15})(.{1})([A-Za-z0-9_]{2,10})(.{1}[A-Za-z]{2,10})?(.{1}[A-Za-z]{2,10})?$/;
        if(!emailEx1.test(email[i])) {
           alert ('E-mail 형식이 잘못되었습니다(빈칸은 들어갈 수 없습니다.)');
           form.email.focus();
           return;
        }
       }
     }  	
  }	  
  //if (frm.adminGroup.value == 'B') {
  //  if (frm.brand.selectedIndex == 0) {
  //    alert('Input Type!');
  //    frm.brand.focus();
  //    return;
  //  }

  if (frm.adminClass.selectedIndex == 0) {
      alert('Input Class.');
      frm.adminClass.focus();
      return;
  }
  
  
  if (confirm('Do you really want to save these data?')) {
    // if the user is not a buyer, clear brand, class values.
    //if (frm.adminGroup.value != 'B') {
    //  frm.brand.selectedIndex = 0;
    //  frm.adminClass.selectedIndex = 0;
    //}

    // if the user belongs to Non-Apparel buyer, clear the brand value.
    //if (frm.adminClass.value == '2') {
    //  frm.brand.selectedIndex = 0;
    //}

    frm.action = './save.jsp';
    frm.submit();
  }
}

function fnDelete(frm) {
  if (frm.actionFlag.value != 'U' || !frm.adminId.value) {
    alert('Select an item you want to delete.');
    return;
  }

  if (confirm('Do you really want to delete the selected item?')) {
    frm.actionFlag.value = 'D';
    frm.action = './save.jsp';
    frm.submit();
  }
}

function fnInitPasswd(frm) {
  if (frm.actionFlag.value != 'U' || !frm.adminId.value) {
    alert('Select an item you want to initialize.');
    return;
  }

  if (confirm('Do you really want to initialize the selected item?')) {
    frm.actionFlag.value = 'P';
    frm.action = './save.jsp';
    frm.submit();
  }
}

function fnSetData(strParams) {
  var params = strParams.split('<%= strSep %>');
  var j = 0;

  with (document.form1) {
    adminId.value = params[j++];
    adminName.value = params[j++];
    password.value = params[j++];
    jf_fnSetSelectOption(adminType, params[j++]);
    jf_fnSetSelectOption(adminGroup, params[j++]);
    jf_fnSetSelectOption(brand, params[j++]);
    jf_fnSetSelectOption(adminClass, params[j++]);
    email.value = params[j++];

    actionFlag.value = 'U';
    adminId.readOnly = true;
    adminId.style.backgroundColor = '#e8e8e8';
    password.readOnly = true;
    password.style.backgroundColor = '#e8e8e8';
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
  <td width='3%'><img src='/img/image1.gif'></td>
  <td width='*' class='left_title'>사용자관리(Admin)</td>
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
  <td width='20%' class='table_header_center'>Admin ID(*)</td>
  <td width='30%' class='table_bg_bright'><input type='text' name='adminId' size='30' maxlength='10'></td>
  <td width='20%' class='table_header_center'>Admin Name(*)</td>
  <td width='30%' class='table_bg_bright'><input type='text' name='adminName' size='30' maxlength='30'></td>
</tr>
<tr>
  <td class='table_header_center'>Password(*)</td>
  <td class='table_bg_bright'><input type='password' name='password' size='30' maxlength='20'></td>
  <td class='table_header_center'>Location(*)</td>
  <td class='table_bg_bright'><select name='adminType'>
    <option></option>
    <option value='H'>본사</option></select></td>
</tr>
<tr>
  <td class='table_header_center'>Admin Group(*)</td>
  <td class='table_bg_bright'><select name='adminGroup'>
    <option></option>
    <option value='S'>일반사용자 </option>
    <option value='A'>시스템관리자 </option>
    <option value='B'>PO관리자 </option></td>
  <td class='table_header_center'> 상품관리 구분 </td>
  <td class='table_bg_bright'><select name='brand'>
    <option></option>
    <option value='1'>의류 </option>
    <option value='2'>악세사리 </option></select></td>
</tr>
<tr>
  <td class='table_header_center'>email</td>
  <td class='table_bg_bright'><input type='text' name='email' size='40' maxlength='40'></td>
  <td class='table_header_center'>권한</td>
  <td class='table_bg_bright'><select name='adminClass'>
    <option></option>
    <option value='1'>입력 </option>
    <option value='2'>조회 </option></select></td>
</tr>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='신규입력' onclick='fnNew(this.form);'>
    <input type='button' value='저장' onclick='fnSave(this.form);'>
    <input type='button' value='삭제' onclick='fnDelete(this.form);'>
    <input type='button' value='비밀번호 초기화' onclick='fnInitPasswd(this.form);'>
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
  <td>User ID</td>
  <td>User Name</td>
  <td>근무지역 </td>
  <td>User Group</td>
  <td>상품관리 구분 </td>
  <td>사용자 구분 </td>
  <td>email </td>
</tr>
<%= outS %>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='신규입력' onclick='fnNew(this.form);'>
    <input type='button' value='저장' onclick='fnSave(this.form);'>
    <input type='button' value='삭제' onclick='fnDelete(this.form);'>
    <input type='button' value='비밀번호 초기화' onclick='fnInitPasswd(this.form);'>
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