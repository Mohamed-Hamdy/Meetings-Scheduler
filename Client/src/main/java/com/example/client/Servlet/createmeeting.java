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

            //out.println("id seesion " + id_session);
            //String uname = String.valueOf(session.getAttribute("username"));


            String meetingUrl = "http://meetingscalendly.com/" + timezone + "/" + title + "/meet0" + id_session + "ing/";
            String meetingCapacity;
            if(meetingtype.equals("One to One")){
                meetingCapacity = "2";
            }else{
                meetingCapacity = request.getParameter("add_fields_placeholderValue");

            }

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
            meeting.setCapacity(meetingCapacity);
            MeetingDAO newGD = new MeetingDAO();

            newGD.addMeeting(meeting);

            HttpSession session = request.getSession();
            session.removeAttribute("error");
            session.setAttribute("meetingtype", meetingtype);
            session.setAttribute("meetingcapacity", meetingCapacity);
            session.setAttribute("duration", duration);
            session.setAttribute("repeat", repeat);
            session.setAttribute("time", time);
            session.setAttribute("title", title);
            session.setAttribute("timezone", timezone);
            session.setAttribute("Date", Date);

            Con.close();
            response.sendRedirect("meetingroom.jsp");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
