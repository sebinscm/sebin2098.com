<%@page import="java.io.*" %>
<%@page import="common.*" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<!--%@ include file="/login_check.jsp" %-->
<%
//response.resetBuffer();
//response.reset();
request.setCharacterEncoding("euc-kr"); 
response.resetBuffer();
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String attachPath = request.getParameter("attachPath");
String attachFile = request.getParameter("attachFile");
String attachRealFile = request.getParameter("attachRealFile");

try {

  String savePath = application.getRealPath(attachPath) + File.separator;
  File file = new File(savePath + attachRealFile);

  if (!file.exists()) {
    throw new UserDefinedException("File does not exist.");
  }

  // file read ..
  //response.setContentType("application/octet-stream");
  //response.setHeader("Content-Length", "" + file.length());
  //response.setHeader("Content-Disposition", "attachment; filename=" + attachFile + ";");
  // file read ..
  response.reset();
  response.setContentType("application/octet-stream");
  //response.setContentType("application/pdf");
  response.setHeader("Content-Length", "" + file.length());
  response.setHeader("Content-Disposition", "attachment; filename=" + attachFile + ";");
  //response.setHeader("Content-Disposition", "inline; filename=" + attachFile + ";");

  byte[] buf = new byte[8192];

  int cnt = 0;

  BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(file));
  BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream());

  try {
    while ((cnt = inStream.read(buf)) != -1) {
        outStream.write(buf, 0, cnt);
    }

    outStream.flush();
  } catch (Exception e) {
    throw e;
  } finally {
    if (outStream != null) outStream.close();
    if (inStream != null) inStream.close();
  }

} catch (Exception e) {
  out.println("<html><script language='javascript'>alert('" + e.getMessage() + "');</script></html>");
}
%>