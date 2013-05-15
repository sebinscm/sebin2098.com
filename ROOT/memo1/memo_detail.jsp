<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ include file="../login_check.jsp" %>
<%

int page_size = 20; // page size
String seqno = request.getParameter("seqno");

DBConnManager dbPool = null;
boolean connState = false;
int iRet = 0;

dbPool = DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");
if( conn == null ) {
        connState = false;
        out.println("OUT");
        return;
} else {
        connState = true;
}

String sdate = "";
String title = "";
String content_all = "";
String read_button = "";
String[] content= new String[15];

String sql = "INSERT INTO s_memo_02t(SEQNO, COMNAME, STAFFID, STAFFNAME, RDATE) " +
             "VALUES(" + seqno + ",'" + scmnm + "','" + scmid + "','" +
             scmnm + "',sysdate) ";

MatrixDataSet matrix = new dbconn.MatrixDataSet();
DataProcess dataProcess = new DataProcess();

if( connState ) {
	dataProcess.ManipulateData(sql, conn);

	sql = "SELECT CONTENT,  CONTENT2, CONTENT3,   CONTENT4,   CONTENT5,   CONTENT6,   CONTENT7,   CONTENT8,   CONTENT9,   CONTENT10,  " +
                " CONTENT11,CONTENT12,CONTENT13,  CONTENT14,  CONTENT15,  " +
                " TO_CHAR(IDATE, 'HH24:MI DD/MM/YYYY'), TITLE " +
                " FROM S_MEMO_01T " +
		" WHERE SEQNO=" + seqno ;

	iRet = dataProcess.RetrieveData(sql, matrix, conn);
	if( iRet < 1 ) {
		seqno = "";
	} else {
		sdate       = matrix.getRowData(0).getData(15);
                title       = matrix.getRowData(0).getData(16);
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
                
                for ( int i=0; i<15; i++)
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

}
dbPool.freeConnection("intranet", conn);
connState = false;

%>
<HTML>
<BODY TOPMARGIN=5 LEFTMARGIN=5>
<CENTER>
<TABLE WIDTH=600 CELLPADDING=0 CELLSPACING=0>
<TR>
<TD BGCOLOR="#B0B0B0">&nbsp;<FONT SIZE=2><B>MEMORANDOM : <%=seqno%></B></FONT>
</TD>
</TR> <TR>                    
<TD BGCOLOR=#EEEEE0>Sent: <%=sdate%> &nbsp; / &nbsp;
<B><%=read_button%></B>
<TD></TR>       
<TR><TD BGCOLOR=#CCCCC0>Title : <B><%=title%></B>
</TD>                   
</TR><TR HEIGHT=250 VALIGN=TOP>
<TD BGCOLOR=#EEEEE0>
<%=content_all%>            
</TD>                   
</TR>
</TABLE>
<BR>
<CENTER>
<INPUT TYPE=BUTTON VALUE=" List " ONCLICK="history.back()">
</BODY>
</HTML>
