<%@ page import="java.util.*,java.io.*" contentType="text/html;charset=euc-kr" %>
<br>
<br>
<center><font size=2><b>파일 중복 체킹 중입니다....</b></font></center><br>
<%
    try {

    if(request.getParameter("myfile2")!=null) {
        String filename=new String(request.getParameter("myfile2").getBytes("8859_1"),"euc-kr");
        StringTokenizer stn=new StringTokenizer(filename,"\\");
        while(stn.hasMoreTokens()) {
            filename=stn.nextToken();
        }
        InputStream is = getClass().getResourceAsStream("/config/config.properties");
		Properties confProps = new Properties();
        try {
            confProps.load(is);
        }
        catch (Exception e) {
            System.out.println("properties 파일을 찾을 수 없습니다. " +
                "config.properties 파일의 클래스패스를 확인하시기 바랍니다.");
            return;
        }
        String uploadPath = confProps.getProperty("uploadPath","C:\\Program Files\\Apache Tomcat 4.0\\webapps\\kimhoboard2.0\\upload");
        String filepath=uploadPath;
    	File f=new File(filepath,filename);
        if(f.exists()) {
            out.println("<script laguage=javascript> alert('중복되는 파일 이름이 존재합니다. 다른 이름으로 파일을 업로드해주세요.'); this.close(); </script>");
        } else {
            out.println("OK!<script lagunage=javascript> "
                        + "opener.write_form.encoding='multipart/form-data'; "
                        + "opener.write_form.action='upload.jsp'; " 
                        + "this.close(); opener.write_form.submit(); </script>");  
        }
    } else {
        out.println(" <form name='thisform' method=get action='filecheck.jsp'> " 
                    + "    <input type='hidden' name='myfile2'> " 
                    + "    </form>                              " 
                    + "  <script language='JavaScript'>         " 
                    + " document.thisform.myfile2.value = opener.document.write_form.file1.value; " 
                    + " document.thisform.submit(); "
                    + "  </script> ");
    }

    } catch(Exception e) {
        out.println(e);
    }
%>
