package org.apache.jsp.admin.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import common.util.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
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


// getPageList : return Paging String
String getPageList(int currentPage, int totalCount, int pageSize, int pageBlockSize) {
  int iTmp = (currentPage - 1)/pageBlockSize;
  int iBlockBegin = iTmp*pageBlockSize + 1;
  int iBlockEnd = iBlockBegin + pageBlockSize - 1;
  int iTotalPage = (totalCount - 1)/pageSize + 1;

  String pageList = "";

  // Ã¹ÆäÀÌÁö, ÀÌÀü ÆäÀÌÁö ÀÌµ¿
  if (currentPage > 1) {
    pageList += "<a href='javascript:fnGoPage(1);'>[First]</a>&nbsp;"
              + "<a href='javascript:fnGoPage("+ (currentPage - 1) + ");'>[Prev]</a>&nbsp;";
  } else {
    pageList += "[First]&nbsp;[Prev]&nbsp;";
  }

  // ÀÌÀü ºí·Ï ÀÌµ¿
  if (iBlockBegin > pageBlockSize) {
    pageList += "<a href='javascript:fnGoPage(" + (iBlockBegin - 1) + ");'>...</a>&nbsp;";
  } else {
    pageList += "...&nbsp;";
  }

  // Block Paging
  for (int i = iBlockBegin; i <= iBlockEnd && i <= iTotalPage; i++) {
    if (i == currentPage) {
      pageList += "<b>" + i + "</b>&nbsp;";
    } else {
      pageList += "<a href='javascript:fnGoPage(" + i + ");'>" + i + "</a>&nbsp;";
    }
  }

  // ´ÙÀ½ ºí·Ï ÀÌµ¿
  if (iBlockEnd < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ (iBlockEnd + 1) + ");'>...</a>&nbsp;";
  } else {
    pageList += "...&nbsp;";
  }

  // ´ÙÀ½ ÆäÀÌÁö ÀÌµ¿
  if (currentPage < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ (currentPage + 1) + ");'>[Next]</a>&nbsp;";
  } else {
    pageList += "[Next]&nbsp;";
  }

  // ¸¶Áö¸· ÆäÀÌÁö ÀÌµ¿
  if (currentPage < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ iTotalPage + ");'>[Last]</a>";
  } else {
    pageList += "[Last]";
  }

  return pageList;
}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
    _jspx_dependants.add("/common/getPageList.jsp");
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
      out.write('\n');
      out.write('\n');
      out.write('\n');

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String seqNo2 = "";
String curPage = request.getParameter("curPage");
if (curPage == null) curPage = "1";

String pageSize = request.getParameter("pageSize");
if (pageSize == null) pageSize = "20";

String searchCategory = request.getParameter("searchCategory");
if (searchCategory == null) searchCategory = "Title";

String searchKeyword = request.getParameter("searchKeyword");
if (searchKeyword == null) searchKeyword = "";

// paging 관련 변수
int iCurPage = 1;
int iPageSize = 20;
int iTotalPage = 1;
int iPageBlockSize = 10;
int iTotalCnt = 0;
int iBeginRownum = 0;
int iEndRownum = 0;
String pageList = "";

try {
  iCurPage = Integer.parseInt(curPage);
  iPageSize = Integer.parseInt(pageSize);
} catch (NumberFormatException ne) {}

// DB 관련 변수
int iRet = 0;

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String outS = "";
String sql = "";
String cntSql = "";
String mainSql = "";
String whereSql = "";
String mainWhereSql = "";
String cntWhereSql = "";
String orderSql = "";
String content = "";
String attachedFiles = "";
// Query 생성 //////////////////////////////////////////////////////////
cntSql = " select count(*) from scm_notice_01t a ";

mainSql = " select  a.seqno,        date_format(a.input_date, '%Y/%m/%d') input_date, "
        + "         a.admin_name,   a.title,    a.read_cnt,   IFNULL(b.file_cnt, 0) file_cnt, "
        + "         curdate()-(a.input_date) date_diff "
        + " from    scm_notice_01t a LEFT OUTER JOIN  "
        + "         ( "
        + "           select  notice_seqno,   count(*) file_cnt "
        + "           from    scm_notice_02t "
        + "           group by notice_seqno "
        + "         ) b ON (a.seqno = b.notice_seqno) ";

mainWhereSql = " where a.seqno > 1  ";
cntWhereSql = " where  1=1 ";            // for skip

if (searchKeyword.length() > 0) {
  String tmpKeyword = searchKeyword.replaceAll("'", "''");

  if (searchCategory.equals("Title")) {
    whereSql += " and     upper(a.title) like upper('%" + tmpKeyword + "%') ";
  } else if (searchCategory.equals("Name")) {
    whereSql += " and     upper(a.admin_name) like upper('%" + tmpKeyword + "%') ";
  }

}

