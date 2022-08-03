<%-- 
    Document   : shop
    Created on : Jul 31, 2022, 1:29:37 PM
    Author     : Admin
--%>

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
           String u_email=request.getParameter("email");
           session.setAttribute("email",u_email);
           GetConnection connect=new GetConnection();
           connect.getConnections();
           PreparedStatement st= connect.co.prepareStatement("SELECT*FROM products");
           ResultSet rs=st.executeQuery();
          
        %>
        <table>
            <tr>
                 <th>ProdId </th>  
                 <th>ProdName</th>
                 <th>Category</th>
                 <th>AmmountAv</th>
                 <th>Price</th>
                 
             </tr>
             <%while(rs.next()){%>
             <tr>
               <td><%=rs.getInt("id")  %></td>
               <td>  <%=rs.getString("prodName") %>  </td>
               <td><%=rs.getString("category") %>  </td>
               <td><%=rs.getInt("ammount") %>  </td>
               <td><%=rs.getInt("unitPrice") %>  </td>
               <td> <a href="/2/productView.jsp?idd=<%=rs.getInt(1) %>">Edit</a> </td>
               
              </tr> 
              <%}%>
              
        </table>
    </body>
</html>
