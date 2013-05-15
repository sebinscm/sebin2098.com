<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%
String roll_name="";
if (_admingroup.equals("B")) roll_name="Power User"; 
else if (_admingroup.equals("A")) roll_name="Administrator User"; 
else if (_admingroup.equals("N")) roll_name="Normal User"; 
%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<BODY>
<table border="0" cellspacing="1" width="100%" height="217">
  <tr>
<td ALIGN=left height="13"><font color=#333399 size=2>You are logged as "<%= _adminname %>".</font></td>
  </tr>
  <tr>
<td ALIGN=left height="13"><font color=balck size=2><font color="#333399">You are</font> <font color=red size=2><%=roll_name%></font><font color=black size=2> </font>
<font color=#333399 size=2>for SCM admin system.</font></td>
  </tr>
  <tr>
    <td width="100%" height="20">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" height="20"><font size="2"><font color="#333399">Click
    </font><a href="/" target="_top"><font color="#333399">here</font></a><font color="#333399"> to connect to the login page for supplier side.<a href="/" target="_top"><font color="#333399">(http://scm.fastfuturebrands.com.au)</a></font></font></td>
  </tr>
  <tr>
    <td width="100%" height="20">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" height="166">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" height="20">
    <p align="right"><font size="2"><font color="#333399">Last updated by system administrator on 03-April-2011.</font></font></td>
  </tr>
</table>
<%= CopyRightLogo() %>
</BODY>
</HTML>
