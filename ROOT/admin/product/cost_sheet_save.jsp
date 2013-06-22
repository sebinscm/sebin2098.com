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
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
    Connection conn = null;
    MatrixDataSet matrix = null;
    DataProcess dataProcess = null;    
    PreparedStatement pstmt = null;
    int iRet = 0;
    String sql = "";
    String error_message = "";
    String po_num = request.getParameter("po_num");
    String r_m_order_total = request.getParameter("r_m_order_total");
    String purchase_total = request.getParameter("purchase_total");
    String forwarding_company_1 = request.getParameter("forwarding_company_1");
    String forwarding_vehicle_no_1 = request.getParameter("forwarding_vehicle_no_1");
    String forwarding_cost_1 = request.getParameter("forwarding_cost_1");
    String forwarding_company_2 = request.getParameter("forwarding_company_2");
    String forwarding_vehicle_no_2 = request.getParameter("forwarding_vehicle_no_2");
    String forwarding_cost_2 = request.getParameter("forwarding_cost_2");
    String rely_on_factory = request.getParameter("rely_on_factory");
    String r_m_total = request.getParameter("r_m_total");
    String factory_fee = request.getParameter("factory_fee");
    String domestic = request.getParameter("domestic");
    String international = request.getParameter("international");
    String etc = request.getParameter("etc");
    String benefit = request.getParameter("benefit");
    
    String purchase_date[] = request.getParameterValues("purchase_date[]");
    String purchase_qty[] = request.getParameterValues("purchase_qty[]");
    String purchase_cost[] = request.getParameterValues("purchase_cost[]");
    String purchase_etc[] = request.getParameterValues("purchase_etc[]");
    String in_stock_date_received[] = request.getParameterValues("in_stock_date_received[]");
    String in_stock_qty[] = request.getParameterValues("in_stock_qty[]");
    String in_stock_date_received_f[] = request.getParameterValues("in_stock_date_received_f[]");
    String in_stock_date_checked_f[] = request.getParameterValues("in_stock_date_checked_f[]");
    String in_stock_qty_f[] = request.getParameterValues("in_stock_qty_f[]");
    String in_stock_diff[] = request.getParameterValues("in_stock_diff[]");
    try{
        Context ic = new InitialContext(); 
        DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
        conn = ds.getConnection();
        int idx = 1;
        conn.setAutoCommit(false);
        
        sql = " INSERT INTO cost_sheet"
          + " ( "
          + "  po_num, r_m_order_total, purchase_total, forwarding_company_1, forwarding_vehicle_no_1, forwarding_cost_1, "
          + "forwarding_company_2, forwarding_vehicle_no_2, forwarding_cost_2, rely_on_factory, r_m_total, factory_fee, "
          + "domestic, international, etc, benefit  "
          + " ) "
          + " Values "
          + " ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(idx++, po_num);        
        pstmt.setString(idx++, r_m_order_total);
        pstmt.setString(idx++, purchase_total);
        pstmt.setString(idx++, forwarding_company_1);
        pstmt.setString(idx++, forwarding_vehicle_no_1);
        pstmt.setString(idx++, forwarding_cost_1);
        pstmt.setString(idx++, forwarding_company_2);
        pstmt.setString(idx++, forwarding_vehicle_no_2);
        pstmt.setString(idx++, forwarding_cost_2);
        pstmt.setString(idx++, rely_on_factory);
        pstmt.setString(idx++, r_m_total);
        pstmt.setString(idx++, factory_fee);
        pstmt.setString(idx++, domestic);
        pstmt.setString(idx++, international);
        pstmt.setString(idx++, etc);
        pstmt.setString(idx++, benefit);
        pstmt.executeUpdate();
        
        for(int i = 0; i<purchase_date.length; i++){
            idx = 1;
            sql = " INSERT INTO cost_sheet_purchase_in_stock"
                + " ( "
                + "po_num, purchase_date,  purchase_qty, purchase_cost, purchase_etc, in_stock_date_received"
                    + ", in_stock_qty, in_stock_date_received_f, in_stock_date_checked_f, in_stock_qty_f, in_stock_diff"
                + " ) "
                + " Values "
                + " (?,?,?,?,?,?,?,?,?,?,?);";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(idx++, po_num);
            pstmt.setString(idx++, purchase_date[i]);
            pstmt.setString(idx++, purchase_qty[i]);
            pstmt.setString(idx++, purchase_cost[i]);
            pstmt.setString(idx++, purchase_etc[i]);
            pstmt.setString(idx++, in_stock_date_received[i]);
            pstmt.setString(idx++, in_stock_qty[i]);
            pstmt.setString(idx++, in_stock_date_received_f[i]);
            pstmt.setString(idx++, in_stock_date_checked_f[i]);
            pstmt.setString(idx++, in_stock_qty_f[i]);
            pstmt.setString(idx++, in_stock_diff[i]);
            pstmt.executeUpdate();
        }
        conn.commit();        
        response.sendRedirect("cost_sheet.jsp?po_no_selected="+po_num+"&isUpdate=true");
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
1 = <%= error_message %><br/>