<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
request.setCharacterEncoding("euc-kr"); 
boolean isSucceeded = true;
String strMsg = "";
String searchCatalogType = request.getParameter("searchCatalogType");

// Database 처리
if (isSucceeded) {

  String sql = "";
  Connection conn = null;
  PreparedStatement pstmt = null;

  String actionFlag = request.getParameter("actionFlag");
  String catalogCode = request.getParameter("catalogCode");
  String catalogName = request.getParameter("catalogName");
  String catalogType = request.getParameter("catalogType");
  String sort_order = request.getParameter("sort_order");
  String useYn = request.getParameter("useYn");
  String related_code = request.getParameter("related_code");
  String catalogDesc = request.getParameter("catalogDesc"); 
  try {
    Context ic = new InitialContext(); 
	  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	  conn = ds.getConnection();

    int idx = 0;
    conn.setAutoCommit(false);

    if (actionFlag.equals("U")) {

      // update ...
      sql = " UPDATE  vg_common_code "
          + " SET     CODE_NAME  = ?, "
          + "         TYPE  = ?, "
          + "         DESCRIPTION = ?, "
          + "         USE_YN = ?, "
          + "         SORT_ORDER = ?, " 
          + "         RELATED_CODE = ?, "
          + "         MODIFIER      = ?, "
          + "         MODIFIED_DATE   = SYSDATE() "
          + " WHERE   CODE = ? "
          + " AND     TYPE = ? ";
      
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, catalogName);
      pstmt.setString(++idx, catalogType);
      pstmt.setString(++idx, catalogDesc);
      pstmt.setString(++idx, useYn);
      pstmt.setString(++idx, sort_order);
      pstmt.setString(++idx, related_code);
      pstmt.setString(++idx, _adminid);
      pstmt.setString(++idx, catalogCode);      
      pstmt.setString(++idx, catalogType);
    } else if (actionFlag.equals("I")) {

      // insert ...
      sql = " INSERT INTO vg_common_code"
          + " ( "
          + "   CODE,  CODE_NAME,  TYPE,   DESCRIPTION,  USE_YN,  SORT_ORDER, "
          + "   RELATED_CODE, MODIFIER, MODIFIED_DATE "
          + " ) "
          + " VALUES "
          + " ( ?,  ?,  ?,  ?,  'Y',  ?,  ?,  ?, SYSDATE() ) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, catalogCode);
      pstmt.setString(++idx, catalogName);
      pstmt.setString(++idx, catalogType);
      pstmt.setString(++idx, catalogDesc);
      pstmt.setString(++idx, sort_order);
      pstmt.setString(++idx, related_code);
      pstmt.setString(++idx, _adminid);      

    } else if (actionFlag.equals("D")) {

      // insert ...
      sql = " DELETE FROM vg_common_code "
          + " WHERE   code = ? "
          + " AND     TYPE = ? ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, catalogCode);
      pstmt.setString(++idx, catalogType);
    }

    // execute ...
    pstmt.executeUpdate();
    conn.commit();
  } catch (SQLException se) {
    try {
        conn.rollback();
    } catch (Exception ex) {}

    isSucceeded = false;
    strMsg = "Check your data. If there is any data using this code, you can't update or delete this data.";
    System.out.println("Exception COMMON CODE save : " + se.getMessage());
    
  } catch (Exception e) {
    try {
        conn.rollback();
    } catch (Exception ex) {}
    

    System.out.println("Exception COMMON CODE save : " + e.getMessage());
    throw e;
  } finally {
    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }

    if (conn != null) {
      try { conn.setAutoCommit(true); } catch (Exception e) {}
      if (conn != null) {conn.close();}	
    }
  }

}

// 결과 메시지 처리
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./code_list.jsp">
<input type="hidden" name="searchCatalogType" value="<%= searchCatalogType %>">
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
