package org.apache.jsp.notice_005fnew;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import java.util.*;
import common.*;
import dbconn.*;
import com.namo.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

public final class buyer_005fsave_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/login_check.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
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
      out.write("\r\n");

response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String scmid = "";
String scmnm = "";
String usertype = "";
String usergroup = "";
String scmsupid = "";
String _buyer_email ="";
String _supplier_email="";

try{
  scmid = (String) session.getAttribute("scmid");


  if (scmid == null || scmid.length() == 0 || scmid.equals("null") ) {     
    response.sendRedirect("/login_first.html");
    return;
  }
  

  scmnm = (String) session.getAttribute("scmnm");
  scmsupid = (String) session.getAttribute("scmsupid");
  usertype = (String) session.getAttribute("usertype");
  if (usertype == null) usertype = "";

  usergroup = (String) session.getAttribute("usergroup");
  if (usergroup == null) usergroup = "";
  _buyer_email = (String) session.getAttribute("buyer_email");
  _supplier_email = (String) session.getAttribute("supplier_email");
  
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/login_first.html");
  return;
}

      out.write('\r');
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


      out.write("\r\n");
      out.write("\r\n");


response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

boolean isSucceeded = false;
String strMsg = "";

HashMap params = new HashMap();               // parameter 저장 임시 변수
List oldAttachedFiles = new ArrayList();         // attachedFile 저장 임시 변수
List attachedFiles = new ArrayList();           // attachFile 저장 임시 변수
String savePath = application.getRealPath(_noticeDataUrl) + File.separator;   // file path

// Jakarta Commons 프로젝트의 FileUpload 모듈을 사용함.
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

try {

  // Process the uploaded items
  Iterator iter = items.iterator();

  while (iter.hasNext()) {

    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {

      // Process a regular form field
      String name = item.getFieldName();

      if (name.equals("oldAttachedFile")) {
        oldAttachedFiles.add(item.getString());
      } else {
        params.put(name, item.getString());
      }

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
      String[] fileNames = {attachFileName, attachRealFileName};
      attachedFiles.add(fileNames);
      item.write(writeFile);

    }

  } // end of while

  isSucceeded = true;

} catch (Exception e) {
  isSucceeded = false;
  strMsg = e.getMessage();
}

// Parameter Setting
String curPage = (String) params.get("curPage");
String pageSize = (String) params.get("pageSize");
String noticeType = (String) params.get("noticeType");
String seqno = (String) params.get("seqno");
String searchCategory = (String) params.get("searchCategory");
String searchKeyword = (String) params.get("searchKeyword");
String title = (String) params.get("title");
String content = (String) params.get("contents");

