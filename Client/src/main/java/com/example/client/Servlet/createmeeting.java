package com.example.client.Servlet;

import com.example.client.DataBase.MeetingDAO;
import com.example.client.Program.Meeting;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

import static java.lang.System.exit;
import static java.lang.System.out;

@WebServlet(name = "createmeeting", value = "/createmeeting")
public class createmeeting extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

            String timezone = request.getParameter("timezone");
            String Date = request.getParameter("Date");

            String time = request.getParameter("time");
            String title = request.getParameter("title");

            String description = request.getParameter("description");
            String duration = request.getParameter("duration");

            String repeat = request.getParameter("repeat");
            String meetingtype = request.getParameter("meetingtype");


            String id_session = request.getSession().getAttribute("Userid").toString();
            //out.println(timezone + " " + Date + "  ");
            //out.println(time + " " + title + "  ");
            //out.println(description + " " + duration + "  ");
            //out.println(repeat + " " + meetingtype + "  " + id_session );

            //out.println("id seesion " + id_session);
            //String uname = String.valueOf(session.getAttribute("username"));


            String meetingUrl = "http://meetingscalendly.com/" + timezone + "/" + title + "/meet0" + id_session + "ing/";
            //out.print("before insert");
            Meeting meeting;
            meeting = new Meeting();
            meeting.setTimezone(timezone);
            meeting.setDate(Date);
            meeting.setTime(time);
            meeting.setTitle(title);
            meeting.setDescription(description);
            meeting.setDuration(duration);
            meeting.setRepeat(repeat);
            meeting.setMeetingtype(meetingtype);
            meeting.setMeetingUrl(meetingUrl);
            meeting.setmeetingTinyIntToIsAvailable(1);
            meeting.setUserId(id_session);
            MeetingDAO newGD = new MeetingDAO();

            newGD.addMeeting(meeting);
            Con.close();
            response.sendRedirect("index.jsp");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
