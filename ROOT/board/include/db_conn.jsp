<%!
//-------------------------------------------
// DB_Connection()
//       - Make DB Connection
//   conn : Output Connection
//
//-------------------------------------------
Connection DB_Connection() throws ClassNotFoundException, SQLException,Exception
{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/scm";
   	Connection conn = DriverManager.getConnection(url, "scm", "scm");
   	
   	return conn;
}

//-------------------------------------------
// DB_Disconnection()
//       - Make DB Disconnection
//   conn : Output Disconnection
//
//-------------------------------------------
void DB_Disconnection(Connection conn) throws ClassNotFoundException, SQLException,Exception
{
	conn.close();
}
%>