// Database 처리
if (isSucceeded) {

  String sql = "";
  Connection conn = null;
  PreparedStatement pstmt = null;
  PreparedStatement pstmt2 = null;
  PreparedStatement pstmt3 = null;

  // Namo Content 처리  ///////////////////////////////////////////////////
  // MIME 디코딩 하기
  NamoMime mime = new NamoMime();
  mime.setSaveURL(request.getScheme() + "://" + request.getHeader("Host") + _noticeDataUrl);
  mime.setSavePath(savePath);
  mime.decode(content);					// MIME 디코딩
  mime.saveFile();						// 포함한 파일 저장하기
  content = mime.getBodyContent();
  //////////////////////////////////////////////////////////////////////////

  try {

    Context ic = new InitialContext(); 
    DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
    conn = ds.getConnection();

    int idx = 0;
    conn.setAutoCommit(false);

    if (seqno != null && seqno.length() > 0) {

      // update ...
      sql = " update  notice_01t "
          + " set     title = ?, "
          + "         content = ?, "
          + "         modify_date = now() "
          + " where   seqno = ? "
          + " and     type = ? "
          + " and     user_id = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, convert_to_ksc(title));
      pstmt.setString(++idx, convert_to_ksc(content));
      pstmt.setLong(++idx, Long.parseLong(seqno));
      pstmt.setInt(++idx, Integer.parseInt(noticeType));
      pstmt.setString(++idx, scmid);

    } else {

      // insert ...
      sql = " insert  into notice_01t "
          + " ( "
          + "  	seqno,      input_date,     user_id,        user_name, "
          + "   type,       title,          content,        read_cnt,       modify_date "
          + " ) "
          + " values "
          + " ( null,   now(),  ?,  ?,  ?,  ?,  ?,  0,  now() ) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, scmid);
      pstmt.setString(++idx, scmnm);
      pstmt.setInt(++idx, Integer.parseInt(noticeType));
      pstmt.setString(++idx, convert_to_ksc(title));
      pstmt.setString(++idx, convert_to_ksc(content));

    }

    // execute ...
    pstmt.executeUpdate();

    // insert 인 경우 seqno를 읽어온다.
    if (seqno == null || seqno.length() == 0) {
      sql = " select last_insert_id() ";

      MatrixDataSet matrix = new MatrixDataSet();
      DataProcess dataProcess = new DataProcess();
      dataProcess.RetrieveData(sql, matrix, conn);
      seqno = matrix.getRowData(0).getData(0);
    }

    // processing attach files ...
    // attached files DB delete ..
    int size = oldAttachedFiles.size();
    if (size > 0) {
      String seqnoes = "";
      for (int i = 0; i < size; i++) {
        String oldAttachedFile = (String) oldAttachedFiles.get(i);
        seqnoes += oldAttachedFile.substring(0, oldAttachedFile.indexOf("/"));
        if (i < (size - 1)) seqnoes += ",";
      }

      sql = " delete  from notice_02t "
          + " where   seqno in (" + seqnoes + ") ";

      pstmt2 = conn.prepareStatement(sql);
      pstmt2.executeUpdate();
    }

    // attach files db insert ..
    size = attachedFiles.size();
    if (size > 0) {
      sql = " insert  into notice_02t "
          + " ( seqno,  notice_seqno,   attach_file,    attach_real_file ) "
          + " values ( null,  ?,  ?,  ? ) ";

      pstmt3 = conn.prepareStatement(sql);

      for (int i = 0; i < size; i++) {
        String[] fileNames = (String[]) attachedFiles.get(i);

        idx = 0;
        pstmt3.setLong(++idx, Long.parseLong(seqno));
        pstmt3.setString(++idx, fileNames[0]);
        pstmt3.setString(++idx, fileNames[1]);
        pstmt3.executeUpdate();
      }
    }

    conn.commit();

  } catch (SQLException se) {
    try { conn.rollback(); } catch (Exception ex) {}

    isSucceeded = false;
    strMsg = "Check your data. " + se.getMessage();
    System.out.println("Exception save : " + se.getMessage());
  } catch (Exception e) {
    try { conn.rollback(); } catch (Exception ex) {}

    isSucceeded = false;
    strMsg = "Error occurred. " + e.getMessage();
    System.out.println("Exception save : " + e.getMessage());
    throw e;
  } finally {
    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }

    if (pstmt2 != null) {
      try { pstmt2.close(); } catch (Exception e) {}
    }

    if (pstmt3 != null) {
      try { pstmt3.close(); } catch (Exception e) {}
    }

    if (conn != null) {
      try { conn.setAutoCommit(true); } catch (Exception e) {}
      conn.close();
    }
  }

}

// attached files 삭제
// isSucceeded == true -> oldAttached files 삭제
// isSucceeded == false -> attached files 삭제
int size = 0;

if (isSucceeded) {

  size = oldAttachedFiles.size();
  if (size > 0) {
    for (int i = 0; i < size; i++) {
      String oldAttachedFile = (String) oldAttachedFiles.get(i);
      String fileName = oldAttachedFile.substring(oldAttachedFile.indexOf("/") + 1);

      try {
        File file = new File(savePath + fileName);
        if (file.exists()) { file.delete(); }
      } catch (Exception e) {}
    }
  }

} else {

  size = attachedFiles.size();
  if (size > 0) {
    for (int i = 0; i < size; i++) {
      String[] fileNames = (String[]) attachedFiles.get(i);

      try {
        File file = new File(savePath + fileNames[1]);
        if (file.exists()) { file.delete(); }
      } catch (Exception e) {}
    }
  }

}

// 결과 메시지 처리
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"./buyer_list.jsp\">\r\n");
      out.write("<input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"pageSize\" value=\"");
      out.print( pageSize );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"noticeType\" value=\"");
      out.print( noticeType );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"searchCategory\" value=\"");
      out.print( searchCategory );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"searchKeyword\" value=\"");
      out.print( searchKeyword );
      out.write("\">\r\n");
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
