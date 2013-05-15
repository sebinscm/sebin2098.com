<%!
//----------------------------------------------------
// CreateBBSTABLE
//     - Create Table
//   conn : Connection Object
//----------------------------------------------------
int CreateBBSTABLE(Connection conn, String table_name) throws SQLException
{
  String sqlstr;
  
  // table creation....
  sqlstr = " CREATE TABLE "+table_name ;
  sqlstr = sqlstr + " ( bbs_id int(20) Not Null , " ;
  sqlstr = sqlstr + " subject varchar(255) Not Null, " ;
  sqlstr = sqlstr + " creator_id varchar(10) Null, " ;
  sqlstr = sqlstr + " creator varchar(255) , " ;
  sqlstr = sqlstr + " password varchar(10) , " ;
  sqlstr = sqlstr + " creator_email varchar(255) , " ;
  sqlstr = sqlstr + " creator_home varchar(255), " ;
  sqlstr = sqlstr + " create_date date , " ;
  sqlstr = sqlstr + " contents varchar(2000), " ;
  sqlstr = sqlstr + " filename varchar(255) , " ;
  sqlstr = sqlstr + " filesize int(10) , " ;
  sqlstr = sqlstr + " hits int(5) , " ;
  sqlstr = sqlstr + " p_bbs_id int(20) Not Null, " ;
  sqlstr = sqlstr + " p_level int(10) Not Null, " ;
  sqlstr = sqlstr + " p_serial int(10)  ) " ;
  
  //Statement stmt = conn.createStatement();
  //int result = stmt.executeUpdate(sqlstr);
  //return result;
  return 1;
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
int InsertBBS(Connection conn, String table_name,int bbs_id,String subject,String creator_id,String creator,String password, String creator_email,String creator_home,String contents,String fileName,int fileSize,int p_bbs_id,int p_level,int p_serial) throws SQLException
{
  String sqlstr;
  sqlstr  = "INSERT INTO "+table_name+" (bbs_id, subject, creator_id,creator, password, creator_email, creator_home,create_date, contents, fileName, fileSize, hits, p_bbs_id, p_level, p_serial) ";
  sqlstr = sqlstr + " VALUES ("+bbs_id+",'"+subject+"','"+creator_id+"','"+creator+"','"+password+"','"+creator_email+"','"+creator_home+"',";
  sqlstr = sqlstr + " sysdate(),'"+contents+"','"+fileName+"',"+fileSize+",0,"+p_bbs_id+","+p_level+","+p_serial+") ";

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
int UpdateBBS(Connection conn, String table_name,int bbs_id,String subject,String creator,String password, String creator_email,String creator_home,String contents,String fileName,int fileSize) throws SQLException
{
  String sqlstr;
  sqlstr = "UPDATE  "+table_name+" SET ";
  sqlstr = sqlstr + " subject='"+subject+"',create_date=sysdate(),creator='"+creator+"',password='"+password+"',creator_email='"+creator_email+"',creator_home='"+creator_home+"',contents='"+contents+"',fileName='"+fileName+"',fileSize="+fileSize ;
  sqlstr = sqlstr + " WHERE bbs_id=" + bbs_id;
  
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
  sqlstr = " UPDATE  "+ table_name +" SET " ;
  sqlstr = sqlstr + " hits = "+hits;
  sqlstr = sqlstr + " WHERE bbs_id = "+bbs_id;
  
  Statement stmt = conn.createStatement();
  stmt.executeUpdate(sqlstr);
  int trans = stmt.getUpdateCount();
  return trans;
}


%>

