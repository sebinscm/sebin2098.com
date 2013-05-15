<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
//response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
//response.setHeader("Pragma","no-cache"); //HTTP 1.0
//response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String noticeType = request.getParameter("noticeType");
String searchCategory = request.getParameter("searchCategory");
String searchKeyword = request.getParameter("searchKeyword");
String seqno = request.getParameter("seqno");

if (curPage == null) curPage = "1";
if (pageSize == null) pageSize = "20";
if (noticeType == null) noticeType = "1";
if (searchCategory == null) searchCategory = "Title";
if (searchKeyword == null) searchKeyword = "";
int iRet = 0;
Connection conn = null;
PreparedStatement pstmt = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql = "";

// Weekly Report 
String inputDate = "";
String userId = "";
String userName = "";
String title = "";
String content = "";
int readCnt = 0;
String attachFiles = "";

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  conn.setAutoCommit(false);

  // update read count
  sql = " update  notice_01t "
      + " set     read_cnt = read_cnt + 1 "
      + " where   seqno = ? ";
  pstmt = conn.prepareStatement(sql);
  pstmt.setLong(1, Long.parseLong(seqno));
  pstmt.executeUpdate();
  conn.commit();

  // Report
  sql = " select  date_format(input_date, '%d/%m/%Y'), user_id, "
      + "         user_name, read_cnt, title, content "
      + " from    notice_01t "
      + " where   seqno = " + seqno
      + " and     type = " + noticeType;

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    inputDate   = matrix.getRowData(0).getData(j++);
    userId      = matrix.getRowData(0).getData(j++);
    userName    = matrix.getRowData(0).getData(j++);
    readCnt     = Integer.parseInt(matrix.getRowData(0).getData(j++));
    title       = matrix.getRowData(0).getData(j++);
    content     = matrix.getRowData(0).getData(j++);
  }

  // 
  sql = " select  attach_file,  attach_real_file "
      + " from    notice_02t "
      + " where   notice_seqno = " + seqno
      + " order by seqno desc ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception view : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// 
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String attachFile      = matrix.getRowData(i).getData(j++);
  String attachRealFile  = matrix.getRowData(i).getData(j++);

  attachFiles += "<a href=\"javascript:fnDownload('" + attachFile + "', '" + attachRealFile + "');\">"
              + attachFile + "</a>";
  if (i < (iRet - 1)) attachFiles += "<br>";
}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function fnNotice(type) {
  with (document.form0) {
    noticeType.value = type;
    action = "./buyer_list.jsp";
    submit();
  }
}

function fnList(frm) {
  frm.action = "./buyer_list.jsp";
  frm.submit();
}

function fnEdit(frm) {
  frm.action = "./buyer_form.jsp";
  frm.submit();
}

function fnDelete(frm) {
  if (confirm("Do you really want to delete these data?")) {
    frm.action = "./buyer_delete.jsp";
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
function fnBack(frm) {
  frm.action = "./buyer_list.jsp";
  frm.submit();
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
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title"><%= noticeType.equals("1") ? "Bulletin Board" : "PDS"  %></td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>
<form name="form1" method="post">
<table width="800" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
<input type="hidden" name="noticeType" value="<%= noticeType %>">
<input type="hidden" name="searchCategory" value="<%= searchCategory %>">
<input type="hidden" name="searchKeyword" value="<%= searchKeyword %>">
<input type="hidden" name="seqno" value="<%= seqno %>">
<tr>
  <td width="15%" class="table_header_center">Date</td>
  <td width="20%" class="table_bg_bright_center"><%= inputDate %></td>
  <td width="15%" class="table_header_center">ID</td>
  <td width="20%" class="table_bg_bright_center"><%= userName %></td>
  <td width="15%" class="table_header_center">View</td>
  <td width="15%" class="table_bg_bright_center"><%= readCnt %></td>
</tr>
<tr>
  <td class="table_header_center">Subject</td>
  <td colspan="5" class="table_bg_bright"><%= StringUtil.convertTextToHtml(title) %></td>
</tr>
<tr>
  <td class="table_header_center">Attachment</td>
  <td colspan="5" class="table_bg_bright"><%= attachFiles %>&nbsp;</td>
</tr>
<tr>
  <td colspan="6" height="300" valign="top" class="table_bg_bright"><%= content %>&nbsp;</td>
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
    <input type="button" value="List" onclick="fnList(this.form);" class="button_default">
    <input type="button" value="Back" onclick="fnBack(this.form);" class="button_default">    
<%
if (userId.equals(scmid)) {
%>
    <input type="button" value="Edit" onclick="fnEdit(this.form);" class="button_default">
    <input type="button" value="Delete" onclick="fnDelete(this.form);" class="button_default">
<%
}
%>
  </td>
</tr>
</table>
</form> 
<form name="form0" method="post">
<input type="hidden" name="noticeType" value="<%= noticeType %>">
</form>
<form name="form2" method="post">
<input type="hidden" name="attachPath" value="<%= _noticeDataUrl %>">
<input type="hidden" name="attachFile">
<input type="hidden" name="attachRealFile">
</form>
</td></tr></table>
<iframe name="hiddenFrm" src="" width="0" height="0" frameborder="0"></iframe>
<%
	out.println(CopyRightLogo());
	%>
</body>
</html>
