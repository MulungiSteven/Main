/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gym;

import java.sql.*;

/**
 *
 * @author Trev
 */
public class DBConnect {
    public Connection getStatement() throws SQLException, ClassNotFoundException{
        Connection con = null;
        /**
         *
         * @return
         * @throws ClassNotFoundException
         * @throws SQLException
         */
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GymPack", "root", "");
        return con;
    } 
}
