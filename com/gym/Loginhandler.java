/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gym;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 *
 * @author Trev
 */
public class Loginhandler extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("address");
            String password = request.getParameter("pass");
            HttpSession session = request.getSession();
            if(email == null || password == null){                
                //session.setAttribute("status", "danger");
                //session.setAttribute("invalidMessage", "Please fill all the fields");
                session.setAttribute("status", "invalidMessage");
                response.sendRedirect("gymlogin.jsp"); 
            }
            DBConnect connect = new DBConnect();
            Connection con = connect.getStatement();
            
            String sql = "Select * from user where Email = '"+email+"' and Password = '"+password+"';";            
            Statement stat = con.createStatement();         
            ResultSet result = stat.executeQuery(sql);
            
            if(result.next()){               
                session.setAttribute("name", result.getString("Name"));
                response.sendRedirect("home.jsp");
            }
            else{
                //session.setAttribute("status", "danger");
                //session.setAttribute("errorMessage", "Incorrect Email or Password");
                session.setAttribute("status", "errorMessage");
                response.sendRedirect("gymlogin.jsp"); 
            }
        
        } catch (SQLException es) {
            es.getMessage();
        } catch (ClassNotFoundException ex) {
            ex.getMessage();
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
