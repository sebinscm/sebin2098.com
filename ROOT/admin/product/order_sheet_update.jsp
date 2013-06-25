<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String hanger_tape_simple = request.getParameter("hanger_tape_simple");
    String packing = request.getParameter("packing");
    String comment = request.getParameter("comment");
    String main_label = request.getParameter("main_label");
    String size_label = request.getParameter("size_label");
    String care_label = request.getParameter("care_label");
    String hanger_tape = request.getParameter("hanger_tape");
    String price_tag = request.getParameter("price_tag");
    String po_num = request.getParameter("po_num");
    String size_name_value[] = request.getParameterValues("size_name_value[]");
    String size_name[] = request.getParameterValues("size_name[]");
    String first[] = request.getParameterValues("first[]");
    String second[] = request.getParameterValues("second[]");
    String third[] = request.getParameterValues("third[]");
    String fourth[] = request.getParameterValues("fourth[]");
    String fifth[] = request.getParameterValues("fifth[]");
    String sixth[] = request.getParameterValues("sixth[]");
    String error_message = "";
    String tmp_size_name_value = "";
    String tmp_size_name = "";
    String tmp_first = "";
    String tmp_second = "";
    String tmp_third = "";
    String tmp_fourth = "";
    String tmp_fifth = "";
    String tmp_sixth = "";
    String outPut = "";
    MatrixDataSet matrix = null;
    DataProcess dataProcess = null;
    
    String sql = "";
    Connection conn = null;
    PreparedStatement pstmt = null;
   try{
    Context ic = new InitialContext(); 
    DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
    conn = ds.getConnection();
    int idx = 1;
    conn.setAutoCommit(false);
    
    ///   START INSERT order sheet   ////////
    sql = " UPDATE order_sheet"
        + " SET "
        + " comment = ?, main_label = ?, size_label = ?, care_label = ?, "
        + "hanger_tape = ?, price_tag = ?, hanger_tape_simple = ?, packing = ? "
        + "where po_num = '" + po_num +"'";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, comment);
    pstmt.setString(idx++, main_label);
    pstmt.setString(idx++, size_label);
    pstmt.setString(idx++, care_label);
    pstmt.setString(idx++, hanger_tape);
    pstmt.setString(idx++, price_tag);
    pstmt.setString(idx++, hanger_tape_simple);
    pstmt.setString(idx++, packing);
    pstmt.executeUpdate();
    ///   END INSERT order sheet   ////////
    sql = "delete from order_sheet_size where po_num='" + po_num + "'";
    pstmt = conn.prepareStatement(sql);
    pstmt.executeUpdate();
    sql = "INSERT INTO order_sheet_size"
          + " ( "
          + "   po_num, size_name, first, second, third, fourth, fifth, sixth"          
          + " ) "
          + " Values "
          + " ( ?, ?, ?, ?, ?, ?, ?, ?); ";
    for(int i = 0; i < size_name.length; i++){
        pstmt = conn.prepareStatement(sql);
        idx = 1;
        pstmt.setString(idx++, po_num);         // po_num
        pstmt.setString(idx++, size_name[i]);   // size_name
        if(first != null){
            pstmt.setString(idx++, first[i]);   // first
        }
        else{
            pstmt.setString(idx++, "0");
        }
        if(second != null){
            pstmt.setString(idx++, second[i]);   // second    
        }
        else{
            pstmt.setString(idx++, "0");   
        }
        if(third != null){
            pstmt.setString(idx++, third[i]);   // third
        }
        else{
            pstmt.setString(idx++, "0");
        }
        if(fourth != null){    
            pstmt.setString(idx++, fourth[i]);      // fourth
        }
        else{
            pstmt.setString(idx++, "0");
        }
        if(fifth != null){
            pstmt.setString(idx++, fifth[i]);   // fifth
        }
        else{
            pstmt.setString(idx++, "0");
        }
        if(sixth != null){
            pstmt.setString(idx++, sixth[i]);   // sixth
        }
        else{
            pstmt.setString(idx++, "0");
        }
        pstmt.executeUpdate();
    }
    conn.commit();
    response.sendRedirect("order_sheet_create.jsp?po_num="+po_num+"&sheetUpdate=true");
   }catch (SQLException se) {
    try { conn.rollback(); } catch (Exception ex) {}
        error_message += "Exception save a : " + se.getMessage();
  } catch (Exception e) {
    try { conn.rollback(); } catch (Exception ex) {}
        error_message +="Exception save b : " + e.getMessage();
    throw e;
  } finally {
    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }
  }
%>
<html>
    <head>
        <title>Order Sheet</title>
    </head>
    <body>        
        <h1>error = <%= error_message %></h1>        
    </body>
</html>