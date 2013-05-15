<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ include file="login_check.jsp" %>

<%!
private String fromHtml(String source)
{
    String br="";
    String nl="<br>";

    for( int index=0; (index= source.indexOf(nl, index)) >=0 ; index += br.length() )
        source = source.substring(0, index) + br + source.substring( index + nl.length() );
    return source;

}
%>
<%

DBConnManager dbPool = null;
boolean connState = false;
int iRet = 0;

dbPool = DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");
if( conn == null ) {
    connState = false;
} else {
    connState = true;
}

String seqno = request.getParameter("checkid");
String replydate = request.getParameter("replydate");
String replyname = request.getParameter("replyname");
String replytitle = request.getParameter("replytitle");
String content = "";
String sql = "SELECT content FROM mail_02t " +
			" WHERE userid = '" + userid + "' AND seqno = " + seqno;
if( connState ) {
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    if( rs.next() ) {
		content = rs.getString(1);
	}
	rs.close();
	stmt.close();
	dbPool.freeConnection("intranet", conn);
    connState = false;
}

content = "\n\n\n===================================================\n" +
		"From : " + replyname +"\nDate : " + replydate +
		"\nSubject : " + replytitle + "\n\n" +
		fromHtml(content);

%>
<HTML>
<HEAD>
<script src="fieldval.js"></script>
<script src="mail.js"></script>
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
<TABLE border="0" width="640">
  <tr>
    <td width=100>
	<a href="javascript:recv_window()"><IMG SRC="img/mail_add.jpg" border=0 onmouseover="this.src='img/mail_add_over.jpg'" onmouseout="this.src='img/mail_add.jpg'" ></a>
	</td>
    <td width=540>
	<input type="HIDDEN" name="receiver" >
	<input type="text" name="receiver_name" size="60" value="Click to add" onfocus="blur(this)">
	</td>
  </tr>
  <tr>
    <td><IMG SRC="img/mail_subject.jpg" border=0></td>
    <td><input type="text" name="title" size="60" maxlength=80 value="FW: <%=replytitle%>" ></td>
  </tr>
  <tr>
    <td colspan=2>
    <textarea name="content" rows="20" cols="80"><%=content%></textarea></td>
  </tr>
</table>
<a href="javascript:send()"><IMG SRC="img/mail_send.jpg" border=0 
onmouseover="this.src='img/mail_send_over.jpg'" 
onmouseout="this.src='img/mail_send.jpg'" ></a><a 
href="javascript:reset()"><IMG SRC="img/mail_reset.jpg" border=0 
onmouseover="this.src='img/mail_reset_over.jpg'" 
onmouseout="this.src='img/mail_reset.jpg'" ></a>
</FORM>
</BODY>
</HTML>
