<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.net.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
request.setCharacterEncoding("euc-kr"); 
boolean isSucceeded = false;
String strMsg = "";

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");

String today_date = DateUtil.getToday("yyyy/MM/dd");
String this_year = DateUtil.getToday("yyyy");
String this_mmdd = DateUtil.getToday("MM/dd");

// Parameter Setting
String pono = request.getParameter("pono");
String input_cnt = request.getParameter("input_cnt");
String nextUrl = request.getParameter("fromUrl");


// color total qty
String aqtytot = request.getParameter("aqtytot");
if (aqtytot == "" || aqtytot== null ) {
    aqtytot = "0";
}
String bqtytot = request.getParameter("bqtytot");
if (bqtytot == "" || bqtytot== null ) {
    bqtytot = "0";
}
String cqtytot = request.getParameter("cqtytot");
if (cqtytot == ""  || cqtytot== null) {
    cqtytot = "0";
}
String dqtytot = request.getParameter("dqtytot");
if (dqtytot == "" || dqtytot== null) {
    dqtytot = "0";
}
String eqtytot = request.getParameter("eqtytot");
if (eqtytot == "" || eqtytot== null) {
    eqtytot = "0";
}
String total_qty = ""+(Integer.parseInt(aqtytot)+Integer.parseInt(bqtytot) +Integer.parseInt(cqtytot)+Integer.parseInt(dqtytot)+Integer.parseInt(eqtytot));
// read colour of qty 
String[] col =   new String[5];
String[] aqty = new String[6];
String[] bqty = new String[6];
String[] cqty = new String[6];
String[] dqty = new String[6];
String[] eqty = new String[6];
// initialize arry
for ( int i = 0; i < 6; i++ ) {
   aqty[i] = "0";
}
for ( int i = 0; i < 6; i++ ) {
   bqty[i] = "0";
}
for ( int i = 0; i < 6; i++ ) {
   cqty[i] = "0";
}
for ( int i = 0; i < 6; i++ ) {
   dqty[i] = "0";
}
for ( int i = 0; i < 6; i++ ) {
   eqty[i] = "0";
}


