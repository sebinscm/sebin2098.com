<%@ page language="java" import="java.sql.*,java.io.*,kaywon.file.multipart.*" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="include/db_conn.jsp" %>
<%@ include file="include/include_com.jsp" %>
<%@ include file="include/include_bbs.jsp" %>

<%
Connection conn =  DB_Connection();

String oper_type = request.getParameter("oper_type");
%>
<HTML>
<HEAD>
<TITLE>Welcomt to download</TITLE>
<%@ include file="include/style.css" %>
</HEAD>
<BODY bgcolor="#FFCC66">
<CENTER>
  <p>Download</p>
  <HR width=550 size=2 >  
  <TABLE border="0" width="65%">
<%
if(oper_type == null)
{
%>
    <tr><TD><FORM action="link.jsp" method="post" >
    	<FONT size="2">
    	<IMG src="images/red.gif" width="20" height="20">
    	<input type="hidden" name="oper_type" value="create_table">
    	<input type="text" name="table_name" value="" size="20" maxlength="20">
    	<input type="submit" name="submit" value="download table create"></font>
    	</FORM>
    	</TD>
    </tr>
<%
}
else if(oper_type.equals("index"))
{
	String table_name = request.getParameter("table_name");
%>
	<tr><TD align="center"><FONT size="2"><a href="list.jsp?table_name=<%=table_name %>">Go to download</a></font></td></tr>
<%
}
%>
  </TABLE>
    	<font color="navy" size="2"><b>.....</b></font>
<br><br>    	
<% out.println(CopyRightLogo()); %> 
</CENTER>
</BODY>
</HTML>

