<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/board/board.util.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String seqno = request.getParameter("seqno");
String adminid ="";
String adminname ="";
String idate ="";
String title ="";
String contents ="";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql  = "";
String outS = "";

sql = "SELECT adminid, adminname, str_to_date(date_format(idate,'%Y/%m/%d'),'%Y/%m/%d'), title, contents " +
      " FROM  t_memo_01t " +
      " WHERE seqno = " + seqno;

try {

    Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);
  
   if (rs.next()) {
    adminid = rs.getString(1);
    adminname = rs.getString(2);
    idate = rs.getString(3);
    title = rs.getString(4);

    Clob clob   = rs.getClob(5);
    Reader clobStream = clob.getCharacterStream();
    StringBuffer buf = new StringBuffer();
    int    nchars = 0; // Number of characters read
    char[] buffer = new char[10];  //  Buffer holding characters being transferred

    while( (nchars = clobStream.read(buffer)) != -1 ) // Read from Clob
      buf.append(buffer, 0, nchars);        // Write to StringBuffer

    clobStream.close();  // Close the Clob input stream

    contents = buf.toString();
  } 

} catch (Exception e) {
  System.out.println("Exception /admin/memo/memo_edit : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }

  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {conn.close(); }
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="vbscript" src="/common/board/board.vb"></script>
<SCRIPT LANGUAGE="JavaScript">
function List(form)
{
	location.href = 'index.jsp';
}

function Delete( form )
{
    result = confirm("Are you sure?");
    if( result == true )
	{
            form.action = "memo_delete.jsp";
            form.submit();
    }
}

function Update(form)
{
  if(form.siba != null) {
    form.contents.value = form.siba.MIMEValue;
  }
  
	form.action = "memo_update.jsp";
	form.submit();
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/icon_ann.jpg"></td>
  <td width="*" class="left_title"> Edit Buyer Notice</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%">No. : <B><%=seqno%></B></td>
</tr>
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>

<TABLE WIDTH=700 border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM NAME=frmMain METHOD=POST action = "memo_update.jsp">
<INPUT type ="HIDDEN" NAME=seqno   VALUE="<%=seqno%>">
<INPUT type ="HIDDEN" NAME=contents   VALUE="<%= convertHtmlchars(contents) %>">
<TR>
  <TD width='100' class="table_header_center"><FONT SIZE=2>Sender</TD>
  <TD width='250' class="table_bg_bright"><FONT SIZE=2><%=adminname%></TD>
  <TD width='100' class="table_header_center"><FONT SIZE=2>Date</TD>
  <TD width='250' class="table_bg_bright"><FONT SIZE=2><%=idate%></TD>
</TR>
<TR>
  <TD ALIGN=CENTER class="table_header_center"><FONT SIZE=2>Title</TD>
  <TD COLSPAN=3  class="table_bg_bright"><font size=2><input type="text" name="title" value="<%=title%>" size="90" maxlength=100></font></TD>
</TR>
<TR>
    <td colspan=4 class="table_bg_bright">
      <object width=0 height=0 classid="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
      <param name="LPKPath" value="/common/board/NamoWe_valleygirl.lpk">
      </object>
      <object id="siba" width=700 height=500 classid="CLSID:898FD2A4-B75E-11d4-BFF3-0050FC1AFCDD" codebase="/common/board/NamoWe.cab#version=2,1,0,3">
      </object>
    </td>
</TR>
</TABLE>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15"></td>
</tr>
<tr>
  <td width="100%" align='center'>
    <INPUT TYPE=BUTTON VALUE=" LIST " ONCLICK="List(document.frmMain)">
    <INPUT TYPE=BUTTON VALUE="DELETE" ONCLICK="Delete(document.frmMain)">
    <INPUT TYPE="BUTTON" VALUE="UPDATE" ONCLICK="Update(document.frmMain)">
  </td>
</tr>
</FORM>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
