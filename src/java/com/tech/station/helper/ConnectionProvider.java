/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.station.helper;

/**
 *
 * @author Yogeshwar_Info
 */
import java.sql.*;
public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection(){
        
        try{
            
            if(con == null){
           
                 //load the class
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            //create connection
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techstation","root","tarun@1234");
            
            }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }    
}
