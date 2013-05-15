<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/board/board.util.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String noticeType = request.getParameter("noticeType");
String searchCategory = request.getParameter("searchCategory");
String searchKeyword = request.getParameter("searchKeyword");
String seqno = request.getParameter("seqno");

int iRet = 0;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "";

// variables
String inputDate = "";
String userName = "";
String title = "";
String contents = "";
long readCnt = 0;
String attachedFiles = "";

// default값 세팅.
inputDate = DateUtil.getToday("yyyy/MM/dd");
userName = scmnm;

// seqno값이 넘어온 경우 수정이므로 DB에서 해당 값을 읽어온다.
if (seqno.length() > 0) {

  try {

    Context ic = new InitialContext(); 
    DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
    conn = ds.getConnection();

    sql = " select  date_format(input_date, '%Y/%m/%d'),  user_name, "
        + "         title, content, read_cnt "
        + " from    notice_01t "
        + " where   seqno = " + seqno
        + " and     type = " + noticeType
        + " and     user_id = '" + scmid + "' ";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
  
   if (rs.next()) {    
    userName = rs.getString(2);
    inputDate = rs.getString(1);
    title = rs.getString(3);
    readCnt = rs.getLong(5);
    Clob clob   = rs.getClob(4);
    Reader clobStream = clob.getCharacterStream();
    StringBuffer buf = new StringBuffer();
    int    nchars = 0; // Number of characters read
    char[] buffer = new char[10];  //  Buffer holding characters being transferred

    while( (nchars = clobStream.read(buffer)) != -1 ) // Read from Clob
      buf.append(buffer, 0, nchars);        // Write to StringBuffer

    clobStream.close();  // Close the Clob input stream

    contents = buf.toString();
   
  } 
  
   // read attached files
   sql = " select  seqno,  attach_file,  attach_real_file "
        + " from    notice_02t "
        + " where   notice_seqno = " + seqno
        + " order by seqno desc ";

    rs = stmt.executeQuery(sql);

    int i = 0;
    while (rs.next()) {
      int j = 0;
      long fileSeqNo        = rs.getLong(++j);
      String attachFile     = rs.getString(++j);
      String attachRealFile = rs.getString(++j);

      if (i++ > 0) attachedFiles += "<br>";

      attachedFiles += "<input type='checkbox' name='oldAttachedFile' value='" + fileSeqNo + "/" + attachRealFile + "'>"
                    + "<a href=\"javascript:fnDownload('" + attachFile + "', '" + attachRealFile + "');\">"
                    + attachFile + "</a>";
    }

} catch (Exception e) {
  System.out.println("Exception /admin/notice/edit_form : " + e.getMessage());
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

}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="vbscript" src="/common/board/board.vb"></script>
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

function fnSave(frm) {
  frm.title.value = frm.title.value.replace(/"/g, "'");

  if (!jf_ChkValue(frm.title.value)) {
    alert("Enter title.");
    frm.title.select();
    return;
  }

  if(frm.siba != null) {
    frm.contents.value = frm.siba.MIMEValue;
  }

  if (confirm("Do you really want to save these data?")) {
    frm.action = "./buyer_save.jsp";
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

<table width="800" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<form name="form1" method="post" enctype="multipart/form-data">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
<input type="hidden" name="noticeType" value="<%= noticeType %>">
<input type="hidden" name="searchCategory" value="<%= searchCategory %>">
<input type="hidden" name="searchKeyword" value="<%= searchKeyword %>">
<input type="hidden" name="seqno" value="<%= seqno %>">
<input type="hidden" name="contents" value="<%= convertHtmlchars(contents) %>">
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
  <td colspan="5" class="table_bg_bright"><input type="text" name="title" value="<%= title %>" size="110" maxlength="200" class="input_text"></td>
</tr>
<%
if (seqno.length() > 0) {
%>
  <tr>
    <td class="table_header_center">Attachment</td>
    <td colspan="5" class="table_bg_bright">* Tick files you want to delete<br><%= attachedFiles %>&nbsp;</td>
  </tr>
<%
}
%>
<tr>
  <td colspan="6" height="300" valign="top" class="table_bg_bright">
    <object width="0" height="0" classid="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
    <param name="LPKPath" value="/common/board/NamoWe_valleygirl.lpk">
    </object>
    <object id="siba" width="775" height="400" classid="CLSID:898FD2A4-B75E-11d4-BFF3-0050FC1AFCDD" codebase="/common/board/NamoWe.cab#version=2,1,0,3">
    </object></td>
</tr>
<tr>
  <td class="table_header_center">File Attachment</td>
  <td colspan="5" class="table_bg_bright"><input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'></td>
</tr>
</table>

<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" align='center'>
    <input type="button" value="List" onclick="fnList(document.form0);" class="button_default">
    <input type="button" value="Save" onclick="fnSave(this.form);" class="button_default">
  </td>
</tr>
</form>
<form name="form0" method="post">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
<input type="hidden" name="noticeType" value="<%= noticeType %>">
<input type="hidden" name="searchCategory" value="<%= searchCategory %>">
<input type="hidden" name="searchKeyword" value="<%= searchKeyword %>">
</form>
<form name="form2" method="post">
<input type="hidden" name="attachPath" value="<%= _noticeDataUrl %>">
<input type="hidden" name="attachFile">
<input type="hidden" name="attachRealFile">
</form>
</table>
</td></tr></table>
<iframe name="hiddenFrm" src="" width="0" height="0" frameborder="0"></iframe>
<%
	out.println(CopyRightLogo());
	%>
</body>
</html>
