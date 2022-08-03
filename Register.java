/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import classes.GetConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import classes.GetConnection;
/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {

   String name;
   String email;
   String password;
   String location;
   String gender;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            name=request.getParameter("name");
            email=request.getParameter("email");
            password=request.getParameter("password");
            location=request.getParameter("location");
            gender=request.getParameter("gender");
            //confrim no empty field
            Boolean checkDetails1=!name.equals("")&&!email.equals("");
            Boolean checkDetails2=!password.equals("")&&!location.equals("");
            Boolean checkDetails3=checkDetails1&&checkDetails2;
            Boolean checkDetails4=checkDetails3&&!gender.equals("");
            
            if(checkDetails4){
                try{
                //Class.forName("com.mysql.jdbc.Driver");
                try{
                    //Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
                    GetConnection connect= new GetConnection();
                    connect.getConnections();
                    
                    PreparedStatement st= connect.co.prepareStatement("SELECT*FROM CUSTOMERS WHERE EMAIL='"+email+"'");
                    ResultSet rs=st.executeQuery();
                    if(rs.next()){
                        //redirect to next page;
                        
                        out.print("<p>this user already exists<p>");
                        
                        //TODO ENTER SIGNUP
                    }else{
                        PreparedStatement st2=connect.co.prepareStatement("INSERT INTO `web`.`customers` (`name`, `gender`, `email`, `password`, `location`) VALUES ('"+name+"','"+gender+"', '"+email+"', '"+password+"', '"+location+"')");
                        st2.executeUpdate();
                        response.sendRedirect("shop.jsp?email="+email);
                     
                    }
                }catch(SQLException es){
                    out.println(es.getMessage());
                }
            }catch(ClassNotFoundException e){
                out.println(e.getMessage());
            }
            }else{
                out.println("<p>Please enter all details</p>");
                
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
