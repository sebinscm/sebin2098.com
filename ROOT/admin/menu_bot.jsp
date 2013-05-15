<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<html>
<head>
<title></title>
</head>

<frameset cols="190,*" frameborder="0" border="0" framespacing="0">
  <frame src="./menu.jsp" name="menu" scrolling="auto" noresize>
  <frame src="/admin/notice/list.jsp" name="main">
</frameset>
<noframes>
<body></body>
</noframes>
</html>
