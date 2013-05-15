<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@page import="com.namo.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

boolean isSucceeded = false;
String strMsg = "";

HashMap params = new HashMap();               // parameter ���� �ӽ� ����
List oldAttachedFiles = new ArrayList();         // attachedFile ���� �ӽ� ����
List attachedFiles = new ArrayList();           // attachFile ���� �ӽ� ����
String savePath = application.getRealPath(_noticeDataUrl) + File.separator;   // file path

// Jakarta Commons ������Ʈ�� FileUpload ����� �����.
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

      // File Size�� 0�� ��� ������.
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

      // File ���� ����
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

// Database ó��
if (isSucceeded) {

  String sql = "";
  Connection conn = null;
  PreparedStatement pstmt = null;
  PreparedStatement pstmt2 = null;
  PreparedStatement pstmt3 = null;

  // Namo Content ó��  ///////////////////////////////////////////////////
  // MIME ���ڵ� �ϱ�
  NamoMime mime = new NamoMime();
  mime.setSaveURL(request.getScheme() + "://" + request.getHeader("Host") + _noticeDataUrl);
  mime.setSavePath(savePath);
  mime.decode(content);					// MIME ���ڵ�
  mime.saveFile();						// ������ ���� �����ϱ�
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

    // insert �� ��� seqno�� �о�´�.
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

// attached files ����
// isSucceeded == true -> oldAttached files ����
// isSucceeded == false -> attached files ����
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

// ��� �޽��� ó��
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;
%>

<%!
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
%>

<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./buyer_list.jsp">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
<input type="hidden" name="noticeType" value="<%= noticeType %>">
<input type="hidden" name="searchCategory" value="<%= searchCategory %>">
<input type="hidden" name="searchKeyword" value="<%= searchKeyword %>">
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
