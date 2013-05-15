<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>

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

String sql = "SELECT userid, firstname, lastname, work_area " +
		" FROM user_01t " +
		" WHERE status <> 'Q' " +
//		"   AND left(depart,2) <> '11' " +
//			"   AND left(depart,2) <> '05' " +
		" ORDER BY firstname DESC ";
MatrixDataSet matrix = new dbconn.MatrixDataSet();
DataProcess dataProcess = new DataProcess();

String outS = "";
int count = 0;
String work_area ="";
String name_col ="";
if( connState ) {
	iRet = dataProcess.RetrieveData(sql, matrix, conn);
	while( iRet > 0 ) {
	  work_area = matrix.getRowData(iRet-1).getData(3);
	  if (work_area.equals("A") ) {
	      name_col = "<font size=2 color=black>";
	  }   
	   if (work_area.equals("K") ) {
	      name_col = "<font size=2 color=blue>";
	  }   
	   if (work_area.equals("C") ) {
	      name_col = "<font size=2 color=#A52A2A>";
	  }       
		if( count == 0 ) outS += "<tr>\n";
		outS += "<td align=center><font size=2>" +
			"<input type=checkbox name=\"" +
			matrix.getRowData(iRet-1).getData(1) + " " +
			matrix.getRowData(iRet-1).getData(2) + "\" value=\"" +
			matrix.getRowData(iRet-1).getData(0) +
            "\"></td>\n<td><font size=2>" + name_col +
			matrix.getRowData(iRet-1).getData(1) + " " +
			matrix.getRowData(iRet-1).getData(2) + "</font></td>\n";

		count++;
		if( count == 5 ) {
			outS += "</tr>\n";
			count = 0;
		}
		iRet--;
	}

	if( count > 0 ) outS +="</TR>\n";
	dbPool.freeConnection("intranet", conn);
	connState = false;
}

%>

<HTML>
<HEAD>
<script src="script/mail.js"></script>
<SCRIPT LANGUAGE="JavaScript">

function check_select(form)
{
    var check = false;
    for( var i=0; i < form.elements.length; i++ )
    {
        var e = form.elements[i];
        if( (e.type == 'checkbox') && e.checked )
        {
            form.ids.value = form.ids.value + e.value + " ";
            form.names.value = form.names.value + e.name + ",";
            check = true;
        }
    }

    return check;
}

function Confirm(form)
{
    if( check_select(form) )
    {
        opener.document.frmMain.receiver_name.value = form.names.value;
        opener.document.frmMain.receiver.value = form.ids.value;
        top.close();
    } else {
        alert("At least 1 receiver required.");
    }
}
</SCRIPT>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
</HEAD>
<BODY topmargin=2 leftmargin=3>

<CENTER>
<font size=2>** Name of colour (Black = H.O , Blue = VBA Korea , Brown = China Office ) </font>
<CENTER>
<BR>
<a href="JavaScript:Confirm(document.frmMain)"><IMG src="img/mail_ok.gif" border=0 onmouseover="this.src='img/mail_ok_over.gif'" onmouseout="this.src='img/mail_ok.gif'"></a><a href="JavaScript:reset()"><IMG src="img/mail_reset.jpg" border=0 onmouseover="this.src='img/mail_reset_over.jpg'" onmouseout="this.src='img/mail_reset.jpg'"></a><a href="JavaScript:Cancel()"><IMG src="img/mail_cancel.jpg" border=0 onmouseover="this.src='img/mail_cancel_over.jpg'" onmouseout="this.src='img/mail_cancel.jpg'"></a>
<BR>
<FONT SIZE=2><A HREF="JavaScript:select_all(document.frmMain)">To All</A>
<A HREF="JavaScript:cancel_all(document.frmMain)">Cancel All</A></FONT>
<FORM NAME="frmMain" METHOD=POST ACTION="mail_add_confirm.jsp">
<INPUT TYPE=HIDDEN NAME="names" VALUE="">
<INPUT TYPE=HIDDEN NAME="ids" VALUE="">
<TABLE border=1 width="630" cellpadding=0>
<TR>
<TD><font size=2>&nbsp;</TD>
<TD><font size=2>Name</TD>
<TD><font size=2>&nbsp;</TD>
<TD><font size=2>Name</TD>
<TD><font size=2>&nbsp;</TD>
<TD><font size=2>Name</TD>
<TD><font size=2>&nbsp;</TD>
<TD><font size=2>Name</TD>
<TD><font size=2>&nbsp;</TD>
<TD><font size=2>Name</TD>
</TR>
<%=outS%>
</TABLE>
<CENTER>
<BR>
<a href="JavaScript:Confirm(document.frmMain)"><IMG src="img/mail_ok.gif" border=0 onmouseover="this.src='img/mail_ok_over.gif'" onmouseout="this.src='img/mail_ok.gif'"></a><a href="JavaScript:reset()"><IMG src="img/mail_reset.jpg" border=0 onmouseover="this.src='img/mail_reset_over.jpg'" onmouseout="this.src='img/mail_reset.jpg'"></a><a href="JavaScript:Cancel()"><IMG src="img/mail_cancel.jpg" border=0 onmouseover="this.src='img/mail_cancel_over.jpg'" onmouseout="this.src='img/mail_cancel.jpg'"></a>
<BR>
<FONT SIZE=2><A HREF="JavaScript:select_all(document.frmMain)">To All</A>
<A HREF="JavaScript:cancel_all(document.frmMain)">Cancel All</A></FONT>
</FORM>
</BODY>
</HTML>
