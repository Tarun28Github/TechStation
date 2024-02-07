
package com.tech.station.entities;


public class Categorie {
    
    private int cid;
    private String name;
    private String discription;

    public Categorie() {
    }

    public Categorie(int cid, String name, String discription) {
        this.cid = cid;
        this.name = name;
        this.discription = discription;
    }

    public Categorie(String name, String discription) {
        this.name = name;
        this.discription = discription;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cit) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }
    
    
    
    
}
