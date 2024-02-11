/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.station.entities;

/**
 *
 * @author Yogeshwar_Info
 */
import java.sql.*;
public class User {
    
    private int id;
    private String name;
    private String password;
    private String email;
    private String gender;
    private String about;
    private Timestamp signup_date;
    private String profile;
    
    public User() {
    }

    public User(int id, String name, String password, String email, String gender, String about, Timestamp signup_date, String profile) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.about = about;
        this.signup_date = signup_date;
        this.profile = profile;
    }
    

    public User(int id, String name, String password, String email, String gender, String about, Timestamp signup_date) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.about = about;
        this.signup_date = signup_date;
    }

    public User(String name, String password, String email, String gender, String about) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.about = about;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getSignup_date() {
        return signup_date;
    }

    public void setSignup_date(Timestamp signup_date) {
        this.signup_date = signup_date;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
    
}
