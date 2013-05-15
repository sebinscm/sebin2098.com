<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import ="java.util.ArrayList" %>
<%
 ArrayList list=(ArrayList)session.getAttribute("clientInfo");
 if(list !=null){
  out.println(list.toString());
  session.invalidate();  // session out
 }else{
  response.sendRedirect("/login_first.html");
 }
%>

<br>


