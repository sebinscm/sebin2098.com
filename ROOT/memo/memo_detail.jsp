<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ include file="../login_check.jsp" %>
<%@ include file="../bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
int page_size = 20; // page size
request.setCharacterEncoding("euc-kr"); 
String seqno = request.getParameter("seqno");

MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int iRet = 0;

String sdate = "";
String memo_date ="";
String title = "";
String adminname= "";
String contents = "";
String read_button = "";
String file_name = "";
String file_name2 = "";
String file_nm ="";
String path = application.getRealPath(_memoDataUrl) + File.separator;   // file path
String sql ="";

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  sql = "SELECT CONTENTS, AFNAME, date_format(IDATE, '%Y/%m/%d'), TITLE, adminname " +
        " FROM T_MEMO_01T " +
        " WHERE SEQNO=" + seqno +
        "   AND dflag = '0' ";

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);
  //out.println(sql);
  if (rs.next()) {
    Clob clob   = rs.getClob(1);
    Reader clobStream = clob.getCharacterStream();
    StringBuffer buf = new StringBuffer();
    int    nchars = 0; // Number of characters read
    char[] buffer = new char[10];  //  Buffer holding characters being transferred
  
    while( (nchars = clobStream.read(buffer)) != -1 ) // Read from Clob
      buf.append(buffer, 0, nchars);        // Write to StringBuffer
  
    clobStream.close();  // Close the Clob input stream
  
    contents = buf.toString();
    
    file_nm   = rs.getString(2);
    memo_date     = rs.getString(3);
    title     = rs.getString(4);
    adminname     = rs.getString(5);
    if ( file_nm != null && file_nm.length() != 0 ) {
      file_name = path + file_nm;
      file_name2  =  "<td align=left COLSPAN=6 class='table_bg_bright' ><a href='download.jsp?filename=" + file_name + "'><font color=#0000FF>" + file_nm + " </font> "+
                     " <IMG height=14  src=../notice/images/disk.gif width=14 align=textTop border=0> </td>";
    } else {
      file_name2 = "<td COLSPAN=6 class='table_bg_bright' align=left ><B> No files attached</B></TD>";
    }

    // For read button
    sql = "SELECT date_format(RDATE,'%Y/%m/%d') " +
           " FROM S_MEMO_02T " +
           " WHERE SEQNO = " + seqno + " AND " +
           " STAFFID = '" + scmid + "'";

    matrix = new dbconn.MatrixDataSet();
    dataProcess = new dbconn.DataProcess();
    iRet = dataProcess.RetrieveData(sql, matrix, conn);

    if( iRet < 1 ) {
      read_button = "<INPUT TYPE=CHECKBOX VALUE=\"READ\" ONCLICK=\"Read()\"><font color=red> Confirm ";
    } else {
      read_button = "<font color=red> Read : " + matrix.getRowData(0).getData(0);
    }
  }

} catch (Exception e) {
  System.out.println("Exception /memo/memo_detail : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }
  
  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}
%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function Read()
{
        frmMain.submit();
}
</SCRIPT>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Notice Board</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>
<TABLE border=0 cellspacing='1' cellpadding='2' WIDTH=100% align='center' class="table_bg">
<FORM NAME=frmMain ACTION=memo_read2.jsp METHOD=POST>
<INPUT TYPE=HIDDEN NAME=seqno VALUE="<%=seqno%>">
<TR>
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">No.</TD>
<TD WIDTH="10%" ALIGN=CENTER class='table_bg_bright'><B><%=seqno%></B></TD>	
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">Sender</TD>
<TD WIDTH="30%" ALIGN=CENTER class='table_bg_bright'><%=adminname%></TD>
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">Date</TD>
<TD WIDTH="30%" ALIGN=CENTER class='table_bg_bright'><%=memo_date%></TD>
</TR>
<TR>
<TD WIDTH="20%" ALIGN=CENTER class="table_header_center">Title</TD>
<TD WIDTH="40%" COLSPAN=3 class='table_bg_bright'><%=title%></TD>
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">Read</TD>
<TD WIDTH="30%" ALIGN=CENTER class='table_bg_bright'><%=read_button%></TD>	
</TR>
<TR>
<TD WIDTH="100%" COLSPAN=6 HEIGHT=250 VALIGN=TOP bgcolor="white" ><%=contents%></font></TD>
</TR>
<TR>
<TD WIDTH="20%" ALIGN=CENTER class="table_header_center">Attached File</TD>
<%=file_name2%>
</TR>
</TABLE>
<BR>
<CENTER>
<INPUT TYPE=BUTTON VALUE="Go to List " ONCLICK="history.back()">

<%
out.println(CopyRightLogo());
%>
</FORM>

</td></tr></table>
</BODY>
</HTML>
