package org.apache.jsp.admin.memo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import com.namo.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

public final class send_005fmemo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


//-------------------------------------------
// CopyRightLogo
//
//-------------------------------------------
String CopyRightLogo()
{
  String str;
  str = "<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' >";
  str += "<tr><td width='100%' height='2' align='center' colspan='2'>";
  str += "<HR color='#5BA3C1' width=100% size=1></td></tr>";
  str += "<tr><td width='40%'align='right'><img src='/img/sebin_small.jpg'></td>";
  str += " <td width='60%' align='left'><FONT size=2 color=778899>";
  str += "&copy;Copyright 2011 ";
  str += "Sebin Trading Enterprise Co,. Ltd. All Rights Reserved.<BR>";
  str += "Contact to <FONT color=blue><A href='mailto:scm@sebin2098.com'>scm@sebin2098.com</A>";
  str += " for more information.</FONT>";
  str += "</td></tr></table>";

  return (String)str;
}


private int insert_send(String userid, String username, String title, 
  String contents, Connection conn, String f_name) throws Exception
{

  int iRet = 0;
  int seqno = 0;

  // Sender's table
  String sql ="";
  Statement stmt = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  sql = "SELECT max(seqno) " +
              "  FROM t_memo_01t " +
        " WHERE seqno < 999999 " +
              " ORDER BY seqno desc" ;  
  try {    
    stmt = conn.createStatement();    
    rs = stmt.executeQuery(sql);        
    if( rs.next() )
      seqno = rs.getInt(1) + 1;
    else
      seqno = 1;
            
    // Receiver table;
    sql = "INSERT INTO t_memo_01t( SEQNO, ADMINID, ADMINNAME, IDATE, DFLAG, TITLE, AFNAME, CONTENTS ) " +
          "VALUES( ?, ?, ?, sysdate(),'0', ?, ?, ? )";
    // Korean language decoding       
    title = convert_to_ksc(title);
    contents = convert_to_ksc(contents);
 
    pstmt = conn.prepareStatement(sql);

    pstmt.setInt(1, seqno);
    pstmt.setString(2, userid);
    pstmt.setString(3, username);
    pstmt.setString(4, title);
    pstmt.setString(5, f_name);
    pstmt.setString(6, contents);

    iRet = pstmt.executeUpdate();    
    pstmt.close();  
  	// CLOB update
  	//sql = " SELECT CONTENTS FROM T_MEMO_01T WHERE SEQNO = " + seqno + " FOR UPDATE ";
  	//stmt = conn.createStatement();
  	//rs = stmt.executeQuery(sql);
  	//BufferedWriter writer = null;
	//  if (rs. next()) {
	//		     CLOB clob = (CLOB)rs.getObject("CONTENTS");              //------>중요			     
	//		     writer = new BufferedWriter(clob.getCharacterOutputStream());
	//		     writer.write(contents);
	//		     writer.flush();
	//		     writer.close();
	//		     writer = null;
	//  }	
  	//rs.close();
  
  	if( iRet == 0 ) {
  		return 0;
  	} else {
  		return seqno;
  	}
  } finally {
    if (rs != null) {
      try { rs.close(); } catch (Exception e) {}
    }
  
    if (stmt != null) {
      try { stmt.close(); } catch (Exception e) {}
    }
  
    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }
  }

} // end of insert_send

private boolean insert_recv(int seqno, String comid, String comnm,
  String title,  Connection conn) throws SQLException
{

  int iRet = 0;
  PreparedStatement pstmt = null;
  
  // Receiver's table
  String sql = "INSERT INTO S_MEMO_03T( SEQNO, COMNAME, IDATE, DFLAG, TITLE, COMID ) " +
    "VALUES(?, ?, sysdate(), '0', ?, ?)";
  title = convert_to_ksc(title);
  try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, seqno);
    pstmt.setString(2, comnm);
    pstmt.setString(3, title);
    pstmt.setString(4, comid);
    iRet = pstmt.executeUpdate();
    pstmt.close();

    return ((iRet > 0) ? true : false);  
  } finally {
    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }
  }

}

private String convert_to_ksc(String str) {
		String result = null;
		try {
			byte[] rawBytes = str.getBytes("8859_1");
			result = new String(rawBytes, "KSC5601");
		} catch(UnsupportedEncodingException e) {
			System.err.println(e.toString());
		}
		return result;
	}