orderSql += " order by a.seqno desc ";
/////////////////////////////////////////////////////////////////////
String inputDate2     = "";
String adminId2       = "";
String adminName2     = "";
int  readCnt2       =0;
String title2         = "";
try {

  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  conn.setAutoCommit(false);
   // read the manual
    sql = " select IFNULL(max(seqno), 0) from scm_notice_01t  ";
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    seqNo2 = matrix.getRowData(0).getData(0);

  // update read count
  sql = " update  scm_notice_01t "
      + " set     read_cnt = IFNULL(read_cnt, 0) + 1 "
      + " where   seqno = ? ";
  pstmt = conn.prepareStatement(sql);
  pstmt.setLong(1, Long.parseLong(seqNo2));
  pstmt.executeUpdate();
  conn.commit();

  // read the notice
  sql = " select  date_format(input_date, '%Y/%m/%d'), admin_id, "
      + "         admin_name, IFNULL(read_cnt, 0), title, content "
      + " from    scm_notice_01t "
      + " where   seqno = " + seqNo2;

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);
  
  if (rs.next()) {
    int j = 0;
    inputDate2     = rs.getString(++j);
    adminId2       = rs.getString(++j);
    adminName2     = rs.getString(++j);
    readCnt2       = rs.getInt(++j);
    title2         = rs.getString(++j);

    // read content
    Clob clob     = rs.getClob(++j);

    Reader clobStream = clob.getCharacterStream();
    StringBuffer buf = new StringBuffer();
    int    nchars = 0;              // Number of characters read
    char[] buffer = new char[10];   //  Buffer holding characters being transferred

    while( (nchars = clobStream.read(buffer)) != -1 ) {   // Read from Clob
      buf.append(buffer, 0, nchars);                      // Write to StringBuffer
    }

    clobStream.close();             // Close the Clob input stream

    content = buf.toString();
    ////////////////////////////
  }

  rs.close();

  // read attached files
  sql = " select  seqno,  attach_file,  attach_real_file "
      + " from    scm_notice_02t "
      + " where   notice_seqno = " + seqNo2
      + " order by seqno desc ";

  rs = stmt.executeQuery(sql);

  int i = 0;
  while (rs.next()) {
    int j = 0;
    long fileSeqNo        = rs.getLong(++j);
    String attachFile     = rs.getString(++j);
    String attachRealFile = rs.getString(++j);

    if (i++ > 0) attachedFiles += "<br>";

    attachedFiles += "<a href=\"javascript:fnDownload('" + attachFile + "', '" + attachRealFile + "');\">"
                + attachFile + "</a>";
  }  
  

  // 전체 Count & Paging 변수 세팅
  dataProcess.RetrieveData(cntSql + cntWhereSql + whereSql, matrix, conn);

  iTotalCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  iTotalPage = (iTotalCnt - 1)/iPageSize + 1;
  iBeginRownum = (iCurPage - 1)*iPageSize + 1;
  iEndRownum = iBeginRownum + iPageSize - 1;

  // 해당 페이지의 데이타를 읽어온다.
  
  sql = "    SELECT T2.* FROM( "
          +"        SELECT @RNUM:=@RNUM+1 AS RM, T1.* "
          +"           FROM(  "
          +            mainSql + mainWhereSql + whereSql + orderSql 
          +  ") AS T1, (SELECT @RNUM:=0) R )  AS T2 "
          + "   WHERE RM >=  " + iBeginRownum+"  AND RM <= " + iEndRownum;
  
  //sql = " select  * "
  //    + " from    ( "
  //    + "           select  rownum rnum, innerview.* "
  //    + "           from    ( "
  //    +                       mainSql + whereSql + orderSql
  //    + "                   ) innerview "
  //    + "           where   rownum <= " + iEndRownum
 //     + "         ) "
 //     + " where   rnum >= " + iBeginRownum;
 //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception notice list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  j++;                // Skip reading rnum
  String seqNo        = matrix.getRowData(i).getData(j++);
  String inputDate    = matrix.getRowData(i).getData(j++);
  String adminName    = matrix.getRowData(i).getData(j++);
  String title        = matrix.getRowData(i).getData(j++);
  long readCnt        = Long.parseLong(matrix.getRowData(i).getData(j++));
  int fileCnt         = Integer.parseInt(matrix.getRowData(i).getData(j++));
  int dateDiff        = Integer.parseInt(matrix.getRowData(i).getData(j++));

 // String strLink = "<a href=\"javascript:fnView('" + seqNo + "')\">" + StringUtil.convertTextToHtml(title) + "</a>";
  String strLink = "<a href=\"javascript:fnView('" + seqNo + "')\">" + title + "</a>";
  // new icon
  String newIcon = "";
  if (dateDiff < 7) newIcon = "<img src='/img/ico_new.gif' border='0'>";

  String bgColor = "";
  if (i%2 == 0) bgColor = "#ffffff";
  else          bgColor = "#F6F5E3";

  outS += "<tr align='center' class='table_list' style='background-color:" + bgColor + ";'>"
        + "  <td>" + seqNo + "</td>"
        + "  <td>" + inputDate + "</td>"
        + "  <td>" + fileCnt + "</td>"
        + "  <td>" + readCnt + "</td>"
        + "  <td>" + adminName + "</td>"
        + "  <td align='left'>" + newIcon + " " + strLink + "</td>"
        + "</tr>";
}

