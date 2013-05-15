<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import ="java.util.ArrayList" %>
<%
 String name=request.getParameter("name").trim();
 int age=Integer.parseInt(request.getParameter("age").trim());
 if(name.equals("jeon") && age == (10) ){
  //HttpSession sess=request.getSession(true);
  ArrayList list=(ArrayList)session.getAttribute("clientInfo");
  if(list ==null)   list=new ArrayList();//2
  list.add(name); 
  list.add(new Integer(age));   //
  session.setAttribute("clientInfo", list);//3
  out.println(name +"  login OK");
  out.println("<a href='sessionCheck.jsp' > sessionJSP</a>");
 }else{
  out.print(" You have to try  login first!"  }
%>


