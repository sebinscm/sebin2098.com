
<ge contentType="text/html; charset=euc-kr"   session="true" %>
<%@ page import="java.io.*,java.util.*"%>
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
  scmnm = request.getParameter("scmnm");
  session.putValue("scmid",scmid);
  session.putValue("scmnm",scmnm);
  java.util.Enumeration st = session.getAttributeNames();
}
%>
 
