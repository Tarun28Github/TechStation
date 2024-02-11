/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.station.dao;

import java.sql.*;

/**
 *
 * @author Yogeshwar_Info
 */
public class LikesDao {

    private Connection con;

    public LikesDao(Connection con) {
        this.con = con;
    }

    public boolean insertLikes(int pid, int uid) {

        boolean f = false;
        try {

            String q = "insert into likes(pid,uid) values(?,?);";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public int countLikesOnPost(int pid) {

        int count = 0;

        try {
            String q = "select count(*) from likes where pid =?;";
            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setInt(1, pid);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean isLikeByUser(int pid, int uid) {

        boolean f = false;
        try {

            String q = "select * from likes where pid=? and uid=?;";

            PreparedStatement pstmt = this.con.prepareStatement(q);

            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
      public boolean deleteLikes(int pid, int uid){
    
        boolean f = false;
         try{
             
             String q ="delete from likes(pid,uid) values(?,?);";
             
             PreparedStatement pstmt =  this.con.prepareStatement(q);
             
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            pstmt.executeUpdate();
            
            f = true;
             
         }catch(Exception e){
             e.printStackTrace();
         }
        
        
        return f;
    }
}
