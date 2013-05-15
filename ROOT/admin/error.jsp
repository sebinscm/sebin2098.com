<%@ page contentType="text/html; charset=MS949" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>

<HTML>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<link rel="stylesheet" type = "text/css" href="style.css">
<HEAD>
<SCRIPT language=JavaScript>
<!--
function submitForm(sub) {
  document.forms[sub].submit();
}
 
function proceedSubmission() {
  return confirm("Press submit button then your message send to administrator.");
}
// -->
</SCRIPT>

</HEAD>

<body leftmargin=15 topmargin=10>
<FORM id=firstForm onsubmit="return proceedSubmission()" action=mailto:jeffreysong@valleygirl.com.au method=post encType=text/plain>
<tr><td><font color=red>  You have some problem that following as System Error Message.</font> <td> </tr>
<tr><td><font color=red>  Would you please,this page save as file("file_name.html or file_name.htm") and send to e-maii to system administrator.</font> <td></tr>
<A onclick="submitForm('firstForm')" href="thanks.htm"> Click here, e-mail Send to system administrator </A>
</FORM>

<table width="700" cellpadding="7" cellspacing="0" 
       border="1" bordercolordark="WHITE" bordercolorlight="BLACK">
<tr align="center"><td>
Host : <%= java.net.InetAddress.getLocalHost().getHostName() %> 
(<%= java.net.InetAddress.getLocalHost().getHostAddress() %>)&nbsp;&nbsp; 
<jsp:useBean id="now" class="java.util.Date"/>
Current ttime : <fmt:formatDate value="${now}" pattern="yyyy/MM/dd a hh:mm:ss"/> 
</td></tr>

<tr><td>

  <table width=100% border=1 cellpadding=6 cellspacing=0>
    <tr align="center" bgcolor="#FFCC66"><td> <b> System Error Message</b></td></tr> 
    <tr align="center">
      <td>
      <c:if test="${not empty requestScope['javax.servlet.error.status_code']}">
      Status Code : <c:out value="${requestScope['javax.servlet.error.status_code']}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
      </c:if>
      Access Path :  
      <c:choose>
        <c:when test="${not empty requestScope['javax.servlet.error.request_uri']}"> 
          <c:out value="${requestScope['javax.servlet.error.request_uri']}"/> 
        </c:when> 
        <c:otherwise> 
          <c:out value="${pageContext.request.requestURI}"/> 
        </c:otherwise> 
      </c:choose> 
      </td>
    </tr>
    <tr align="center">
      <td><b>
      Exception type : <c:out value="${requestScope['javax.servlet.error.exception_type']}"/><br>
      </b></td>
    </tr>
    <tr align="center">
      <td><c:out value="${requestScope['javax.servlet.error.message']}"/></td>
    </tr>
  </table>
  <p>

  <c:if test="${not empty requestScope['javax.servlet.error.exception']}">
    <c:set var="ex" value="${requestScope['javax.servlet.error.exception']}"/>
    <jsp:useBean id="ex" class="java.lang.Throwable" />
    <table width=100% border=1 cellpadding=6 cellspacing=0>
      <tr align="center" bgcolor="lightgrey"><td> Error stack tracking information 
      </td></tr>
      <tr align="left"><td>
      <pre><% ex.printStackTrace(new java.io.PrintWriter(out)); %></pre>
      </td></tr>
    </table>
    <p>
  </c:if>

<%@ include file="request_data.jspf" %>

</td></tr>
</table>
<table>
    <tr align="center" bgcolor="#FFCC66"><td bgcolor="#000080"> <font color="#E1E1E1"><span style="background-color: #000080"> Please contact with Valleygirl SCM Support 
        </span>.</font></td></tr>
    <tr><td> Head Office: 02-8458-6200 </td></tr>
</table>
</body>
</html>
