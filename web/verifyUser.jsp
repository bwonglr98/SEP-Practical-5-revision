<%-- 
    Document   : verifyUser
    Created on : 29 Sep, 2017, 3:31:45 PM
    Author     : Brian
--%>

<%@page import="java.sql.*"%>
<html>
    <body>
        <%
            String id = request.getParameter("userid");
            String pwd = request.getParameter("password");
            
            Connection conn = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                String connURL = "jdbc:mysql://localhost/onlineshop?user=root&password=12345";
                
                conn = DriverManager.getConnection(connURL);
                
                Statement stmt = conn.createStatement();
                                             
                String sqlStr = "Select * from Login where Userid=? and Password=?";
                
                PreparedStatement pstmt = conn.prepareStatement(sqlStr);
                pstmt.setString(1, id);
                pstmt.setString(2, pwd);
                ResultSet rs = pstmt.executeQuery();
       /*
                while(rs.next()) {
                    id=rs.getString("userid");
                    pwd=rs.getString("password");
                    System.out.println("ID: " + id + ", Password: " + pwd);
                }*/
                if(rs.next()) {
                    session.setAttribute("LOGIN-STATUS", "YES");
                    
                    response.sendRedirect("search.jsp");
                } else {
                    response.sendRedirect("login.html");
                }
            } catch(Exception e) {
                System.out.println(e.getMessage());
            } finally {
                conn.close();
            }
        %>
    </body>
</html>
