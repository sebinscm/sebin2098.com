package org.apache.jsp.memo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;

public final class memo_jsp extends org.apache.jasper.runtime.HttpJspBase
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

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/memo/../bottom_line.jsp");
    _jspx_dependants.add("/memo/../login_check.jsp");
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
      			"../error.jsp", true, 8192, true);
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
      out.write('\n');
      out.write('\n');

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

MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "";
int iRet = 0;
int page_size = 10; // page size

String next_page="memo.jsp?";
String prev_page="";
String start_seqno= request.getParameter("seqno");
if ( start_seqno != null && start_seqno.length() > 0 ) {
  prev_page = "<A href=\"JavaScript:Back()\">Prev</A>";
}
else {
  start_seqno = "99999";
}

String sdate = "";
String title = "";
String read_button = "";
String memolist = "";
String seqno = "0";
String contents = "";
String file_name ="";
String file_name2="";
String file_nm ="";
String path = application.getRealPath(_memoDataUrl) + File.separator;   // file path
String chk_new2 = "";
String chk_new = "";

sql = " select distinct a.seqno, date_format(a.IDATE, '%Y/%m/%d'), a.TITLE, case b.seqno when null then 1 else 0 end   " +
      "   from s_memo_03t a left outer join  s_memo_02t b  on( a.seqno = b.seqno  and a.comid = b.staffid )  " +
      "  where  a.comid =  '" + scmid + "'" +
      "    and case sign(sysdate() + 100 - sysdate()) when -1 then 0 else 1 end "  +
      "    and a.dflag = '0' "   +
      "    order by a.seqno desc  "  ;

