package org.apache.jsp.notice_005fnew;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write('\r');
      out.write('\n');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");

//response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
//response.setHeader("Pragma","no-cache"); //HTTP 1.0
//response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String noticeType = request.getParameter("noticeType");
String searchCategory = request.getParameter("searchCategory");
String searchKeyword = request.getParameter("searchKeyword");

if (curPage == null) curPage = "1";
if (pageSize == null) pageSize = "20";
if (noticeType == null) noticeType = "1";
if (searchCategory == null) searchCategory = "Title";
if (searchKeyword == null) searchKeyword = "";

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

// paging �� ��
int iCurPage = 1;
int iPageSize = 20;
int iTotalPage = 1;
int iPageBlockSize = 10;
int iTotalCnt = 0;
String pageList = "";

try {
  iCurPage = Integer.parseInt(curPage);
  iPageSize = Integer.parseInt(pageSize);
} catch (NumberFormatException ne) {}

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  // 
  sql = " select  count(*)  from notice_01t where type = " + noticeType;
	dataProcess.RetrieveData(sql, matrix, conn);
  iTotalCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  iTotalPage = (iTotalCnt - 1)/iPageSize + 1;


  int iOffset = (iCurPage - 1)*iPageSize;
  sql = " select  a.seqno, date_format(a.input_date, '%Y/%m/%d'), a.user_name, a.title, a.read_cnt, "
      + "         ifnull(b.file_cnt, 0), datediff(now(), input_date) "
      + " from    notice_01t a "
      + "         left outer join "
      + "         ( "
      + "           select  notice_seqno,   count(*) file_cnt "
      + "           from    notice_02t "
      + "           group by notice_seqno "
      + "         ) b "
      + "           on a.seqno = b.notice_seqno "
      + " where   a.type = " + noticeType;

  if (searchKeyword.length() > 0) {
    String tmpKeyword = searchKeyword.replaceAll("'", "''");
  
    if (searchCategory.equals("Title")) {
      sql += " and     upper(a.title) like upper('%" + tmpKeyword + "%') ";
    } else if (searchCategory.equals("Name")) {
      sql += " and     upper(a.user_name) like upper('%" + tmpKeyword + "%') ";
    }
  }

  sql += " order by a.seqno desc "
       + " limit " + iOffset + ", " + iPageSize;

  //out.println(sql); if (true) return;
	iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String seqno        = matrix.getRowData(i).getData(j++);
  String inputDate    = matrix.getRowData(i).getData(j++);
  String userName     = matrix.getRowData(i).getData(j++);
  String title        = matrix.getRowData(i).getData(j++);
  long readCnt        = Long.parseLong(matrix.getRowData(i).getData(j++));
  int fileCnt         = Integer.parseInt(matrix.getRowData(i).getData(j++));
  int dateDiff        = Integer.parseInt(matrix.getRowData(i).getData(j++));

  String strLink = "<a href=\"javascript:fnView('" + seqno + "')\">" + StringUtil.convertTextToHtml(title) + "</a>";

  // new icon
  String newIcon = "";
  if (dateDiff < 1) newIcon = "<img src='/img/ico_new2.gif' border='0'>";

  String bgColor = "";
  if (i%2 == 0) bgColor = "#ffffff";
  else          bgColor = "#F6F5E3";

  outS += "<tr align='center' class='table_list' style='background-color:" + bgColor + ";'>"
        + "  <td>" + seqno + "</td>"
        + "  <td>" + inputDate + "</td>"
        + "  <td>" + fileCnt + "</td>"
        + "  <td>" + readCnt + "</td>"
        + "  <td>" + userName + "</td>"
        + "  <td align='left'>" + strLink + " " + newIcon + "</td>"
        + "</tr>";
}

