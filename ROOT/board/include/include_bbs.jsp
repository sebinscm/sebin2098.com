<%!
//----------------------------------------------------
// CreateBBSTABLE
//     - Create Table
//   conn : Connection Object
//----------------------------------------------------
int CreateBBSTABLE(Connection conn, String table_name) throws SQLException
{
  String sqlstr;
  
  // 
  sqlstr = " CREATE TABLE "+table_name ;
  sqlstr = sqlstr + " (bbs_id number(20) Not Null PRIMARY KEY, " ;
  sqlstr = sqlstr + " subject varchar2(255) Not Null, " ;
  sqlstr = sqlstr + " creator varchar2(255) Null, " ;
  sqlstr = sqlstr + " password varchar2(10) Null, " ;
  sqlstr = sqlstr + " creator_email varchar2(255) Null, " ;
  sqlstr = sqlstr + " creator_home varchar2(255) Null, " ;
  sqlstr = sqlstr + " create_date date Null, " ;
  sqlstr = sqlstr + " contents varchar2(2000) Null, " ;
  sqlstr = sqlstr + " hits number(5) Null, " ;
  sqlstr = sqlstr + " p_bbs_id number(20) Not Null, " ;
  sqlstr = sqlstr + " p_level number(10) Not Null, " ;
  sqlstr = sqlstr + " p_serial number(10) Null) " ;
  
  Statement stmt = conn.createStatement();
  int result = stmt.executeUpdate(sqlstr);
  return result;
}
//----------------------------------------------------
// SelectBBSQry
//   conn : Connection Object
//   rs : Output RecordSet   
//----------------------------------------------------
ResultSet SelectBBSQry(Connection conn, String table_name, String qry_cond, String qry_contents) throws SQLException
{

	String sqlstr = null;
	sqlstr = " SELECT * FROM "+table_name ;  
  	sqlstr = sqlstr + " WHERE " + qry_cond + " LIKE '%"+qry_contents+"%'";
	sqlstr = sqlstr + " ORDER BY p_bbs_id DESC, p_serial ASC";
  
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sqlstr);
	return (rs==null)?null:rs;
}

//----------------------------------------------------
// SelectBBS
//   conn : Connection Object
//   rs : Output RecordSet   
//----------------------------------------------------
ResultSet SelectBBS(Connection conn,String table_name) throws SQLException
{
  String sqlstr;
  sqlstr = " SELECT * FROM "+table_name ;
  
	sqlstr = sqlstr + " ORDER BY p_bbs_id DESC, p_serial ASC";
  
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sqlstr);
	return (rs==null)?null:rs;
}

//----------------------------------------------------
// SelectBBS_id
//   conn : Connection Object
//   rs : Output RecordSet   
//----------------------------------------------------
ResultSet SelectBBS_id(Connection conn,String table_name,int bbs_id) throws SQLException
{
  String sqlstr;
  sqlstr = " SELECT * FROM "+table_name ;
	sqlstr = sqlstr + " WHERE bbs_id = "+bbs_id ;
  
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sqlstr);
	return (rs==null)?null:rs;
}

//----------------------------------------------------
// SelectBBSQryCount
//   conn : Connection Object
//   rs : Output RecordSet   
//----------------------------------------------------
ResultSet SelectBBSQryCount(Connection conn, String table_name, String qry_cond, String qry_contents) throws SQLException
{
	String sqlstr;
  	sqlstr = " SELECT count(*) as counter FROM "+table_name ;
	sqlstr = sqlstr + " WHERE " + qry_cond + " LIKE '%"+qry_contents+"%'";
	  
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sqlstr);
	return (rs==null)?null:rs;
}

//----------------------------------------------------
// SelectBBSCount
//   conn : Connection Object
//   rs : Output RecordSet   
//----------------------------------------------------
ResultSet SelectBBSCount(Connection conn,String table_name) throws SQLException
{
  String sqlstr;
  sqlstr = " SELECT count(*) as counter FROM "+table_name ;  
  
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sqlstr);
	return (rs==null)?null:rs;
}

