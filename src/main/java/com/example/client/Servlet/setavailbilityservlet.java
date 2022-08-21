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

import static java.lang.System.exit;
import static java.lang.System.out;

@WebServlet(name = "setavailbilityservlet", value = "/setavailbilityservlet")
public class setavailbilityservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection Con;

            Class.forName("com.mysql.jdbc.Driver");


            String url = "jdbc:postgresql://ec2-52-49-120-150.eu-west-1.compute.amazonaws.com:5432/dbt2n4ufb35tt9";

            String user = "buctxcvhzkynmq";
            String password = "ed63df97e3ed14918e622f6cfa76f9b0715a543608324085b8cb3dff6742d7dd";

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
            //out.print(profilemeetingurl + "        " + Meetingurl);

            HttpSession session = request.getSession();
            session.removeAttribute("error");


            String Saturday = request.getParameter("Saturday");
            String Saturdaytimefrom = request.getParameter("fromtime1");
            String Saturdaytimeto = request.getParameter("totime1");
            String Satstr = Saturday + "/" + Saturdaytimefrom + "/" + Saturdaytimeto;
            session.setAttribute("Satstr", Satstr);

            String Sunday = request.getParameter("Sunday");
            String Sundaytimefrom = request.getParameter("fromtime2");
            String Sundaytimeto = request.getParameter("totime2");
            String Sunstr = Sunday + "/" + Sundaytimefrom + "/" + Sundaytimeto;
            session.setAttribute("Sunstr", Sunstr);

            String Monday = request.getParameter("Monday");
            String Mondaytimefrom = request.getParameter("fromtime3");
            String Mondaytimeto = request.getParameter("totime3");
            String Monstr = Monday + "/" + Mondaytimefrom + "/" + Mondaytimeto;
            session.setAttribute("Monstr", Monstr);

            String Tuesday = request.getParameter("Tuesday");
            String Tuesdaytimefrom = request.getParameter("fromtime4");
            String Tuesdaytimeto = request.getParameter("totime4");
            String Tuestr = Tuesday + "/" + Tuesdaytimefrom + "/" + Tuesdaytimeto;
            session.setAttribute("Tuestr", Tuestr);

            String Wednesday = request.getParameter("Wednesday");
            String Wednesdaytimefrom = request.getParameter("fromtime5");
            String Wednesdaytimeto = request.getParameter("totime5");
            String Wedstr = Wednesday + "/" + Wednesdaytimefrom + "/" + Wednesdaytimeto;
            session.setAttribute("Wedstr", Wedstr);

            String Thursday = request.getParameter("Thursday");
            String Thursdaytimefrom = request.getParameter("fromtime6");
            String Thursdaytimeto = request.getParameter("totime6");
            String Thurstr = Thursday + "/" + Thursdaytimefrom + "/" + Thursdaytimeto;
            session.setAttribute("Thurstr", Thurstr);

            String Friday = request.getParameter("Friday");
            String Fridaytimefrom = request.getParameter("fromtime7");
            String Fridaytimeto = request.getParameter("totime7");
            String Fristr = Friday + "/" + Fridaytimefrom + "/" + Fridaytimeto;
            session.setAttribute("Fristr", Fristr);

            out.println(Satstr + "   " + Sunstr);
            try (PreparedStatement pstmt = Con.prepareStatement(

                    "INSERT INTO setavailabledays(profilemeetingsurl,Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,user_id) VALUES(?,?,?,?,?,?,?,?,?)")) {

                pstmt.setString(1, profilemeetingurl);
                pstmt.setString(2, Satstr);
                pstmt.setString(3, Sunstr);
                pstmt.setString(4, Monstr);
                pstmt.setString(5, Tuestr);
                pstmt.setString(6, Wedstr);
                pstmt.setString(7, Thurstr);
                pstmt.setString(8, Fristr);
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