try {

  String curno="";
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  if( iRet < 1 ) {
    seqno = "";
  } else {
    seqno = matrix.getRowData(0).getData(0);
    sdate = matrix.getRowData(0).getData(1);
    title = matrix.getRowData(0).getData(2);
    chk_new = matrix.getRowData(0).getData(3) ;
    
    if (chk_new.equals("0")){
           title = "&nbsp;"+title;
    } else {
           title = "<IMG src='../board/images/new_6.gif'>"+title ;
    }
    
    sql = "SELECT CONTENTS, AFNAME " +
          " FROM T_MEMO_01T " +
          " WHERE SEQNO = " + seqno +
          "   AND dflag = '0'";

    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
  
    if (rs.next()) {
      Clob clob   = rs.getClob(1);
      Reader clobStream = clob.getCharacterStream();
      StringBuffer buf = new StringBuffer();
      int    nchars = 0; // Number of characters read
      char[] buffer = new char[10];  //  Buffer holding characters being transferred
  
      while( (nchars = clobStream.read(buffer)) != -1 ) // Read from Clob
        buf.append(buffer, 0, nchars);        // Write to StringBuffer
  
      clobStream.close();  // Close the Clob input stream
  
      contents = buf.toString();
      
      file_nm   = rs.getString(2);

      if ( file_nm == null || file_nm.length() < 3 ) {
        file_name2 = "<td align=left ><B> 첨부된 화일 없음. </B></TD>";
      } else {
        file_name = path + file_nm;
        file_name2 = "<td align=left  ><B>첨부된 화일 : <a href='download.jsp?filename=" + file_name + "'><font color=#0000FF size=3>" + file_nm + " </font></B>" +
                     " <IMG height=14  src=../notice/images/disk.gif width=14 align=textTop border=0> </td>";
      }
    }
    
    rs.close();
    stmt.close();

    // For read button
    sql = "SELECT date_format(RDATE,'%Y/%m/%d') " +
          " FROM S_MEMO_02T " +
          " WHERE SEQNO = " + seqno + " AND " +
          " STAFFID = '" + scmid + "'";
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    if( iRet < 1 ) {
      read_button = "<INPUT TYPE=CHECKBOX VALUE=\"READ\" ONCLICK=\"Read()\"><font color=red>수신확인 </font>";
    } else {
      read_button = "<font color=red >수신 처리일자 : " + matrix.getRowData(0).getData(0);
    }
  }

  sql =  " select distinct a.seqno seqno, date_format(a.IDATE, '%Y/%m/%d') idate, a.TITLE title, case b.seqno when null then 1 else 0 end    " +
         " from s_memo_03t a left outer join s_memo_02t b  on (  a.seqno = b.seqno and a.comid = b.staffid ) " +
         " where a.seqno < " + start_seqno +
         "   and a.comid =  '" + scmid + "'" +
         "   AND a.dflag = '0'" +
         " ORDER BY a.seqno DESC  " +
         "  limit  " + page_size ;
  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  int count = 0;
  int chk_bgcolor = 0;
  String bgcolor = "#FFFFFF";
  String newimg = "";

  for( count=0;count < iRet; count++ ) {
    chk_new2 = matrix.getRowData(count).getData(3) ;
    
    if (chk_new2.equals("0")){
      newimg = "&nbsp;";
    } else {
      newimg = "<IMG src='../board/images/new_6.gif'>" ;
    }

    curno = matrix.getRowData(count).getData(0);
    
    if( chk_bgcolor == 0 ) {
      bgcolor = "#FFFFFF";
      chk_bgcolor = 1;
    }
    else {
      bgcolor = "#E0E0E0";
      chk_bgcolor = 0;
    }
    
    memolist += "<tr bgcolor=" + bgcolor + ">\n<td>" +
                matrix.getRowData(count).getData(1) + "</td><td width=25 >"+newimg+"</td><td>" +
                "<a href=\"memo_detail.jsp?seqno=" +
                matrix.getRowData(count).getData(0) + "\"> " +
                matrix.getRowData(count).getData(2) + "</a></td></tr>\n";
  }
  
  if( iRet == 0 ) {
    memolist += "<tr><td>&nbsp;</td><td>공지사항이 없습니다.</td></tr>\n";
  }
  else {
   if ( count < page_size )
     next_page = "";
   else
     next_page = "<A HREF=\"" + next_page + "seqno=" + curno + "\">Next</A>";
  }

} catch (Exception e) {
  System.out.println("Exception /memo/memo : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }
  
  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\n");
      out.write("function Read()\n");
      out.write("{\n");
      out.write("  frmMain.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function Back()\n");
      out.write("{\n");
      out.write("  history.back();\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">공지사항</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<TR>\n");
      out.write("  <td width=100% align='center' class='sub_title'>최근 공지사항</td>\n");
      out.write("</TR>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE border=0 WIDTH=95% CELLPADDING=0 CELLSPACING=0 align='center'>\n");
      out.write("<FORM NAME=frmMain ACTION=memo_read3.jsp METHOD=POST>\n");
      out.write("<INPUT TYPE=HIDDEN NAME=seqno VALUE=\"");
      out.print(seqno);
      out.write("\">\n");
      out.write("<TR HEIGHT=22>\n");
      out.write("<TD BGCOLOR=#EEEEE0>&nbsp;<font color=blue> Updated : ");
      out.print(sdate);
      out.write(" &nbsp; / &nbsp; </font>\n");
      out.print(read_button);
      out.write("</font>\n");
      out.write("<TD></TR>\n");
      out.write("<TR HEIGHT=22><TD BGCOLOR=#000080>&nbsp;<FONT color=white > 제 목 : <B>");
      out.print(title);
      out.write("</B></FONT>\n");
      out.write("</TD>\n");
      out.write("</TR><TR HEIGHT=250 VALIGN=TOP>\n");
      out.write("<TD>\n");
      out.print(contents);
      out.write("\n");
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("<TR HEIGHT=22>\n");
      out.print(file_name2);
      out.write("\n");
      out.write("</TR>\n");
      out.write("<TR><TD BGCOLOR=\"#B0B0B0\">&nbsp;<FONT SIZE=2><B> 지난 공지사항 HISTORY</B></FONT></TD></TR>\n");
      out.write("<TR><TD ALIGN=CENTER>\n");
      out.write("  <TABLE WIDTH=100% CELLPADDING=0 CELLSPACING=0>\n");
      out.write("  ");
      out.print(memolist);
      out.write("\n");
      out.write("  </TABLE>\n");
      out.write("</TD></TR>\n");
      out.write("<TR>\n");
      out.write("<TD colspan=2 align=right ><font size=2>");
      out.print(prev_page);
      out.write("&nbsp;");
      out.print(next_page);
      out.write("</font></TD>\n");
      out.write("</TR>\n");
      out.write("</FORM>\n");
      out.write("</TABLE>\n");
      out.write("\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("\n");
      out.write("</td></tr></table>\n");
      out.write("</BODY>\n");
      out.write("</HTML>\n");
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
