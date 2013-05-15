<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ include file="../login_check.jsp" %>

<%

	String seqno = request.getParameter("seqno");

	DBConnManager dbPool = DBConnManager.getInstance();
	Connection conn = dbPool.getConnection("intranet");
	boolean connState = false;
	boolean bRet = false;
	if( conn == null ) {
		connState = false;
	} else {
		connState = true;
	}

	String sql = "INSERT INTO s_memo_02t(SEQNO, COMNAME, STAFFID, STAFFNAME, RDATE) " +
		"VALUES(" + seqno + ",'" + scmnm + "','" + scmid + "','" +
			scmnm + "',sysdate) ";

	String outS = "";
	DataProcess dataProcess = new DataProcess();

	if( connState ) {
		bRet = dataProcess.ManipulateData(sql, conn);
		if( bRet ) {
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("index.jsp");
		}
	}

	dbPool.freeConnection("intranet", conn);
	connState = false;

%>
