package com.example.client.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "SlotChecker", value = "/SlotChecker")
public class SlotChecker extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            String SlotDate = request.getParameter("SlotDate");

            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = null;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/meetingscheduler", "root", "root");

                PreparedStatement pstmt = null;

                pstmt = con.prepareStatement("SELECT * FROM user WHERE email=? ");
                pstmt.setString(1, SlotDate);
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
}
