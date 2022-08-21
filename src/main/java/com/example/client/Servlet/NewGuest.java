package com.example.client.Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import jakarta.servlet.http.HttpSession;

import static java.lang.System.exit;


/**
 *
 * @author AA
 */
@WebServlet(name = "NewGuest", urlPatterns = {"/NewGuest"})
public class NewGuest extends HttpServlet {

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

            try {
                Connection Con;

                //out.println("test 1");
                Class.forName("com.mysql.jdbc.Driver");
                //out.println("test 2");

                String url = "jdbc:postgresql://ec2-52-49-120-150.eu-west-1.compute.amazonaws.com:5432/dbt2n4ufb35tt9";
                //out.println("test 3");

                String user = "buctxcvhzkynmq";
                String password = "ed63df97e3ed14918e622f6cfa76f9b0715a543608324085b8cb3dff6742d7dd";
                //out.println("test 4");

                Con = DriverManager.getConnection(url, user, password);
                //out.println("test 5");

                //out.println("test aaa5");
                //Stmt = Con.createStatement();
                //Select_Stmt = Con.createStatement();
                int userId = 0;
                String ValidatorEmailMSG = request.getSession().getAttribute("ValidatorEmailMSG").toString();
                out.println(ValidatorEmailMSG);
                String gRecaptchaResponse = request
                        .getParameter("g-recaptcha-response");

                if (gRecaptchaResponse.length() != 0 && "".equals(ValidatorEmailMSG)) {
                    String firstName = request.getParameter("fName");
                    String lastName = request.getParameter("lName");

                    String email = request.getParameter("email");
                    String username = request.getParameter("username");

                    String phone = request.getParameter("phone");
                    String country = request.getParameter("country");

                    String address = request.getParameter("address");
                    String pass = request.getParameter("password");

                    //out.println(firstName + " " +lastName+ "  ");
                    //out.println(email + " " +username+ "  ");
                    //out.println(phone + " " +country+ "  ");
                    //out.println(address + " " +userType+ "  ");

                    /*
                    final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    SecureRandom random = new SecureRandom();
                    StringBuilder sb = new StringBuilder();
                    int len = 4;
                    for (int i = 0; i < len; i++) {
                        int randomIndex = random.nextInt(chars.length());
                        sb.append(chars.charAt(randomIndex));
                    }

                    String pass = sb.toString();
                    */

                    /*
                    User newGuest;
                    newGuest = new Guest(username, pass);
                    newGuest.setFirstName(firstName);
                    newGuest.setLastName(lastName);
                    newGuest.setUsername(username);
                    newGuest.setEmail(email);
                    newGuest.setPhone(phone);
                    newGuest.setCountry(country);
                    newGuest.setAddress(address);
                    newGuest.setNewPassword(pass , pass);
                    newGuest.setUsertype(userType);
                    GuestDAO newGD = new GuestDAO();
                    userId = newGD.addUser(newGuest);
                    //out.println("password = " + pass);
                    // complete from here
                    */

                    String userType = "Initiator";
                    try (PreparedStatement pstmt = Con.prepareStatement(
                            "INSERT INTO usertable(firstname,lastname,username,email,password,country,phone,Address,type) VALUES(?,?,?,?,?,?,?,?,?)")) {

                        pstmt.setString(1, firstName);
                        pstmt.setString(2, lastName);
                        pstmt.setString(3, username);
                        pstmt.setString(4, email);
                        pstmt.setString(5, pass);
                        pstmt.setString(6, country);
                        pstmt.setString(7, phone);
                        pstmt.setString(8, address);
                        pstmt.setString(9, userType);
                        pstmt.executeUpdate();
                        pstmt.close();

                    }
                    //out.print("inserted");


                    PreparedStatement pstmt = null;
                    pstmt = Con.prepareStatement("SELECT * FROM user WHERE email=? ");
                    pstmt.setString(1, email);
                    ResultSet Check_id_RS = pstmt.executeQuery();

                    while (Check_id_RS.next()) {
                        userId = Check_id_RS.getInt("id");
                    }
                    //out.println("user id : " + userId);

                    //out.println(userId);
                    if (userId != 0) {

                        // if succesfull create session for user
                        HttpSession session = request.getSession();
                        session.removeAttribute("error");
                        session.setAttribute("username", username);
                        session.setAttribute("Userid", userId);
                        session.setAttribute("fName", firstName);
                        session.setAttribute("lName", lastName);
                        session.setAttribute("phone", phone);
                        session.setAttribute("email", email);
                        session.setAttribute("address", address);
                        session.setAttribute("userType", userType);
                        session.setAttribute("country", country);
                        session.setAttribute("password", pass);
                        response.sendRedirect("SetAvailability.jsp");
                        //out.print("good");
                    } else {
                        String error = "e";
                        HttpSession session = request.getSession();
                        session.setAttribute("error", error);
                        //out.print("sad");
                        response.sendRedirect("Join.jsp");
                    }

                    Con.close();

                } else {
                    String error = "e";
                    HttpSession session = request.getSession();
                    session.setAttribute("error", error);
                    response.sendRedirect("Join.jsp");
                }

                //response.sendRedirect("index.html");
            } catch (Exception ex) {
                ex.printStackTrace();
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
