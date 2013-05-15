<%@ page language="java" import="java.sql.*,java.io.*,kaywon.file.multipart.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="include/db_conn.jsp" %>
<%@ include file="include/include_com.jsp" %>
<%@ include file="include/include_bbs.jsp" %>

<%
//
String table_name = request.getParameter("table_name");


String oper_type = request.getParameter("oper_type");

String subject = "";
String creator_id = "";
String creator = _adminname;
String creator_email =_adminmail;
String creator_home = "";
String create_date = "";
String contents = "";
String fileName = "";
int fileSize = 0;

int bbs_id=0, hits=0, p_bbs_id=0, p_level=0, p_serial=0;

Connection conn = null;
ResultSet rs = null;

if(oper_type != null)
{
	conn =  DB_Connection();
	bbs_id = Integer.parseInt(request.getParameter("bbs_id"));
	rs = SelectBBS_id(conn, table_name, bbs_id);

	rs.next();

	if(oper_type.equals("update"))
	{
		subject = kscToasc(rs.getString("subject"));
		subject = subject.replace('\b', '\'');
		creator_id = _adminid;
		creator = kscToasc(rs.getString("creator"));
		creator_email = kscToasc(rs.getString("creator_email"));
		creator_home = kscToasc(rs.getString("creator_home"));
		create_date = kscToasc(rs.getString("create_date"));
		contents = kscToasc(rs.getString("contents"));
        	contents = contents.replace('\b', '\'');
		fileName = kscToasc(rs.getString("fileName"));
		fileName = fileName.replace('\b', '\'');
		if(creator_email.equals("null")) creator_email = "";
		if(creator_home.equals("null")) creator_home = "";

	}
	else if(oper_type.equals("ans"))
	{
		subject = kscToasc(rs.getString("subject"));
		subject = subject.replace('\b', '\'');
	}

	hits = rs.getInt("hits");
	p_bbs_id = rs.getInt("p_bbs_id");
	p_level = rs.getInt("p_level");
	p_serial = rs.getInt("p_serial");
	fileSize = rs.getInt("fileSize");

	rs.close();
}

%>
<HTML>
<HEAD>
<TITLE>Upload BBS</TITLE>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript">
<!--
function validateSubmit()
{
  subject = document.hwang_bbs.subject.value;  
  creator = document.hwang_bbs.creator.value;
  password = document.hwang_bbs.password.value;
  contents = document.hwang_bbs.contents.value;
  if (subject == "" )
  {
    alert ("Subject is empty.\nPlease input subject!.");
    document.hwang_bbs.subject.select();
    return false;
  }
  if (creator == "" )
  {
    alert ("Name is empty.\nPlease input Name!");
    document.hwang_bbs.creator.select();
    return false;
  }
  if (password == "" )
  {
    alert ("Password is empty.\nPlease input password!");
    document.hwang_bbs.password.select();
    return false;
  }
  if (contents == "" )
  {
    alert ("Description is empty.\nPlease input description!.");
    document.hwang_bbs.contents.select();
    return false;
  }
  else return true;
}
-->
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
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title"><%= table_name.equals("notice") ? "게시판" : "자료실" %></td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

  <TABLE border="0" width="80%" align='center'>
    <TR>
      <TD colspan="3">
        <UL>
          <LI><FONT size="2">*주의사항: 작성을 위해서는 필히 제목,작성자,비밀번호를 입력해야 합니다!</FONT></LI>
          <LI><FONT size="2">*비밀번호는 자료 수정,삭제시 필요합니다.</FONT></LI>
        </UL>
      </TD>
    </TR>
  </TABLE>
  <FORM name="hwang_bbs" enctype="multipart/form-data" action="insert_check.jsp" method="post" onSubmit="return validateSubmit()">
  <TABLE width="80%" border="0" align='center'>
    <TR>
      <TD width="15%"><FONT size="2">*제 목</FONT></TD>
      <TD width="72%"><INPUT type="text" name="subject" value="<%=subject %>"  size='60' maxlength='60'></TD>
    </TR>
    <TR>
      <TD width="15%"><FONT size="2">*작성자</FONT></TD>
      <TD width="72%"><INPUT type="text" name="creator"  value="<%=creator %>" size="30" maxlength="30">&nbsp;&nbsp;&nbsp;&nbsp;
			<FONT size="2">*비밀번호</FONT>&nbsp;&nbsp;
			<INPUT type="password" name="password"  value="" size="10" maxlength="10"></TD>
    </TR>
    <TR>
      <TD width="15%"><FONT size="2">e-mail address</FONT></TD>
      <TD width="72%"><INPUT type="text" name="creator_email"  value="<%=CheckNull(creator_email) %>" size="60" maxlength="40"></TD>
    </TR>
    <TR>
      <TD width="15%"><FONT size="2">연락처</FONT></TD>
      <TD width="72%"><INPUT type="text" name="creator_home"   value="<%=CheckNull(creator_home) %>" size="60" maxlength="40"></TD>
    </TR>
    <TR>
      <TD width="15%" valign="top"><FONT size="2">Description</FONT></TD>
      <TD width="72%"><TEXTAREA name="contents" cols="60" rows="10"><%=contents %></TEXTAREA></TD>
    </TR>
    <TR>
      <TD width="15%" valign="top"><FONT size="2">첨부화일</FONT></TD>
      <TD width="72%"><INPUT type="file" name="file" size="30" value="<%=CheckNull(fileName) %>"></TD><br>
      <font color=red>**주의)반드시 첨부화일 이름은 영문으로 하세요. 한글이름은 허용하지 않습니다.</font>
    </TR>
    <TR>
      <TD colspan="2">
        <CENTER>
          <!--HR noshade-->
    <br>
		<INPUT type="hidden" name="table_name" value="<%=table_name %>">
		<%
		if(oper_type != null)
		{
		//-----------------------------------------------------------------------
		//  reply
		//-----------------------------------------------------------------------
		%>
			<INPUT type="hidden" name="oper_type" value="<%=oper_type %>">
			<INPUT type="hidden" name="creater_id" value="<%=_adminid %>">
			<INPUT type="hidden" name="bbs_id" value="<%=bbs_id %>">
			<INPUT type="hidden" name="p_bbs_id" value="<%=p_bbs_id %>">
			<INPUT type="hidden" name="p_level" value="<%=p_level %>">
			<INPUT type="hidden" name="p_serial" value="<%=p_serial %>">
			<INPUT type="hidden" name="fileSize" value="<%=fileSize %>">
			<INPUT type="submit" name="Submit" value="Write">
		<%
		}
		else
		{
		//-----------------------------------------------------------------------
		//  new
		//-----------------------------------------------------------------------
			out.println("<INPUT type='submit' name='Submit' value='저장'>");
		}
		%>
          <INPUT type="reset" name="Submit2" value="Reset">
        </CENTER>
      </TD>
    </TR>
  </TABLE>
  </FORM>
  <%
out.println(CopyRightLogo());
%>

</td></tr></table>
</BODY>
</HTML>
