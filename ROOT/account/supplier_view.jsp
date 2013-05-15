<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="java.text.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page errorPage="../error.jsp" %>
<%@ include file="../bottom_line.jsp" %>
<%
String ag_id = request.getParameter("ag_id");

SimpleDateFormat dd = new SimpleDateFormat("yyyyMMdd");
String sdate = dd.format(new java.util.Date());
String id      = "";
String pw      = "";
String name    = "";
String supplier_type = "";
String email   = "";
String phone1  = "";
String phone2  = "";
String fax     = "";
String contact = "";
String addr1   = "";
String addr2   = "";
String postcode= "";
String surburb = "";
String state   = "";
String supplier_class = "";

int iRet = 0;
String outS = "";
String sql = "";

Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // Read profile info
  sql = "select id," +
        "       passwd," +
        "       name,"+
        "       email,"+
        "       phone1,"+
        "       phone2,"+
        "       fax,"+
        "       contact,"+
        "       addr1,"+
        "       addr2,"+
        "       postcode,"+
        "       surburb,"+
        "       state,"+
        "       case user_group when 'D' then 'DDP' " +
         "                                 when  'F' then 'FOB' end , " +
        "       supplier_class " +
        "  from login_01t " +
        " where id = '" + ag_id + "'" ;

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception /account/supplier_view : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}
}

if (iRet > 0) {
  int j = 0;
  id      = matrix.getRowData(0).getData(j++);
  pw      = matrix.getRowData(0).getData(j++);
  name    = matrix.getRowData(0).getData(j++);
  email   = matrix.getRowData(0).getData(j++);
  phone1  = matrix.getRowData(0).getData(j++);
  phone2  = matrix.getRowData(0).getData(j++);
  fax     = matrix.getRowData(0).getData(j++);
  contact = matrix.getRowData(0).getData(j++);
  addr1   = matrix.getRowData(0).getData(j++);
  addr2   = matrix.getRowData(0).getData(j++);
  postcode= matrix.getRowData(0).getData(j++);
  surburb = matrix.getRowData(0).getData(j++);
  state   = matrix.getRowData(0).getData(j++);
  supplier_type = matrix.getRowData(0).getData(j++);
  supplier_class = matrix.getRowData(0).getData(j++);
}
%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
function Submit()
{
  var yn
  yn = confirm(" Save your profile ?  ");
  
  if ( yn == true ) {
    frmMain.method = "POST";
    frmMain.action = "profile_update.jsp";
    frmMain.submit();
  }
}

function pwchange()
{
  if (confirm("Do you want to initialize the password?")) {
    document.form1.action = "./init_password.jsp";
    document.form1.submit();
  }
}

function Back()
{
  location.href = './supplier.jsp';
}
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Supplier Profile</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE border="0" CELLPADDING=0 CELLSPACING=0 WIDTH=650 align='center'>
<FORM NAME="frmMain" METHOD="POST" ACTION="profile_update.jsp">
<input type=hidden name=id   value=<%=id%>>
<input type=hidden name=name   value=<%=name%>>
<TBODY>
<TR><TD vAlign=top bgColor=#ffffff>
  <TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
  <TBODY>
    <TR class=bodytext bgColor=#ccccff>
      <TD ALIGN=CENTER bgcolor=#ccccff>Supplier ID</TD>
      <TD ALIGN=left ><b> <%=id%></b> </TD>
    </TR>
    <TR class=bodytext bgColor=#ccccff>
      <TD ALIGN=CENTER bgcolor=#ccccff>Supplier name</TD>
      <TD ALIGN=left bgcolor=#ccccff><b> <%=name%></b> </TD>
    </TR>
    <TR class=bodytext bgColor=#ccccff>
      <TD ALIGN=CENTER bgcolor=#ccccff>Supplier Type</TD>
      <TD ALIGN=left bgcolor=#ccccff><b> <%=supplier_type%></b> </TD>
    </TR>
    <TR class=bodytext bgColor=#ccccff>
      <TD ALIGN=CENTER bgcolor=#ccccff>Supplier Class</TD>
      <TD ALIGN=left bgcolor=#ccccff><b> <%=supplier_class %></b> </TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE">Email</TD>
      <TD ALIGN=LEFT   ><textarea NAME=email rows=1 cols=30><%=email%></textarea></TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE">Phone</TD>
      <TD ALIGN=LEFT   ><textarea NAME=phone1 rows=1 cols=30 ><%=phone1%></textarea></TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE">Mobile Phone</TD>
      <TD ALIGN=LEFT   ><textarea NAME=phone2 rows=1 cols=30><%=phone2%></textarea> </TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE">Fax</TD>
      <TD ALIGN=LEFT   ><textarea NAME=fax rows=1 cols=30 ><%=fax%></textarea></TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE">Contact Person</TD>
      <TD ALIGN=LEFT   ><textarea NAME=contact  rows=1 cols=30><%=contact%></textarea></TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE" rowspan='2'>Address 1, 2</TD>
      <TD ALIGN=LEFT   ><textarea NAME=addr1   rows=1 cols=30><%=addr1%></textarea></TD>
    </TR>
    <TR>
      <TD ALIGN=LEFT   ><textarea NAME=addr2   rows=1 cols=30 ><%=addr1%></textarea></TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE">Post Code</TD>
      <TD ALIGN=LEFT   ><textarea NAME=postcode  rows=1 cols=30><%=postcode%></textarea></TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE">Surburb</TD>
      <TD ALIGN=LEFT   ><textarea NAME=surburb  rows=1 cols=30 ><%=surburb%></textarea></TD>
    </TR>
    <TR>
      <TD ALIGN=CENTER bgcolor="#F4F2AE">State</TD>
      <TD ALIGN=LEFT   ><input type=text NAME=state value=<%=state%>></TD>
    </TR>
  </TABLE>
</td></tr>
</table>

<TABLE border="0" CELLPADDING=0 CELLSPACING=0 WIDTH=650 align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <INPUT TYPE=BUTTON VALUE="Save" ONCLICK="Submit()">
    <INPUT TYPE=BUTTON VALUE="Reset Password" ONCLICK="pwchange()">
    <INPUT TYPE=BUTTON VALUE="Back" ONCLICK="Back()">
  </td>
</tr>
</FORM>
<form name='form1' method='post'>
<input type='hidden' name='ag_id' value='<%= ag_id %>'>
</form>
</table>

<%
out.println(CopyRightLogo());
%>

</td></tr></table>
</BODY>
</HTML>
