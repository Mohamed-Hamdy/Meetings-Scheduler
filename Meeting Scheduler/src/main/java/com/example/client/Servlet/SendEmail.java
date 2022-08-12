package com.example.client.Servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import static java.lang.System.out;


@WebServlet(name = "SendEmail", value = "/SendEmail")
public class SendEmail extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        out.print("From send Email");

        String emailpassword = request.getSession().getAttribute("password").toString();
        String to = request.getSession().getAttribute("email").toString();
        String name = request.getSession().getAttribute("username").toString();
        try {
            JavaMailUtil.SendMail("mohamed547754@gmail.com");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        out.print("Done");
    }
}
