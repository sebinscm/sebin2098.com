package org.apache.jsp.admin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import java.net.*;
import java.text.*;
import java.util.*;
import common.*;
import common.util.*;
import dbconn.*;

public final class admin_005fsuborder_005finput_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/admin/login_check.jsp");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=euc-kr");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\r\n");

// MY SQL DB
//String _mysqlJdbcDriver = "com.mysql.jdbc.Driver";
//String _urlLogin = "jdbc:mysql://10.2.1.247:3306";
//String _userLogin = "user";
//String _pwLogin = "password";

// MS-SQL DB
//String _mssqlJdbcDriver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
//String _urlFutura = "jdbc:microsoft:sqlserver://10.2.1.228:1433";
//String _userFutura = "user";
//String _pwFutura = "password";


// Management Notice Upload path
String _ManagementNoticeUploadUrl = "/admin/notice/upload";

// Uplod
//String _uploadPath = "../../var/tmp";
String _uploadPath = "C:/SCM_MYSQL/ROOT/var/tmp";
String _uploadPath2 = "C:/SCM_MYSQL/ROOT/var/tmp";
long _maxFileSize = 50*1024*1024;

// SCM Image Path
String _SCMIMGURL = "http://www.sebin2098.com/images/";

// style image path
String _styleImgURL = "/images";

// Fault return invoice File URL
String _faultReturnInvoiceFileURL = "/images/Return";

// Memo °ü·Ã º¯¼ö
String _memoDataUrl = "/memo/upload";


// Spec Sheet path
String _specSheetUrl = "/spec_sheet_files";

// Notice URL
// Notice
String _noticeDataUrl = "/notice_new/upload";


// Sample Image Url
String _sampleImageUrl = "/images/SAMPLE_IMAGE";

// barcode file Image Url
String _barcodeFileUrl = "/images/Barcode";

// Invoice file path
String _invoiceFileUrl = "/payment/inv_files";

// shipment file path
String _shipmentFileUrl = "/ordermanagement/shipment_upload";

// SMTP MAIL SERVER
String SMTP_SERVER = "smtp.gmail.com";
String SMTP_USER ="scm@sebin2098.com";
String SMTP_PASSWORD ="gavi1004";

// System Admin Mail Address
String _systemAdminEmail = "scm@sebin2098.com";
String _systemAdminName = "SCM Administrator";

//  MU rate
double _MURate = 0.25;

// Ex-Factory Price Rate
double _EXRate = 0.04;


// Ex-Factory Price Rate 
double _EXRate2 = 0.04;


      out.write('\r');
      out.write('\n');

response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String _adminid = "";
String _adminname = "";
String _admintype = "";
String _admingroup = "";
String _approval = "";
String _adminclass = "";
String _adminmail = "";

try{

  _adminid = (String) session.getAttribute("adminid");

  if( _adminid == null || _adminid.length() == 0 || _adminid.equals("null") ) {
    response.sendRedirect("/admin/login_first.html");
    return;
  }

  _adminname = (String) session.getAttribute("adminname");
  _admintype = (String) session.getAttribute("admintype");
  _admingroup = (String) session.getAttribute("admingroup");
  _approval = (String) session.getAttribute("approval");
  _adminclass = (String) session.getAttribute("adminclass");
  _adminmail = (String) session.getAttribute("admin_email");
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/admin/login_first.html");
  return;
}

      out.write("\r\n");
      out.write("\r\n");

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
	

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"./");
      out.print( nextUrl );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"pono\" value=\"");
      out.print( pono );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"po_no_selected\" value=\"");
      out.print( pono );
      out.write("\">\r\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\r\n");
      out.write("<input type='hidden' name='ag_status' value='");
      out.print( ag_status );
      out.write("'>\r\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\r\n");
      out.write("<input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\r\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\r\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\r\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\t\r\n");
      out.write("</form>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("  alert(\"");
      out.print( strMsg );
      out.write("\");\r\n");
      out.write("  document.form1.submit();\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
