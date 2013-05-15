<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String seqNo = request.getParameter("seqNo");
String searchKeyword = request.getParameter("searchKeyword");

Connection conn = null;
DataProcess dataProcess = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "";

// Weekly Report 관련 변수
String inputDate = "";
String adminId = "";
String adminName = "";
String title = "";
String content = "";
int readCnt = 0;
String attachedFiles = "";

try {

      dataProcess = new dbconn.DataProcess();
     Context ic = new InitialContext(); 
	 DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	 conn = ds.getConnection();
	 	
  conn.setAutoCommit(false);

  // update read count
  sql = " update  scm_notice_01t "
      + " set     read_cnt = ifnull(read_cnt, 0) + 1 "
      + " where   seqno = ? ";
  pstmt = conn.prepareStatement(sql);
  pstmt.setLong(1, Long.parseLong(seqNo));
  pstmt.executeUpdate();
  conn.commit();

  // read the notice
  sql = " select  str_to_date(date_format(input_date, '%Y/%m/%d'),'%Y/%m/%d'), admin_id, "
      + "         admin_name, ifnull(read_cnt, 0), title, content "
      + " from    scm_notice_01t "
      + " where   seqno = " + seqNo;

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);

  if (rs.next()) {
    int j = 0;
    inputDate     = rs.getString(++j);
    adminId       = rs.getString(++j);
    adminName     = rs.getString(++j);
    readCnt       = rs.getInt(++j);
    title         = rs.getString(++j);

    // read content
   StringBuffer output = new StringBuffer();
    Reader input = rs.getCharacterStream(6);
    char[] buffer = new char[1024];
    int byteRead;
    while( (byteRead=input.read(buffer,0,1024))!= -1 )       
    output.append(buffer,0,byteRead);    
    input.close();
    content = output.toString();
     
   // Clob clob     = rs.getClob(++j);

    //Reader clobStream = clob.getCharacterStream();
    //StringBuffer buf = new StringBuffer();
    //int    nchars = 0;              // Number of characters read
    //char[] buffer = new char[10];   //  Buffer holding characters being transferred

    //while( (nchars = clobStream.read(buffer)) != -1 ) {   // Read from Clob
    //  buf.append(buffer, 0, nchars);                      // Write to StringBuffer
    //}

    //clobStream.close();             // Close the Clob input stream

    //content = buf.toString();
    ////////////////////////////
  }

  rs.close();

  // read attached files
  sql = " select  seqno,  attach_file,  attach_real_file "
      + " from    scm_notice_02t "
      + " where   notice_seqno = " + seqNo
      + " order by seqno desc ";

  rs = stmt.executeQuery(sql);

  int i = 0;
  while (rs.next()) {
    int j = 0;
    long fileSeqNo        = rs.getLong(++j);
    String attachFile     = rs.getString(++j);
    String attachRealFile = rs.getString(++j);

    if (i++ > 0) attachedFiles += "<br>";

    attachedFiles += "<a href=\"javascript:fnDownload('" + attachFile + "', '" + attachRealFile + "');\">"
                + attachFile + "</a>";
  }

} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception view : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }

  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
     conn.close();	
  }
}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function fnList(frm) {
  frm.action = "./list.jsp";
  frm.submit();
}

function fnEdit(frm) {
  frm.action = "./edit_form.jsp";
  frm.submit();
}

function fnDelete(frm) {
  if (confirm("Do you really want to delete these data?")) {
    frm.action = "./delete.jsp";
    frm.submit();
  }
}

function fnDownload(file1, file2) {
  with (document.form2) {
    attachFile.value = file1;
    attachRealFile.value = file2;
    action = "/common/download.jsp";
    target = "hiddenFrm";
    submit();
  }
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>&nbsp;</td></tr>
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/btnFolder.gif"></td>
  <td width="*" class="left_title">&nbsp;&nbsp;&nbsp;Notice for Sebin User</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="800" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<form name="form1" method="post">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
<input type="hidden" name="searchKeyword" value="<%= searchKeyword %>">
<input type="hidden" name="seqNo" value="<%= seqNo %>">
<tr>
  <td width="15%" class="table_header_center">Date</td>
  <td width="20%" class="table_bg_bright_center"><%= inputDate %></td>
  <td width="15%" class="table_header_center">Admin Name</td>
  <td width="20%" class="table_bg_bright_center"><%= adminName %></td>
  <td width="15%" class="table_header_center">Read Count</td>
  <td width="15%" class="table_bg_bright_center"><%= readCnt %></td>
</tr>
<tr>
  <td class="table_header_center">Title</td>
  <td colspan="5" class="table_bg_bright"><%= title %></td>
</tr>
<tr>
  <td class="table_header_center">Attached Files</td>
  <td colspan="5" class="table_bg_bright"><%= attachedFiles %>&nbsp;</td>
</tr>
<tr>
  <td colspan="6" height="300" valign="top" class="table_bg_white"><%= content %>&nbsp;</td>
</tr>
</table>

<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" align="center">
    <input type="button" value=" List " onclick="fnList(this.form);" class="button_default">
<%
if (adminId.equals(_adminid)) {
%>
    <input type="button" value=" Edit " onclick="fnEdit(this.form);" class="button_default">
    <input type="button" value=" Delete" onclick="fnDelete(this.form);" class="button_default">
<%
}
%>
  </td>
</tr>
</table>
</form>
<%
out.println(CopyRightLogo());
%>
<form name="form2" method="post">
<input type="hidden" name="attachPath" value="<%= _ManagementNoticeUploadUrl %>">
<input type="hidden" name="attachFile">
<input type="hidden" name="attachRealFile">
</form>
</td></tr></table>
<iframe name="hiddenFrm" src="" width="0" height="0" frameborder="0"></iframe>
</body>
</html>
