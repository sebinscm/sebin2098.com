<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page errorPage="../error.jsp" %>
<%@ include file="../bottom_line.jsp" %>
<%
int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

String ag_supplier = request.getParameter("ag_supplier");
String id      = "";
String ag_id   = "";
String ag_id2   = request.getParameter("ag_id2");
String ag_pwd  = "";
String pw      = "";
String name    = "";
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
int    i = 0;

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
      "       state, "+
      "       decode(user_group, 'D', 'DDP', 'F', 'FOB', user_group), " +
      "       supplier_class " +
      "  from login_01t " +
      " where delete_yn = 'N' ";

if ( !(ag_supplier == null || ag_supplier.length() < 1))  {
  ag_supplier = ag_supplier.toUpperCase();
  sql +=  " and upper(name) like  '%" + ag_supplier + "%'" ;
}
if ( !(ag_id2 == null || ag_id2.length() < 1))  {
  sql += " and id = '" + ag_id2 + "'" ;
}

sql += " order by name asc " ;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception supplier : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

if (iRet > 0 ) {
  int no = 0;
  
  for (i=0; i < iRet; i++) {
    id      = matrix.getRowData(i).getData(0);
    pw      = matrix.getRowData(i).getData(1);
    name    = matrix.getRowData(i).getData(2);
    email   = matrix.getRowData(i).getData(3);
    phone1  = matrix.getRowData(i).getData(4);
    phone2  = matrix.getRowData(i).getData(5);
    fax     = matrix.getRowData(i).getData(6);
    contact = matrix.getRowData(i).getData(7);
    addr1   = matrix.getRowData(i).getData(8);
    addr2   = matrix.getRowData(i).getData(9);
    postcode= matrix.getRowData(i).getData(10);
    surburb = matrix.getRowData(i).getData(11);
    state   = matrix.getRowData(i).getData(12);
    String supplier_type = matrix.getRowData(i).getData(13);
    String supplier_class = matrix.getRowData(i).getData(14);
    
    no = no + 1;
    outS += "<tr class='table_list'>" +
            "<td align=center > <font size=2>" + no + "</font></td>" +
            "<td align=center > <font size=2> <a href=\"../admin_login.jsp?ag_id="+id+ "&ag_pwd=" + pw + "\" target=_top >" + id   + "</font></td>" +
            "<td align=left > <font size=1> <a href=\"supplier_view.jsp?ag_id="+id+"\">" + name + "</font></td>" +
            "<td align=center > <font size=2>" + supplier_type + "</font></td>" +
            "<td align=center > <font size=2>" + supplier_class + "</font></td>" +
            "<td align=left > <font size=2>" + email             + "</font></td>" +
            "<td align=center > <font size=2>" + phone1                 + "</font></td>" +
            "<td align=center > <font size=2>" + phone2                 + "</font></td>" +
            "<td align=center > <font size=2>" + fax                 + "</font></td>" +
            "</tr>";
  } //end of for
} //end of if
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language='javascript'>
function fnSearch(frm) {
  frm.action = "./supplier.jsp";
  frm.target = this.name;
  frm.submit();
}

function fnExcel(frm) {
  if (confirm("Do you want to download these data as an excel file?"))
  {
    frm.action="./supplier_excel.jsp";
    frm.target = hidenFrame.name;
    frm.submit();
  }
}
</script>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="99%" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Supplier List</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE width=800 border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM NAME="frmMain" METHOD=POST>
<TR>
  <TD width='20%' class="table_header_center">Supplier ID</TD>
  <TD width='20%' class='table_bg_bright'><input type=text name=ag_id2></TD>
  <TD width='20%' class="table_header_center">Supplier Name</TD>
  <TD width='20%' class='table_bg_bright'><input type=text name=ag_supplier></TD>
  <TD width='20%' class='table_bg_bright_center'><INPUT TYPE=BUTTON VALUE="Search" ONCLICK='fnSearch(this.form)'>
    <input type='button' value='Excel' onclick='fnExcel(this.form)'></TD>
</TR>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"><font color=blue size=2>&nbsp;Note: Click on "ID" number to be directed to the Supplier Login page or "Name" to go to Supplier Profile</font> </td>
</tr>
</table>

<TABLE width=100% border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class="table_header_center">
<TD width='2%'>No.</TD>
<TD width='5%'>ID.</TD>
<TD width='20%'>NAME</TD>
<TD width='5%'>Type</TD>
<TD width='5%'>Class</TD>
<TD width='20%'>E-Mail</TD>
<TD width='13%'>Phone1</TD>
<TD width='13%'>Phone2</TD>
<TD width='13%'>FAX</TD>
</TR>
<%=outS%>
</TABLE>
</FORM>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe width="0" height="0" name="hidenFrame"></iframe>
</BODY>
</HTML>
