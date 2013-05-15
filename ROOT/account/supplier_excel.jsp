<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page errorPage="/error.jsp" %>
<%
response.setHeader("Content-Disposition", "attachment; filename=Supplier.xls;");
response.setHeader("Content-Description", "JSP Generated Data");

int iRet = 0;
Connection connScm = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
DBConnManager dbPool = null;
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
      "       case user_group when 'D' then 'DDP' " +
      "                                 when  'F' then 'FOB' end , " +
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
  dbPool = dbconn.DBConnManager.getInstance();
  connScm = dbPool.getConnection("intranet");

  iRet = dataProcess.RetrieveData(sql, matrix, connScm);

} catch (Exception e) {
  System.out.println("Exception supplier : " + e.getMessage());
  throw e;
} finally {
  if (connScm != null) {
    dbPool.freeConnection("intranet", connScm);
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
    
    outS += "<tr align='center'>" +
            "<td>" + id   + "</td>" +
            "<td align='left'>" + name + "</td>" +
            "<td>" + supplier_type + "</td>" +
            "<td>" + supplier_class + "</td>" +
            "<td align='left'>" + email + "</td>" +
            "<td>" + phone1 + "&nbsp;</td>" +
            "</tr>";
  } //end of for
} //end of if
%>
<html>
<head>
</head>
<body>
<table width="1200" border="1" cellspacing="0" cellpadding="0">
<tr align='center'>
  <TD>ID</TD>
  <TD>NAME</TD>
  <TD>Type</TD>
  <TD>Class</TD>
  <TD>E-Mail</TD>
  <TD>Phone1</TD>
</tr>
<%= outS %>
</table>
</body>
</html>
