<%-- 
    Document   : productView
    Created on : Aug 1, 2022, 3:05:36 PM
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
           int id=Integer.parseInt(request.getParameter("idd"));
           GetConnection connect=new GetConnection();
           connect.getConnections();
           PreparedStatement st= connect.co.prepareStatement("SELECT*FROM products WHERE id='"+id+"'");
           ResultSet rs=st.executeQuery();
           
           
          
        %>
        
        <form action="displayFinalPrice.jsp">
            <input type="hidden" name="idd" value="<%=id%>">
         
            <table>
                 <th>ProdId </th>  
                 <th>ProdName</th>
                 <th>Category</th>
                 <th>AmmountAv</th>
                 <th>Price</th>
                  <%while(rs.next()){%>
             <tr>
               <td><%=rs.getInt("id")  %></td>
               <td>  <%=rs.getString("prodName") %> <input type="hidden" name="pdname" value="<%=rs.getString("prodName")%>"> </td>
               <td><%=rs.getString("category") %>  <input type="hidden" name="cat" value="<%=rs.getString("category")%>"></td>
               <td><%=rs.getInt("ammount") %>  <input type="hidden" name="amm" value="<%=rs.getInt("ammount")%>"></td>
               <td><%=rs.getInt("unitPrice") %>  <input type="hidden" name="price" value="<%=rs.getInt("unitPrice")%>"></td>
               <td> <a href="/2/productView.jsp?idd=<%=rs.getInt(1) %>">Edit</a> </td>
               
              </tr> 
              <%}%>
             
            </table>
             
               <input type="number" name="ammount1">
               <input type="submit" name="submit">
               
               
            
        </form>
    </body>
</html>
