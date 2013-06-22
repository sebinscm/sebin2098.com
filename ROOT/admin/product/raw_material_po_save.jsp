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
    String po_num = request.getParameter("po_num");
    String date_ordered = request.getParameter("date_ordered");
    String writer = request.getParameter("writer");
    String factory = request.getParameter("factory");
    String out_shell_length = request.getParameter("out_shell_length");
    String combination_length = request.getParameter("combination_length");
    String lining_length = request.getParameter("lining_length");
    String inter_lining_length = request.getParameter("inter_lining_length");
    String button_length = request.getParameter("button_length");
    String hanger_tape_length = request.getParameter("hanger_tape_length");
    String sewing_yarn_length = request.getParameter("sewing_yarn_length");
    String out_shell_store = request.getParameter("out_shell_store");
    String out_shell_name = request.getParameter("out_shell_name");
    String out_shell_add = request.getParameter("out_shell_add");
    String out_shell_comp = request.getParameter("out_shell_comp");
    String out_shell_cost = request.getParameter("out_shell_cost");
    String out_shell_tel = request.getParameter("out_shell_tel");
    String combination_1_store = request.getParameter("combination_1_store");
    String combination_1_name = request.getParameter("combination_1_name");
    String combination_1_add = request.getParameter("combination_1_add");
    String combination_1_comp = request.getParameter("combination_1_comp");
    String combination_1_cost = request.getParameter("combination_1_cost");
    String combination_1_tel = request.getParameter("combination_1_tel");
    String combination_2_store = request.getParameter("combination_2_store");
    String combination_2_name = request.getParameter("combination_2_name");
    String combination_2_add = request.getParameter("combination_2_add");
    String combination_2_comp = request.getParameter("combination_2_comp");
    String combination_2_cost = request.getParameter("combination_2_cost");
    String combination_2_tel = request.getParameter("combination_2_tel");
    String lining_store = request.getParameter("lining_store");
    String lining_name = request.getParameter("lining_name");
    String lining_add = request.getParameter("lining_add");
    String lining_comp = request.getParameter("lining_comp");
    String lining_cost = request.getParameter("lining_cost");
    String lining_tel = request.getParameter("lining_tel");
    String button_store = request.getParameter("button_store");
    String button_name = request.getParameter("button_name");
    String button_add = request.getParameter("button_add");
    String button_comp = request.getParameter("button_comp");
    String button_cost = request.getParameter("button_cost");
    String button_tel = request.getParameter("button_tel");
    
    String colour[] = request.getParameterValues("colour[]");
    String qty[] = request.getParameterValues("qty[]");
    String out_shell_qty[] = request.getParameterValues("out_shell_qty[]");
    String combination_qty[] = request.getParameterValues("combination_qty[]");
    String lining_qty[] = request.getParameterValues("lining_qty[]");
    String inter_lining_qty[] = request.getParameterValues("inter_lining_qty[]");
    String button_qty[] = request.getParameterValues("button_qty[]");
    String hanger_tape_qty[] = request.getParameterValues("hanger_tape_qty[]");
    String sewing_yarn_qty[] = request.getParameterValues("sewing_yarn_qty[]");
    String out_shell_stocked[] = request.getParameterValues("out_shell_stocked[]");
    String combination_stocked[] = request.getParameterValues("combination_stocked[]");
    String lining_stocked[] = request.getParameterValues("lining_stocked[]");
    String inter_lining_stocked[] = request.getParameterValues("inter_lining_stocked[]");
    String button_stocked[] = request.getParameterValues("button_stocked[]");
    String hanger_tape_stocked[] = request.getParameterValues("hanger_tape_stocked[]");
    String sewing_yarn_stocked[] = request.getParameterValues("sewing_yarn_stocked[]");
    String tmp_test = "";
    MatrixDataSet matrix = null;
    DataProcess dataProcess = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "";
    String error_message = "";
    try{
        Context ic = new InitialContext(); 
        DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
        conn = ds.getConnection();
        int idx = 1;
        conn.setAutoCommit(false);
        
        sql = " INSERT INTO raw_material_purchase_order"
          + " ( "
          + "   po_num, date_ordered, writer, factory, out_shell_length, combination_length, lining_length, inter_lining_length, "
                + " button_length, hanger_tape_length, sewing_yarn_length, "
                + " out_shell_store, out_shell_name, out_shell_add, out_shell_comp, out_shell_cost, out_shell_tel, "
                + " combination_1_store, combination_1_name, combination_1_add, combination_1_comp, combination_1_cost, combination_1_tel, "
                + " combination_2_store, combination_2_name, combination_2_add, combination_2_comp, combination_2_cost, combination_2_tel, "
                + " lining_store, lining_name, lining_add, lining_comp, lining_cost, lining_tel, "
                + " button_store, button_name, button_add, button_comp, button_cost, button_tel"
          + " ) "
          + " Values "
          + " ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(idx++, po_num);
        pstmt.setString(idx++, date_ordered);
        pstmt.setString(idx++, writer);
        pstmt.setString(idx++, factory);
        pstmt.setString(idx++, out_shell_length);
        pstmt.setString(idx++, combination_length);
        pstmt.setString(idx++, lining_length);
        pstmt.setString(idx++, inter_lining_length);
        pstmt.setString(idx++, button_length);
        pstmt.setString(idx++, hanger_tape_length);
        pstmt.setString(idx++, sewing_yarn_length);
        pstmt.setString(idx++, out_shell_store);
        pstmt.setString(idx++, out_shell_name);
        pstmt.setString(idx++, out_shell_add);
        pstmt.setString(idx++, out_shell_comp);
        pstmt.setString(idx++, out_shell_cost);
        pstmt.setString(idx++, out_shell_tel);
        pstmt.setString(idx++, combination_1_store);
        pstmt.setString(idx++, combination_1_name);
        pstmt.setString(idx++, combination_1_add);
        pstmt.setString(idx++, combination_1_comp);
        pstmt.setString(idx++, combination_1_cost);
        pstmt.setString(idx++, combination_1_tel);
        pstmt.setString(idx++, combination_2_store);
        pstmt.setString(idx++, combination_2_name);
        pstmt.setString(idx++, combination_2_add);
        pstmt.setString(idx++, combination_2_comp);
        pstmt.setString(idx++, combination_2_cost);
        pstmt.setString(idx++, combination_2_tel);
        pstmt.setString(idx++, lining_store);
        pstmt.setString(idx++, lining_name);
        pstmt.setString(idx++, lining_add);
        pstmt.setString(idx++, lining_comp);
        pstmt.setString(idx++, lining_cost);
        pstmt.setString(idx++, lining_tel);
        pstmt.setString(idx++, button_store);
        pstmt.setString(idx++, button_name);
        pstmt.setString(idx++, button_add);
        pstmt.setString(idx++, button_comp);
        pstmt.setString(idx++, button_cost);
        pstmt.setString(idx++, button_tel);
        pstmt.executeUpdate();
        
        for(int i=0; i<colour.length; i++){
            idx = 1;
            sql = " INSERT INTO raw_material_fabric"
              + " ( "
              + " po_num, colour, qty, out_shell_qty, combination_qty, lining_qty, inter_lining_qty, button_qty, hanger_tape_qty, sewing_yarn_qty,"
              + " out_shell_stocked, combination_stocked, lining_stocked, inter_lining_stocked, button_stocked,"
              + " hanger_tape_stocked, sewing_yarn_stocked"
              + " ) "
              + " Values "
              + " (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(idx++, po_num);
            pstmt.setString(idx++, colour[i]);
            pstmt.setString(idx++, qty[i]);
            pstmt.setString(idx++, out_shell_qty[i]);
            pstmt.setString(idx++, combination_qty[i]);
            pstmt.setString(idx++, lining_qty[i]);
            pstmt.setString(idx++, inter_lining_qty[i]);
            pstmt.setString(idx++, button_qty[i]);
            pstmt.setString(idx++, hanger_tape_qty[i]);
            pstmt.setString(idx++, sewing_yarn_qty[i]);
            pstmt.setString(idx++, out_shell_stocked[i]);
            pstmt.setString(idx++, combination_stocked[i]);
            pstmt.setString(idx++, lining_stocked[i]);
            pstmt.setString(idx++, inter_lining_stocked[i]);
            pstmt.setString(idx++, button_stocked[i]);
            pstmt.setString(idx++, hanger_tape_stocked[i]);
            pstmt.setString(idx++, sewing_yarn_stocked[i]);
            pstmt.executeUpdate();
        }
        
        sql = " UPDATE purchase_order"
            + " SET "
            + " has_rm_po = 1 "
            + "where order_no = '" + po_num +"'";

        pstmt = conn.prepareStatement(sql);    
        pstmt.executeUpdate();
        conn.commit();
        response.sendRedirect("raw_material_po_create.jsp?po_num="+po_num+"&rm_poUpdate=true");
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
<%= error_message %><br/>
<%= tmp_test %>