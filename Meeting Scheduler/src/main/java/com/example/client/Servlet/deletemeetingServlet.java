package com.example.client.Servlet;

import com.example.client.DataBase.MeetingDAO;
import com.example.client.Program.Meeting;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static java.lang.System.exit;
import static java.lang.System.out;

@WebServlet(name = "deletemeetingServlet", value = "/deletemeetingServlet")
public class deletemeetingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection Con;

            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            //out.println("test 2");

            String url = "jdbc:mysql://localhost:3306/meetingscheduler";
            //out.println("test 3");

            String user = "root";
            String password = "root";
            //out.println("test 4");

            Con = DriverManager.getConnection(url, user, password);
            //out.println("test 5");

            //out.println("test aaa5");
            //Stmt = Con.createStatement();
            //Select_Stmt = Con.createStatement();

            String meetingid = request.getParameter("meetingid");

            out.println("meeting id is : " + meetingid);
            MeetingDAO newGD = new MeetingDAO();
            newGD.deleteMeeting(meetingid);

            Con.close();
            response.sendRedirect("meetings.jsp");

        } catch (
                SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