// Paging.
pageList = getPageList(iCurPage, iTotalCnt, iPageSize, iPageBlockSize);

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("function fnGoPage(page) {\n");
      out.write("  with (document.form1) {\n");
      out.write("    curPage.value = page;\n");
      out.write("    action = \"./list.jsp\";\n");
      out.write("    submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSearch(frm) {\n");
      out.write("  if (jf_ChkValue(frm.searchKeyword.value)) {\n");
      out.write("    frm.searchKeyword.value = frm.searchKeyword.value.replace(/\"/g, \"'\");\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  frm.curPage.value = '1';\n");
      out.write("  frm.action=\"./list.jsp\";\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnNew(frm) {\n");
      out.write("  frm.curPage.value = '1';\n");
      out.write("  frm.action = \"./form.jsp\";\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnView(pSeqNo) {\n");
      out.write("  with (document.form1) {\n");
      out.write("    seqNo.value = pSeqNo;\n");
      out.write("    action = \"./view.jsp\";\n");
      out.write("    submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>&nbsp;</td></tr>\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/btnFolder.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">&nbsp;&nbsp;&nbsp;Notice for Sebin User</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">Date</td>\n");
      out.write("  <td width=\"20%\" class=\"table_bg_bright_center\">");
      out.print( inputDate2 );
      out.write("</td>\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">Admin Name</td>\n");
      out.write("  <td width=\"20%\" class=\"table_bg_bright_center\">");
      out.print( adminName2 );
      out.write("</td>\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">Read Count</td>\n");
      out.write("  <td width=\"15%\" class=\"table_bg_bright_center\">");
      out.print( readCnt2 );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">Title</td>\n");
      out.write("  <td colspan=\"5\" class=\"table_bg_bright\">");
      out.print( title2 );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">Attached Files</td>\n");
      out.write("  <td colspan=\"5\" class=\"table_bg_bright\">");
      out.print( attachedFiles );
      out.write("&nbsp;</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td colspan=\"6\" height=\"300\" valign=\"top\" class=\"table_bg_white\">");
      out.print( content );
      out.write("&nbsp;</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<br>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<form name=\"form1\" method=\"post\">\n");
      out.write("<input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"seqNo\">\n");
      out.write("<tr>\n");
      out.write(" ");

  	   if ( _adminclass.equals("1")) {
     
      out.write(" \n");
      out.write("  <td width=\"50%\" align=\"left\">\n");
      out.write("    <input type=\"button\" value=\" New \" onclick=\"fnNew(this.form);\" class=\"button_default\">\n");
      out.write("  </td>\n");
      out.write("      ");

    }
    
      out.write("\t\n");
      out.write("  <td width=\"50%\" align='right'><select name=\"searchCategory\">\n");
      out.write("      <option value=\"Title\" ");
      out.print( (searchCategory.equals("Title") ? "selected" : "") );
      out.write(">Title</option>\n");
      out.write("      <option value=\"Name\" ");
      out.print( (searchCategory.equals("Name") ? "selected" : "") );
      out.write(">Name</option>\n");
      out.write("    </select>\n");
      out.write("    <input type=\"text\" name=\"searchKeyword\" value=\"");
      out.print( searchKeyword );
      out.write("\" size=\"30\" maxlength=\"30\" class=\"input_text\">\n");
      out.write("    <input type=\"button\" value=\"Search\" onclick=\"fnSearch(this.form);\" class=\"button_default\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"50%\">Page Size :\n");
      out.write("    <select name=\"pageSize\" onChange=\"fnGoPage(1)\">\n");
      out.write("      <option value=\"20\" ");
      out.print( pageSize.equals("20") ? "selected" : "" );
      out.write(">20</option>\n");
      out.write("      <option value=\"50\" ");
      out.print( pageSize.equals("50") ? "selected" : "" );
      out.write(">50</option>\n");
      out.write("      <option value=\"100\" ");
      out.print( pageSize.equals("100") ? "selected" : "" );
      out.write(">100</option>\n");
      out.write("    </select></td>  \n");
      out.write("  <td width=\"*\" align=\"right\" valign=\"bottom\">Total : ");
      out.print( iTotalCnt );
      out.write(", Current Page : ");
      out.print( iCurPage );
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print( iTotalPage );
      out.write("&nbsp;</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<tr class=\"table_header_center\">\n");
      out.write("  <td width=\"9%\">Seq No</td>\n");
      out.write("  <td width=\"9%\">Input Date</td>\n");
      out.write("  <td width=\"9%\">File Count</td>\n");
      out.write("  <td width=\"9%\">Read Count</td>\n");
      out.write("  <td width=\"14%\">Name</td>\n");
      out.write("  <td width=\"50%\">Title</td>\n");
      out.write("</tr>\n");
      out.print( outS );
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" align=\"center\">");
      out.print( pageList );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("<!--tr>\n");
      out.write("  <td width=\"100%\" align=\"center\">\n");
      out.write("    <input type=\"button\" value=\"NEW\" onclick=\"fnNew(this.form);\" class=\"button_default\">\n");
      out.write("  </td>\n");
      out.write("</tr-->\n");
      out.write("</form>\n");
      out.write("</table>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</td></tr></table>\n");
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
