<%@ include file="./login_check.jsp" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<html>
<head>
<title>Valleygrirl Supply Chain System </title>
</head>

<frameset rows="53,*" frameborder="no" border="0" framespacing="0">
  <frame src="menu_t.jsp" name="topFrame" scrolling="NO" noresize >
  <frame src="index2.jsp" name="bottomFrame">
</frameset>
<noframes><body>

</body></noframes>
</html>

