

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% 
           
           String email=session.getAttribute("email");
           GetConnection connect=new GetConnection();
           connect.getConnections();
           PreparedStatement st= connect.co.prepareStatement("SELECT*FROM orders WHERE email ='"+email+"'");
           ResultSet rs=st.executeQuery();
          
        %>
        <table>
            <tr>
                 <th>OrderId </th>  
                 <th>ProdName</th>
                 <th>Amount</th>
                 <th>Price</th>
                 <th>Email</th>
                 <th>Location</th>
                 <th>TotalAmount</th>
                 
                 
             </tr>
             <%while(rs.next()){%>
             <tr>
               <td><%=rs.getInt("id")  %></td>
               <td>  <%=rs.getString("prodName") %>  </td>
               <td><%=rs.getInt("prodAmt") %>  </td>
               <td><%=rs.getInt("prodPrice") %>  </td>
               <td><%=rs.getString("cstEmail") %>  </td>
               <td><%=rs.getString("location") %>  </td>
               <td><%=rs.getInt("totalAmount") %>  </td>
               <td> <a href="/2/productView.jsp?idd=<%=rs.getInt(1) %>">Edit</a> </td>
               
              </tr> 
              <%}%>
              
        </table>
    </body>
</html>
