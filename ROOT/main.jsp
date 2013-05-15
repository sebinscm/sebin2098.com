<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>

<%

dbconn.DBConnManager dbPool = null;
boolean connState = false;
int iRet = 0;

dbPool = dbconn.DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");

if( conn == null ) {
        connState = false;
} else {
        connState = true;
}
if( conn == null ) {
	connState = false;
	System.out.println("Get connection error!!! - from main.jsp");
} else {
	connState = true;
}
String table = "board_01t";
String image = "notice";

String sql = "SELECT b_id, b_name, b_title, b_ref, b_restep " +
	     " FROM " + table +
	     " ORDER BY B_REF DESC, B_RESTEP ASC " ;

dbconn.MatrixDataSet matrix = new dbconn.MatrixDataSet();
dbconn.DataProcess dataProcess = new dbconn.DataProcess();

String outS = "<table width=315 border=0 cellpadding=0 cellspacing=1>\n" +
	"<tr><td colspan=3><a href=\"board/board.jsp?table=" + table +
	"\"><img src='img/" + image + ".gif' border=0 " +
	"onmouseover=\"this.src='img/" + image + "_over.gif'\" " +
	"onmouseout=\"this.src='img/" + image + ".gif'\"></a></td></tr>";

if( connState ) {
	iRet = dataProcess.RetrieveData(sql, matrix, conn);
}
dbPool.freeConnection("intranet", conn);
connState = false;

int count = 0;
int current = iRet;
while( current > 0 && count < 7){
	outS += "<tr>\n<td width=30 align=center><font size=2>" +
		matrix.getRowData(count).getData(3) +
		"</td><td width=203><font size=2>";

	int level = Integer.parseInt(matrix.getRowData(count).getData(4));
	if( level > 0 )
		outS +="<img src=\"skin/default/images/re_icon.gif\">";

	outS += "<a href=\"board/board.jsp?branch=V&mypage=1&table=" +
		table + "&b_id=" + matrix.getRowData(count).getData(0) +
		"\" target=\"main\">" +
		matrix.getRowData(count).getData(2) +
		"</a></td><td width=80><font size=1>" +
		matrix.getRowData(count).getData(1) +
		"</td>\n</tr>\n" +
		"<tr><td colspan=3><img src=\"img/line.gif\" width=315 height=1></td></tr>";
	count++;
	current--;
}
outS += "</table><br>";

%>

<HTML>
<HEAD>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
</HEAD>
<BODY topmargin=0 leftmargin=3 link="#404040" vlink="gray" alink="#404040">
<TABLE border=0 width="640">
<TR><td height=61 colspan=2></td></tr>
<TR>
  <td width=80%></td>
  <td align=left>
	<a href="myfolder.jsp"><img src="img/myfolder.gif" onmouseover="this.src='img/myfolder_over.gif'" onmouseout="this.src='img/myfolder.gif'" border=0></a><br>
	<img src="img/line.gif" width=130 height=1><br>
	<a href="calendar.jsp"><img src="img/compfolder.gif" onmouseover="this.src='img/compfolder_over.gif'" onmouseout="this.src='img/compfolder.gif'" border=0></a><br>
	<img src="img/line.gif" width=130 height=1><br>
  </td>
</TR>
<TR><td height=48 colspan=2></td></tr>
</TABLE>
<TABLE border=0 width="640" cellpadding=0>
<TR height=190>
<TD valign=top><%=outS%></TD>
</TR>
</TABLE>
</BODY>
</HTML>

