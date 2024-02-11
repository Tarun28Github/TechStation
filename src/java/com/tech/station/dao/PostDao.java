package com.tech.station.dao;

import com.mysql.cj.protocol.Resultset;
import com.tech.station.entities.Categorie;
import com.tech.station.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categorie> getAllCategories() {

        ArrayList<Categorie> list = new ArrayList<>();

        try {

            String q = "Select * from Categorie;";

            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet set = pstmt.executeQuery();

            while (set.next()) {

                int cid = set.getInt("cid");
                String cname = set.getString("name");
                String cdiscription = set.getString("discription");

                Categorie c = new Categorie(cid, cname, cdiscription);

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public boolean savePost(Post p) {
        boolean f = false;

        try {

            String q = "insert into post (ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?);";

            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getPtitle());
            pstmt.setString(2, p.getPcontent());
            pstmt.setString(3, p.getPcode());
            pstmt.setString(4, p.getPpic());
            pstmt.setInt(5, p.getCatid());
            pstmt.setInt(6, p.getUserid());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public List<Post> getAllPost() {

        List<Post> list = new ArrayList<>();

        try {

            PreparedStatement pstmt = con.prepareStatement("select * from post;");
            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int Pid = set.getInt("pid");
                String Ptitle = set.getString("ptitle");
                String Pcontent = set.getString("pcontent");
                String Pcode = set.getString("pcode");
                String Ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
                int Catid = set.getInt("catid");
                int Userid = set.getInt("userid");

                Post p = new Post(Pid,Ptitle, Pcontent, Pcode, Ppic, date, Catid, Userid);

                list.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getPostByCatId(int catid) {
        List<Post> list = new ArrayList<>();

        try {

            PreparedStatement pstmt = con.prepareStatement("select * from post where catid=?;");
            pstmt.setInt(1, catid);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int Pid = set.getInt("pid");
                String Ptitle = set.getString("ptitle");
                String Pcontent = set.getString("pcontent");
                String Pcode = set.getString("pcode");
                String Ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
                int Catid = set.getInt("catid");
                int Userid = set.getInt("userid");

                Post p = new Post(Pid,Ptitle, Pcontent, Pcode, Ppic, date, Catid, Userid);

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }
    
    public Post getPostByPid(int pid){
        
        Post p = null;

        try {

            PreparedStatement pstmt = con.prepareStatement("select * from post where pid=?;");
            pstmt.setInt(1, pid);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                int Pid = set.getInt("pid");
                String Ptitle = set.getString("ptitle");
                String Pcontent = set.getString("pcontent");
                String Pcode = set.getString("pcode");
                String Ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
                int Catid = set.getInt("catid");
                int Userid = set.getInt("userid");

                p = new Post(Pid,Ptitle, Pcontent, Pcode, Ppic, date, Catid, Userid);

               
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
        
    }

}
