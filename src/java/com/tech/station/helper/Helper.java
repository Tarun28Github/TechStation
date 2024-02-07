/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.station.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Path;

/**
 *
 * @author Yogeshwar_Info
 */
public class Helper {
    
    public static boolean deleteFile(String path){         
        
       
        File file = new File(path);
        boolean f=file.delete();
        
        return f;
    }
    
    public static boolean updateFile(InputStream is, String path){
        boolean f = false;
        try{
            byte[]  pic = new byte[is.available()];
            is.read(pic);
            
            FileOutputStream fos = new FileOutputStream(path);
            
            fos.write(pic);
            
            fos.flush();
            
            fos.close();
            
           f=true; 
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return f;        
    }
    
    
}
