<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="dbconn.*" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page errorPage="error.jsp" %>
<%@ include file="/login_check.jsp" %>
<%
String main_window = "memo/";
String menuhtml = "menu.jsp";


Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
int iRet = 0;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  String sql = " select seqno from s_memo_03t " +
               "  where comid = '" + scmid + "' " +
               "    and dflag = '0' " +
               "    and decode(sign(IDATE + 100 - sysdate),-1,0,1) = 1 " +
               "  minus " +
               " select seqno from s_memo_02t " +
               "  where staffid = '" + scmid + "' " +
               "    and decode(sign(RDATE + 100 - sysdate),-1,0,1) = 1 " ;

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

/*
  if( iRet <  1 ) {
    if (scmid.equals("3")) {
       main_window = "memo/";
    } else {
       main_window = "memo/";
    }
  } else {
    if (scmid.equals("3")) {
      main_window = "memo/";
      menuhtml = "menu.jsp";
    } else {
      main_window = "memo/";
      menuhtml = "menu_error.jsp";
    }
  }


  if (iRet > 0) {
    if (!usertype.equals("A")) {
      menuhtml = "menu_error.jsp";
    }
  }
 */
} catch (Exception e) {
  System.out.println("Exception menu_bot : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close(); }
}
%>
<html>
<head>
<title></title>
</head>

<frameset cols="190,*" frameborder="0" border="0" framespacing="0">
  <frame src="<%= menuhtml %>" name="menu" scrolling="auto" noresize>
  <frame src="<%= main_window %>" name="main">
</frameset>
<noframes>
<body></body>
</noframes>
</html>
