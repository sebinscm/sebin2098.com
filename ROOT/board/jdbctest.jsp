<%@ page import="java.sql.*" contentType="text/html;charset=euc-kr" %>
<% 

	/* mysql�� ���� ����Ŭ�� ��쿡 ���� �ּ��� �����Ͽ� �׽�Ʈ�ϼ���.*/
	try {
		// Class.forName("com.caucho.jdbc.mysql.Driver");
		Class.forName("org.gjt.mm.mysql.Driver"); //mysql�� ���
		//Class.forName("oracle.jdbc.driver.OracleDriver"); //����Ŭ�� ���	

		Connection conn = 
		// DriverManager.getConnection("jdbc:mysql_caucho://localhost:3306/intranet","intranet","tetris82"); 
		DriverManager.getConnection("jdbc:mysql://localhost/intranet","intranet","tetris82"); 
		//DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","kimho","1234"); ����Ŭ�� ���

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select b_name from notice");
		String name="";
		if(rs.next()) {
			out.println("JDBC ���� ����");		
		} else {
			out.println("��·�� JDBC ���� ����");
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
