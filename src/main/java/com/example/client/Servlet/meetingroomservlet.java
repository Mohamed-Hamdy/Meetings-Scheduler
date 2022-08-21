package com.example.client.Servlet;

import com.example.client.DataBase.AttendeeDAO;
import com.example.client.DataBase.MeetingDAO;
import com.example.client.DataBase.MeetingRoomDAO;
import com.example.client.Program.Attendee;
import com.example.client.Program.Meeting;
import com.example.client.Program.MeetingRoom;
import com.example.client.Program.SendMail;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

import static java.lang.System.exit;
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

            String url = "jdbc:postgresql://ec2-52-49-120-150.eu-west-1.compute.amazonaws.com:5432/dbt2n4ufb35tt9";
            //out.println("test 3");

            String user = "buctxcvhzkynmq";
            String password = "ed63df97e3ed14918e622f6cfa76f9b0715a543608324085b8cb3dff6742d7dd";
            //out.println("test 4");

            Con = DriverManager.getConnection(url, user, password);
            //out.println("test 5");

            //out.println("test aaa5");
            //Stmt = Con.createStatement();
            String meetingtype = request.getSession().getAttribute("meetingtype").toString();
            String meetingcapacity = request.getSession().getAttribute("meetingcapacity").toString();
            String emailsession = request.getSession().getAttribute("email").toString();
            String meetingtime = request.getSession().getAttribute("time").toString();
            String meetingtitle = request.getSession().getAttribute("title").toString();
            String meetingtimezone = request.getSession().getAttribute("timezone").toString();
            String meetingDate = request.getSession().getAttribute("Date").toString();
            String meetingUrl = request.getSession().getAttribute("meetingUrl").toString();


            //out.println("test");


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
            Attendee participant = new Attendee();

            if(meetingtype.equals("One to One")){
                String name = request.getParameter("name");
                String email = request.getParameter("mail");

                participant.setName(name);
                participant.setEmail(email);
                participant.setMeetingid(meetingID);
                object.addAttendee(participant);

                String to = email;

                // Sender's email ID needs to be mentioned

                String from = "meetingschedulerteam@gmail.com";

                // Assuming you are sending email from through gmails smtp
                String host = "smtp.gmail.com";

                // Get system properties
                Properties properties = System.getProperties();

                // Setup mail server
                properties.put("mail.smtp.host", host);
                properties.put("mail.smtp.port", "465");
                properties.put("mail.smtp.ssl.enable", "true");
                properties.put("mail.smtp.auth", "true");

                // Get the Session object.// and pass username and password
                Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                    protected PasswordAuthentication getPasswordAuthentication() {

                        return new PasswordAuthentication("meetingschedulerteam@gmail.com", "fvwmxdedppdpgyqm");
                    }
                });

                // Used to debug SMTP issues
                session.setDebug(true);

                try {
                    // Create a default MimeMessage object.
                    MimeMessage message = new MimeMessage(session);

                    // Set From: header field of the header.
                    message.setFrom(new InternetAddress(from));

                    // Set To: header field of the header.
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                    // Set Subject: header field
                    message.setSubject("Meeting Scheduler Team");

                    // Now set the actual message
                    message.setText("Hi" + name + " You Invited To Attend Meeting about " + meetingtitle + " at " + meetingtime + " / " + meetingDate + " with timezone" + meetingtimezone + " and meeting url is "+ meetingUrl + "\n" + "Initiator Meeting " + emailsession + "\nThanks.");

                    System.out.println("sending...");
                    // Send message
                    Transport.send(message);
                    System.out.println("Sent message successfully....");
                } catch (MessagingException mex) {
                    mex.printStackTrace();
                }


            }else{
                String name = request.getParameter("name");
                String email = request.getParameter("mail");

                participant.setName(name);
                participant.setEmail(email);
                participant.setMeetingid(meetingID);
                object.addAttendee(participant);
                //out.println("Done name");

                String to = email;
                // Sender's email ID needs to be mentioned
                String from = "meetingschedulerteam@gmail.com";
                // Assuming you are sending email from through gmails smtp
                String host = "smtp.gmail.com";

                // Get system properties
                Properties properties = System.getProperties();

                // Setup mail server
                properties.put("mail.smtp.host", host);
                properties.put("mail.smtp.port", "465");
                properties.put("mail.smtp.ssl.enable", "true");
                properties.put("mail.smtp.auth", "true");

                // Get the Session object.// and pass username and password
                Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                    protected PasswordAuthentication getPasswordAuthentication() {

                        return new PasswordAuthentication("meetingschedulerteam@gmail.com", "fvwmxdedppdpgyqm");
                    }
                });

                // Used to debug SMTP issues
                session.setDebug(true);

                try {
                    // Create a default MimeMessage object.
                    MimeMessage message = new MimeMessage(session);

                    // Set From: header field of the header.
                    message.setFrom(new InternetAddress(from));

                    // Set To: header field of the header.
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                    // Set Subject: header field
                    message.setSubject("Meeting Scheduler Team");

                    // Now set the actual message
                    message.setText("Hi" + name + " You Invited To Attend Meeting about " + meetingtitle + " at " + meetingtime + " / " + meetingDate + " with timezone" + meetingtimezone + " and meeting url is "+ meetingUrl + "\n" + "Initiator Meeting " + emailsession + "\nThanks.");

                    System.out.println("sending...");
                    // Send message
                    Transport.send(message);
                    System.out.println("Sent message successfully....");
                } catch (MessagingException mex) {
                    mex.printStackTrace();
                }


                for(int i = 2; i <= Integer.parseInt(meetingcapacity); i++){
                    participant = new Attendee();
                    String varName = "iname" + i;
                    String varMail = "imail" + i;

                    participant.setName(request.getParameter(varName));
                    participant.setEmail(request.getParameter(varMail));
                    participant.setMeetingid(meetingID);

                    object.addAttendee(participant);

                    String toi = request.getParameter(varMail);
                    //System.out.println("to Email :" + toi);
                    // Sender's email ID needs toi be mentioned

                    String fromi = "meetingschedulerteam@gmail.com";

                    // Assuming you are sending email from through gmails smtp
                    String hosti = "smtp.gmail.com";

                    // Get system properties
                    Properties propertiesi = System.getProperties();

                    // Setup mail server
                    propertiesi.put("mail.smtp.host", hosti);
                    propertiesi.put("mail.smtp.port", "465");
                    propertiesi.put("mail.smtp.ssl.enable", "true");
                    propertiesi.put("mail.smtp.auth", "true");

                    // Get the Session object.// and pass username and password
                    Session sessioni = Session.getInstance(propertiesi, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {

                            return new PasswordAuthentication("meetingschedulerteam@gmail.com", "fvwmxdedppdpgyqm");
                        }
                    });

                    // Used to debug SMTP issues
                    sessioni.setDebug(true);

                    try {
                        // Create a default MimeMessage object.
                        MimeMessage message = new MimeMessage(sessioni);

                        // Set From: header field of the header.
                        message.setFrom(new InternetAddress(fromi));

                        // Set To: header field of the header.
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(toi));

                        // Set Subject: header field
                        message.setSubject("Meeting Scheduler Team");

                        // Now set the actual message
                        message.setText("Hi " + request.getParameter(varName) + "You Invited To Attend Meeting about " + meetingtitle + " at " + meetingtime + " / " + meetingDate + " with timezone" + meetingtimezone + " and meeting url is "+ meetingUrl + "\n" + "Initiator Meeting " + emailsession + "\nThanks.");

                        System.out.println("sending...");
                        // Send message
                        Transport.send(message);
                        System.out.println("Sent message successfully....");
                    } catch (MessagingException mex) {
                        mex.printStackTrace();
                    }
                }

            }
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
