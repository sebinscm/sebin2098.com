<%@ page import="java.net.*" %>
<%
        session.invalidate();
        response.sendRedirect("index.jsp");
%>
