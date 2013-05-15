<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/getPageList.jsp" %>
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

if (curPage == null) curPage = "1";
if (pageSize == null) pageSize = "20";
if (noticeType == null) noticeType = "1";
if (searchCategory == null) searchCategory = "Title";
if (searchKeyword == null) searchKeyword = "";

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

// paging °u·A º?¼o
int iCurPage = 1;
int iPageSize = 20;
int iTotalPage = 1;
int iPageBlockSize = 10;
int iTotalCnt = 0;
String pageList = "";

try {
  iCurPage = Integer.parseInt(curPage);
  iPageSize = Integer.parseInt(pageSize);
} catch (NumberFormatException ne) {}

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  // 
  sql = " select  count(*)  from notice_01t where type = " + noticeType;
	dataProcess.RetrieveData(sql, matrix, conn);
  iTotalCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  iTotalPage = (iTotalCnt - 1)/iPageSize + 1;


  int iOffset = (iCurPage - 1)*iPageSize;
  sql = " select  a.seqno, date_format(a.input_date, '%Y/%m/%d'), a.user_name, a.title, a.read_cnt, "
      + "         ifnull(b.file_cnt, 0), datediff(now(), input_date) "
      + " from    notice_01t a "
      + "         left outer join "
      + "         ( "
      + "           select  notice_seqno,   count(*) file_cnt "
      + "           from    notice_02t "
      + "           group by notice_seqno "
      + "         ) b "
      + "           on a.seqno = b.notice_seqno "
      + " where   a.type = " + noticeType;

  if (searchKeyword.length() > 0) {
    String tmpKeyword = searchKeyword.replaceAll("'", "''");
  
    if (searchCategory.equals("Title")) {
      sql += " and     upper(a.title) like upper('%" + tmpKeyword + "%') ";
    } else if (searchCategory.equals("Name")) {
      sql += " and     upper(a.user_name) like upper('%" + tmpKeyword + "%') ";
    }
  }

  sql += " order by a.seqno desc "
       + " limit " + iOffset + ", " + iPageSize;

  //out.println(sql); if (true) return;
	iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String seqno        = matrix.getRowData(i).getData(j++);
  String inputDate    = matrix.getRowData(i).getData(j++);
  String userName     = matrix.getRowData(i).getData(j++);
  String title        = matrix.getRowData(i).getData(j++);
  long readCnt        = Long.parseLong(matrix.getRowData(i).getData(j++));
  int fileCnt         = Integer.parseInt(matrix.getRowData(i).getData(j++));
  int dateDiff        = Integer.parseInt(matrix.getRowData(i).getData(j++));

  String strLink = "<a href=\"javascript:fnView('" + seqno + "')\">" + StringUtil.convertTextToHtml(title) + "</a>";

  // new icon
  String newIcon = "";
  if (dateDiff < 1) newIcon = "<img src='/img/ico_new2.gif' border='0'>";

  String bgColor = "";
  if (i%2 == 0) bgColor = "#ffffff";
  else          bgColor = "#F6F5E3";

  outS += "<tr align='center' class='table_list' style='background-color:" + bgColor + ";'>"
        + "  <td>" + seqno + "</td>"
        + "  <td>" + inputDate + "</td>"
        + "  <td>" + fileCnt + "</td>"
        + "  <td>" + readCnt + "</td>"
        + "  <td>" + userName + "</td>"
        + "  <td align='left'>" + strLink + " " + newIcon + "</td>"
        + "</tr>";
}

if (iRet == 0 ) {
  outS += "<tr><td width='100%' align='center' colspan='6' class='table_list'>Data are Not found.</td></tr>";
}
// Paging.
pageList = getPageList(iCurPage, iTotalCnt, iPageSize, iPageBlockSize);
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javascript">
function fnGoPage(page) {
  with (document.form1) {
    curPage.value = page;
    action = "./list.jsp";
    submit();
  }
}

function fnNotice(type) {
  with (document.form0) {
    noticeType.value = type;
    action = "./list.jsp";
    submit();
  }
}

function fnSearch(frm) {
  if (jf_ChkValue(frm.searchKeyword.value)) {
    frm.searchKeyword.value = frm.searchKeyword.value.replace(/"/g, "'");
  }

  frm.curPage.value = '1';
  frm.action="./list.jsp";
  frm.submit();
}

function fnNew(frm) {
  frm.curPage.value = '1';
  frm.action = "./form.jsp";
  frm.submit();
}

function fnView(pSeqNo) {
  with (document.form1) {
    seqno.value = pSeqNo;
    action = "./view.jsp";
    submit();
  }
}

function fnBack(frm) {
  frm.action="./list.jsp";
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
<form name="form1" method="post" >
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<input type="hidden" name="curPage" value="<%= curPage %>" >
<input type="hidden" name="noticeType" value="<%= noticeType %>" >
<input type="hidden" name="seqno">
<tr>
  <td width="15%" align='center'><select name="searchCategory">
      <option value="Title" <%= (searchCategory.equals("Title") ? "selected" : "") %>>Title</option>
      <option value="Name" <%= (searchCategory.equals("Name") ? "selected" : "") %>>Name</option>
    </select>
    <input type="text" name="searchKeyword" value="<%= searchKeyword %>" size="30" maxlength="30" class="input_text">
    <input type="button" value="Search" onclick="fnSearch(this.form);" class="button_default"></td>
</tr>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="50%">Items per page :
    <select name="pageSize" onChange="fnGoPage(1)">
      <option value="20" <%= pageSize.equals("20") ? "selected" : "" %>>20</option>
      <option value="50" <%= pageSize.equals("50") ? "selected" : "" %>>50</option>
      <option value="100" <%= pageSize.equals("100") ? "selected" : "" %>>100</option>
    </select></td>
  <td width="*" align="right" valign="bottom">Total : <%= iTotalCnt %>, Current Page : <%= iCurPage %> / <%= iTotalPage %>&nbsp;</td>
</tr>
</table>
<table width="800" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<tr class="table_header_center">
  <td width="9%">No.</td>
  <td width="9%">Date</td>
  <td width="9%">Attachment</td>
  <td width="9%">View</td>
  <td width="20%">ID</td>
  <td width="44%">Subject</td>
</tr>
<%= outS %>
</table>

<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" align="center"><%= pageList %></td>
</tr>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%" align="center">
    <input type="button" value="Create New" onclick="fnNew(this.form);" class="button_default">
    <!--input type="button" value="Back" onclick="fnBack(this.form);" class="button_default"-->
  </td>
</tr>
</form>
<form name="form0" method="post">
<input type="hidden" name="noticeType">
</form>
</table>

</td></tr></table>
<%
	out.println(CopyRightLogo());
	%>
</body>
</html>
