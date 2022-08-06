<%-- 
    Document   : gymsignup
    Created on : Jul 30, 2022, 12:42:49 AM
    Author     : Trev
--%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gym Pack Sign-up Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="register.css" rel="stylesheet">
    </head>
    <body class ="text-center">
        <input type="hidden" id ="status" value="<%=session.getAttribute("status")%>">  
        <main class ="form-signin">          
            <form method ="POST" action="Signuphandler">
                <img class="mb-4" src="" alt="" width="72" height="57">
                <h1 class="h3 mb-3 fw-normal">Sign up</h1>
                <div class = "form-floating">
                    <input type = "text" class = "form-control" id = "floatingInput"  name="name" placeholder = "eg.John Doe" required>
                    <label for="floatingInput">Name</label>
                </div>
                <div class = "form-floating">
                    <input type = "email" class = "form-control" id = "floatingEmail"  name="email" placeholder="name@example.com" required>
                    <label for="floatingEmail">Email Address</label>
                </div>
                <div class = "form-floating">
                    <input type = "password" class = "form-control" id = "floatingPassword" name="pass" placeholder = "Password" required>
                    <label for="floatingPassword">Password</label>
                </div>
                <div class = "form-floating">
                    <input type = "password" class = "form-control" id = "floatingConf" name="rpt" placeholder = "Confirm password" required>
                    <label for="floatingConf">Confirm Password</label>
                </div>
                    <button type="submit" class="w-100 btn btn-lg btn-secondary" id = "btnup" name = "signup">Sign Up</button>
                
                <div>Already registered? <a href = "gymlogin.jsp"> Log In.</a></div>
            </form>
        </main>
        <script src="package/dist/sweetalert2.all.min.js"></script>
	<link rel="stylesheet" href="package/dist/sweetalert2.min.css">
	
        <script type="text/javascript">
            var status = document.getElementById("status").value;           
            if(status === "invalidSignup"){
                Swal.fire('', 'Please fill in all the fields', 'error');
                <% session.removeAttribute("invalidSignup");%>
            }
            else if(status === "signError"){
                Swal.fire('', 'Passwords do not match', 'error');
                <% session.removeAttribute("signError"); %>
            }
            else if(status === "regError"){
                Swal.fire('', 'Error signing up', 'error');
                <% session.removeAttribute("regError"); %>
            }
            else if(status === "duplicate"){
                Swal.fire('', 'User name or email already exists', 'error');
                <% session.removeAttribute("duplicate"); %>
            }
        </script>       
    </body>
</html>