for (int i = 0; i < Integer.parseInt(input_cnt); i++) {  
   if ( request.getParameter("col_" + (i+1)).trim() == "" ) {
        col[i] = ""; 
    } else {
       col[i] = request.getParameter("col_" + (i+1)).trim();     
    }  
   //col[i] = request.getParameter("col_" + (i+1)).trim();  
}
if ( Integer.parseInt(input_cnt) == 1 ) {
		for (int i = 0; i < aqty.length; i++) {
		    if ( request.getParameter("aqty_" + (i+1)).trim() == "" ) {
		        aqty[i] = ""; 
		    } else {
		      aqty[i] = request.getParameter("aqty_" + (i+1)).trim();     
		    }  
		  //aqty[i] = request.getParameter("aqty_" + (i+1)).trim();
		}
}		
if ( Integer.parseInt(input_cnt) == 2 ) {
       for (int i = 0; i < aqty.length; i++) {
		    if ( request.getParameter("aqty_" + (i+1)).trim() == "" ) {
		        aqty[i] = ""; 
		    } else {
		      aqty[i] = request.getParameter("aqty_" + (i+1)).trim();     
		    }  
		  //aqty[i] = request.getParameter("aqty_" + (i+1)).trim();
		}
		for (int i = 0; i < bqty.length; i++) {
		
		     if ( request.getParameter("bqty_" + (i+1)).trim() == "" ) {
		        bqty[i] = ""; 
		    } else {
		        bqty[i] = request.getParameter("bqty_" + (i+1)).trim();     
		    }  
		   // bqty[i] = request.getParameter("bqty_" + (i+1)).trim();
		}
}
if ( Integer.parseInt(input_cnt) == 3 ) {
       for (int i = 0; i < aqty.length; i++) {
		    if ( request.getParameter("aqty_" + (i+1)).trim() == "" ) {
		        aqty[i] = ""; 
		    } else {
		      aqty[i] = request.getParameter("aqty_" + (i+1)).trim();     
		    }  
		  //aqty[i] = request.getParameter("aqty_" + (i+1)).trim();
		}
		for (int i = 0; i < bqty.length; i++) {
		
		     if ( request.getParameter("bqty_" + (i+1)).trim() == "" ) {
		        bqty[i] = ""; 
		    } else {
		        bqty[i] = request.getParameter("bqty_" + (i+1)).trim();     
		    }  
		   // bqty[i] = request.getParameter("bqty_" + (i+1)).trim();
		}		
		for (int i = 0; i < cqty.length; i++) {
		     if ( request.getParameter("cqty_" + (i+1)).trim() == "" ) {
		        cqty[i] = ""; 
		    } else {
		        cqty[i] = request.getParameter("cqty_" + (i+1)).trim();     
		    }  
		}
}
if ( Integer.parseInt(input_cnt) == 4 ) {
       for (int i = 0; i < aqty.length; i++) {
		    if ( request.getParameter("aqty_" + (i+1)).trim() == "" ) {
		        aqty[i] = ""; 
		    } else {
		      aqty[i] = request.getParameter("aqty_" + (i+1)).trim();     
		    }  
		  //aqty[i] = request.getParameter("aqty_" + (i+1)).trim();
		}
		for (int i = 0; i < bqty.length; i++) {
		
		     if ( request.getParameter("bqty_" + (i+1)).trim() == "" ) {
		        bqty[i] = ""; 
		    } else {
		        bqty[i] = request.getParameter("bqty_" + (i+1)).trim();     
		    }  
		   // bqty[i] = request.getParameter("bqty_" + (i+1)).trim();
		}		
		for (int i = 0; i < cqty.length; i++) {
		     if ( request.getParameter("cqty_" + (i+1)).trim() == "" ) {
		        cqty[i] = ""; 
		    } else {
		        cqty[i] = request.getParameter("cqty_" + (i+1)).trim();     
		    }  
		}		
		for (int i = 0; i < dqty.length; i++) {
			  if ( request.getParameter("dqty_" + (i+1)).trim() == "" ) {
			        dqty[i] = ""; 
			    } else {
			        dqty[i] = request.getParameter("dqty_" + (i+1)).trim();     
			    }  
			  //dqty[i] = request.getParameter("dqty_" + (i+1)).trim();
		}
}
if ( Integer.parseInt(input_cnt) == 5 ) {
      for (int i = 0; i < aqty.length; i++) {
		    if ( request.getParameter("aqty_" + (i+1)).trim() == "" ) {
		        aqty[i] = ""; 
		    } else {
		      aqty[i] = request.getParameter("aqty_" + (i+1)).trim();     
		    }  
		  //aqty[i] = request.getParameter("aqty_" + (i+1)).trim();
		}
		for (int i = 0; i < bqty.length; i++) {
		
		     if ( request.getParameter("bqty_" + (i+1)).trim() == "" ) {
		        bqty[i] = ""; 
		    } else {
		        bqty[i] = request.getParameter("bqty_" + (i+1)).trim();     
		    }  
		   // bqty[i] = request.getParameter("bqty_" + (i+1)).trim();
		}		
		for (int i = 0; i < cqty.length; i++) {
		     if ( request.getParameter("cqty_" + (i+1)).trim() == "" ) {
		        cqty[i] = ""; 
		    } else {
		        cqty[i] = request.getParameter("cqty_" + (i+1)).trim();     
		    }  
		}		
		for (int i = 0; i < dqty.length; i++) {
			  if ( request.getParameter("dqty_" + (i+1)).trim() == "" ) {
			        dqty[i] = ""; 
			    } else {
			        dqty[i] = request.getParameter("dqty_" + (i+1)).trim();     
			    }  
			  //dqty[i] = request.getParameter("dqty_" + (i+1)).trim();
		}		
		for (int i = 0; i < eqty.length; i++) {
		    if ( request.getParameter("eqty_" + (i+1)).trim() == "" ) {
		       eqty[i] = ""; 
		    } else {
		       eqty[i] = request.getParameter("eqty_" + (i+1)).trim();     
		    }  
		  // eqty[i] = request.getParameter("eqty_" + (i+1)).trim();
		}
}
int iCnt = 0;
String sql = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;

