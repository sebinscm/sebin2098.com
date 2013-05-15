<HTML>
<HEAD>
<!--SCRIPT LANGUAGE="JavaScript">
alert("This function's replaced by Outlook.\nPlease use Outlook from now on!");
history.back();
</SCRIPT -->
<script src="script/fieldval.js"></script>
<script src="script/mail.js"></script>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
</HEAD>
<BODY topmargin=0 leftmargin=3>
<%@ include file="main_head.html" %>

<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=0>
<TR>
<TD width="164" align="right">
<IMG src="img/mail_s_compose_over.jpg" border=0></td>
<TD><a href="mail_inbox.jsp">
<IMG src="img/mail_s_inbox.jpg" border=0 onmouseover="this.src='img/mail_s_inbox_over.jpg'" onmouseout="this.src='img/mail_s_inbox.jpg'"></a></TD>
<TD><a href="mail_sent.jsp">
<IMG src="img/mail_s_sent.jpg" border=0 onmouseover="this.src='img/mail_s_sent_over.jpg'" onmouseout="this.src='img/mail_s_sent.jpg'"></a></TD>
<TD><a href="mail_trash.jsp">
<IMG src="img/mail_s_trash.jpg" border=0 onmouseover="this.src='img/mail_s_trash_over.jpg'" onmouseout="this.src='img/mail_s_trash.jpg'"></a></TD>
</TR>
</TABLE>
<BR>

<FORM name="frmMain" method="POST" action="code_mailcomp.jsp">
	<TABLE border="0" width="797" height="357">
  <tr>
    <td width="4" height="30"><IMG SRC="img/mail_to.jpg" border=0></td>
    <td width="578" height="30">
    <p align="left">
    <input type="HIDDEN" name="receiver" >
    <input type="text" name="receiver_name" size="70" value="Click to add receiver " onfocus="blur(this)"><a href="javascript:recv_window()"><font size=2>Add</font></a></td>
  </tr>
  <tr><td width="4" height="16">
	&nbsp;</td>
    <td width="578" height="16">
	</td>
  </tr>
  <tr>
    <td width="38" height="30"><IMG SRC="img/mail_subject.jpg" border=0></td>
    <td width="745" height="30"><input type="text" name="title" size="73" maxlength=80></td>
  </tr>
  <tr>
    <td colspan=2 width="460" height="241">&nbsp;
    <textarea name="content" rows="17" cols="84"></textarea></td>
  </tr>
</table>
&nbsp;
    <a href="javascript:send()"><IMG SRC="img/mail_send.jpg" border=0 onmouseover="this.src='img/mail_send_over.jpg'" onmouseout="this.src='img/mail_send.jpg'" ></a><a href="javascript:reset()"><IMG SRC="img/mail_cancel.jpg" border=0 onmouseover="this.src='img/mail_cancel_over.jpg'" onmouseout="this.src='img/mail_cancel.jpg'" ></a>
</form>
</BODY>
</HTML>