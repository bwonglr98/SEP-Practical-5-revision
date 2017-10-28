<%-- 
    Document   : search
    Created on : 28 Sep, 2017, 10:19:03 PM
    Author     : Brian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="processSearch.jsp" method="get">
            Search Phone: <input type="text" name="searchString" size="50" />
            <input type="submit" value="Search" />
        </form>
    </body>
</html>
