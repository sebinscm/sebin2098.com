<%@ include file="/login_check.jsp" %>
<%@ include file="/bottom_line2.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String id = request.getParameter("id");
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT for="document" event="onkeypress">
if (window.event.keyCode==13)
{
        ChangePW()
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
function init()
{
  frmPass.password.focus();
}

function Reset()
{
  frmPass.reset();
}
function Cancel()
{
  history.back();
}
function ChangePW()
{
  var check = frmPass.password.value;
  if( check.length < 1 ) {
    alert('New password must be at least 1 characters.');
    return;
  }
  if( frmPass.password.value == '1111' || frmPass.password.value == '1234' ) {
    alert('Your new password is not allowed for security reason! Please input new password with strong word.');
    return;
  }
  if( frmPass.password.value == frmPass.confirm.value ) {
    frmPass.submit();
  }else {
    alert('New Password and retype password must be same.');
  }
}
</SCRIPT>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
</HEAD>
<BODY ONLOAD="init();" bgcolor="white" TOPMARGIN=5 LEFTMARGIN=5>
<center>
<TABlE width="679" height="83">
<TR><TD width="671" height="79"></TD>
</TABLE>
<FORM NAME="frmPass" ACTION="code_initpass.jsp" METHOD=POST>
<input type='hidden' name='id' value='<%= id %>'>
<TABLE WIDTH=681 height="288" >
<TR> <TD height="284" width="673">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="23%" rowspan="4"><img border="0" src="img/pass.jpg" width="143" height="155"></td>
    <td width="46%" colspan="2">
      <p align="center"><b><font size="2" face="Verdana" color="#0000FF">Please input your new password.</font></b></td>
    <td width="31%" rowspan="4"></td>
  </tr>
  <tr>
    <td width="22%">
      <p align="center"><FONT SIZE=2>Buyer ID</font></td>
    <td width="24%">
      <p align="center"><FONT SIZE=2><%= id %></font></td>
  </tr>
  <tr>
    <td width="22%">
      <p align="center"><FONT SIZE=2>New password</font></td>
    <td width="24%">
      <p align="center"><INPUT TYPE="password" NAME="password" SIZE=18 MAXLENGTH=10></td>
  </tr>
  <tr>
    <td width="22%">
      <p align="center"><FONT SIZE=2>Confirm passoword</td>
      <td width="24%">
        <p align="center"><INPUT TYPE="password" NAME="confirm" SIZE=18 MAXLENGTH=10></td>
    </tr>
    <tr>
      <td width="50%" colspan="3">
        <p align="center"><INPUT TYPE=BUTTON VALUE="Apply" ONCLICK="JavaScript:ChangePW()"> <INPUT TYPE=BUTTON VALUE="Cancel" ONCLICK="JavaScript:Cancel()">
      </td>
    </tr>
  </table>

</TD></TR>
</FORM>
</TABLE>
<CENTER>
<%
out.println(CopyRightLogo());
%>
</BODY>
</HTML>
