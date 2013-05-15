<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@ include file="include/db_conn.jsp" %>
<%@ include file="include/include_com.jsp" %>
<%@ include file="include/include_bbs.jsp" %>
<%
String url=null;
// 
String table_name = request.getParameter("table_name");


String oper_type = ascToksc(request.getParameter("oper_type"));
String subject = ascToksc(request.getParameter("subject"));
String creator = ascToksc(request.getParameter("creator"));
String password = ascToksc(request.getParameter("password"));
String creator_email = ascToksc(request.getParameter("creator_email"));
String creator_home = ascToksc(request.getParameter("creator_home"));
String contents = ascToksc(request.getParameter("contents"));
int bbs_id, p_bbs_id, p_level, p_serial;
if (contents.length()==1) 
    contents = contents+" "  ;
	int pos=0;
	while ((pos=contents.indexOf("\'", pos)) != -1) {
		String left=contents.substring(0, pos);
		String right=contents.substring(pos, contents.length());
		contents = left + "\'" + right;
		pos += 2;
		} 

Connection conn =  DB_Connection();

//-------------------------------------------------------- 
//  
//-------------------------------------------------------- 
if(oper_type == null)
{
	int new_num =  GetMaxBBS(conn, table_name);
	bbs_id = new_num;
	
	p_bbs_id = new_num;
	p_level = 0;
	p_serial = 0;
	
	InsertBBS(conn, table_name, bbs_id, subject, creator, password, creator_email, creator_home, contents, p_bbs_id, p_level, p_serial);
}
//-------------------------------------------------------- 
//  
//-------------------------------------------------------- 
else if(oper_type.equals("update"))  
{
	bbs_id = Integer.parseInt(request.getParameter("bbs_id"));
	
	UpdateBBS(conn, table_name, bbs_id, subject, creator, password, creator_email, creator_home, contents);
}
//-------------------------------------------------------- 
//  
//-------------------------------------------------------- 
else if(oper_type.equals("ans")) 
{	
	int new_num =  GetMaxBBS(conn, table_name);
	bbs_id = new_num;
	
	p_bbs_id = Integer.parseInt(request.getParameter("p_bbs_id"));
	p_level = Integer.parseInt(request.getParameter("p_level"));
	p_serial = Integer.parseInt(request.getParameter("p_serial"));
	
	UpdateBBSForSerial(conn, table_name, p_bbs_id, p_serial);
	InsertBBS(conn, table_name, bbs_id, subject, creator, password, creator_email, creator_home, contents, p_bbs_id, p_level+1, p_serial+1);
}

url = "list.jsp?table_name="+table_name;  
out.println(Redirect(url));

%>