if (iRet == 0 ) {
  outS += "<tr><td width='100%' align='center' colspan='6' class='table_list'>Data are Not found.</td></tr>";
}
// Paging.
pageList = getPageList(iCurPage, iTotalCnt, iPageSize, iPageBlockSize);

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("function fnGoPage(page) {\r\n");
      out.write("  with (document.form1) {\r\n");
      out.write("    curPage.value = page;\r\n");
      out.write("    action = \"./list.jsp\";\r\n");
      out.write("    submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnNotice(type) {\r\n");
      out.write("  with (document.form0) {\r\n");
      out.write("    noticeType.value = type;\r\n");
      out.write("    action = \"./list.jsp\";\r\n");
      out.write("    submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnSearch(frm) {\r\n");
      out.write("  if (jf_ChkValue(frm.searchKeyword.value)) {\r\n");
      out.write("    frm.searchKeyword.value = frm.searchKeyword.value.replace(/\"/g, \"'\");\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  frm.curPage.value = '1';\r\n");
      out.write("  frm.action=\"./list.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnNew(frm) {\r\n");
      out.write("  frm.curPage.value = '1';\r\n");
      out.write("  frm.action = \"./form.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnView(pSeqNo) {\r\n");
      out.write("  with (document.form1) {\r\n");
      out.write("    seqno.value = pSeqNo;\r\n");
      out.write("    action = \"./view.jsp\";\r\n");
      out.write("    submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnBack(frm) {\r\n");
      out.write("  frm.action=\"./list.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("<tr><td>&nbsp;</td></tr>\r\n");
      out.write("<tr><td>\r\n");
      out.write("\r\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\r\n");
      out.write("  <td width=\"*\" class=\"left_title\">");
      out.print( noticeType.equals("1") ? "Bulletin Board" : "PDS"  );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<form name=\"form1\" method=\"post\" >\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\" >\r\n");
      out.write("<input type=\"hidden\" name=\"noticeType\" value=\"");
      out.print( noticeType );
      out.write("\" >\r\n");
      out.write("<input type=\"hidden\" name=\"seqno\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"15%\" align='center'><select name=\"searchCategory\">\r\n");
      out.write("      <option value=\"Title\" ");
      out.print( (searchCategory.equals("Title") ? "selected" : "") );
      out.write(">Title</option>\r\n");
      out.write("      <option value=\"Name\" ");
      out.print( (searchCategory.equals("Name") ? "selected" : "") );
      out.write(">Name</option>\r\n");
      out.write("    </select>\r\n");
      out.write("    <input type=\"text\" name=\"searchKeyword\" value=\"");
      out.print( searchKeyword );
      out.write("\" size=\"30\" maxlength=\"30\" class=\"input_text\">\r\n");
      out.write("    <input type=\"button\" value=\"Search\" onclick=\"fnSearch(this.form);\" class=\"button_default\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"50%\">Items per page :\r\n");
      out.write("    <select name=\"pageSize\" onChange=\"fnGoPage(1)\">\r\n");
      out.write("      <option value=\"20\" ");
      out.print( pageSize.equals("20") ? "selected" : "" );
      out.write(">20</option>\r\n");
      out.write("      <option value=\"50\" ");
      out.print( pageSize.equals("50") ? "selected" : "" );
      out.write(">50</option>\r\n");
      out.write("      <option value=\"100\" ");
      out.print( pageSize.equals("100") ? "selected" : "" );
      out.write(">100</option>\r\n");
      out.write("    </select></td>\r\n");
      out.write("  <td width=\"*\" align=\"right\" valign=\"bottom\">Total : ");
      out.print( iTotalCnt );
      out.write(", Current Page : ");
      out.print( iCurPage );
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print( iTotalPage );
      out.write("&nbsp;</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\r\n");
      out.write("<tr class=\"table_header_center\">\r\n");
      out.write("  <td width=\"9%\">No.</td>\r\n");
      out.write("  <td width=\"9%\">Date</td>\r\n");
      out.write("  <td width=\"9%\">Attachment</td>\r\n");
      out.write("  <td width=\"9%\">View</td>\r\n");
      out.write("  <td width=\"20%\">ID</td>\r\n");
      out.write("  <td width=\"44%\">Subject</td>\r\n");
      out.write("</tr>\r\n");
      out.print( outS );
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" align=\"center\">");
      out.print( pageList );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" align=\"center\">\r\n");
      out.write("    <input type=\"button\" value=\"Create New\" onclick=\"fnNew(this.form);\" class=\"button_default\">\r\n");
      out.write("    <!--input type=\"button\" value=\"Back\" onclick=\"fnBack(this.form);\" class=\"button_default\"-->\r\n");
      out.write("  </td>\r\n");
      out.write("</tr>\r\n");
      out.write("</form>\r\n");
      out.write("<form name=\"form0\" method=\"post\">\r\n");
      out.write("<input type=\"hidden\" name=\"noticeType\">\r\n");
      out.write("</form>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("</td></tr></table>\r\n");

	out.println(CopyRightLogo());
	
      out.write("\r\n");
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
