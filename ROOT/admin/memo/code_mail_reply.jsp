<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="login_check.jsp" %>

<%!
private String toHtml(String source)
{
	String nl="\n";
	String br="<br>";

	for( int index=0; (index= source.indexOf(nl, index)) >=0 ; index += br.length() )
		source = source.substring(0, index) + br + source.substring( index + nl.length() );
	return source;
	
}
%>

<%
DBConnManager dbPool = null;
boolean connState = false;
String	replyid = request.getParameter("replyid");
String	replyname = request.getParameter("replyname");
String username = firstname + " " + lastname;
String	receiver_list = request.getParameter("receiver");
String	receiver_names = request.getParameter("receiver_name");
String	title = request.getParameter("title");
String	content = request.getParameter("content");
content = toHtml( content );

boolean	check = false;
int	r_count = 0;
int	next_line = 0;
String result = "";
String outS = "";

dbPool = DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");
if( conn == null ) {
	connState = false;
} else {
	connState = true;
}

check = send_mail( userid, username, title, content,
			replyid, replyname, conn );
if( check ) {
	r_count++;
	next_line++;
	outS += "<TD><font size=2>" + replyname + "</font></TD>\n";
}

StringTokenizer id_token = new StringTokenizer( receiver_list, " ");
StringTokenizer name_token = new StringTokenizer( receiver_names, ",");

while( id_token.hasMoreElements() ) {
	String name = (String) name_token.nextElement();
	check = send_mail( userid, username, title, content,
			(String) id_token.nextElement(),
			name, conn );
	if( check ) {
		r_count++;
		next_line++;
		outS += "<TD><font size=2>" + name + "</font></TD>\n";
		if( next_line == 4 ) {
			next_line = 0;
			outS +="</TR><TR>";
		}
	}
}

if( r_count > 0 )
	result = "Mail sent to below person!";

dbPool.freeConnection("intranet", conn);
connState = false;

%>

<%!
	private boolean send_mail(String userid, String username, String title, String content,
		String receiver, String receiver_name, Connection conn)
	throws SQLException
{

int send_no = 0;
int recv_no = 0;
int iRet = 0;
boolean	send_result = false;

// Receiver's table
String sql ="";
Statement stmt;
ResultSet rs;

	// Receiver's table
	sql = "SELECT max(seqno) FROM mail_02t WHERE userid = '" + receiver + "'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if( rs.next() )
		recv_no = rs.getInt(1) + 1;
	else
		recv_no = 1;
	rs.close();
	stmt.close();

	// Sender's table
	sql = "SELECT max(seqno) FROM mail_01t WHERE userid = '" + userid + "'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if( rs.next() )
		send_no = rs.getInt(1) + 1;
	else
		send_no = 1;
	rs.close();
	stmt.close();

	sql = "INSERT INTO mail_02t( userid, seqno, s_seqno, sender_id, " +
		"sender_name, title, sentdate,content)" +
		"VALUES('" + receiver + "'," + recv_no + "," + send_no + ",'" +
		userid + "','" + username + "',?, sysdate(), ?)";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	iRet = pstmt.executeUpdate();
	pstmt.close();

	if( iRet == 0 ) {
		// response.sendRedirect("register_error.htm");
	} else {
		// Sender's table
		sql = "INSERT INTO mail_01t( userid, seqno, r_seqno, receiver_id, " +
			"receiver_name, title, sentdate, content )" +
			"VALUES('" + userid + "'," + send_no + "," + recv_no + ",'" +
				receiver + "','" + receiver_name + "',?, sysdate(), ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		iRet = pstmt.executeUpdate();
		pstmt.close();
		send_result = true;
	}
	return send_result;
}

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
<TABLE WIDTH=640 BORDER=1 CELLSPACING=1 CELLPADDING=0>
<TR>
<TD COLSPAN=4 align=center><%=result%></TD>
</TR>
<TR>
<%=outS%>
</TR>
<TR>
<TD COLSPAN=4 align=center>
<a href="mail_inbox.jsp"><IMG src="img/mail_ok.gif" border=0 onmouseover="this.src='img/mail_ok_over.gif'" onmouseout="this.src='img/mail_ok.gif'"></a>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>
