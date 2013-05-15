<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ include file="../login_check.jsp" %>
<%

DBConnManager dbPool = null;
boolean connState = false;
int iRet = 0;
int page_size = 10; // page size

dbPool = DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");
if( conn == null ) {
        connState = false;
        out.println("OUT");
        return;
} else {
        connState = true;
}

String next_page="index.jsp?";
String prev_page="";
String start_seqno= request.getParameter("seqno");
if ( start_seqno != null && start_seqno.length() > 0 ) {
     prev_page = "<A href=\"JavaScript:Back()\">Prev</A>";
}
else {
     start_seqno = "99999";
}

String sql = "SELECT /*+ index_desc( s_memo_03t s_memo_03idx1) */ " +
		" SEQNO, TO_CHAR(IDATE, 'HH24:MI DD/MM/YYYY'), TITLE " +
		" FROM S_MEMO_03T " +
                " WHERE COMNAME = '" + scmnm + "'" +
                "   AND rownum = 1" +
		"   AND dflag = '0'";

MatrixDataSet matrix = new dbconn.MatrixDataSet();
DataProcess dataProcess = new DataProcess();
String sdate = "";
String title = "";
String read_button = "";
String memolist = "";
String seqno = "0";
String[] content = new String[15];
String   content_all = "";
if( connState ) {
        String curno="";
	iRet = dataProcess.RetrieveData(sql, matrix, conn);
	if( iRet < 1 ) {
		seqno = "";
	} else {
		seqno = matrix.getRowData(0).getData(0);
		sdate = matrix.getRowData(0).getData(1);
		title = matrix.getRowData(0).getData(2);
		sql = "SELECT CONTENT, " +
			" CONTENT2, CONTENT3, CONTENT4, CONTENT5, CONTENT6, CONTENT7, CONTENT8, CONTENT9, CONTENT10,  " +
			" CONTENT11,CONTENT12,CONTENT13,CONTENT14,CONTENT15 " +
			" FROM S_MEMO_01T " +
			" WHERE SEQNO = " + seqno + 
		        "   AND dflag = '0'";
		iRet = dataProcess.RetrieveData(sql, matrix, conn);
		content[ 0] = matrix.getRowData(0).getData( 0);
		content[ 1] = matrix.getRowData(0).getData( 1);
		content[ 2] = matrix.getRowData(0).getData( 2);
		content[ 3] = matrix.getRowData(0).getData( 3);
		content[ 4] = matrix.getRowData(0).getData( 4);
		content[ 5] = matrix.getRowData(0).getData( 5);
		content[ 6] = matrix.getRowData(0).getData( 6);
		content[ 7] = matrix.getRowData(0).getData( 7);
		content[ 8] = matrix.getRowData(0).getData( 8);
		content[ 9] = matrix.getRowData(0).getData( 9);
		content[10] = matrix.getRowData(0).getData(10);
		content[11] = matrix.getRowData(0).getData(11);
		content[12] = matrix.getRowData(0).getData(12);
		content[13] = matrix.getRowData(0).getData(13);
		content[14] = matrix.getRowData(0).getData(14);
                for (int i=0; i<15; i++)
                    if ( content[i] != null ) content_all += content[i];

		// For read button
		sql = "SELECT TO_CHAR(RDATE,'HH24:MI DD/MM/yyyy') " +
		      " FROM S_MEMO_02T " +
		      " WHERE SEQNO = " + seqno + " AND " +
		      " STAFFID = '" + scmid + "'";
		iRet = dataProcess.RetrieveData(sql, matrix, conn);
		if( iRet < 1 ) {
			read_button = "<INPUT TYPE=CHECKBOX VALUE=\"READ\" ONCLICK=\"Read()\">Read confirm";
		} else {
			read_button = "Read at " + matrix.getRowData(0).getData(0);
		}
	}


	//sql = "SELECT /*+ index_desc( s_memo_03t s_memo_03pk) */ " +
	sql =  "SELECT * FROM ( " +
	       "SELECT  " +
	       " SEQNO, TO_CHAR(IDATE,'DD/MM/yyyy'), TITLE " +
	       " FROM S_MEMO_03T " +
	       " WHERE SEQNO < " + start_seqno + 
	       "   AND COMNAME = '" + scmnm + "'" +
	       "   AND dflag = '0'" +
	       "   ORDER BY SEQNO DESC)  " +
	       " WHERE ROWNUM <= " + page_size ;

	iRet = dataProcess.RetrieveData(sql, matrix, conn);
	int count = 0;
	int chk_bgcolor = 0;
	String bgcolor = "#FFFFFF";
	for( count=0;count < iRet; count++ ) {
                curno = matrix.getRowData(count).getData(0);
		if( chk_bgcolor == 0 ) {
			bgcolor = "#FFFFFF";
			chk_bgcolor = 1;
		}
		else {
			bgcolor = "#E0E0E0";
			chk_bgcolor = 0;
		}
		memolist += "<tr bgcolor=" + bgcolor + ">\n<td>" +
			matrix.getRowData(count).getData(1) + "</td><td>" +
			"<a href=\"memo_detail.jsp?seqno=" +
			matrix.getRowData(count).getData(0) + "\"> " +
			matrix.getRowData(count).getData(2) + "</a></td></tr>\n";
	}
	if( iRet == 0 ) {
		memolist += "<tr><td>&nbsp;</td><td>No old memorandum</td></tr>\n";
	}
        else {

          if ( count < page_size ) 
               next_page = "";
          else
               next_page = "<A HREF=\"" + next_page +
                           "seqno=" + curno + "\">Next</A>";
        }
}
dbPool.freeConnection("intranet", conn);
connState = false;

%>
<HTML>
<SCRIPT LANGUAGE="JavaScript">
function Read()
{
	frmMain.submit();
}

function Back()
{
	history.back();
}
</SCRIPT>
<BODY TOPMARGIN=5 LEFTMARGIN=5>
<CENTER>
<FORM NAME=frmMain ACTION=memo_read.jsp METHOD=POST>
<INPUT TYPE=HIDDEN NAME=seqno VALUE="<%=seqno%>">
<TABLE WIDTH=600 CELLPADDING=0 CELLSPACING=0>
<TR HEIGHT=22><TD BGCOLOR="#C0C0C0">&nbsp;<FONT SIZE=2><B>LATEST MEMORANDUM</B></FONT>
</TD></TR>
<TR HEIGHT=23>
<TD BGCOLOR=#EEEEE0>&nbsp; Sent: <%=sdate%> &nbsp; / &nbsp;
<B><%=read_button%></B>
<TD></TR>
<TR HEIGHT=22><TD BGCOLOR=#D0D0C0>&nbsp; Title : <B><%=title%></B>
</TD>
</TR><TR HEIGHT=250 VALIGN=TOP>
<TD BGCOLOR=#EEEEE0>
<%=content_all%>
</TD>
</TR><TR>

<TR><TD BGCOLOR="#B0B0B0">&nbsp;<FONT SIZE=2><B>OLD MEMORANDUM HISTORY</B></FONT></TD></TR>
<TR><TD ALIGN=CENTER>
	<TABLE WIDTH=100% CELLPADDING=0 CELLSPACING=0>
	<TR BGCOLOR="#C0C0C0">
	<TD WIDTH=100>Date</TD><TD>Title</TD></TR>
	<%=memolist%>
	</TABLE>
</TD></TR>
<TR>
<TD colspan=2 align=right ><font size=2><%=prev_page%>&nbsp;<%=next_page%></font></TD>
</TR>
</TABLE>
</FORM>
<!--
<%=sql%>
-->
</BODY>
</HTML>
