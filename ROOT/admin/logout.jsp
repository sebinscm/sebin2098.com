<%@ page import="java.net.*" %>
<%
        session.invalidate();
        response.sendRedirect("/admin/index.jsp");
%>