private String convert_to_ascii(String str) {		
		String result = null;
		try {
			byte[] kscBytes = str.getBytes("KSC5601");
			result = new String(kscBytes, "8859_1");
		} catch(UnsupportedEncodingException e) {
			System.err.println(e.toString());
		}
		return result;
	}	


  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/admin/memo/../bottom_line.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

      out.write('\n');

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


      out.write("\n");
      out.write("<!--%@ page errorPage=\"../../error.jsp\" %-->\n");
      out.write('\n');
      out.write('\n');
      out.write('\n');


response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
boolean isSucceeded = false;
HashMap params = new HashMap();               // parameter 저장 임시 변수
String savePath = application.getRealPath(_memoDataUrl) + File.separator;   // file path
String strMsg="";

// Jakarta Commons 프로젝트의 FileUpload 모듈을 사용함.
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

// Process the uploaded items
Iterator iter = items.iterator();

while (iter.hasNext()) {

  FileItem item = (FileItem) iter.next();

  if (item.isFormField()) {

    // Process a regular form field
    params.put(item.getFieldName(), item.getString());

  } else {

    // Process a file upload
    String fieldName = item.getFieldName();
    String fileName = item.getName();
    long sizeInBytes = item.getSize();

    // File Size가 0인 경우 무시함.
    if (sizeInBytes == 0) {
      continue;
    }

    int pos = fileName.lastIndexOf("\\");
    if (pos < 0) fileName.lastIndexOf("/");

    String attachFileName = fileName.substring(pos+1);
    String attachRealFileName = attachFileName;
    String name = "";
    String ext = "";
    int i = 0;

    File writeFile = new File(savePath + attachRealFileName);

    pos = attachRealFileName.lastIndexOf(".");
    if (pos < 0) {
      name = attachRealFileName;
    } else {
      name = attachRealFileName.substring(0, pos);
      ext = attachRealFileName.substring(pos);
    }

    while(writeFile.exists())
    {
      attachRealFileName = name + "[" + (i++) + "]" + ext;
      writeFile = new File(savePath + attachRealFileName);
    }

    // File 정보 저장
    item.write(writeFile);
    params.put(fieldName, attachRealFileName);

  }

} // end of while

// Database 처리
// Parameter Setting
String receiver_list = (String) params.get("receiver");
String title = (String) params.get("title"); 
String contents = (String) params.get("contents");

String f_name = (String) params.get("file_name");

boolean check = false;
int r_count = 0;
int next_line = 0;
String result = "";
String outS = "";
String sql = "";

Connection conn = null;

// Namo Content 처리  ///////////////////////////////////////////////////
// MIME 디코딩 하기
NamoMime mime = new NamoMime();
mime.setSaveURL(request.getScheme() + "://" + request.getHeader("Host") + _memoDataUrl);
mime.setSavePath(savePath);
mime.decode(contents);					// MIME 디코딩
mime.saveFile();						// 포함한 파일 저장하기
contents = mime.getBodyContent();
//////////////////////////////////////////////////////////////////////////
//out.println(title);
//out.println(contents);
//title = new String(title.getBytes("8859_1"),"KSC5601");
//contents = new String(contents.getBytes("8859_1"),"KSC5601");
//if (true) return;

try {
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  conn.setAutoCommit(false);   // CLOB를 업데이트 하는 동안 다른 process의 접근을 막기 위해 반드시 설정을 해야 한다.
 
  int seqno = insert_send( _adminid, _adminname, title, contents, conn, f_name );
  StringTokenizer id_token = new StringTokenizer( receiver_list, ";");
  
  while( id_token.hasMoreElements() ) {
    String id_name = (String) id_token.nextElement();
    String[] strArr = id_name.split("\\^", 2);
  
    check = insert_recv( seqno, strArr[0], strArr[1], title, conn );
    if (check) {
      r_count++;
      next_line++;
      outS += "<TD><font size=2>" + strArr[1] + "</font></TD>\n";
      if( next_line == 4 ) {
        next_line = 0;
        outS +="</TR><TR>";
      }
    }
  }

  conn.commit();
  isSucceeded = true;  
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  throw e;
} finally {
  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}   
    conn.close();
  }
}
if (isSucceeded) strMsg = "The data was successfully processed.";
     else strMsg = "The operation failed.\\n" + strMsg;

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"./index.jsp\">\n");
      out.write("</form>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("  alert('");
      out.print( strMsg );
      out.write("');\n");
      out.write("  document.form1.submit();\n");
      out.write("</script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
