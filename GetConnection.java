package classes;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;

public class GetConnection {
     public Connection co=null;
     public void getConnections() throws ClassNotFoundException, SQLException{
       Class.forName("com.mysql.jdbc.Driver");
       co =DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "root", "root");
         
      
    
    }
    
}
