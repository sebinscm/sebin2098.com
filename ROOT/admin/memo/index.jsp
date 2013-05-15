<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ include file="/admin/login_check.jsp" %>
<%@ page errorPage="../../error.jsp" %>
<%@ include file="../../bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String next_page="index.jsp?";
String prev_page="";
String start_seqno= request.getParameter("seqno");
String ag_title = request.getParameter("title");

if ( start_seqno != null && start_seqno.length() > 0 ) {
     prev_page = "<A href=\"JavaScript:Back()\">Prev</A>";
}
else {
     start_seqno = "99999";
}
if ( ag_title == null ) {
     ag_title = "";
}

dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
Connection conn = null;
String sql  = "";

String outS =  "";
String curno =  "";
int iRet = 0;
int page_size = 20;

sql = "  SELECT  seqno, adminname, date_format(idate,'%Y/%m/%d') , title  " +
      "  FROM    t_memo_01t " +
      "  WHERE   seqno < " + start_seqno +
      "  AND     dflag = '0' " +
      "  And     (title like '%" + ag_title + "%' OR contents like '%" + ag_title + "%') " +
      "  ORDER BY seqno desc  " +
      "   limit  " + page_size ;
//out.println(sql);

try {
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  String seqno = "";
  String adminname = "";
  String idate = "";
  String title = "";

  int count = 0 ;

  for (count = 0 ; count < iRet; count++) {
    seqno = matrix.getRowData(count).getData(0);
    adminname = matrix.getRowData(count).getData(1);
    idate = matrix.getRowData(count).getData(2);
    title = matrix.getRowData(count).getData(3);

    outS += "<tr class='table_list'>"
          + "  <td align=center>" + seqno + "</td>"
          + "  <td align=center>" + idate + "</td>"
          + "  <td><font color=blue>&nbsp;<a href='view_memo.jsp?seqno=" + seqno + "'>" + title + "</a></font></td>"
          + "</tr>\n";
  }

  if ( count < page_size )
    next_page = "";
  else
    next_page = "<A HREF=\"" + next_page + "seqno=" + seqno + "\">Next</A>";

} catch (Exception e) {
  System.out.println("Exception /admin/memo/index : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}
}
%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function NewMemo()
{
  window.location.replace("memo_form.jsp");
}

function Back()
{
  history.back();
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
  <td width="3%"><img src="/img/icon_ann.jpg"></td>
  <td width="*" class="left_title">Buyer Notice Board</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="100%" border="0" cellspacing="1" cellpadding="2" align="center"  >
<FORM ACTION="index.jsp" METHOD=POST>
<tr>
	<%
  	   if ( _adminclass.equals("1")) {
     %>
   <td width="50%" ><INPUT TYPE=BUTTON VALUE="New" ONCLICK="JavaScript:NewMemo()"  class="button_default" ></td>
        <%
      } 
     %>
  <td width="50%" align=right ><input type=text name=title>
    <INPUT TYPE=BUTTON VALUE="Search" ONCLICK=submit() class="button_default"></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>

<TABLE border=0 width=99% CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class="table_header_center">
<TD WIDTH=10%>Seqno</TD>
<TD WIDTH=10%>Date</TD>
<TD WIDTH=*>Title</TD>
</TR>
<%= outS %>
<TR>
<TD colspan=3 align=right class='table_bg_bright' ><font size=2><%=prev_page%>&nbsp;<%=next_page%></font></TD>
</TR>
</TABLE>
<BR>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
