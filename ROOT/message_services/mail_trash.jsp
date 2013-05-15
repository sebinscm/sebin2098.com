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
		" WHERE userid = '" + userid + "' AND del_flag is not null " +
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

		outS += "<tr>\n<td></td><td align=center><font size=2>" +
			"<input type=checkbox name=checkid" + iRet + " value=\"" +
			matrix.getRowData(iRet-1).getData(0) +
			"\"></td>\n<td><font size=2>" +
			matrix.getRowData(iRet-1).getData(1) +
			"</td>\n<td><font size=2>" +
			title + "</td>\n<td><font size=2>" +
			matrix.getRowData(iRet-1).getData(3) +
			"</td>\n<td align=center><font size=2>";
		String read = matrix.getRowData(iRet-1).getData(5);
		if( read.equals("1") ) {
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
<SCRIPT src="script/mail.js"></SCRIPT>
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

function Undelete( form )
{
	if( check_select(form) )
    {
		form.action = "trash_undelete.jsp";
        form.submit();
    } else {
        alert("Click the checkbox next to the messages you want undeleted");
    }
}

function Empty( form )
{
	result = confirm("Are you sure?\nAll messages will be deleted permanently");
	if( result == true )
	{
		form.action = "trash_empty.jsp";
       	form.submit();
	}
}
function Delete( form )
{
	if( check_select(form) )
    {
		result = confirm("Are you sure?\nThis message(s) will be deleted permanently");
		if( result == true )
		{
			form.action = "trash_delete.jsp";
        	form.submit();
		}
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
<a href="mail_comp.jsp"><IMG src="img/mail_s_compose.jpg" border=0 onmouseover="this.src='img/mail_s_compose_over.jpg'" onmouseout="this.src='img/mail_s_compose.jpg'"></a></TD>
<TD><a href="mail_inbox.jsp">
<IMG src="img/mail_s_inbox.jpg" border=0 onmouseover="this.src='img/mail_s_inbox_over.jpg'" onmouseout="this.src='img/mail_s_inbox.jpg'"></a></TD>
<TD><a href="mail_sent.jsp"><IMG src="img/mail_s_sent.jpg" border=0 onmouseover="this.src='img/mail_s_sent_over.jpg'" onmouseout="this.src='img/mail_s_sent.jpg'"></a></TD>
<TD><IMG SRC="img/mail_s_trash_over.jpg" border=0></TD>
</TR>
</TABLE>
<BR>

<FORM NAME="frmMain" METHOD=POST>
<TABLE border=0 width="631" CELLSPACING=0 CELLPADDING=0>
<TR>
<TD width=8>&nbsp;&nbsp;</TD>
<TD width=40 align=center background="img/inbox_back.jpg"><INPUT TYPE=CHECKBOX NAME="switch" VALUE="0" ONCLICK="Change(this.form)"></TD>
<TD width=80 background="img/inbox_back.jpg"><IMG SRC="img/inbox_from.jpg"></TD>  
<TD width=343 background="img/inbox_back.jpg"><IMG SRC="img/inbox_subject.jpg"></TD>  
<TD width=80 background="img/inbox_back.jpg"><IMG SRC="img/inbox_sent.jpg"></TD>
<TD width=80 background="img/inbox_back.jpg"><IMG SRC="img/inbox_read.jpg"></TD>
</TR>
<%=outS%>
</TABLE>
<BR>

<a href="javascript:Empty(document.frmMain)"><IMG SRC="img/trash_empty.gif"
 border=0 onmouseover="this.src='img/trash_empty_over.gif'" 
onmouseout="this.src='img/trash_empty.gif'" ></a><a
 href="javascript:Undelete(document.frmMain)"><IMG SRC="img/trash_undelete.gif"
 border=0 onmouseover="this.src='img/trash_undelete_over.gif'" 
onmouseout="this.src='img/trash_undelete.gif'" ></a><a
href="javascript:Delete(document.frmMain)"><IMG SRC="img/inbox_delete.jpg"
 border=0 onmouseover="this.src='img/inbox_delete_over.jpg'" 
onmouseout="this.src='img/inbox_delete.jpg'" ></a><a 
href="javascript:reset()"><IMG SRC="img/inbox_reset.jpg" border=0 
onmouseover="this.src='img/inbox_reset_over.jpg'" 
onmouseout="this.src='img/inbox_reset.jpg'" ></a>
</FORM>
</BODY>
</HTML>
