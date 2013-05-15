<%@ page language="java" import="board.Board" contentType="text/html" %>

<jsp:useBean id="kb" class="board.Board" scope="request" />

<%=kb.getPrint(request,response,session)%>
