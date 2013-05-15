<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="include/db_conn.jsp" %>
<%@ include file="include/include_com.jsp" %>
<%@ include file="include/include_bbs.jsp" %>

<%
String table_name = request.getParameter("table_name");
int bbs_id        = Integer.parseInt(request.getParameter("bbs_id"));
String password   = request.getParameter("password");
String check      = request.getParameter("check");
%>
<HTML>
<HEAD>
<TITLE>BBS Delete</TITLE>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript">
<!--
function validateSubmit()
{
  password = document.hwang_bbs.password.value;

  if (password == "" )
  {
    alert ("Password Not found.\nPlease try again1");
    document.hwang_bbs.password.select();
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
  <td width="*" class="left_title"><%= table_name.equals("notice") ? "Manuals" : "Tag Specs" %></td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

  <FORM name="hwang_bbs" action="delete.jsp" method="post" onSubmit="return validateSubmit()">
  <TABLE width="60%" border="0" align='center'>
    <TR>
      <td align="center">
<%
//--------------------------------------------------------------
//
//--------------------------------------------------------------
if(password == null)
{
	if(check == null)
		out.println("<FONT size='2'>Input password!</FONT>");
	else
		out.println("<FONT size='2' color='red'><b>Wrong password! please try again!</b></FONT>");
%>
      </td>
      <TD>
      	<INPUT type="hidden" name="table_name" value="<%=table_name %>">
      	<INPUT type="hidden" name="bbs_id" value="<%=bbs_id %>">
      	<INPUT type="password" name="password" value="" size="10" maxlength="10">
      	<INPUT type="submit" name="Submit" value="Delete">
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
<%
}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
else
{
	Connection conn =  DB_Connection();
	int result = DeleteBBS(conn, table_name, bbs_id, password);
	String url;

	if(result == 0)
		url = "delete.jsp?table_name="+table_name+"&bbs_id="+bbs_id+"&check=error";
	else
		url = "admin_list.jsp?table_name="+table_name;

	out.println(Redirect(url));
}
%>