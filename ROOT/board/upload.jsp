<%@ page import="java.util.*,java.io.*, board.MultipartRequest" contentType="text/html;charset=euc-kr" %>
<%
    try {
		String str="";
		if((str=upload(request)).equals("1")) {
			out.println("<script language=javascript> alert('���ε� ������ ���� �뷮�� �ʰ��߽��ϴ�\\n���ε� ������ �뷮�� 2M�Դϴ�.'); history.go(-1); </script>");
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
