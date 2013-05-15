<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@ include file="include/db_conn.jsp" %>
<%@ include file="include/include_com.jsp" %>
<%@ include file="include/include_bbs.jsp" %>
<%
//
String table_name = request.getParameter("table_name");
int bbs_id = Integer.parseInt(request.getParameter("bbs_id"));

Connection conn =  DB_Connection();

ResultSet rs = SelectBBS_id(conn, table_name, bbs_id);
rs.next();

String subject = kscToasc(rs.getString("subject"));
String creator = kscToasc(rs.getString("creator"));
String creator_email = kscToasc(rs.getString("creator_email"));
String creator_home = kscToasc(rs.getString("creator_home"));
String create_date = kscToasc(rs.getString("create_date"));
String contents = kscToasc(rs.getString("contents"));
int hits = rs.getInt("hits")+1;
int p_bbs_id = rs.getInt("p_bbs_id");
int p_level = rs.getInt("p_level");
int p_serial = rs.getInt("p_serial");

rs.close();

String contents_conv = convertHtmlBr(contents);

UpdateBBSHits(conn, table_name, bbs_id, hits);

%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Q & A</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

  <TABLE width="99%" border="1" cellpadding="1" cellspacing="1" bordercolor="black" align='center'>
    <TR>
      <TD width="14%" bgcolor="ffd700"><FONT size="2" >ID</FONT></TD>
      <TD width="37%"><FONT size="2"><%=bbs_id %>&nbsp;</FONT></TD>
      <TD width="12%" bgcolor="ffd700"><FONT size="2" >Name</FONT></TD>
      <TD width="37%"><FONT size="2"><%=CheckNull(creator) %>&nbsp;</FONT></TD>
    </TR>
    <TR>
      <TD width="14%" bgcolor="ffd700"><FONT size="2" >Date</FONT></TD>
      <TD width="37%"><FONT size="2"><%=CheckNull(create_date) %>&nbsp;</FONT></TD>
      <TD width="12%" bgcolor="ffd700"><FONT size="2" >Hit</FONT></TD>
      <TD width="37%"><FONT size="2"><%=hits %></FONT></TD>
    </TR>
    <TR>
      <TD width="14%" bgcolor="ffd700"><FONT size="2" >Homepage</FONT></TD>
      <TD width="37%"><FONT size="2">
	<%
		if(creator_home != null)
		{
			out.println("<A href='http://"+creator_home+"'>");
			out.println(creator_home+"</A>");
		}

	%>
        &nbsp;</FONT></TD>
      <TD width="12%" bgcolor="ffd700"><FONT size="2" >E-mail</FONT></TD>
      <TD width="37%"><FONT size="2">
	<%
		if(creator_email != null)
		{
			out.println("<A href='mailto:"+creator_email+"'>");
			out.println(creator_email+"</A>");
		}
	%>
        &nbsp;</FONT></TD>
    </TR>
    <TR>
      <TD width="14%" bgcolor="ffd700"><FONT size="2" >Subject</FONT></TD>
      <TD colspan="3"><FONT size="2"><%=CheckNull(subject) %>&nbsp;</FONT></TD>
    </TR>
    <TR>
      <TD width="14%" bgcolor="ffd700" valign="top" height="143"><FONT size="2" >Contents</FONT></TD>
      <TD colspan="3" height="143" valign="top"><FONT size="2"><%=contents_conv %>&nbsp;</FONT></TD>
    </TR>
  </TABLE>
  <BR>

  <TABLE border="0" width="99%" align='center'>
    <TR>
        <TD>
          <A href="link.jsp?oper_type=hwang&table_name=<%=table_name %>&bbs_id=0"
          	onMouseOver="window.status=('List'); return true;" onMouseOut="window.status=(''); return true;"><IMG src="images/v_list.gif" border=0></a>
        </TD>
        <TD>
          <A href="link.jsp?oper_type=update&table_name=<%=table_name %>&bbs_id=<%=bbs_id %>" onMouseOver="window.status=('Modify'); return true;" onMouseOut="window.status=(''); return true;"><IMG src="images/v_modify.gif" border=0></a>
        </TD>
	<TD>
          <A href="link.jsp?oper_type=ans&table_name=<%=table_name %>&bbs_id=<%=bbs_id %>" onMouseOver="window.status=('Reply'); return true;" onMouseOut="window.status=(''); return true;"><IMG src="images/v_reply.gif" border=0></a>
        </TD>
	<TD>
          <A href="delete.jsp?table_name=<%=table_name %>&bbs_id=<%=bbs_id %>" onMouseOver="window.status=('Delete'); return true;" onMouseOut="window.status=(''); return true;"><IMG src="images/v_delete.gif" border=0></a>
        </TD>
    </TR>
  </TABLE>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
