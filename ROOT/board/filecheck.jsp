<%@ page import="java.util.*,java.io.*" contentType="text/html;charset=euc-kr" %>
<br>
<br>
<center><font size=2><b>���� �ߺ� üŷ ���Դϴ�....</b></font></center><br>
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
            System.out.println("properties ������ ã�� �� �����ϴ�. " +
                "config.properties ������ Ŭ�����н��� Ȯ���Ͻñ� �ٶ��ϴ�.");
            return;
        }
        String uploadPath = confProps.getProperty("uploadPath","C:\\Program Files\\Apache Tomcat 4.0\\webapps\\kimhoboard2.0\\upload");
        String filepath=uploadPath;
    	File f=new File(filepath,filename);
        if(f.exists()) {
            out.println("<script laguage=javascript> alert('�ߺ��Ǵ� ���� �̸��� �����մϴ�. �ٸ� �̸����� ������ ���ε����ּ���.'); this.close(); </script>");
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
