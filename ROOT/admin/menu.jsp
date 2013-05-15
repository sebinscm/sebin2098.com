<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %> 
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %> 
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String menus = "";

int iRet = 0;
Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
String sql = "";

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  // Read Menu List
  sql = " SELECT  M.PARENT_NO, M.MENUNAME, M.MENUURL, IFNULL(MC.CHILD_CNT, 0) "
      + " FROM    ( "
      + "           SELECT SEQNO, PARENT_NO, MENUNAME, MENUURL, SORT_NO "
      + "           FROM   MENU_T "
      + "           WHERE  MENU_TYPE = '" + _admintype + "' "
      + "           AND    USER_GROUP = '" + _admingroup + "' "
      + "           ORDER BY SORT_NO "
      + "         ) M LEFT OUTER JOIN "
      + "         ( "
      + "           SELECT M1.SEQNO, COUNT(M2.SEQNO) CHILD_CNT "
      + "           FROM   MENU_T M1  LEFT OUTER JOIN MENU_T M2 ON ( M1.SEQNO = M2.PARENT_NO AND M1.PARENT_NO = 1)  "
      + "           WHERE  M1.MENU_TYPE = '" + _admintype + "' "
      + "           AND    M1.USER_GROUP = '" + _admingroup + "' "
      + "           GROUP BY M1.SEQNO "
      + "         ) MC ON (  M.SEQNO = MC.SEQNO) "
      + " ORDER BY M.SORT_NO ";
 // out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  for (int i = 0; i < iRet; i++) {
    int j = 0;

    String parentNo   = matrix.getRowData(i).getData(j++);
    String menuName   = matrix.getRowData(i).getData(j++);
    String menuUrl    = matrix.getRowData(i).getData(j++);
    int childCnt      = Integer.parseInt(matrix.getRowData(i).getData(j++));

    if (parentNo.equals("1")) {

      // Parent Menu인 경우
      if (childCnt > 0) {
        menus += "aux1 = insFolder(rootTree, genFolder(\"" + menuName + "\", \"" + menuUrl + "\"));\n";
      } else {
        menus += "insItem(rootTree, genItemIcon(\"write.gif\", \"" + menuName + "\", \"" + menuUrl + "\"));\n";
      }

    } else {
       
      // Child Menu      
      menus += "insItem(aux1, genItemIcon(\"write.gif\", \"" + menuName + "\", \"" + menuUrl + "\"));\n";

    }

  }
  /////////////////////////////////////////////////////////////////////////

} catch (Exception e) {
  System.out.println("Exception menu : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">	
<style type="text/css">
a:link {text-decoration: none ; color: #020468;}
a:visited {text-decoration: none ; color: #666666;}
a:active {text-decoration: underline ; color: #0770FF;}
a:hover {text-decoration: underline ; color: #0770FF;}
</style>
<script language=javascript src="/common/js/admin_tree_win.js"></script>
<script language="javascript">
function LoadLeave()
{
    clearTimeout(Time_ID);
    location.href = "./menu.jsp";
}
function delay()
{
    Time_ID = setTimeout("LoadLeave()",( 10 * 60 * 1000 ));
}
</script>
</head>
<body leftmargin="2" topmargin="10" marginwidth="0" marginheight="0"  onload="delay()">
<!--body leftmargin="2" topmargin="10" marginwidth="0" marginheight="0" background="/img/bgimage2.gif" onload="delay()"-->
<script language=javascript>
rootTree = genFolderRoot("<img src='/img/tree_base.gif' border='0'> <b>HOME</b>", <%= _admingroup.equals("Z") ? "'/order/admin_po_status.jsp'" : "'/admin/notice/list.jsp'" %>);
<%= menus %>
initializeDocument(rootTree);
</script>
<table width="100%" border="0" cellspacing="1" cellpadding="2" align="center">
<tr>
  <td align="center" height="10"></td>
</tr>

<tr>
  <td align="center"><a href="http://www.sebin2098.com/admin" target="_blank"><img src="/img/sebin_mid.jpg"></a></td>
  </tr>
<!--tr>
   <td align="center"><a href="http://get.adobe.com/reader/" target="_blank"><img src="/img/adobe_reader.png"></a></td>
</tr>
<tr>
  <td align="center" class="font_small"><font color="#0770FF" siz=2>Get Adobe Reader</font></td>

</tr-->

</table>
</body>
</html>