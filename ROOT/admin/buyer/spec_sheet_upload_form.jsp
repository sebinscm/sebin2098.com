<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=javascript src="/common/js/util.js"></script>
<script language="javascript">
function fnUpload(frm) {
  var isEntered = false;

  if (!jf_ChkValue(frm.brand.value)) {
    alert("Input Brand.");
    frm.brand.focus();
    return;
  }

  for (var i = 1; i <= 10; i++) {
    if (jf_ChkValue(frm['file'+i].value)) {
      isEntered = true;
      break;
    }
  }

  if (!isEntered) {
    alert("Input spec sheet file name.");
    frm.file1.focus();
    return;
  }

/*
  // check extension of file names
  for (var i = 1; i <= 10; i++) {
    if (jf_ChkValue(frm['file'+i].value)) {
      var ext = frm['file'+i].value.substr(frm['file'+i].value.lastIndexOf(".")+1);

      if (ext != "jpg") {
        alert("The extension of the file name must be 'jpg'.");
        frm['file'+i].select();
        return;
      }
    }
  }
*/

  if (confirm('Do you want to upload these files?')) {
    frm.action = './spec_sheet_upload_save.jsp';
    frm.submit();
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
  <td width='*' class='left_title'>Spec Sheet Upload</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>

<table width='80%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<form name='form1' method='post' enctype='multipart/form-data'>
<tr>
  <td width='20%' class='table_header_center'>Brand</td>
  <td width='80%' class='table_bg_bright'><select name='brand'>
<%
if (_admingroup.equals("B")) {
%>
    <option value='<%= _brand.equals("1") ? "VG" : (_brand.equals("2") ? "TEMT" : _brand) %>'><%= _brand.equals("1") ? "VG" : (_brand.equals("2") ? "TEMT" : _brand) %></option>
<%
} else {
%>
    <option value='' ></option>
    <option value='VG'>VG</option>
    <option value='TEMT'>TEMT</option>
<%
}
%>
  </select></td>
</tr>
<%
for (int i = 1; i <= 10; i++) {
%>
<tr>
  <td class='table_header_center'>File<%= i %></td>
  <td class='table_bg_bright'><input type='file' name='file<%= i %>' size='70'></td>
</tr>
<%
}
%>
</table>
<table width='80%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='reset' value='Reset'>
    <input type='button' value='Upload' onclick='fnUpload(this.form);'>
  </td>
</tr>
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</tr></td></table>
</body>
</html>