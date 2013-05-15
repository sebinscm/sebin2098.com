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
String seqNo = request.getParameter("seqNo");
String adminid ="";
String adminname ="";
String idate ="";
String title ="";
String contents ="";
String attachedFiles = "";
int readCnt = 0;

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql  = "";
String outS = "";

 // read the notice
    sql = " select  str_to_date(date_format(input_date, '%Y/%m/%d'),'%Y/%m/%d'), admin_name, "
        + "         ifnull(read_cnt, 0), title, content "
        + " from    scm_notice_01t "
        + " where   seqno = " + seqNo
        + " and     admin_id = '" + _adminid + "' ";

try {

    Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);
  
   if (rs.next()) {    
    adminname = rs.getString(2);
    idate = rs.getString(1);
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
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="vbscript" src="/common/board/board.vb"></script>
<SCRIPT LANGUAGE="JavaScript">
function List(form)
{
	location.href = "./list.jsp";
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
  <td width="3%"><img src="/img/btnFolder.gif"></td>
  <td width="*" class="left_title">&nbsp;&nbsp;&nbsp;Edit Notice for Sebin User</td>
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
  <td width="100%">No. : <B><%=seqNo%></B></td>
</tr>
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>

<TABLE WIDTH=700 border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM NAME=frmMain METHOD=POST enctype="multipart/form-data" >
<INPUT type ="HIDDEN" NAME=seqNo   VALUE="<%=seqNo%>">
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
<%
if (seqNo.length() > 0) {
%>
  <tr>
    <td class="table_header_center">Attached Files</td>
    <td colspan="5" class="table_bg_bright">* Tick files you want to delete<br><%= attachedFiles %>&nbsp;</td>
  </tr> 
<%
}
%>
<TR>
    <td colspan=4 class="table_bg_bright">
      <object width=0 height=0 classid="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
      <param name="LPKPath" value="/common/board/NamoWe_valleygirl.lpk">
      </object>
      <object id="siba" width=700 height=500 classid="CLSID:898FD2A4-B75E-11d4-BFF3-0050FC1AFCDD" codebase="/common/board/NamoWe.cab#version=2,1,0,3">
      </object>
    </td>
</TR>
<tr>
  <td class="table_header_center">File Attachment</td>
  <td colspan="5" class="table_bg_bright"><input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>
    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'></td>
</tr>
</TABLE>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15"></td>
</tr>
<tr>
  <td width="100%" align='center'>
    <INPUT TYPE=BUTTON VALUE=" Cancel " ONCLICK="List(document.frmMain)">
    <INPUT TYPE="BUTTON" VALUE=" Save " ONCLICK="fnSave(document.frmMain)">
  </td>
</tr>
</FORM>
</table>
<form name="form2" method="post">
<input type="hidden" name="attachPath" value="<%= _ManagementNoticeUploadUrl %>">
<input type="hidden" name="attachFile">
<input type="hidden" name="attachRealFile">
</form>
</td></tr></table>
<iframe name="hiddenFrm" src="" width="0" height="0" frameborder="0"></iframe>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
