<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ include file="../login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String seqno = request.getParameter("seqno");

DataProcess dataProcess = null;
Connection conn = null;
boolean bRet = false;
String outS = "";

String sql = "INSERT INTO s_memo_02t(SEQNO, COMNAME, STAFFID, STAFFNAME, RDATE) " +
	"VALUES(" + seqno + ",'" + scmnm.replaceAll("'", "''") + "','" + scmid + "','" +
		scmnm.replaceAll("'", "''") + "',sysdate()) ";

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  dataProcess = new DataProcess();

	bRet = dataProcess.ManipulateData(sql, conn);

/*
	if (bRet) {
		response.sendRedirect("memo_detail.jsp?seqno="+seqno);
	} else {
    conn.rollback();
		response.sendRedirect("memo_detail.jsp?seqno="+seqno);
	}
*/

  response.sendRedirect("memo_detail.jsp?seqno="+seqno);

} catch (Exception e) {
  System.out.println("Exception /memo/memo_read2 : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}
%>
