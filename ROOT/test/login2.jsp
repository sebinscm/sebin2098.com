
<ge contentType="text/html; charset=euc-kr"   session="true" %>
<%@ page import="java.io.*,java.util.*"%>
<html>
<body>
<% 
if(session.getValue("scmid") == null  ){

 response.sendRedirect("/login_first.html");

}
%>

<%
String scmid="";
String scmnm="";
if(request.getParameter("scmid") != null){
  scmid=request.getParameter("scmid");
  scmnm = (String) session.getAttribute("scmnm");
  session.putValue("scmid",scmid);
  session.putValue("scmnm",scmnm);
  java.util.Enumeration st = session.getAttributeNames();
}
%>
 <br>
 <table border="1" align="center">
              <tr>
                          <td>getCreationTime()</td>
                          <td><%=(new Date(session.getCreationTime()))%></td>
              </tr>
              <tr>
                          <td>getID</td>
                          <td><%=session.getId()%></td>
              </tr>
              <tr>
                          <td>getMaxInactiveInterval</td>
                          <td><%=(session.getMaxInactiveInterval()/60)%>min</td>
              <tr>
              <tr>
                          <td>getLastAccessedTime()</td>
                          <td><%=(new Date(session.getLastAccessedTime()))%></td>
              </tr>
</table>
</body>
</html>
 
