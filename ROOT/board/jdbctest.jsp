<%@ page import="java.sql.*" contentType="text/html;charset=euc-kr" %>
<% 

	/* mysql인 경우와 오라클인 경우에 따라 주석을 제거하여 테스트하세요.*/
	try {
		// Class.forName("com.caucho.jdbc.mysql.Driver");
		Class.forName("org.gjt.mm.mysql.Driver"); //mysql인 경우
		//Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클인 경우	

		Connection conn = 
		// DriverManager.getConnection("jdbc:mysql_caucho://localhost:3306/intranet","intranet","tetris82"); 
		DriverManager.getConnection("jdbc:mysql://localhost/intranet","intranet","tetris82"); 
		//DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","kimho","1234"); 오라클인 경우

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select b_name from notice");
		String name="";
		if(rs.next()) {
			out.println("JDBC 설정 성공");		
		} else {
			out.println("어쨌든 JDBC 설정 성공");
		}
		stmt.close();
		conn.close();
	} catch(Exception e) {
		out.println("err01:"+e);
	} finally {
		try {
			// conn.close();
		} catch(Exception e) {
			out.println("err02:"+e);
		}
	}
%>
