package com.example.client.Servlet;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JavaMailUtil {
    public static void SendMail(String recepient) throws MessagingException {
        Properties props = new Properties();

        //Enable authentication
        props.put("mail.smtp.auth", "true");
        //Set TLS encryption enabled
        props.put("mail.smtp.starttls.enable", "true");
        //Set SMTP host
        props.put("mail.smtp.host", "smtp.gmail.com");
        //Set smtp port
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "*");

        String myEmail = "internetproject57@gmail.com";
        String password = "qwe123@thelover";

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(myEmail, password);
                    }
                });
        Message message = prepareMessage(session , myEmail , recepient);
        Transport.send(message);
        System.out.println("Message sent successfully");

    }
    private static Message prepareMessage(Session session, String myAccountEmail, String recepient){
        try{
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO , new InternetAddress(recepient));
            message.setSubject("Meeting Scheduler Account Password");
            String htmlCode = "<h3>Thanks you for your registration in Meeting Scheduler website</h3><br/><h4>This your account password </h4>";
            //String htmlandpass = htmlCode + account pass;
            message.setContent(htmlCode, "text/html");
            return  message;

        }catch (Exception ex){
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
