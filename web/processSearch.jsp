<%-- 
    Document   : processSearch
    Created on : 27 Sep, 2017, 6:18:37 PM
    Author     : Brian
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            String search = request.getParameter("searchString");
        %>
        <form action="processSearch.jsp" method="get">
            Search Phone:<input type="text" name="searchString" size="50"
                                value="<%=search%>" />
                         <input type="sumbmit" value="Search" />
        </form>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                String connURL = "jdbc:mysql://localhost/onlineshop?user=root&password=12345";
                
                Connection conn = DriverManager.getConnection(connURL);
                String sqlStr = "Select * from Inventory where functions "
                        + "like ? order by brand, model";
                
                PreparedStatement pstmt = conn.prepareStatement (sqlStr);
                
                pstmt.setString(1, "%" + search + "%");
                ResultSet rs = pstmt.executeQuery();
        %>
        <table border='2'>
            <tr bgcolor='yellow'>
                <td width='100'>Model</td>
                <td width='100'>Brand</td>
                <td width='300'>Functions</td>
                <td width='70'>Quantity</td>
                
                <td width='200' colspan='2'>Actions</td>
            </tr>      
            <%
                String id, brand, model, function, image;
                int qty;
                
                while (rs.next()) {
                    id = rs.getString("ID");
                    brand = rs.getString("Brand");
                    model = rs.getString("Model");
                    function = rs.getString("Functions");
                    qty = rs.getInt("Quantity");
            %>
            <tr>
                <td width='100'><%=brand%></td>
                <td width='100'><%=model%></td>
                <td width='300'><%=function%></td>
                <td width='70'><%=qty%></td>
                <td width='50'>
                    <form action="delete.jsp" method="get">
                        <input type="hidden" name="hiddenID" value="<%=id%>" />
                        <input type="submit" name="deleteBtn" value="Delete" />
                    </form>
                </td>
                <td>
                    <form action="update.jsp" method="get">
                        <input type="hidden" name="hiddenID" value="<%=id%>" />
                        <input type="submit" name="updateBtn" value="Update" />
                    </form>
                </td>
            </tr>
            <%
                }//end while
                conn.close();
            %>
        </table>
        <%
              } catch (Exception e){
                    out.println(e.getMessage());
              }  
        %>
    </body>
</html>
