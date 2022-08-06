<%--
    HttpSession logsession = request.getSession();
    String message = logsession.getAttribute("regMessage").toString();      
--%>
<!DOCTYPE html>
<%--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
--%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<html>
    <head>
        <title>GymPack Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="register.css" rel="stylesheet">
    </head>
    <body class ="text-center">              
        <%--${sessionScope.errorMessage}        
        ${sessionScope.regMessage}--%>
        <input type="hidden" id ="status" value="<%=session.getAttribute("status")%>">
        <main class ="form-signin">          
            <form method="POST" action="Loginhandler">
                <img class="mb-4" src="" alt="" width="72" height="57">
                <h1 class="h3 mb-3 fw-normal">Sign in</h1>
                <div class ="form-floating">
                    <input type="email" class="form-control" id="floatingInput" name="address" placeholder="name@example.com" required>
                  <label for="floatingInput">Email address</label>
                </div>
                <div class ="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="pass" placeholder="Password" required>
                  <label for="floatingPassword">Password</label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit" id = "btn">Sign in</button>
                <div>Not yet registered? <a href = "gymsignup.jsp"> Sign up.</a></div>
            </form>
        </main>
        
        <script src="package/dist/sweetalert2.all.min.js"></script>
	<link rel="stylesheet" href="package/dist/sweetalert2.css">
        <script type="text/javascript">
            var status = document.getElementById("status").value;         
            if(status === "invalidMessage"){
                Swal.fire("", "Please fill in all the fields", "error");
            }
            else if(status === "errorMessage"){
                Swal.fire("", "Incorrect Email or Password", "error");
            }
            else if(status === "regMessage"){
                Swal.fire("", "Account has been created successfully", "success");
            }
        </script>  
    </body>
</html>
