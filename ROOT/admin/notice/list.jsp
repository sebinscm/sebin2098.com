<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ include file="/common/getPageList.jsp" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String seqNo2 = "";
String curPage = request.getParameter("curPage");
if (curPage == null) curPage = "1";

String pageSize = request.getParameter("pageSize");
if (pageSize == null) pageSize = "20";

String searchCategory = request.getParameter("searchCategory");
if (searchCategory == null) searchCategory = "Title";

String searchKeyword = request.getParameter("searchKeyword");
if (searchKeyword == null) searchKeyword = "";

// paging 관련 변수
int iCurPage = 1;
int iPageSize = 20;
int iTotalPage = 1;
int iPageBlockSize = 10;
int iTotalCnt = 0;
int iBeginRownum = 0;
int iEndRownum = 0;
String pageList = "";

try {
  iCurPage = Integer.parseInt(curPage);
  iPageSize = Integer.parseInt(pageSize);
} catch (NumberFormatException ne) {}

// DB 관련 변수
int iRet = 0;

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String outS = "";
String sql = "";
String cntSql = "";
String mainSql = "";
String whereSql = "";
String mainWhereSql = "";
String cntWhereSql = "";
String orderSql = "";
String content = "";
String attachedFiles = "";
// Query 생성 //////////////////////////////////////////////////////////
cntSql = " select count(*) from scm_notice_01t a ";

mainSql = " select  a.seqno,        date_format(a.input_date, '%Y/%m/%d') input_date, "
        + "         a.admin_name,   a.title,    a.read_cnt,   IFNULL(b.file_cnt, 0) file_cnt, "
        + "         curdate()-(a.input_date) date_diff "
        + " from    scm_notice_01t a LEFT OUTER JOIN  "
        + "         ( "
        + "           select  notice_seqno,   count(*) file_cnt "
        + "           from    scm_notice_02t "
        + "           group by notice_seqno "
        + "         ) b ON (a.seqno = b.notice_seqno) ";

mainWhereSql = " where a.seqno > 1  ";
cntWhereSql = " where  1=1 ";            // for skip

if (searchKeyword.length() > 0) {
  String tmpKeyword = searchKeyword.replaceAll("'", "''");

  if (searchCategory.equals("Title")) {
    whereSql += " and     upper(a.title) like upper('%" + tmpKeyword + "%') ";
  } else if (searchCategory.equals("Name")) {
    whereSql += " and     upper(a.admin_name) like upper('%" + tmpKeyword + "%') ";
  }

}

