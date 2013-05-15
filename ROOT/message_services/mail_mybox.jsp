<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ include file="login_check.jsp" %>

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

String sql = "SELECT seqno, sender_name,title," +
			"IF(STRCMP(date_format(sentdate,'%Y%m%d'),date_format(sysdate()," +
			"'%Y%m%d')),date_format(sentdate,'%Y-%m-%d')," +
			"date_format(sentdate,'%T')), " +
			"IF(STRCMP(date_format(receive,'%Y%m%d'),date_format(sysdate()," +
			"'%Y%m%d')),date_format(receive,'%Y-%m-%d')," +
			"date_format(receive,'%T')), " +
			" read_flag " +
		" FROM mail_02t " +
		" WHERE userid = '" + userid +
		"' AND read_flag = '2' AND del_flag is null " +
		" ORDER BY seqno ASC ";
MatrixDataSet matrix = new dbconn.MatrixDataSet();
DataProcess dataProcess = new DataProcess();

String outS = "";

if( connState ) {
	iRet = dataProcess.RetrieveData(sql, matrix, conn);
	while( iRet > 0 ) {

		String title = matrix.getRowData(iRet-1).getData(2);
		if( title.length() > 48 ) {
			title = title.substring(0,48) + "...";
		}

		outS += "<tr><td> </td>\n<td align=center><font size=2>" +
			"<input type=checkbox name=checkid" + iRet + " value=\"" +
			matrix.getRowData(iRet-1).getData(0) +
            "\"></td>\n<td><font size=2>" +
			matrix.getRowData(iRet-1).getData(1) +
			"</td>\n<td><font size=2>" +
			"<a href=\"mail_read.jsp?seqno=" + 
			matrix.getRowData(iRet-1).getData(0) + "\">" +
			title + "</a></td>\n<td><font size=2>" +
			matrix.getRowData(iRet-1).getData(3) +
			"</td>\n<td align=center><font size=2>";
		String read = matrix.getRowData(iRet-1).getData(5);
		if( read.equals("2") ) {
			outS +=  matrix.getRowData(iRet-1).getData(4) + "</td></tr>" +
			"\n<tr><td></td><td colspan=5><img src=\"img/line.gif\" width=623 height=1></td></tr>";
		}else {
			outS += "new</td></tr>" +
			"\n<tr><td></td><td colspan=5><img src=\"img/line.gif\" width=623 height=1></td></tr>";
		}
		iRet--;
	}
	dbPool.freeConnection("intranet", conn);
	connState = false;
}

%>

<HTML>
<HEAD>
<SCRIPT SRC="script/mail.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
function Change(form)
{
    var temp = form.elements[0];
    for( var i=0; i < form.elements.length ; i++ )
    {
        var e = form.elements[i];
        if( (e.name != 'switch') && (e.type == 'checkbox') )
            e.checked = temp.checked;
    }
}
function check_select(form)
{
    var check=false;
    for( var i=0; i < form.elements.length; i++ )
    {
        var e = form.elements[i];
        if( (e.name != 'switch') && (e.type == 'checkbox') && e.checked )
            check=true;
    }
    return check;
}

function Delete(form)
{
    if( check_select(form) )
    {
        form.action = "inbox_delete.jsp";
        form.submit();
    } else {
        alert("Click the checkbox next to the messages you want deleted");
    }
}
</SCRIPT>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
</HEAD>
<BODY topmargin=0 leftmargin=3 link="#404040" vlink="gray" alink="#404040">
<%@ include file="main_head.html" %>

<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=0>
<TR>
<TD width="164" align="right">
<a href="mail_comp.jsp">
<IMG src="img/mail_s_compose.jpg" border=0 onmouseover="this.src='img/mail_s_compose_over.jpg'" onmouseout="this.src='img/mail_s_compose.jpg'"></a></TD>
<TD><IMG src="img/mail_s_inbox_over.jpg" border=0></TD>
<TD><a href="mail_sent.jsp">
<IMG src="img/mail_s_sent.jpg" border=0 onmouseover="this.src='img/mail_s_sent_over.jpg'" onmouseout="this.src='img/mail_s_sent.jpg'"></a></TD>
<TD><a href="mail_trash.jsp">
<IMG src="img/mail_s_trash.jpg" border=0 onmouseover="this.src='img/mail_s_trash_over.jpg'" onmouseout="this.src='img/mail_s_trash.jpg'"></a></TD>
</TR>
</TABLE>
<BR>

<FORM NAME="frmMain" METHOD=POST>
<TABLE border=0 width="631" cellpadding=0 CELLSPACING=0>
<TR>
<TD width=8>&nbsp;&nbsp;</TD>
<TD width=40 align=center background="img/inbox_back.jpg">
<INPUT TYPE=CHECKBOX NAME="switch" VALUE="0" ONCLICK="Change(this.form)">
</TD>
<TD width=80 background="img/inbox_back.jpg"><IMG SRC="img/inbox_from.jpg"></TD>
<TD width=343 background="img/inbox_back.jpg"><IMG SRC="img/inbox_subject.jpg"></TD>
<TD width=80 background="img/inbox_back.jpg"><IMG SRC="img/inbox_sent.jpg"></TD>
<TD width=80 background="img/inbox_back.jpg"><IMG SRC="img/inbox_read.jpg"></TD>
</TR>
<%=outS%>
</TABLE>
<BR>
&nbsp;
<a href="javascript:Delete(document.frmMain)"><IMG SRC="img/inbox_delete.jpg" border=0 onmouseover="this.src='img/inbox_delete_over.jpg'" onmouseout="this.src='img/inbox_delete.jpg'" ></a><a href="javascript:reset()"><IMG SRC="img/inbox_reset.jpg" border=0 onmouseover="this.src='img/inbox_reset_over.jpg'" onmouseout="this.src='img/inbox_reset.jpg'" ></a>
</FORM>
</BODY>
</HTML>
