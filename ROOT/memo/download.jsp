<%@page 
	language="java"
	contentType="text/html;charset=EUC-KR"
	import="java.io.*,
		java.net.*,
		javax.servlet.ServletOutputStream,
		javax.servlet.http.HttpServletResponse"
%>
<%@page import="memo.FormDataDownload" %>
<%!
	//replace
	//srcStr: original
	//oldStr: target
	//newStr: replace
	public static String castString(String srcStr, String oldStr, String newStr)
	{
		String temp;
		String destString = "";
		int pos = 0;

		while((pos = srcStr.indexOf(oldStr)) != -1)
		{
			temp = srcStr.substring(0, pos);
			srcStr = srcStr.substring(pos + oldStr.length(), srcStr.length());
			destString = destString + temp + newStr;
		}
		destString = destString + srcStr;
		return destString;
	} 
%>
<%
	String filename = request.getParameter("filename");
	String downname = request.getParameter("downname");
	FormDataDownload formData = new FormDataDownload(response, new File(filename), null, null);
	try
	{
		formData.download();
	}catch(FileNotFoundException e)
	{
		%>
			<center>
			<font color=ff0000>no found in path.</font>
			<br><%= e %>
			<br>confirm file path
			</center>
		<%
		return;
	}catch(IOException e)
	{
		%>
			<font color=ff0000>IOException Error!!</font>
			<br><%= e %>
			<br>cancel
		<%
		return;
	}catch(Exception e)
	{
		System.out.println("jeoijsodjodjfoj" + e);
	}
	System.out.println("abcde\n\n\n\n");
%>