orderSql += " order by a.seqno desc ";
/////////////////////////////////////////////////////////////////////
String inputDate2     = "";
String adminId2       = "";
String adminName2     = "";
int  readCnt2       =0;
String title2         = "";
try {

  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  conn.setAutoCommit(false);
   // read the manual
    sql = " select IFNULL(max(seqno), 0) from scm_notice_01t  ";
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    seqNo2 = matrix.getRowData(0).getData(0);

  // update read count
  sql = " update  scm_notice_01t "
      + " set     read_cnt = IFNULL(read_cnt, 0) + 1 "
      + " where   seqno = ? ";
  pstmt = conn.prepareStatement(sql);
  pstmt.setLong(1, Long.parseLong(seqNo2));
  pstmt.executeUpdate();
  conn.commit();

  // read the notice
  sql = " select  date_format(input_date, '%Y/%m/%d'), admin_id, "
      + "         admin_name, IFNULL(read_cnt, 0), title, content "
      + " from    scm_notice_01t "
      + " where   seqno = " + seqNo2;

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);
  
  if (rs.next()) {
    int j = 0;
    inputDate2     = rs.getString(++j);
    adminId2       = rs.getString(++j);
    adminName2     = rs.getString(++j);
    readCnt2       = rs.getInt(++j);
    title2         = rs.getString(++j);

    // read content
    Clob clob     = rs.getClob(++j);

    Reader clobStream = clob.getCharacterStream();
    StringBuffer buf = new StringBuffer();
    int    nchars = 0;              // Number of characters read
    char[] buffer = new char[10];   //  Buffer holding characters being transferred

    while( (nchars = clobStream.read(buffer)) != -1 ) {   // Read from Clob
      buf.append(buffer, 0, nchars);                      // Write to StringBuffer
    }

    clobStream.close();             // Close the Clob input stream

    content = buf.toString();
    ////////////////////////////
  }

  rs.close();

  // read attached files
  sql = " select  seqno,  attach_file,  attach_real_file "
      + " from    scm_notice_02t "
      + " where   notice_seqno = " + seqNo2
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
  

  // 전체 Count & Paging 변수 세팅
  dataProcess.RetrieveData(cntSql + cntWhereSql + whereSql, matrix, conn);

  iTotalCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  iTotalPage = (iTotalCnt - 1)/iPageSize + 1;
  iBeginRownum = (iCurPage - 1)*iPageSize + 1;
  iEndRownum = iBeginRownum + iPageSize - 1;

  // 해당 페이지의 데이타를 읽어온다.
  
  sql = "    SELECT T2.* FROM( "
          +"        SELECT @RNUM:=@RNUM+1 AS RM, T1.* "
          +"           FROM(  "
          +            mainSql + mainWhereSql + whereSql + orderSql 
          +  ") AS T1, (SELECT @RNUM:=0) R )  AS T2 "
          + "   WHERE RM >=  " + iBeginRownum+"  AND RM <= " + iEndRownum;
  
  //sql = " select  * "
  //    + " from    ( "
  //    + "           select  rownum rnum, innerview.* "
  //    + "           from    ( "
  //    +                       mainSql + whereSql + orderSql
  //    + "                   ) innerview "
  //    + "           where   rownum <= " + iEndRownum
 //     + "         ) "
 //     + " where   rnum >= " + iBeginRownum;
 //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception notice list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  j++;                // Skip reading rnum
  String seqNo        = matrix.getRowData(i).getData(j++);
  String inputDate    = matrix.getRowData(i).getData(j++);
  String adminName    = matrix.getRowData(i).getData(j++);
  String title        = matrix.getRowData(i).getData(j++);
  long readCnt        = Long.parseLong(matrix.getRowData(i).getData(j++));
  int fileCnt         = Integer.parseInt(matrix.getRowData(i).getData(j++));
  int dateDiff        = Integer.parseInt(matrix.getRowData(i).getData(j++));

 // String strLink = "<a href=\"javascript:fnView('" + seqNo + "')\">" + StringUtil.convertTextToHtml(title) + "</a>";
  String strLink = "<a href=\"javascript:fnView('" + seqNo + "')\">" + title + "</a>";
  // new icon
  String newIcon = "";
  if (dateDiff < 7) newIcon = "<img src='/img/ico_new.gif' border='0'>";

  String bgColor = "";
  if (i%2 == 0) bgColor = "#ffffff";
  else          bgColor = "#F6F5E3";

  outS += "<tr align='center' class='table_list' style='background-color:" + bgColor + ";'>"
        + "  <td>" + seqNo + "</td>"
        + "  <td>" + inputDate + "</td>"
        + "  <td>" + fileCnt + "</td>"
        + "  <td>" + readCnt + "</td>"
        + "  <td>" + adminName + "</td>"
        + "  <td align='left'>" + newIcon + " " + strLink + "</td>"
        + "</tr>";
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
    seqNo.value = pSeqNo;
    action = "./view.jsp";
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
<tr>
  <td width="15%" class="table_header_center">Date</td>
  <td width="20%" class="table_bg_bright_center"><%= inputDate2 %></td>
  <td width="15%" class="table_header_center">Admin Name</td>
  <td width="20%" class="table_bg_bright_center"><%= adminName2 %></td>
  <td width="15%" class="table_header_center">Read Count</td>
  <td width="15%" class="table_bg_bright_center"><%= readCnt2 %></td>
</tr>
<tr>
  <td class="table_header_center">Title</td>
  <td colspan="5" class="table_bg_bright"><%= title2 %></td>
</tr>
<tr>
  <td class="table_header_center">Attached Files</td>
  <td colspan="5" class="table_bg_bright"><%= attachedFiles %>&nbsp;</td>
</tr>
<tr>
  <td colspan="6" height="300" valign="top" class="table_bg_white"><%= content %>&nbsp;</td>
</tr>
</table>
<br>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<form name="form1" method="post">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="seqNo">
<tr>
 <%
  	   if ( _adminclass.equals("1")) {
     %> 
  <td width="50%" align="left">
    <input type="button" value=" New " onclick="fnNew(this.form);" class="button_default">
  </td>
      <%
    }
    %>	
  <td width="50%" align='right'><select name="searchCategory">
      <option value="Title" <%= (searchCategory.equals("Title") ? "selected" : "") %>>Title</option>
      <option value="Name" <%= (searchCategory.equals("Name") ? "selected" : "") %>>Name</option>
    </select>
    <input type="text" name="searchKeyword" value="<%= searchKeyword %>" size="30" maxlength="30" class="input_text">
    <input type="button" value="Search" onclick="fnSearch(this.form);" class="button_default"></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="50%">Page Size :
    <select name="pageSize" onChange="fnGoPage(1)">
      <option value="20" <%= pageSize.equals("20") ? "selected" : "" %>>20</option>
      <option value="50" <%= pageSize.equals("50") ? "selected" : "" %>>50</option>
      <option value="100" <%= pageSize.equals("100") ? "selected" : "" %>>100</option>
    </select></td>  
  <td width="*" align="right" valign="bottom">Total : <%= iTotalCnt %>, Current Page : <%= iCurPage %> / <%= iTotalPage %>&nbsp;</td>
</tr>
</table>

<table width="99%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<tr class="table_header_center">
  <td width="9%">Seq No</td>
  <td width="9%">Input Date</td>
  <td width="9%">File Count</td>
  <td width="9%">Read Count</td>
  <td width="14%">Name</td>
  <td width="50%">Title</td>
</tr>
<%= outS %>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" align="center"><%= pageList %></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
<!--tr>
  <td width="100%" align="center">
    <input type="button" value="NEW" onclick="fnNew(this.form);" class="button_default">
  </td>
</tr-->
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</body>
</html>
