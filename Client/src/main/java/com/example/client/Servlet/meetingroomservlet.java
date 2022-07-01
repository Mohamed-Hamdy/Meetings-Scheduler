package com.example.client.Servlet;

import com.example.client.DataBase.AttendeeDAO;
import com.example.client.DataBase.MeetingDAO;
import com.example.client.DataBase.MeetingRoomDAO;
import com.example.client.Program.Attendee;
import com.example.client.Program.Meeting;
import com.example.client.Program.MeetingRoom;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

import static java.lang.System.out;

@WebServlet(name = "meetingroomservlet", value = "/meetingroomservlet")
public class meetingroomservlet extends HttpServlet {
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

            String name = request.getParameter("name");
            String email = request.getParameter("mail");
            //out.println("test");
            //out.println(name + " " + email);


            //String id_session = request.getSession().getAttribute("Userid").toString();
            //out.print("before insert");
            PreparedStatement pstmt = null;
            pstmt = Con.prepareStatement("SELECT id FROM meeting WHERE id=(SELECT MAX(id) FROM meeting)");

            ResultSet Check_id_RS = pstmt.executeQuery();

            int meetingID = 0;
            while (Check_id_RS.next()) {
                meetingID = Check_id_RS.getInt("id");
            }
            //meeting.setId(meetingID);


            //Meeting meeting = new Meeting();
            //out.println("1");
            //int meetingid = meeting.getId();
            //out.print("2");
            //out.print("Meeting id = " + meetingID);
            // add participants to attendee table
            AttendeeDAO object = new AttendeeDAO();
            //out.println("222");

            Attendee participant = new Attendee();
            //out.println("0");

            participant.setName(name);
            participant.setEmail(email);
            participant.setMeetingid(meetingID);
            //out.println("1");
            object.addAttendee(participant);

            // add room info to meetingroom table
            //out.println("1");
            MeetingRoom room = new MeetingRoom();
            MeetingRoomDAO roomDAO = new MeetingRoomDAO();
            //out.println("2");
            room.setMeeting_id(meetingID);
            //out.println("3");
            participant = new Attendee();
            //out.println("4");

            PreparedStatement pstmt1 = null;
            pstmt1 = Con.prepareStatement("SELECT id FROM attendee WHERE id=(SELECT MAX(id) FROM attendee)");

            ResultSet Check_id_RS1 = pstmt1.executeQuery();

            int attendeeid = 0;
            while (Check_id_RS1.next()) {
                attendeeid = Check_id_RS1.getInt("id");
            }

            room.setAttendee_id(attendeeid);
            //out.println("5");
            roomDAO.addMeetingRoom(room);
            //out.println("6");

            Con.close();
            response.sendRedirect("meetings.jsp");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
