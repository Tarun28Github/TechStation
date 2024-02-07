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

    public boolean saveUser(User user) {

        boolean f = false;

        try {

            String query = "insert into signup(username,password,email,gender,about) values(?,?,?,?,?);";

            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();

            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User getUserByEmailandPassword(String email, String password) {
        User user = null;

        try {
            

            String q = "select * from signup where email=? and password=?;";

            PreparedStatement stmt = this.con.prepareStatement(q);

            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            

            if ( rs.next()){ 
                user = new User();
                
                int id =rs.getInt("id");
                user.setId(id);
                
                
                user.setName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setSignup_date(rs.getTimestamp("signup_date"));
                user.setProfile(rs.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    public boolean updateUser(User user){
        boolean f = false;
        
        try{
            
            String query ="update signup set username=? , password=? ,email=? ,gender=? ,about=? ,profile=? where id=?;";
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            
            f =true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
}
