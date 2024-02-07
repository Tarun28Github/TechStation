package com.tech.station.dao;

import com.mysql.cj.protocol.Resultset;
import com.tech.station.entities.Categorie;
import com.tech.station.entities.Post;
import java.sql.*;
import java.util.ArrayList;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categorie> getAllCategories()      
    {

        ArrayList<Categorie> list = new ArrayList<>(); 
        
        try{
            
            String q = "Select * from Categorie;";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet set =  pstmt.executeQuery();
            
            while(set.next()){
                
                int cid = set.getInt("cid");
                String cname = set.getString("name");
                String cdiscription = set.getString("discription");
                
                Categorie c = new Categorie(cid, cname, cdiscription);
                
                list.add(c);                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        

        return list;

    }

    public boolean savePost(Post p){
      boolean f= false;
      
      try{
          
          String q ="insert into post (ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?);"; 
          
          PreparedStatement pstmt = con.prepareStatement(q);
          pstmt.setString(1,p.getPtitle());
          pstmt.setString(2,p.getPcontent());
          pstmt.setString(3, p.getPcode());
          pstmt.setString(4, p.getPpic());
          pstmt.setInt(5, p.getCatid());
          pstmt.setInt(6, p.getUserid());
          
          pstmt.executeUpdate();
          f = true;
      }catch(Exception e){
          e.printStackTrace();
      }
      
      return f;
    }
}
