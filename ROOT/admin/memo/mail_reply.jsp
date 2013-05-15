<%
	String replytitle = request.getParameter("replytitle");
	String replyid = request.getParameter("replyid");
	String replyname = request.getParameter("replyname");
%>
<HTML>
<HEAD>
<script src="fieldval.js"></script>
<script src="mail.js"></script>
<SCRIPT>
function send()
{
	if( ValidateFields())
	{
		frmMain.submit();
	}
}

function ValidateFields()
{
    bRetVal=false;
   
   	if (ValidateLength("title","Subject",1))
    {
           	bRetVal=true;
    }
    return bRetVal;
}
</SCRIPT>
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

<FORM name="frmMain" method="POST" action="code_mail_reply.jsp">
<input type="HIDDEN" name="replyid" value="<%=replyid%>">
<input type="HIDDEN" name="replyname" value="<%=replyname%>">
<TABLE border="0" width="640">
  <tr>
    <TD>&nbsp;&nbsp;<IMG SRC="img/mail_reply.gif"></TD>
    <td><%=replyname%></td>
  </tr>
  <tr>
    <td width=100>
	<a href="javascript:recv_window()"><IMG SRC="img/mail_add.jpg" border=0 onmouseover="this.src='img/mail_add_over.jpg'" onmouseout="this.src='img/mail_add.jpg'" ></a>
	</td>
    <td width=540>
	<input type="HIDDEN" name="receiver" >
	<input type="text" name="receiver_name" size="60" value="Click to add CC" onfocus="blur(this)">
	</td>
  </tr>
  <tr>
    <td><IMG SRC="img/mail_subject.jpg" border=0></td>
    <td><input type="text" name="title" size="60" maxlength=80 value="RE: <%=replytitle%>" ></td>
  </tr>
  <tr>
    <td colspan=2>
    <textarea name="content" rows="15" cols="80"></textarea></td>
  </tr>
</table>
<a href="javascript:send()"><IMG 
SRC="img/mail_send.jpg" border=0 onmouseover="this.src='img/mail_send_over.jpg'" 
onmouseout="this.src='img/mail_send.jpg'" ></a><a href="javascript:reset()"><IMG 
SRC="img/mail_reset.jpg" border=0 onmouseover="this.src='img/mail_reset_over.jpg'" 
onmouseout="this.src='img/mail_reset.jpg'" ></a>
</form>
</BODY>
</HTML>
