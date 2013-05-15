<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page errorPage="../error.jsp" %>

<%@ include file="../login_check.jsp" %>

<%

	String seqno = request.getParameter("seqno");

	Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
	boolean connState = false;
	boolean bRet = false;
	if( conn == null ) {
		connState = false;
	} else {
		connState = true;
	}

	String sql = "INSERT INTO s_memo_02t(SEQNO, COMNAME, STAFFID, STAFFNAME, RDATE) " +
		"VALUES(" + seqno + ",'" + scmnm.replaceAll("'", "''") + "','" + scmid + "','" +
			scmnm.replaceAll("'", "''") + "',sysdate()) ";

	String outS = "";
	DataProcess dataProcess = new DataProcess();

	if( connState ) {
		bRet = dataProcess.ManipulateData(sql, conn);
		if( bRet ) {
                        conn.commit();
			response.sendRedirect("index.jsp");
		}else {
                        conn.rollback();
			response.sendRedirect("index.jsp");
		}
	}

	conn.close();
	connState = false;

%>
