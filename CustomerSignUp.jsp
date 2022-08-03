<%-- 
    Document   : CustomerSignUp
    Created on : Jul 31, 2022, 12:28:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Register">
            Name:<input type="text" name="name">
            Email:<input type="text" name="email">
            Password:<input type="password" name="password">
            Male:<input type="radio" name ="gender" value="male" checked>Female:<input type="radio" name="gender" value="feamle">
            Location:<input type="text" name="location">
            <input type="submit" name="SignUp">
            <a href="CustomerLogin.jsp"><input type="Button" name="Login"></a>
            
        </form>
    </body>
</html>
