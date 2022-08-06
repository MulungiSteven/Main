/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gym;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author Trev
 */
public class Signuphandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String passrpt = request.getParameter("rpt");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(name == null || email == null || password == null || passrpt == null){
            session.setAttribute("status", "invalidSignup");
            response.sendRedirect("gymsignup.jsp"); 
            }
            else if(!password.equals(passrpt)){
                //request.setAttribute("status", "danger");
                session.setAttribute("status", "signError");
                dispatcher = request.getRequestDispatcher("gymsignup.jsp");
                dispatcher.forward(request, response);
            }else{       
                DBConnect connect = new DBConnect();   
                String sql = "Select * from user where Name = '"+name+"' or Email = '"+email+"'";
                Statement stat = connect.getStatement().createStatement();
                ResultSet result = stat.executeQuery(sql);
                if(result.next()){
                    session.setAttribute("status", "duplicate");
                    response.sendRedirect("gymsignup.jsp");               
                }
                else{
                    String query = "Insert into user (Name, Email, Password) values (?,?,?)";                

                    PreparedStatement prep = connect.getStatement().prepareStatement(query);
                    prep.setString(1, name);
                    prep.setString(2, email);
                    prep.setString(3, password);

                    int row = prep.executeUpdate();
                    if(row < 0){                
                        //request.setAttribute("status", "danger");
                        //session.setAttribute("regError", errorMessage);
                        session.setAttribute("status", "regError");
                        response.sendRedirect("gymsignup.jsp");
                    }
                    else{               
                        //request.setAttribute("status", "success");
                        //session.setAttribute("regMessage", "Account has been created successfully");
                        session.setAttribute("status", "regMessage");
                        response.sendRedirect("gymlogin.jsp"); 
                    }
                }               
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
        try {
            processRequest(request, response);
        } catch (SQLException es) {
            es.getMessage();
        } catch (ClassNotFoundException ec) {
            ec.getMessage();
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException es) {
            es.getMessage();
        } catch (ClassNotFoundException ex) {
            ex.getMessage();
        }
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
