<%-- 
    Document   : CustomerLogin
    Created on : Jul 31, 2022, 12:27:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CustomerLogin</title>
    </head>
    <body>
        <form action="UserLogin">
            Email:<input type="text" name="email">
            Password:<input type="password" name="password">
            <input type="submit" name="Login">
            <a href="CustomerSignUp.jsp"><input type="Button" name="SignUp"></a>
            
        </form>
    </body>
</html>
