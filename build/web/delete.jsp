<%-- 
    Document   : delete
    Created on : 28 Sep, 2017, 5:39:57 PM
    Author     : Brian
--%>

<%@page import="java.sql.*"%>
<%
    String id = request.getParameter("hiddenID");
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        
        String connURL = "jdbc:mysql://localhost/onlineshop?user=root&password=12345";
        
        conn = DriverManager.getConnection(connURL);
        
        String sqlStr = "Delete from Inventory WHERE ID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sqlStr);
        pstmt.setInt(1, Integer.parseInt(id));
        int rec=pstmt.executeUpdate();
        conn.close();
        
        if(rec > 0){
            out.println("<h2>" + rec + " Record deleted!</h2>");
        }
        else{
            out.println("<h2>No Record deleted!</h2>");
        }
    }catch(Exception e) {
        out.println(e.getMessage());
    }
%>
