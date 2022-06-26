package com.example.client.Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author AA
 */
@WebServlet(urlPatterns = {"/EditProfile"})
public class EditProfile extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet update</title>");
            out.println("</head>");
            out.println("<body>");
            Class.forName("com.mysql.jdbc.Driver");
            Connection Con = null;
            Statement Stmt = null;
            out.println("MMMM");

            String id_session = request.getSession().getAttribute("Userid").toString();

            Con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/meetingscheduler", "root", "root");
            Stmt = (Statement) Con.createStatement();

            String fName = request.getParameter("fName");
            String lName = request.getParameter("lName");
            String address = request.getParameter("address");

            String phone = request.getParameter("phone");
            String username = request.getParameter("username");
            String country = request.getParameter("country");
            String password = request.getParameter("password");
            out.println("ssssss");

            PreparedStatement ps = Con.prepareStatement(
                    "UPDATE user SET firstname = ?, lastname = ?,  username = ? , address = ? , country = ? ,  phone = ?, password = ? WHERE id = ? ");

            // set the preparedstatement parameters
            ps.setString(1, fName);
            ps.setString(2, lName);
            //ps.setString(3, email);
            ps.setString(3, username);
            ps.setString(4, address);
            ps.setString(5, country);
            ps.setString(6, phone);
            ps.setString(7, password);
            ps.setString(8, id_session);
            ps.executeUpdate();

            response.sendRedirect("index.jsp");

            ps.close();
            Con.close();
            out.println("</body>");
            out.println("</html>");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
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
