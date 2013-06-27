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
    
    String cons[] = request.getParameterValues("cons[]");
    String length[] = request.getParameterValues("length[]");
    String order_qty[] = request.getParameterValues("order_qty[]");
    String stocked[] = request.getParameterValues("stocked[]");
    String colour[] = request.getParameterValues("colour[]");
    
    String store_name[] = request.getParameterValues("store_name[]");
    String composition[] = request.getParameterValues("composition[]");
    String cons_name[] = request.getParameterValues("cons_name[]");
    String cons_cost[] = request.getParameterValues("cons_cost[]");
    String cons_add[] = request.getParameterValues("cons_add[]");
    String cons_tel[] = request.getParameterValues("cons_tel[]");
    String consumption[] = request.getParameterValues("consumption[]");
    
    MatrixDataSet matrix = null;
    DataProcess dataProcess = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "";
    String error_message = "";
    
    int j = 0;
    int k = 0;
    try{
        Context ic = new InitialContext(); 
        DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
        conn = ds.getConnection();
        conn.setAutoCommit(false);
        
        sql = "delete from raw_material_purchase_order where po_num='" + po_num + "'";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        for(int i =0; i<order_qty.length; i++){
            int idx = 1;
            sql = " INSERT INTO raw_material_purchase_order"
                + " ( "
                + " po_num, colour, cons, length, order_qty, stocked"
                + " ) "
                + " Values "
                + " ( ? , ? , ? , ? , ? , ? );";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(idx++, po_num);
            pstmt.setString(idx++, colour[j++]);
            pstmt.setString(idx++, cons[k]);
            pstmt.setString(idx++, length[k]);
            pstmt.setString(idx++, order_qty[i]);
            pstmt.setString(idx++, stocked[i]);
            pstmt.executeUpdate();
            
            if(j >= colour.length  ){                
                j = 0;
                k++;
            }
        }
        sql = "delete from raw_material_purchase_order_store_info where po_num='" + po_num + "'";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        for(int i=0; i<cons.length; i++){
            sql = " INSERT INTO raw_material_purchase_order_store_info"
                + " ( "
                + " po_num, store_name, composition, cons_name, cons_cost, cons_add, cons_tel, consumption"
                + " ) "
                + " Values "
                + " ( ? , ? , ? , ? , ? , ? , ? , ? );";
            int idx = 1;
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(idx++, po_num);
            pstmt.setString(idx++, store_name[i]);
            pstmt.setString(idx++, composition[i]);
            pstmt.setString(idx++, cons_name[i]);
            pstmt.setString(idx++, cons_cost[i]);
            pstmt.setString(idx++, cons_add[i]);
            pstmt.setString(idx++, cons_tel[i]);
            pstmt.setString(idx++, cons[i]);
            pstmt.executeUpdate();
        }
        sql = "delete from r_m_p_order_basic where po_num='" + po_num + "'";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
         sql = " INSERT INTO r_m_p_order_basic"
                + " ( "
                + " po_num, date_ordered, writer, factory"
                + " ) "
                + " Values "
                + " ( ? , ? , ? , ? );";
        int idx = 1;
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(idx++, po_num);
        pstmt.setString(idx++, date_ordered);
        pstmt.setString(idx++, writer);
        pstmt.setString(idx++, factory);
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