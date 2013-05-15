<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<!--%@ page errorPage="../../error.jsp" %-->
<%@ include file="../../bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String seqno = request.getParameter("seqno");
String adminid ="";
String adminname ="";
String idate ="";
String title ="";
String contents ="";
String recv_list ="";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql  = "";
String outS = "";
String file_name = "";
String file_name2 = "";
String file_nm ="";
String path = application.getRealPath(_memoDataUrl) + File.separator;   // file path

sql = "SELECT adminid, adminname, str_to_date(date_format(idate,'%Y/%m/%d'),'%Y/%m/%d'), title, contents, AFNAME " +
      " FROM  t_memo_01t " +
      " WHERE seqno = " + seqno;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);

  if (rs.next()) {
    adminid = rs.getString(1);
    adminname = rs.getString(2);
    idate = rs.getString(3);
    title = rs.getString(4);
    // CLOB Test
    StringBuffer output = new StringBuffer();
    Reader input = rs.getCharacterStream(5);
    char[] buffer = new char[1024];
    int byteRead;
    while( (byteRead=input.read(buffer,0,1024))!= -1 )       
    output.append(buffer,0,byteRead);    
    input.close();
    contents = output.toString();
     
    //
    


    //Clob clob   = rs.getClob(5);
    //Reader clobStream = clob.getCharacterStream();
    //StringBuffer buf = new StringBuffer();
    //int    nchars = 0; // Number of characters read
    //char[] buffer = new char[10];  //  Buffer holding characters being transferred
    //while( (nchars = clobStream.read(buffer)) != -1 ) // Read from Clob
    //  buf.append(buffer, 0, nchars);        // Write to StringBuffer
    //clobStream.close();  // Close the Clob input stream
    //contents = buf.toString();

    if ( rs.getString(6) != null ) {
      file_nm   = rs.getString(6);
      file_name = path + file_nm;
      file_name2  =  "<td align=left colspan=5 class='table_list' ><B><a href='download.jsp?filename=" + file_name + "'><font color=#0000FF >" + file_nm + " </font></B> </td>";
    } else {
      file_name2 = "<td colspan=5 align=left class='table_list'> No attached files </TD>";
    }
  }

 // sql = " select COMNAME, IFNULL(read_date,'not read') " +
 //       " from ( " +
 sql =   "        SELECT COMNAME, str_to_date(date_format(rdate,'%Y/%m/%d'),'%Y/%m/%d') AS read_date " +
        "        FROM   s_memo_02t WHERE seqno = " + seqno  +
        "        union " +
        "        Select comname, str_to_date(date_format('','%Y/%m/%d'),'%Y/%m/%d') AS read_date from s_memo_03t " +
        "        where  seqno = " + seqno +
        "        and    comid not in (select staffid from  s_memo_02t where seqno= " + seqno + ")" ;
  //      "      ) " +
  //      " order by substr(read_date,7,10) asc " ;
  //out.println(sql);
  //if (true) return;
  rs = stmt.executeQuery(sql);

  int linefeed = 0;
  String bgcolor = "#FFFFF0";
  
  while (rs.next()) {
    String shopname = rs.getString(1);
    String rdate = rs.getString(2);

    if( linefeed == 0 ) {
      bgcolor = "#FFFFF0";
      linefeed = 1;
    } else {
      bgcolor = "#EEEEE0";
      linefeed = 0;
    }
    
    recv_list += "<TR><TD class='table_list'> " + shopname +
      "</TD><TD align=center class='table_list'>" + rdate +
      "</font></TD></TR>\n";
  }

} catch (Exception e) {
  System.out.println("Exception /admin/memo/view_memo : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }

  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {conn.close(); }
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function List(form)
{
  form.seqno.value = "";
  form.action = "index.jsp";
  form.submit();
}

function Delete( form )
{
    result = confirm("Are you sure?");
    if( result == true )
  {
            form.action = "memo_delete.jsp";
            form.submit();
    }
}

function Update(form)
{
  form.action = "memo_edit.jsp";
  form.submit();
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/icon_ann.jpg"></td>
  <td width="*" class="left_title"> Manage Buyer Notice</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>
<table width="100%" border="0" cellspacing='1' cellpadding='2' align="center" class="table_bg">
<FORM NAME="frmMain" METHOD=POST>
<INPUT type ="HIDDEN" NAME=seqno VALUE="<%=seqno%>">
<tr>
  <td width="100%" colspan=2 align='center' class="table_bg_bright_center">
    <INPUT TYPE=BUTTON VALUE=" List " ONCLICK="List(document.frmMain)" class="button_default">
     <%
  	   if ( _adminclass.equals("1")) {
     %>
    <INPUT TYPE=BUTTON VALUE="Delete" ONCLICK="Delete(document.frmMain)" class="button_default">
    <INPUT TYPE=BUTTON VALUE="Edit" ONCLICK="Update(document.frmMain)" class="button_default">
        <%
      } 
     %>
  </td>
</tr>
</FORM>
</table>
<TABLE border=0 cellspacing='1' cellpadding='2' WIDTH=100% align='center' class="table_bg">
<TR>
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">Notice No.</TD>
<TD WIDTH="10%" ALIGN=CENTER class='table_bg_bright'><B><%=seqno%></B></TD>	
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">Sender</TD>
<TD WIDTH="30%" ALIGN=CENTER class='table_bg_bright'><%=adminname%></TD>
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">Date</TD>
<TD WIDTH="30%" ALIGN=CENTER class='table_bg_bright'><%=idate%></TD>
</TR>
<TR>
<TD WIDTH="20%" ALIGN=CENTER class="table_header_center">Title</TD>
<TD WIDTH="80%" COLSPAN=5 class='table_bg_bright'><%=title%></TD>
</TR>
<TR>
<TD WIDTH="100%" COLSPAN=6 HEIGHT=250 VALIGN=TOP bgcolor="white" ><%=contents%></font></TD>
</TR>
<TR>
<TD WIDTH="20%" ALIGN=CENTER class="table_header_center">Attached File</TD>
<%=file_name2%>
</TR>
</TABLE>
<br>
<table width="50%" border="0" cellspacing='1' cellpadding='2' align="center" class="table_bg">
<tr>
  <td width="100%" colspan=2 align='center' class="table_bg_bright_center">
    Confirmed Notice 
  </td>
</tr>
<tr>
  <TD WIDTH=50% ALIGN=CENTER class="table_header_center">Receiver</TD>
  <TD WIDTH=50% ALIGN=CENTER class="table_header_center">Read time</TD>
   <%=recv_list%>
</tr>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
