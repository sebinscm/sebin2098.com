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
  
  for (var i = 1; i <= 10; i++) {
    if (jf_ChkValue(frm['file'+i].value)) {
      isEntered = true;
      break;
    }
  }

  if (!isEntered) {
    alert("Input image file name.\nThe extension of the file name must be 'jpg'.");
    frm.file1.focus();
    return;
  }

  // check extension of file names
  for (var i = 1; i <= 10; i++) {
    if (jf_ChkValue(frm['file'+i].value)) {
      var ext = frm['file'+i].value.substr(frm['file'+i].value.lastIndexOf(".")+1);

      if (ext != "jpg" && ext != "JPG") {
        alert("The extension of the file name must be 'jpg' or 'JPG'.");
        frm['file'+i].select();
        return;
      }
    }
  }

  if (confirm('Do you want to upload these files?')) {
    frm.action = './style_image_upload_save.jsp';
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
  <td width='3%'><img src='/img/image_upload.jpg'></td>
  <td width='*' class='left_title'>Sample Image Upload</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>
** You can upload max 10 images at once. Image file name must be 'Sample#.jpg' format.
<table width='80%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<form name='form1' method='post' enctype='multipart/form-data'>
<%
for (int i = 1; i <= 10; i++) {
%>
<tr>
  <td width='20%' class='table_header_center'>File<%= i %></td>
  <td width='80%' class='table_bg_bright'><input type='file' name='file<%= i %>' size='70'></td>
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