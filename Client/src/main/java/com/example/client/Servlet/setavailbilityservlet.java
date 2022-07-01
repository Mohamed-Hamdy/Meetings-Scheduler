package com.example.client.Servlet;

import com.example.client.DataBase.MeetingDAO;
import com.example.client.Program.Meeting;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

import static java.lang.System.out;

@WebServlet(name = "setavailbilityservlet", value = "/setavailbilityservlet")
public class setavailbilityservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection Con;

            Class.forName("com.mysql.jdbc.Driver");


            String url = "jdbc:mysql://localhost:3306/meetingscheduler";

            String user = "root";
            String password = "root";

            Con = DriverManager.getConnection(url, user, password);

            int userId = 0;
            //String ValidatorEmailMSG = request.getSession().getAttribute("ValidatorEmailMSG").toString();
            //out.println(ValidatorEmailMSG);
            //String gRecaptchaResponse = request.getParameter("g-recaptcha-response");


            //String murl = request.getParameter("meetingsurl");
            String id_session = request.getSession().getAttribute("Userid").toString();
            String uname =request.getSession().getAttribute("username").toString();
            String Meetingurl = "meeting0"+id_session + "room/";

            String profilemeetingurl = "meetingscalendly.com/"+ uname + "/" + Meetingurl;
            out.print(profilemeetingurl + "        " + Meetingurl);

            String Saturday = request.getParameter("Saturday");

            String Sunday = request.getParameter("Sunday");
            String Monday = request.getParameter("Monday");

            String Tuesday = request.getParameter("Tuesday");
            String Wednesday = request.getParameter("Wednesday");

            String Thursday = request.getParameter("Thursday");
            String Friday = request.getParameter("Friday");



            //out.println("before insert");
            try (PreparedStatement pstmt = Con.prepareStatement(


                    "INSERT INTO setavailabledays(profilemeetingsurl,Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,user_id) VALUES(?,?,?,?,?,?,?,?,?)")) {

                pstmt.setString(1, profilemeetingurl);
                pstmt.setString(2, Saturday);
                pstmt.setString(3, Sunday);
                pstmt.setString(4, Monday);
                pstmt.setString(5, Tuesday);
                pstmt.setString(6, Wednesday);
                pstmt.setString(7, Thursday);
                pstmt.setString(8, Friday);
                pstmt.setString(9, id_session);
                pstmt.executeUpdate();
                pstmt.close();
            }
            //out.println("after insert");

            Meeting meeting;
            meeting = new Meeting();
            //TimeZone tz = TimeZone.getTimeZone("EGYPT");
            meeting.setTimezone("Africa/cairo");
            meeting.setDate("YYYY-MM-dd");
            meeting.setTime("HH:MM");

            meeting.setTitle("Default Meeting");
            meeting.setDescription("Meeting Description");
            meeting.setDuration("30 Minutes");

            meeting.setRepeat("Never");
            meeting.setMeetingtype("One To One");
            meeting.setMeetingUrl("NO URL For Default Meeting");
            meeting.setmeetingTinyIntToIsAvailable(1);
            meeting.setUserId(id_session);
            MeetingDAO newGD = new MeetingDAO();

            newGD.addMeeting(meeting);
            response.sendRedirect("index.jsp");
            Con.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
