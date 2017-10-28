<%-- 
    Document   : update
    Created on : 29 Sep, 2017, 10:09:06 AM
    Author     : Brian
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            String id = request.getParameter("hiddenID");
            Connection conn = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                String connURL = "jdbc:mysql://localhost/onlineshop?user=root&password=12345";
                
                conn = DriverManager.getConnection(connURL);
                
                String sqlStr = "Select * from Inventory WHERE ID = 2";
                
                PreparedStatement pstmt = conn.prepareStatement(sqlStr);
                pstmt.setInt(1, Integer.parseInt(id));
                
                ResultSet rs = pstmt.executeQuery();
                
                if(rs.next()){
                    String brand = rs.getString("Brand");
                    String model = rs.getString("Model");
                    String functions = rs.getString("Functions");
                    int qty = rs.getInt("Quantity");
        %>
        <form action="processUpdate.jsp" method="get">
            <table>
                <tr bgcolor='yellow'>
                    <td colspan="2">Update Record</td>
                </tr>
                <tr>
                    <td>Brand:</td>
                    <td><input type="text" name="Brand" value="<%=brand%>" size="50" /></td>
                </tr>
                <tr>
                    <td>Model</td>
                    <td><input type="text" name="Model" value="<%=model%>" size="50" /></td>
                </tr>
                <tr>
                    <td>Functions</td>
                    <td><input type="text" name="Functions" value="<%=functions%>" size="50" /></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="text" name="Quantity" value="<%=qty%>" size="50" /></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="hiddenID" value="<%=id%>" /></td>
                    <td><input type="submit" value="Update Now!" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr> 
            </table>
        </form>
        <%
            }
            conn.close();
            }catch(Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
