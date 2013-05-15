package org.apache.jsp.admin.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import common.*;
import common.util.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import com.namo.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

public final class save_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/bottom_line.jsp");
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
      out.write("\n");
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\n");

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
      out.write('\n');
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


      out.write('\n');
      out.write('\n');

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
request.setCharacterEncoding("euc-kr"); 
boolean isSucceeded = false;
String strMsg = "";

HashMap params = new HashMap();               // parameter 저장 임시 변수
List oldAttachedFiles = new ArrayList();         // attachedFile 저장 임시 변수
List attachedFiles = new ArrayList();           // attachFile 저장 임시 변수
String savePath = application.getRealPath(_ManagementNoticeUploadUrl) + File.separator;   // file path

// Jakarta Commons 프로젝트의 FileUpload 모듈을 사용함.
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath2));                 // Set factory constraints
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
String seqNo = (String) params.get("seqNo");
String searchCategory = (String) params.get("searchCategory");
String searchKeyword = (String) params.get("searchKeyword");
String title = (String) params.get("title");
String content = (String) params.get("content");

//out.println(title);
//if (true) return;

// Database 처리
if (isSucceeded) {

  String sql = "";
  
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  DataProcess dataProcess = null;
  PreparedStatement pstmt = null;
  PreparedStatement pstmt2 = null;
  PreparedStatement pstmt3 = null;

  // Namo Content 처리  ///////////////////////////////////////////////////
  // MIME 디코딩 하기
  NamoMime mime = new NamoMime();
  mime.setSaveURL(request.getScheme() + "://" + request.getHeader("Host") + _ManagementNoticeUploadUrl);
  mime.setSavePath(savePath);
  mime.decode(content);					// MIME 디코딩
  mime.saveFile();						// 포함한 파일 저장하기
  content = mime.getBodyContent();
  //////////////////////////////////////////////////////////////////////////

  try {

    dataProcess = new dbconn.DataProcess();
     Context ic = new InitialContext(); 
	 DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	 conn = ds.getConnection();

    int idx = 0;
    conn.setAutoCommit(false);

    if (seqNo != null && seqNo.length() > 0) {

      // update ...
      sql = " update  scm_notice_01t "
          + " set     title = ?, "
          + "         content = ?, "
          + "        	modify_date = sysdate() "
          + " where   seqno = ? "
          + " and     admin_id = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, convert_to_ascii(title));
      pstmt.setString(++idx, convert_to_ksc(content));
      pstmt.setLong(++idx, Long.parseLong(seqNo));
      pstmt.setString(++idx, _adminid);

    } else {

      // select seqno
      //sql = " select  notice_seq.nextval from dual ";
      //stmt = conn.createStatement();
      //rs = stmt.executeQuery(sql);
      //if (rs.next()) seqNo = rs.getString(1);
      //rs.close();
      //stmt.close();

      // insert ...
      sql = " insert  into scm_notice_01t "
          + " ( "
          + "  	 input_date,     admin_id,       admin_name,     title, "
          + "  	content,        read_cnt,       modify_id,      modify_date "
          + " ) "
          + " values "
          + " ( sysdate(), ?, ?, ?, ?, 0, ?, sysdate() ) ";

      pstmt = conn.prepareStatement(sql);
      //pstmt.setLong(++idx, Long.parseLong(seqNo));
      pstmt.setString(++idx, _adminid);
      pstmt.setString(++idx, _adminname);
      pstmt.setString(++idx, convert_to_ksc(content));
      pstmt.setString(++idx, title.trim() );
      pstmt.setString(++idx, _adminid);

    }

    // execute ...
    pstmt.executeUpdate();

    // update CLOB type content
    //sql = " select  content "
    //    + " from    scm_notice_01t "
    //    + " where   seqno = " + seqNo
    //    + " and     admin_id = '" + _adminid + "' "
    //    + " for update ";

    //stmt = conn.createStatement();
    //rs = stmt.executeQuery(sql);

  	//if (rs.next()) {
  //		oracle.sql.CLOB tmpContent = (oracle.sql.CLOB) rs.getObject(1);
  //		Writer contentWriter = tmpContent.getCharacterOutputStream();
  //		contentWriter.write(convert_to_ksc(content));
  //		contentWriter.flush();
  //		contentWriter.close();
   // }

    //rs.close();

    // processing attach files ...
    // attached files DB delete ..
    int size = oldAttachedFiles.size();
    if (size > 0) {
      String seqNoes = "";
      for (int i = 0; i < size; i++) {
        String oldAttachedFile = (String) oldAttachedFiles.get(i);
        seqNoes += oldAttachedFile.substring(0, oldAttachedFile.indexOf("/"));
        if (i < (size - 1)) seqNoes += ",";
      }

      sql = " delete  from scm_notice_02t "
          + " where   notice_seqno = ? "
          + " and     seqno in (" + seqNoes + ") ";

      pstmt2 = conn.prepareStatement(sql);
      pstmt2.setLong(1, Long.parseLong(seqNo));
      pstmt2.executeUpdate();
    }

    // attach files db insert ..
    size = attachedFiles.size();
    if (size > 0) {
      // read max file seqno
      int fileSeqNo = 1;

      sql = " select  ifnull(max(seqno) + 1, 1) "
          + " from    scm_notice_02t "
          + " where   notice_seqno = " + seqNo;

      rs = stmt.executeQuery(sql);

      if (rs.next()) {
        fileSeqNo = rs.getInt(1);
      }

      sql = " insert  into scm_notice_02t "
          + " ( notice_seqno, seqno, attach_file, attach_real_file ) "
          + " values ( ?,  ?,  ?,  ? ) ";

      pstmt3 = conn.prepareStatement(sql);

      for (int i = 0; i < size; i++) {
        String[] fileNames = (String[]) attachedFiles.get(i);

        idx = 0;
        pstmt3.setLong(++idx, Long.parseLong(seqNo));
        pstmt3.setInt(++idx, fileSeqNo++);
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
    //throw se;
  } catch (Exception e) {
    try { conn.rollback(); } catch (Exception ex) {}

    isSucceeded = false;
    strMsg = "Error occurred. " + e.getMessage();
    System.out.println("Exception save : " + e.getMessage());
    throw e;
  } finally {
    if (rs != null) {
      try { rs.close(); } catch (Exception e) {}
    }

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
else strMsg = "The operation failed.\\n" + StringUtil.replace(StringUtil.replace(strMsg, "\"", "\\\""), "\n", "\\n");

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"./list.jsp\">\n");
      out.write("<input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"pageSize\" value=\"");
      out.print( pageSize );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"searchCategory\" value=\"");
      out.print( searchCategory );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"searchKeyword\" value=\"");
      out.print( searchKeyword );
      out.write("\">\n");
      out.write("</form>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("  alert(\"");
      out.print( strMsg );
      out.write("\");\n");
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
