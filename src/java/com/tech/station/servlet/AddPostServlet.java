/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.station.servlet;

import com.tech.station.dao.PostDao;
import com.tech.station.entities.Post;
import com.tech.station.entities.User;
import com.tech.station.helper.ConnectionProvider;
import com.tech.station.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Yogeshwar_Info
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

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

            //fetching data of post form
            int cid = Integer.parseInt(request.getParameter("cid"));
            String Ptitle = request.getParameter("ptitle");
            String Pcontent = request.getParameter("pcontent");
            String Pcode = request.getParameter("pcode");
            Part part = request.getPart("ppic");
            String Ppic = part.getSubmittedFileName();

            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            int Userid = user.getId();

            Post post = new Post(Ptitle, Pcontent, Pcode, Ppic, null, cid, Userid);
            try {
                PostDao pd = new PostDao(ConnectionProvider.getConnection());
                Boolean b = pd.savePost(post);
                
                if(b){
                    out.println("done");
                    String pth = request.getRealPath("/") + "Blog-pics" + File.separator + Ppic;

                    Helper.updateFile(part.getInputStream(), pth);
                    
                    
                }else{
                    out.println("error");
                }
                
                
            } catch (Exception e) {
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
