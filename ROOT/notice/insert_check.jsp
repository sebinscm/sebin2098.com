<%@ page language="java" import="java.sql.*,java.io.*,kaywon.file.multipart.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="include/db_conn.jsp" %>
<%@ include file="include/include_com.jsp" %>
<%@ include file="include/include_bbs.jsp" %>
<%
int maxUploadSize = 50;
String docRoot = "C:/SCM_MYSQL/ROOT/notice";
String midDir = "upload";
String userid = "scm";
String saveDir = docRoot + File.separator + midDir + File.separator + userid;

MultipartRequest multi = new MultipartRequest(request, saveDir, maxUploadSize);

String url=null;
String table_name = multi.getParameter("table_name");


String oper_type = ascToksc(multi.getParameter("oper_type"));
String subject = ascToksc(multi.getParameter("subject"));
subject = subject.replace('\'', '\b');
String creator_id = _adminid;
String creator = ascToksc(multi.getParameter("creator"));
String password = ascToksc(multi.getParameter("password"));
String creator_email = ascToksc(multi.getParameter("creator_email"));
String creator_home = ascToksc(multi.getParameter("creator_home"));
String contents = ascToksc(multi.getParameter("contents"));
contents = contents.replace('\'', '\b');


String fileName = null;
int fileSize = 0;

File f;
if(multi.getFilesystemName("file") != null) {
	fileName = "/" + midDir + "/" + userid + "/" + multi.getFilesystemName("file");
	f = multi.getFile("file");
	fileSize = (int)f.length();
	}

int bbs_id, p_bbs_id, p_level, p_serial;

Connection conn =  DB_Connection();

//--------------------------------------------------------
//--------------------------------------------------------
if(oper_type == null)
{

	int new_num =  GetMaxBBS(conn, table_name);
	bbs_id = new_num;

	p_bbs_id = new_num;
	p_level = 0;
	p_serial = 0;

	InsertBBS(conn, table_name, bbs_id, subject, creator_id,creator, password, creator_email, creator_home, contents, fileName, fileSize, p_bbs_id, p_level, p_serial);
}
//--------------------------------------------------------
//--------------------------------------------------------
else if(oper_type.equals("update"))
{
	bbs_id = Integer.parseInt(multi.getParameter("bbs_id"));
	UpdateBBS(conn, table_name, bbs_id, subject, creator, password, creator_email, creator_home, contents, fileName, fileSize);
}
//--------------------------------------------------------
//--------------------------------------------------------
else if(oper_type.equals("ans"))
{
	int new_num =  GetMaxBBS(conn, table_name);
	bbs_id = new_num;

	p_bbs_id = Integer.parseInt(multi.getParameter("p_bbs_id"));
	p_level = Integer.parseInt(multi.getParameter("p_level"));
	p_serial = Integer.parseInt(multi.getParameter("p_serial"));

	UpdateBBSForSerial(conn, table_name, p_bbs_id, p_serial);
	InsertBBS(conn, table_name, bbs_id, subject, creator_id,creator, password, creator_email, creator_home, contents, fileName, fileSize ,p_bbs_id, p_level+1, p_serial+1);
}

url = "admin_list.jsp?table_name="+table_name;
out.println(Redirect(url));

%>
