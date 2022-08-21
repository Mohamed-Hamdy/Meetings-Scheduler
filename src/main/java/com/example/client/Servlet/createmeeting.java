package com.example.client.Servlet;

import com.example.client.DataBase.MeetingDAO;
import com.example.client.Program.Meeting;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

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

            String timezone = request.getParameter("timezone");
            String Date = request.getParameter("Date");

            String time = request.getParameter("time");
            String title = request.getParameter("title");

            String description = request.getParameter("description");
            String duration = request.getParameter("duration");

            String repeat = request.getParameter("repeat");
            String meetingtype = request.getParameter("meetingtype");
            String roomservice = request.getParameter("roomservice");
            String id_session = request.getSession().getAttribute("Userid").toString();

            //out.println("id seesion " + id_session);
            //String uname = String.valueOf(session.getAttribute("username"));

            // chose a Character random from this String


            String titlewithoutspaces = title.replaceAll(" ", "");
            String meetingUrl = null;
            if(roomservice.equals("herokuapp")){
                // https://github.com/itstaranarora/video-chat-v1
                String meetingUrlservice2 = "https://video-chat-app-v1.herokuapp.com/" + Random(8) + "-" + Random(4) + "-" + Random(4) + "-" +  Random(4) + "-" + Random(12);
                meetingUrl = meetingUrlservice2;
            }else{
                // https://github.com/amirsanni/conference-call-ratchet
                String meetingUrlservice1 = "https://chat.1410inc.xyz/?room=" + titlewithoutspaces + "_" + Random(11) ;
                meetingUrl = meetingUrlservice1;
            }
            System.out.println(meetingUrl);

            String meetingCapacity;
            if(meetingtype.equals("One to One")){
                meetingCapacity = "2";
            }else{
                meetingCapacity = request.getParameter("add_fields_placeholderValue");

            }
            String SlotCheckerMSG = request.getSession().getAttribute("SlotCheckerMSG").toString();

            if(SlotCheckerMSG == "") {


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

            }else{
                String error = "e";
                HttpSession session = request.getSession();
                session.setAttribute("error", error);
                //out.print("sad");
                response.sendRedirect("meetings.jsp");
            }

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
            session.setAttribute("meetingUrl", meetingUrl);

            Con.close();
            response.sendRedirect("meetingroom.jsp");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    String Random(int n){
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";

        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(n);

        for (int i = 0; i < n; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                    = (int)(AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                    .charAt(index));
        }
        String str = sb.toString();

        return str;
    }
}
