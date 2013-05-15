<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
request.setCharacterEncoding("euc-kr"); 
String actionFlag = request.getParameter("actionFlag");
String searchId = request.getParameter("searchId");
String id = request.getParameter("id");
String subname = request.getParameter("subname");

String sql = "";
int iRet = 0;
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";

Connection conn = null;
PreparedStatement pstmt = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

try {

 Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // check duplication
  if ( actionFlag.equals("I") )   {
    sql = " select  count(*) "
        + " from    login_02t "
        + " where   id = '" + id + "' " ;
   

    matrix = new dbconn.MatrixDataSet();
    dataProcess = new dbconn.DataProcess();
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    
    if (iRet > 0) {
      iCnt = Integer.parseInt(matrix.getRowData(0).getData(0));

      if (iCnt > 0) {
        throw new UserDefinedException("Duplication error. Check your data.");
      }
    }
  }
  
  // insert/update/delete 처리...
  int idx = 1;
  iCnt = 0;
  conn.setAutoCommit(false);

  // actionFlag에 따라 처리함.
  if (actionFlag.equals("I")) {
   
    // insert...
    sql = " insert into login_02t "
        + " ( "
        + "   id, supply_name, modifyid, modify_date "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, ?, sysdate "
        + " ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, id);
    pstmt.setString(idx++, subname);
    pstmt.setString(idx++, _adminid);

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  login_02t "
        + "  set "
        + "   supply_name = ?, "
        + "   modifyid = ?, "
        + "   modify_date = sysdate "
        + "  where   id = ? " ;


    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, subname);
    pstmt.setString(idx++, _adminid);
    pstmt.setString(idx++, id);

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  login_02t "
        + " where   id = ? " ;


    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, id);


  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  // execute ...
  iCnt = pstmt.executeUpdate();

  if (iCnt != 1) {
    throw new UserDefinedException("Check your data.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /account/sub_save : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
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
<form name="form1" method="post" action="./sub_list.jsp">
<input type='hidden' name='searchId' value='<%= searchId %>'>
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
