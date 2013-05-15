<%@ page import="java.util.*,java.io.*, board.MultipartRequest" contentType="text/html;charset=euc-kr" %>
<%
    try {
		String str="";
		if((str=upload(request)).equals("1")) {
			out.println("<script language=javascript> alert('업로드 가능한 파일 용량을 초과했습니다\\n업로드 가능한 용량은 2M입니다.'); history.go(-1); </script>");
		} else {
			out.println(str);
		}
    } catch (Exception e) {
		out.println(e);
	}
%>
<%!
	public String upload(HttpServletRequest req) throws Exception {
		if(req.getContentLength() >  2097152) {  //2M
			return "1";
		} else {
			MultipartRequest parser = new MultipartRequest(req.getContentType(), req.getContentLength(),req.getInputStream(), "/home/intranet/public_html/board/uploadfile");
			return parser.getHtmlTable();
		}  
	}
%>
