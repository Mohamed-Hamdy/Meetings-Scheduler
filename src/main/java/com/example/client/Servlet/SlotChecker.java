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

import static java.lang.System.exit;

@WebServlet(name = "SlotChecker", value = "/SlotChecker")
public class SlotChecker extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SlotChecker</title>");
            out.println("</head>");
            out.println("<body>");

            int id = 0;
            //String email_session = request.getSession().getAttribute("username").toString();
            //String SlotDate = request.getParameter("SlotDate");
            String SlotTime = request.getParameter("SlotTime");
            String SlotDate = request.getParameter("SlotDate");
            String user_id = request.getSession().getAttribute("Userid").toString();
            //System.out.println(SlotTime + " Date  " + SlotDate);
            //System.out.println("user id " + user_id);

            //exit(0);
            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = null;
                con = DriverManager.getConnection("jdbc:postgresql://ec2-52-49-120-150.eu-west-1.compute.amazonaws.com:5432/dbt2n4ufb35tt9", "buctxcvhzkynmq", "ed63df97e3ed14918e622f6cfa76f9b0715a543608324085b8cb3dff6742d7dd");

                PreparedStatement pstmt = null;

                pstmt = con.prepareStatement("SELECT * FROM meeting WHERE user_id=? AND meetingdate =? AND meetingtime =?");
                pstmt.setString(1, user_id);
                pstmt.setString(2, SlotDate);
                pstmt.setString(3, SlotTime);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    //System.out.println("This Slot is Taken Before");
                    out.println("<span class=\"text-danger text-sm\">"
                            + "This Slot is Taken Before"
                            + "</span>");
                    String msg = "EIDB";
                    HttpSession session = request.getSession();
                    session.setAttribute("SlotCheckerMSG", msg);
                } else {
                    //System.out.println("This Slot is available");

                    out.print("<span class=\"text-success\">"
                            + "This Slot is available"
                            + "</span>");
                    String msg = "";
                    HttpSession session = request.getSession();
                    session.setAttribute("SlotCheckerMSG", msg);

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
