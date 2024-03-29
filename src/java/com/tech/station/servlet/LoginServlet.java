/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.station.servlet;

import com.tech.station.dao.UserDao;
import com.tech.station.entities.Message;
import com.tech.station.entities.User;
import com.tech.station.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Yogeshwar_Info
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //fetching data form Login_page;
            
            String useremail = request.getParameter("email");
            String userpassword = request.getParameter("password");
            
            
            try{
                
                UserDao userdao = new UserDao(ConnectionProvider.getConnection());
                
                User  u =  userdao.getUserByEmailandPassword(useremail, userpassword);
                
                if(u == null){
                    // show error user email or password is invalid
                    
                    Message ms = new Message("Invalid details..... try again","error","alert-danger");
                    
                   HttpSession s = request.getSession();
                   s.setAttribute("msg",ms);
                   response.sendRedirect( "login_page.jsp");
                    
                    
                    
                }else{
                    // put user obj into session object which will remail until browers is not close
                   
                    HttpSession s = request.getSession();
                    s.setAttribute("currentUser", u);
                    response.sendRedirect("profile_page.jsp");
                   
                    
                }
                
                
                
            }catch(Exception e){
                e.printStackTrace();
            }
         
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
