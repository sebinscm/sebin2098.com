<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@ include file="include/db_conn.jsp" %>
<%@ include file="include/include_com.jsp" %>
<%@ include file="include/include_bbs.jsp" %>
<%
Connection conn =  DB_Connection();

//String oper_type = request.getParameter("oper_type");
String oper_type ="index";
%>
<HTML>
<HEAD>
<TITLE>Welcome to Suppiier BBS.</TITLE>
<%@ include file="include/style.css" %>
</HEAD>
<BODY  bgcolor="f5f5f5">
<left>
<TABLE cellSpacing=0 cellPadding=0 width="433"  background="../img/Inner_bg.gif" border=0>
<TBODY> <TR>
<TD vAlign=bottom align=right>
<TABLE cellSpacing=0 cellPadding=5 width="433" border=0>
<TBODY>
<TR>
<TD class=smalltextyel>&nbsp;</TD></TR>
<TR> <TD class=headingtext><font color=white size=4><b> Q & A Administrator </b></font></TD></TR></TBODY></TABLE></TD>
<TD><IMG height=77 alt=Consulting src="../img/header.jpg" ></TD></TR></TBODY>
</TABLE>
  <TABLE border="0" width="65%">
    <TR> 
      <TD> 
        <UL>
          <LI><FONT size="2">welcomt to VG Bulletin board.</FONT></LI>
          <LI><FONT size="2">JSP version 0.92 </FONT></LI>
          <LI><FONT size="2">A.P.M (Apache,Resin, JSP, Oracle)</FONT></LI>
          <LI><FONT size="2">(Apache + Resin + JDK1.2.2 + Oracle9i).</FONT></LI>
          <LI><FONT size="2">Request mail to <a href="mailto:jeffreysong@valleygirl.com.au>support@valleygirl.com.au</a>  </FONT></LI>
        </UL>
      </TD>
    </TR>
    <TR> 
    	<TD><centeR><font color="blue" size="4"><b>2005/10/01 Version</b></font></center>
    	<br>
    	<FONT size="2" color="navy"><b>Q&A Administation for VG SCM</b></font>
    	<br><br><FONT size="2">  	  	
    	</td>
    </tr>
<%
if(oper_type == null)
{
%>
    <tr><TD><FONT size="2">
    	<FORM action="link.jsp" method="post" >
    	<IMG src="images/red.gif" width="20" height="20">
    	<input type="hidden" name="oper_type" value="create_table">
    	<input type="text" name="table_name" value="" size="20" maxlength="20">
    	<input type="submit" name="submit" value="Create bbs table"></FONT>
    	</FORM>
    	</TD>
    </tr>
<%
}
else if(oper_type.equals("index"))
{
	//String table_name = request.getParameter("table_name");
       String table_name = "bbs";
%>
	<tr><TD align="center"><FONT size="2"><a href="list.jsp?table_name=<%=table_name %>"> Go to Bulletin Board Service</a></td></tr>
<%
}
%>
  </TABLE>
    	<font color="navy" size="2"><b>copyright(c) 2005 valleygirl fashions Pty Ltd</b></font>
<br><br>    	
<% out.println(CopyRightLogo()); %> 
</CENTER>
</BODY>
</HTML>

