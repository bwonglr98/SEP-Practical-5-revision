package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class processSearch_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <body>\n");
      out.write("        ");

            String search = request.getParameter("searchString");
        
      out.write("\n");
      out.write("        <form action=\"processSearch.jsp\" method=\"get\">\n");
      out.write("            Search Phone:<input type=\"text\" name=\"searchString\" size=\"50\"\n");
      out.write("                                value=\"");
      out.print(search);
      out.write("\" />\n");
      out.write("                         <input type=\"sumbmit\" value=\"Search\" />\n");
      out.write("        </form>\n");
      out.write("        ");

            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                String connURL = "jdbc:mysql://localhost/onlineshop?user=root&password=root";
                
                Connection conn = DriverManager.getConnection(connURL);
                String sqlStr = "Select * fron Inventory where functions "
                        + "like ? order by brand, model";
                
                PreparedStatement pstmt = conn.prepareStatement (sqlStr);
                
                pstmt.setString(1, "%" + search + "%");
                ResultSet rs = pstmt.executeQuery();
        
      out.write("\n");
      out.write("        <table border='2'>\n");
      out.write("            <tr bgcolor='yellow'>\n");
      out.write("                <td width='100'>Model</td>\n");
      out.write("                <td width='100'>Brand</td>\n");
      out.write("                <td width='300'>Functions</td>\n");
      out.write("                <td width='70'>Quantity</td>\n");
      out.write("                \n");
      out.write("                <td width='200' colspan='2'>Actions</td>\n");
      out.write("            </tr>      \n");
      out.write("            ");

                String id, brand, model, function, image;
                int qty;
                
                while (rs.next()) {
                    id = rs.getString("ID");
                    brand = rs.getString("Brand");
                    model = rs.getString("Model");
                    function = rs.getString("Functions");
                    qty = rs.getInt("Quantity");
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td width='100'>");
      out.print(brand);
      out.write("</td>\n");
      out.write("                <td width='100'>");
      out.print(model);
      out.write("</td>\n");
      out.write("                <td width='300'>");
      out.print(function);
      out.write("</td>\n");
      out.write("                <td width='70'>");
      out.print(qty);
      out.write("</td>\n");
      out.write("                <td width='50'>\n");
      out.write("                    <form action=\"delete.jsp\" method=\"get\">\n");
      out.write("                        <input type=\"hidden\" name=\"hiddenID\" value=\"");
      out.print(id);
      out.write("\" />\n");
      out.write("                        <input type=\"submit\" name=\"deleteBtn\" value=\"Delete\" />\n");
      out.write("                    </form>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <form action=\"update.jsp\" method=\"get\">\n");
      out.write("                        <input type=\"hidden\" name=\"hiddenID\" value=\"");
      out.print(id);
      out.write("\" />\n");
      out.write("                        <input type=\"submit\" name=\"updateBtn\" value=\"Update\" />\n");
      out.write("                    </form>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                }//end while
                conn.close();
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("        ");

              } catch (Exception e){
                    out.println(e.getMessage());
              }  
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
