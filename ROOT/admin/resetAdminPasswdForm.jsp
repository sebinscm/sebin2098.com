<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%
String fromURL = request.getParameter("fromURL");
if (fromURL == null) fromURL = "";
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

function ChangePW()
{
  if( frmPass.password.value.length < 4 ) {
    alert('The password should be at least 4 characters.');
    frmPass.password.focus();
    return;
  }

  if (frmPass.password.value.indexOf('"') >= 0) {
    alert('Double quotes(") are not accepted in Password.');
    frmPass.password.select();
    return;
  }

  if( frmPass.password.value != frmPass.confirm.value ) {
    alert('New Password and Retype password must be same.');
    return;
  }

  frmPass.submit();
}
</SCRIPT>
</HEAD>
<BODY ONLOAD="init();" bgcolor="white" TOPMARGIN=5 LEFTMARGIN=5>
<center>
<TABlE width="679" height="83">
<TR><TD width="671" height="79"></TD>
</TABLE>
<FORM NAME="frmPass" ACTION="resetAdminPasswd.jsp" METHOD=POST>
<input type='hidden' name='fromURL' value='<%= fromURL %>'>
<TABLE WIDTH=681 height="288" >
<TR> <TD height="284" width="673">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="23%" rowspan="4"><img border="0" src="/img/pass.jpg" width="143" height="155"></td>
    <td width="46%" colspan="2">
      <p align="center"><b><font size="2" face="Verdana" color="#0000FF">Please input the new password.</font></b></td>
    <td width="31%" rowspan="4"></td>
  </tr>
  <tr>
    <td width="22%">
      <p align="center"><FONT SIZE=2>User ID</font></td>
    <td width="24%">
      <p align="center"><FONT SIZE=2><%= _adminid %></font></td>
  </tr>
  <tr>
    <td width="22%">
      <p align="center"><FONT SIZE=2>New Password</font></td>
    <td width="24%">
      <p align="center"><INPUT TYPE="password" NAME="password" SIZE=20 MAXLENGTH=20></td>
  </tr>
  <tr>
    <td width="22%">
      <p align="center"><FONT SIZE=2>Re-type Password</td>
      <td width="24%">
        <p align="center"><INPUT TYPE="password" NAME="confirm" SIZE=20 MAXLENGTH=20></td>
    </tr>
    <tr>
      <td width="46%" colspan="3">
        <p align="center"><INPUT TYPE=BUTTON VALUE="Modify" ONCLICK="JavaScript:ChangePW()">
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
