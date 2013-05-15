<%
DBConnManager dbPool = null;
boolean connState = false;

dbPool = DBConnManager.getInstance();
Connection admin_conn = dbPool.getConnection("intranet");
if ( admin_conn == null)
   connState = false ;
else
   connState = true ;

if ( ! connState ) {
    out.println("DB connection error!");
    return;
}

MatrixDataSet matrix = new dbconn.MatrixDataSet();
DataProcess dataProcess = new DataProcess();

//String supplier = request.getParameter("supplier");

String sql9 = "";
String name = "";
String id = "";
String opt = "";
int    iRet9 = 0 ;
int    i = 0;
sql9 = " select id, name from login_01t order by name asc " ;
iRet9 = dataProcess.RetrieveData(sql9, matrix, admin_conn); 
if (iRet9 > 0 ) {
   for (i=0; i < iRet9; i++) {
      id  = matrix.getRowData(i).getData(0);
      name= matrix.getRowData(i).getData(1);
      if (supplier != null) {
         if (supplier.equals(name)) {
            opt += " <OPTION value="+ name + "  SELECTED >"+ id +"-"+ name + " </OPTION>" ;
          } else {
            opt += " <OPTION value="+ name + "  >"+ id +"-"+ name + " </OPTION>" ;
          }
      } else {
        opt += " <OPTION value="+ name + "  >"+ id +"-"+ name + " </OPTION>" ;
      }
   }
}


%>
