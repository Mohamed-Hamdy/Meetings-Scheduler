package com.example.client.Program;

import com.example.client.DataBase.MeetingDAO;
import com.example.client.DataBase.MeetingRoomDAO;
import jakarta.servlet.http.HttpServletRequest;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

    public static void SendmailFunction(String Emailto, String nameto, String Emailfrom) {
        System.out.println("From SendmailFunction ");

        String to = Emailto;

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
            message.setText("Hi" + nameto + " You Invited To Attend Meeting ");

            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
            // Recipient's email ID needs to be mentioned.
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}