<%-- 
    Document   : gymlogout
    Created on : Aug 2, 2022, 8:35:43 PM
    Author     : Trev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("name");
            session.invalidate();
            response.sendRedirect("gymlogin.jsp");
        %>
        
    </body>
</html>