try {
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  conn.setAutoCommit(false);   
	  // delete po detail before update
	  sql = "delete from subpurchase_order_line where order_no = '"  + pono + "' ";
      pstmt = conn.prepareStatement(sql);
      iCnt = pstmt.executeUpdate();
      if (iCnt < 0) {
          throw new UserDefinedException("Check your data.");
      }
      conn.commit();
      
	  // insert data subPO detail 
	  if ( Integer.parseInt(input_cnt) == 1 ) { 
			  if ( col[0].length() > 2  || Integer.parseInt(aqtytot) > 0 ) {
			     insert_podetail(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
			  }
	 }
	 if ( Integer.parseInt(input_cnt) == 2 ) {	
	         if ( col[0].length() > 2  || Integer.parseInt(aqtytot) > 0 ) {
			     insert_podetail(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
			  }	  
			  if (col[1].length() > 2 || Integer.parseInt(bqtytot) > 0 ) {
			     insert_podetail(pono, col[1],bqty[0],bqty[1],bqty[2],bqty[3],bqty[4],bqty[5], bqtytot,conn);
			  } 
	 }		  
	 if ( Integer.parseInt(input_cnt) == 3 ) {
	        if ( col[0].length() > 2  || Integer.parseInt(aqtytot) > 0 ) {
			     insert_podetail(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
			  }	  
			  if (col[1].length() > 2 || Integer.parseInt(bqtytot) > 0 ) {
			     insert_podetail(pono, col[1],bqty[0],bqty[1],bqty[2],bqty[3],bqty[4],bqty[5], bqtytot,conn);
			  } 
			  if (col[2].length() > 2 || Integer.parseInt(cqtytot) > 0 ) {
			     insert_podetail(pono, col[2],cqty[0],cqty[1],cqty[2],cqty[3],cqty[4],cqty[5],cqtytot,conn);
			  } 
	 }	  
	 if ( Integer.parseInt(input_cnt) == 4 ) {
	        if ( col[0].length() > 2  || Integer.parseInt(aqtytot) > 0 ) {
			     insert_podetail(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
			  }	  
			  if (col[1].length() > 2 || Integer.parseInt(bqtytot) > 0 ) {
			     insert_podetail(pono, col[1],bqty[0],bqty[1],bqty[2],bqty[3],bqty[4],bqty[5], bqtytot,conn);
			  } 
			  if (col[2].length() > 2 || Integer.parseInt(cqtytot) > 0 ) {
			     insert_podetail(pono, col[2],cqty[0],cqty[1],cqty[2],cqty[3],cqty[4],cqty[5],cqtytot,conn);
			  } 
			  if ( col[3].length() > 2 || Integer.parseInt(dqtytot) > 0 ) {
			     insert_podetail(pono, col[3],dqty[0],dqty[1],dqty[2],dqty[3],dqty[4],dqty[5],dqtytot,conn);
			  }
	 }		  
	 if ( Integer.parseInt(input_cnt) == 5 ) {
	        if ( col[0].length() > 2  || Integer.parseInt(aqtytot) > 0 ) {
			     insert_podetail(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
			  }	  
			  if (col[1].length() > 2 || Integer.parseInt(bqtytot) > 0 ) {
			     insert_podetail(pono, col[1],bqty[0],bqty[1],bqty[2],bqty[3],bqty[4],bqty[5], bqtytot,conn);
			  } 
			  if (col[2].length() > 2 || Integer.parseInt(cqtytot) > 0 ) {
			     insert_podetail(pono, col[2],cqty[0],cqty[1],cqty[2],cqty[3],cqty[4],cqty[5],cqtytot,conn);
			  } 
			  if ( col[3].length() > 2 || Integer.parseInt(dqtytot) > 0 ) {
			     insert_podetail(pono, col[3],dqty[0],dqty[1],dqty[2],dqty[3],dqty[4],dqty[5],dqtytot,conn);
			  }
			  if ( col[4].length() > 2 || Integer.parseInt(eqtytot) > 0 ) {   
			     insert_podetail(pono, col[4],eqty[0],eqty[1],eqty[2],eqty[3],eqty[4],eqty[5], eqtytot,conn);
			  }  
    }
  // commit;
  conn.commit();

  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception PO_input : " + ue.getMessage());
} catch (SQLException se) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Check your data. " + se.getMessage();
  System.out.println("Exception PO_input : " + se.getMessage());
  throw se;
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Error occurred. " + e.getMessage();
  System.out.println("Exception PO_input : " + e.getMessage());
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


<%!
private void insert_podetail(String pono,String color, String qty1,String qty2,String qty3,String qty4,String qty5,String qty6,String totqty,Connection conn){

	  String sql = " insert  into subpurchase_order_line "
      + " ( "
      + "   ORDER_NO ,  BACKORDER_FLAG ,  COLOUR ,  "
      + "   SQTY_1,SQTY_2,SQTY_3,SQTY_4,SQTY_5,SQTY_6, "
      + "   TOTAL_QTY ";
  
  sql += " ) "
       + " values "
       + " ( "
       + "   '" + pono + "','N','" + color + "',  "
       + "   '" + qty1 + "','" +qty2 + "','" + qty3 + "','" + qty4 + "', '" + qty5 + "','" + qty6 + "', "
       + "   '" + totqty + "' ) " ;     
	try{	
		Statement stmt = conn.createStatement();
		int iRet = stmt.executeUpdate(sql);
		stmt.close();		
		}catch( SQLException e ) {
	}

}
%>

<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./<%= nextUrl %>">
<input type="hidden" name="pono" value="<%= pono %>">
<input type="hidden" name="po_no_selected" value="<%= pono %>">
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_status' value='<%= ag_status %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>	
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
