<%!
public String getSupplierNameOptions(String selectedItem, boolean includeAll, String valueStr) throws SQLException{ 
  String retStr = "";
  int iRet = 0;
  String sql = "";
  Connection conn = null;
  MatrixDataSet matrix = null;
  DataProcess dataProcess = null;

  try {
    sql = " select id, name from login_01t where user_type='S' order by name ";

    Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
    matrix = new MatrixDataSet();
    dataProcess = new DataProcess();

    iRet = dataProcess.RetrieveData(sql, matrix, conn);

    if (includeAll) retStr += "<option value=''>All</option>";

    for (int i = 0; i < iRet; i++) {
      String id = matrix.getRowData(i).getData(0);
      String name = matrix.getRowData(i).getData(1);
      String value = "";

      if (valueStr.equals("id")) value = id;
      else if (valueStr.equals("name")) value = name;

      retStr += "<option value='" + value + "'"
              + (selectedItem.equals(value) ? " selected" : "")
              + ">" + id + "-" + name + "</option>";
    }
  } catch (Exception e) {
     retStr = "";
  } finally {
	 // if (conn != null)   
	 conn.close();	  
  }
  return retStr;
}
%>