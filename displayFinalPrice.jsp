

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="classes.GetConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
           String email=(String)session.getAttribute("email");
           int id=Integer.parseInt(request.getParameter("idd"));
           String prodName=request.getParameter("pdname");
           int prodAmt=Integer.parseInt(request.getParameter("amm"));
           int prodPrice=Integer.parseInt(request.getParameter("price"));
           int total=prodAmt*prodPrice;
   
           GetConnection connect=new GetConnection();
           connect.getConnections();
           PreparedStatement st1=connect.co.prepareStatement("SELECT * FROM web.customers where email='"+email+"'");
           ResultSet rs=st1.executeQuery();
           String location=null;
           while(rs.next()){
              location=rs.getString("location");
              }
           PreparedStatement st2= connect.co.prepareStatement("SELECT*FROM products WHERE id='"+id+"'");
           ResultSet rs1=st2.executeQuery();
           int amount=0;
           while(rs1.next()){
              amount=rs1.getInt("ammount");
              }
           if(prodAmt>amount){
             %>
              }
              <p>The amount you ordered is not available</p>
              <%}else{

           }
           %>
      
        <form action="processOrder">
            <p><input type="hidden" value="<%=total%>" name="total"><%=total%> is the total price</p>
            <p><input type="hidden" value="<%=request.getParameter("pdname")%>" name="pdname"><%=request.getParameter("pdname")%> is the total price</p>
            <p><input type="hidden" value="<%=request.getParameter("cat")%>" name="cat"><%=request.getParameter("cat")%> is the Category</p>
            <p><input type="hidden" value="<%=request.getParameter("amm")%>" name="amt"><%=request.getParameter("amm")%> is the amount</p>
            <p><input type="hidden" value="<%=request.getParameter("price")%>" name="price"><%=request.getParameter("price")%> is the total price</p>
            <p><input type="hidden" value="<%=email%>" name="email"><%=email%> is the email</p>
            <p><input type="hidden" value="<%=location%>" name="location"><%=location%> is the location</p>
            <input type="submit" value="submit">
            
        </form>
        
    </body>
</html>
