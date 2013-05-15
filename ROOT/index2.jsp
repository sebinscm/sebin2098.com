<%@ include file="/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<html>
<head>
<link rel="shortcut icon" type="image/ico" href="/img/sebin.ico" />			
<title><%= scmnm %></title>
</head>
<frameset rows="83,*" frameborder="no" border="0" framespacing="0">
  <frame src="menu_t.jsp" name="topFrame" scrolling="NO" noresize >
  <frame src="menu_bot.jsp" name="bottomFrame">
</frameset>
<noframes>
<body></body></noframes>
</html>
