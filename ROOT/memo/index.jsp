<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "";
int iRet = 0;
int page_size = 10; // page size

String next_page="memo.jsp?";
String prev_page="";
String start_seqno= request.getParameter("seqno");
if ( start_seqno != null && start_seqno.length() > 0 ) {
  prev_page = "<A href=\"JavaScript:Back()\">Prev</A>";
}
else {
  start_seqno = "99999";
}

String sdate = "";
String title = "";
String read_button = "";
String memolist = "";
String seqno = "0";
String contents = "";
String file_name ="";
String file_name2="";
String file_nm ="";
String path = application.getRealPath(_memoDataUrl) + File.separator;   // file path
String chk_new2 = "";
String chk_new = "";

sql = " select distinct a.seqno, date_format(a.IDATE, '%Y/%m/%d'), a.TITLE, case b.seqno when null then 1 else 0 end   " +
      "   from s_memo_03t a left outer join s_memo_02t b  ON( a.seqno = b.seqno and a.comid = b.staffid  )  " +
      "  where a.comid =  '" + scmid + "'" +
      "    and case sign(sysdate() + 100 - sysdate()) when -1 then 0 else 1 end "  +
      "    and a.dflag = '0' "   +
      "    order by a.seqno desc  "  ;
//out.println(sql);
try {

  String curno="";
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  if( iRet < 1 ) {
    //seqno = "";
    response.sendRedirect("./welcome.jsp");
  } else {
    seqno = matrix.getRowData(0).getData(0);
    sdate = matrix.getRowData(0).getData(1);
    title = matrix.getRowData(0).getData(2);
    chk_new = matrix.getRowData(0).getData(3) ;
    
    if (chk_new.equals("0")){
           title = "&nbsp;"+title;
    } else {
           title = "<IMG src='../board/images/new_6.gif'>"+title ;
    }
    
    sql = "SELECT CONTENTS, AFNAME " +
          " FROM T_MEMO_01T " +
          " WHERE SEQNO = " + seqno +
          "   AND dflag = '0'";

    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
  
    if (rs.next()) {
      Clob clob   = rs.getClob(1);
      Reader clobStream = clob.getCharacterStream();
      StringBuffer buf = new StringBuffer();
      int    nchars = 0; // Number of characters read
      char[] buffer = new char[10];  //  Buffer holding characters being transferred
  
      while( (nchars = clobStream.read(buffer)) != -1 ) // Read from Clob
        buf.append(buffer, 0, nchars);        // Write to StringBuffer
  
      clobStream.close();  // Close the Clob input stream
  
      contents = buf.toString();
      
      file_nm   = rs.getString(2);

      if ( file_nm == null || file_nm.length() < 3 ) {
        file_name2 = "<td align=left class='table_bg_bright' COLSPAN=6 ><B> No files attached. </B></TD>";
      } else {
        file_name = path + file_nm;
        file_name2 = "<td align=left class='table_bg_bright' COLSPAN=6 ><a href='download.jsp?filename=" + file_name + "'>" + file_nm + " </B>" +
                     " <IMG height=14  src=../notice/images/disk.gif width=14 align=textTop border=0> </td>";
      }
    }
    
    rs.close();
    stmt.close();

    // For read button
    sql = "SELECT date_format(RDATE, '%Y/%m/%d') " +
          " FROM S_MEMO_02T " +
          " WHERE SEQNO = " + seqno + " AND " +
          " STAFFID = '" + scmid + "'";
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    if( iRet < 1 ) {
      read_button = "<INPUT TYPE=CHECKBOX VALUE=\"READ\" ONCLICK=\"Read()\"><font color=red> Confirm </font>";
    } else {
      read_button = "<font color=red >Read : " + matrix.getRowData(0).getData(0);
    }
  }

  sql =   " select distinct a.seqno seqno, date_format(a.IDATE, '%Y/%m/%d') idate, a.TITLE title, case b.seqno when null then 1 else 0 end    " +
         " from s_memo_03t a left outer join s_memo_02t b on( a.seqno = b.seqno AND a.comid = b.staffid ) " +
         " where a.seqno < " + start_seqno +
         "   and a.comid =  '" + scmid + "'" +
         "   AND a.dflag = '0'" +
         " ORDER BY a.seqno DESC  " +
         " limit  " + page_size ;
  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  int count = 0;
  int chk_bgcolor = 0;
  String bgcolor = "#FFFFFF";
  String newimg = "";

  for( count=0;count < iRet; count++ ) {
    chk_new2 = matrix.getRowData(count).getData(3) ;
    
    if (chk_new2.equals("0")){
      newimg = "&nbsp;";
    } else {
      newimg = "<IMG src='../board/images/new_6.gif'>" ;
    }

    curno = matrix.getRowData(count).getData(0);
    
    if( chk_bgcolor == 0 ) {
      bgcolor = "#FFFFFF";
      chk_bgcolor = 1;
    }
    else {
      bgcolor = "#E0E0E0";
      chk_bgcolor = 0;
    }
    
    memolist += "<tr bgcolor=" + bgcolor + ">\n<td align=center width='5%' >" +
                matrix.getRowData(count).getData(0) + "</td><td align=center width='10%' >" +
                matrix.getRowData(count).getData(1) + "</td><td width='5%' >"+newimg+"</td><td align=left width='80%'>" +
                "<a href=\"memo_detail.jsp?seqno=" +
                matrix.getRowData(count).getData(0) + "\"> " +
                matrix.getRowData(count).getData(2) + "</a></td></tr>\n";
  }
  
  if( iRet == 0 ) {
    memolist += "<tr><td>&nbsp;</td><td>Recent Notice List</td></tr>\n";
  }
  else {
   if ( count < page_size )
     next_page = "";
   else
     next_page = "<A HREF=\"" + next_page + "seqno=" + curno + "\">Next</A>";
  }

} catch (Exception e) {
  System.out.println("Exception /memo/memo : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }
  
  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}
%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function Read()
{
  frmMain.submit();
}

function Back()
{
  history.back();
}
</SCRIPT>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Notice Board</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>
** Don't forget to tick the check box to confirm to sender that you've read this message.
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
<TR>
  <td width=100% align='center' class="table_header_center" ><B>Latest Message </b></td>
</TR>
</table>
<TABLE border=0 cellspacing='1' cellpadding='2' WIDTH=100% align='center' class="table_bg">
<FORM NAME=frmMain ACTION=memo_read3.jsp METHOD=POST>
<INPUT TYPE=HIDDEN NAME=seqno VALUE="<%=seqno%>">	
<TR>
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">No.</TD>
<TD WIDTH="10%" ALIGN=CENTER class='table_bg_bright'><B><%=seqno%></B></TD>	
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">Date</TD>
<TD WIDTH="20%" ALIGN=CENTER class='table_bg_bright'><%=sdate%></TD>
<TD WIDTH="10%" ALIGN=CENTER class="table_header_center">Read</TD>
<TD WIDTH="20%" ALIGN=CENTER class='table_bg_bright'>( <%=read_button%> )</TD>
</TR>
<TR>
<TD WIDTH="20%" ALIGN=CENTER class="table_header_center">Title</TD>
<TD WIDTH="40%" COLSPAN=5 class='table_bg_bright'><%=title%></TD>
</TR>
<TR>
<TD WIDTH="100%" COLSPAN=6 HEIGHT=250 VALIGN=TOP bgcolor="white" ><%=contents%></font></TD>
</TR>
<TR>
<TD WIDTH="20%" ALIGN=CENTER class="table_header_center">Attachment</TD>
<%=file_name2%>
</TR>
</TABLE>
<br>
<TABLE border=0 width=100% CELLPADDING=0 CELLSPACING=0 align=center class="table_bg">
<TR><TD class="table_header_center" colspan=4><b>Recent Notice</b></TD>
</TR>
  <%=memolist%>
</TABLE>
</TD></TR>
<TR>
<TD colspan=2 align=right ><%=prev_page%>&nbsp;<%=next_page%></font></TD>
</TR>
</FORM>
</TABLE>

<%
out.println(CopyRightLogo());
%>

</td></tr></table>
</BODY>
</HTML>
