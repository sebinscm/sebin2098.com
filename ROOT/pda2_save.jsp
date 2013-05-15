<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%
String barcode = request.getParameter("barcode");
String po_no = request.getParameter("po_no");
String ffb_inspector = request.getParameter("ffb_inspector");

String sql = "";
int iRet = 0;
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
DBConnManager dbPool = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection connPronto = null;
PreparedStatement pstmt = null;

try {

  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  dbPool = DBConnManager.getInstance();
  connPronto = dbPool.getConnection("pronto");
  connPronto.setAutoCommit(false);

  // check qc info whether the po was entered or not
  sql = " select  po_no "
      + " from    buying.vg_qc_master@aps "
      + " where   po_no = '" + po_no + "' "
      + " and     final_decision is not null ";

  iRet = dataProcess.RetrieveData(sql, matrix, connPronto);

  if (iRet > 0) {
    throw new UserDefinedException("Check your data.");
  }

  // delete and insert data into qc master
  sql = " delete  from buying.vg_qc_master@aps "
      + " where   po_no = ? "
      + " and     final_decision is null ";

  int idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  sql = " insert  into buying.vg_qc_master@aps "
      + " ( "
      + "   po_no, scan_date, style_no, supplier_id, supplier, "
      + "   buyer, brand, item_class, item_group, big_season, "
      + "   small_season, colour, size_label, rrp, item_text, "
      + "   ffb_inspector, final_decision, inspect_date, file_name, etc, "
      + "   barcode, ship_date, rec_date, gi_date "
      + " ) "
      + " select  ?, to_char(sysdate, 'yyyymmdd'), substr(a.stock_code, 1, 6), d.cre_accountcode, e.cr_shortname,  "
      + "         f.sys_description, b.sht_category, b.sht_class, a.stock_group, substr(a.stock_code, 7, 2)||'0', "
      + "         substr(a.stock_code, 7, 4), null, null, round(c.wholesale_price*1.1, 2), a.stk_description, "
      + "         ?, '1', null, null, null, "
      + "         a.stk_apn_number, null, to_char(sysdate, 'yyyymmdd'), null "
      + " from    stk5mf1 a "
      + "         left outer join "
      + "         ( "
      + "           select z.stock_group, z.sht_category, z.sht_class "
      + "           from   stkhierachymst0 y "
      + "                  inner join stkhiertree3 z "
      + "                    on y.shm_code = z.sht_class "
      + "                    and y.shm_type = 4 "
      + "         ) b "
      + "           on a.stock_group = b.stock_group "
      + "         left outer join stk5prc c "
      + "           on a.stock_code = c.stock_code "
      + "         left outer join stk5supt d "
      + "           on a.stock_code = d.stock_code "
      + "         left outer join cre5mfi e "
      + "           on d.cre_accountcode = e.cre_accountcode "
      + "         left outer join sys5tbl5 f "
      + "           on a.reorder_buyer = f.sys_tbl_code "
      + "           and f.sys_tbl_type = 'RR' "
      + " where   a.stk_apn_number = ? ";

  idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  pstmt.setString(++idx, ffb_inspector);
  pstmt.setString(++idx, barcode);
  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  if (iCnt != 1) {
    throw new UserDefinedException("Could not insert QC master inforamtion. Check your data.");
  }

  // delete and insert data into qc detail
  sql = " delete  from buying.vg_qc_detail@aps "
      + " where   po_no = ? ";

  idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  sql = " insert  into buying.vg_qc_detail@aps "
      + " ( "
      + "   po_no, qc_code, qc_code_desc, qc_decision, qc_comment, "
      + "   qc_comm_date, qc_etc, qc_major_fail "
      + " ) "
      + " select  ?, code, code_desc, '1', null, "
      + "         trunc(sysdate), null, 'N' "
      + " from    buying.vg_qc_code@aps "
      + " where   div = 'QC' ";

  idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  if (iCnt < 1) {
    throw new UserDefinedException("Could not insert QC detail inforamtion. Check your data.");
  }
  
  // update po_style_etc
  sql = " update  po_style_etc@scm "
      + " set     rec_date = trunc(sysdate) "
      + " where   po_no = ? ";

  idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  connPronto.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { connPronto.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { connPronto.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /pda2_save : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (connPronto != null) {
      DataProcess tmpDataProcess = new dbconn.DataProcess();
      tmpDataProcess.ManipulateData("alter session close database link aps", connPronto);
      tmpDataProcess.ManipulateData("alter session close database link scm", connPronto);
      dbPool.freeConnection("pronto", connPronto);
  }
}

// result message
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./pda2.jsp">
<input type='hidden' name='searchBarcode' value='<%= barcode %>'>
</form>
<script language="javascript">
<%
if (!isSucceeded) {
%>
  alert('<%= strMsg %>');
<%
}
%>
  document.form1.submit();
</script>
</body>
</html>