//----------------------------------------------------
// GetMaxBBS
//   conn : Connection Object
//----------------------------------------------------
int GetMaxBBS(Connection conn,String table_name) throws SQLException
{
  String sqlstr;
  sqlstr = " SELECT MAX(bbs_id) as last_num FROM "+table_name ;
  
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sqlstr);
	rs.next();
	int last_num = rs.getInt("last_num");
	if(last_num != 0)
	{
		return (last_num + 1);
	}
	else
	{
		return 1;
	}
}

//----------------------------------------------------
// InsertBBS
//     - Insert Table
//   conn : Connection Object
//----------------------------------------------------
int InsertBBS(Connection conn, String table_name,int bbs_id,String subject,String creator,String password, String creator_email,String creator_home,String contents,int p_bbs_id,int p_level,int p_serial) throws SQLException
{
  String sqlstr;
  sqlstr  = "INSERT INTO "+table_name+" (bbs_id, subject, creator, password, creator_email, creator_home,create_date, contents,hits, p_bbs_id, p_level, p_serial) ";
  sqlstr = sqlstr + " VALUES ("+bbs_id+",'"+subject+"','"+creator+"','"+password+"','"+creator_email+"','"+creator_home+"',";
  sqlstr = sqlstr + "(select SYSDATE from dual),'"+contents+"',0,"+p_bbs_id+","+p_level+","+p_serial+") ";

  Statement stmt = conn.createStatement();
  stmt.executeUpdate(sqlstr);
  int trans = stmt.getUpdateCount();
  return trans;
}

//----------------------------------------------------
// UpdateBBSForSerial
//     - Insert Table
//   conn : Connection Object
//----------------------------------------------------
int UpdateBBSForSerial(Connection conn, String table_name, int p_bbs_id, int p_serial) throws SQLException
{
  String sqlstr;
  sqlstr = " UPDATE "+table_name+" SET p_serial = (p_serial+1) ";
  sqlstr = sqlstr + " WHERE p_bbs_id = "+p_bbs_id+" AND p_serial > "+p_serial;

  Statement stmt = conn.createStatement();
  stmt.executeUpdate(sqlstr);
  int trans = stmt.getUpdateCount();
  return trans;
}

//----------------------------------------------------
// UpdateBBS
//     - Update(Modify) Table
//   conn : Connection Object
//----------------------------------------------------
int UpdateBBS(Connection conn, String table_name,int bbs_id,String subject,String creator,String password, String creator_email,String creator_home,String contents) throws SQLException
{
  String sqlstr;
  sqlstr = "UPDATE "+table_name+" SET ";
  sqlstr = sqlstr + "subject='"+subject+"',creator='"+creator+"',password='"+password+"',creator_email='"+creator_email+"',creator_home='"+creator_home+"',contents='"+contents+"'";
  sqlstr = sqlstr + "WHERE bbs_id=" + bbs_id;
  
  System.out.println(sqlstr);
  
  Statement stmt = conn.createStatement();
  stmt.executeUpdate(sqlstr);
  int trans = stmt.getUpdateCount();
  return trans;
}

//----------------------------------------------------
// DeleteBBS
//     - Insert Table
//   conn : Connection Object
//----------------------------------------------------
int DeleteBBS(Connection conn, String table_name, int bbs_id, String password) throws SQLException
{
  String sqlstr;
  sqlstr = " DELETE FROM "+ table_name ;
  sqlstr = sqlstr + " WHERE bbs_id="+bbs_id+" AND password='"+password+"'";
  
  Statement stmt = conn.createStatement();
  stmt.executeUpdate(sqlstr);
  int trans = stmt.getUpdateCount();
  return trans;
}

//----------------------------------------------------
// UpdateBBSHits
//     - Insert Table
//   conn : Connection Object
//----------------------------------------------------
int UpdateBBSHits(Connection conn, String table_name,int bbs_id,int  hits) throws SQLException
{
  String sqlstr;
  sqlstr = " UPDATE "+ table_name +" SET " ;
  sqlstr = sqlstr + " hits = "+hits;
  sqlstr = sqlstr + " WHERE bbs_id = "+bbs_id;
  
  Statement stmt = conn.createStatement();
  stmt.executeUpdate(sqlstr);
  int trans = stmt.getUpdateCount();
  return trans;
}


%>

