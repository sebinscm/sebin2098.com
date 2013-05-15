<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/board/board.util.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String seqNo = request.getParameter("seqNo");
//String searchCategory = request.getParameter("searchCategory");
//String searchKeyword = request.getParameter("searchKeyword");

Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "";

// Notice 관련 변수
String inputDate = "";
String adminName = "";
String title = "";
String content = "";
int readCnt = 0;
String attachedFiles = "";

// default값 세팅.
//inputDate = DateUtil.getToday("yyyy/MM/dd/");
inputDate ="";
adminName = _adminname;

// seqNo값이 넘어온 경우 수정이므로 DB에서 해당 값을 읽어온다.
if (seqNo.length() > 0) {

  try {
    dataProcess = new dbconn.DataProcess();
   Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

    // read the notice
    sql = " select  to_char(input_date, 'yyyy/mm/dd'), admin_name, "
        + "         nvl(read_cnt, 0), title, content "
        + " from    scm_notice_01t "
        + " where   seqno = " + seqNo
        + " and     admin_id = '" + _adminid + "' ";

    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    
    if (rs.next()) {
      int j = 0;
      inputDate     = rs.getString(++j);
      adminName     = rs.getString(++j);
      readCnt       = rs.getInt(++j);
      title         = rs.getString(++j);
      //out.println(rs.getString(5));
      // read content
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
    }    
    rs.close();

    // read attached files
   //  sql = " select  seqno,  attach_file,  attach_real_file "
   //     + " from    scm_notice_02t "
   //     + " where   notice_seqno = " + seqNo
   //     + " order by seqno desc ";

    //rs = stmt.executeQuery(sql);

    //int i = 0;
    //while (rs.next()) {
    //  int j = 0;
    //  long fileSeqNo        = rs.getLong(++j);
    //  String attachFile     = rs.getString(++j);
    //  String attachRealFile = rs.getString(++j);

   //   if (i++ > 0) attachedFiles += "<br>";

  //    attachedFiles += "<input type='checkbox' name='oldAttachedFile' value='" + fileSeqNo + "/" + attachRealFile + "'>"
  //                  + "<a href=\"javascript:fnDownload('" + attachFile + "', '" + attachRealFile + "');\">"
  //                  + attachFile + "</a>";
  //  }

  } catch (Exception e) {
    try { conn.rollback(); } catch (Exception ex) {}
    System.out.println("Exception form : " + e.getMessage());
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

}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="vbscript" src="/common/board/board.vb"></script>
<script language="javascript">
function fnList(frm) {
  with (document.form0) {
    action = "./list.jsp";
    submit();
  }
}

function fnSave(frm) {
  frm.title.value = frm.title.value.replace(/"/g, "'");

  if (!jf_ChkValue(frm.title.value)) {
    alert("Enter title.");
    frm.title.select();
    return;
  }

  if(frm.siba != null) {
    frm.content.value = frm.siba.MIMEValue;
  }

  if (confirm("Do you really want to save these data?")) {
    frm.action = "./save.jsp";
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
  <td width="*" class="left_title">&nbsp;&nbsp;&nbsp;Create New Notice for System Administrator</td>
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
<input type="hidden" name="seqNo" value="<%= seqNo %>">
<input type="hidden" name="content" value="<%= convertHtmlchars(content) %>">
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
  <td colspan="5" class="table_bg_bright"><input type="text" name="title" value="<%= title %>" size="110" maxlength="200" class="input_text"></td>
</tr>

<tr>
  <td colspan="6" height="300" valign="top" class="table_bg_bright">
    <object width="0" height="0" classid="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
    <param name="LPKPath" value="/common/board/NamoWe_valleygirl.lpk">
    </object>
    <object id="siba" width="775" height="400" classid="CLSID:898FD2A4-B75E-11d4-BFF3-0050FC1AFCDD" codebase="/common/board/NamoWe.cab#version=2,1,0,3">
    </object></td>
</tr>
<!--tr>
  <td class="table_header_center">File Attachment</td>
  <td colspan="5" class="table_bg_bright"><input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'></td>
</tr-->
</table>

<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" align="center">
    <input type="button" value="List" onclick="fnList();" class="button_default">
    <input type="button" value="Save" onclick="fnSave(this.form);" class="button_default">
  </td>
</tr>
</table>
</form>
<%
out.println(CopyRightLogo());
%>
<form name="form0" method="post">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
</form>
<!--form name="form2" method="post">
<input type="hidden" name="attachPath" value="<%= _ManagementNoticeUploadUrl %>">
<input type="hidden" name="attachFile">
<input type="hidden" name="attachRealFile">
</form>
</td></tr></table>
<iframe name="hiddenFrm" src="" width="0" height="0" frameborder="0"></iframe-->
</body>
</html>
