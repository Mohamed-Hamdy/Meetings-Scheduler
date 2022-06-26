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
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * 
 * 
 * 
 *
 * @author AA
 */
@WebServlet(urlPatterns = {"/EmailValidator"})
public class EmailValidator extends HttpServlet {

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
            out.println("<title>Servlet EmailValidator</title>");
            out.println("</head>");
            out.println("<body>");

            int id = 0;
            //String email_session = request.getSession().getAttribute("username").toString();
            String email_session = request.getParameter("email");

            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = null;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/meetingscheduler", "root", "root");

                PreparedStatement pstmt = null;

                pstmt = con.prepareStatement("SELECT * FROM user WHERE email=? ");
                pstmt.setString(1, email_session);
                ResultSet rs = pstmt.executeQuery();
                
                if (rs.next()) {

                    out.println("<span class=\"text-danger text-sm\">"
                            + "This e-mail is already in use"
                            + "</span>");
                    String msg = "EIDB";
                    HttpSession session = request.getSession();
                    session.setAttribute("ValidatorEmailMSG", msg);
                } else {

                    out.print("<span class=\"text-success\">"
                            + "This e-mail is available"
                            + "</span>");
                    String msg = "";
                    HttpSession session = request.getSession();
                    session.setAttribute("ValidatorEmailMSG", msg);
                }
                con.close();
                pstmt.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
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
