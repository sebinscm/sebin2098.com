<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@ include file="include/db_conn.jsp" %>
<%@ include file="include/include_com.jsp" %>
<%@ include file="include/include_bbs.jsp" %>
<%
//
String table_name = request.getParameter("table_name");

String url = null;
String oper_type = request.getParameter("oper_type");
String bbs_id = request.getParameter("bbs_id");

//------------------------------------------------------------------------
//
//------------------------------------------------------------------------
if(oper_type == null)
{
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE=JavaScript>

function Back()
{
  history.back();
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

	  <TABLE border="0" width="99%" align="center">
	    <TR>
	      <TD colspan="3">
	        <UL>
	          <LI><FONT size="2">Record not found.</FONT></LI>
	          <LI><FONT size="2">If you want to create new please click  "Write"!</FONT></LI>
	          <LI><FONT size="2"><FONT color=green> </FONT>Today new write.</FONT></LI>
	        </UL>
	      </TD>
	    </TR>
	    </TABLE>
	  <TABLE width="99%" border="0" align="center">
	  <FORM action='insert.jsp' method=post >
	    <TR>
	      <TD>
	        <CENTER>
	          <INPUT type="hidden" name="table_name" value="<%=table_name %>">
                  <INPUT TYPE=BUTTON VALUE=Back ONCLICK=JavaScript:Back()>
                  <INPUT type="submit" name="Submit" value="Write">
	        </CENTER>
	      </TD>
	    </TR>
	    </FORM>
	  </TABLE>
	  <%
	out.println(CopyRightLogo());
	%>

  </td></tr></table>
	</BODY>
	</HTML>
<%
}
//------------------------------------------------------------------------
//
//------------------------------------------------------------------------
else if(oper_type.equals("create_table"))
{
	Connection conn =  DB_Connection();

	int result = CreateBBSTABLE(conn, table_name);

	url = "index.jsp?oper_type=index&table_name="+table_name;
	out.println(Redirect(url));
}

//------------------------------------------------------------------------
//
//------------------------------------------------------------------------
else
{
	if (oper_type.equals("hwang"))		//
	{
		url = "list.jsp?table_name="+table_name;
	}
	else if (oper_type.equals("update"))	//
	{
		url = "insert.jsp?oper_type="+oper_type+"&table_name="+table_name+"&bbs_id="+bbs_id;
	}
	else if (oper_type.equals("ans"))	//
	{
		url = "insert.jsp?oper_type="+oper_type+"&table_name="+table_name+"&bbs_id="+bbs_id;
	}

out.println(Redirect(url));

}

%>
