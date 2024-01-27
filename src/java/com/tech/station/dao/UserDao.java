/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.station.dao;

/**
 *
 * @author Yogeshwar_Info
 */

import com.tech.station.entities.User;
import java.sql.*;

public class UserDao {
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean saveUser(User user){
        
        boolean f = false;
        
        try{
            
            String query = "insert into signup(username,password,email,gender,about) values(?,?,?,?,?);";
            
            PreparedStatement pstmt =this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            pstmt.executeUpdate();
            
            f = true;
        }catch(Exception e)
        {
            e.printStackTrace();
        }    
        
        return f;
    }
    
}
