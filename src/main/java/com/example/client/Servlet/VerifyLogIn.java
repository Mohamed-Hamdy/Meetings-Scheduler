package com.example.client.Servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.client.Program.User;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import static java.lang.System.exit;

/**
 * Servlet implementation class VerifyLogIn
 */
@WebServlet("/VerifyLogIn")
public class VerifyLogIn extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyLogIn() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        Connection connection = null;
        ResultSet rs;
        String DBId = "";
        String DBmail = "";
        String DBpass = "";
        String form_email = "";
        String form_password = "";
        String originPage = "";
        String DBFname = "";
        String DBLname = "";
        String DBAddress = "";
        String DBusername = "";
        String DBuserType = "";
        String DBCountry = "";
        String DBPhone = "";
        response.setContentType("text/html");

        try {
            out.println("From verify Login");
            // Load the database driver
            Class.forName("com.mysql.jdbc.Driver");
            // Get a Connection to the database
            connection = DriverManager.getConnection("jdbc:postgresql://ec2-52-49-120-150.eu-west-1.compute.amazonaws.com:5432/dbt2n4ufb35tt9", "buctxcvhzkynmq", "ed63df97e3ed14918e622f6cfa76f9b0715a543608324085b8cb3dff6742d7dd");
            form_email = request.getParameter("email");
            form_password = request.getParameter("password");
            form_password = request.getParameter("password");
            originPage = request.getParameter("originURL");
            //out.println(form_email +  "   " + form_password);
            //Add Login user data to the database (Customer Table)
            String sql = "select * from usertable where email = '" + form_email + "' and password ='" + form_password + "';";
            Statement s = connection.createStatement();
            s.executeQuery(sql);
            rs = s.getResultSet();
            while (rs.next()) {
                //out.println("in while email = email and pass = pass");
                DBId = rs.getString("id");
                
                DBFname = rs.getString("firstname");
                DBLname = rs.getString("lastname");
                
                DBmail = rs.getString("email");
                DBusername = rs.getString("username");
                
                DBCountry = rs.getString("country");
                DBpass = rs.getString("password");

                DBAddress = rs.getString("address");
                DBPhone = rs.getString("phone");
                
                DBuserType = rs.getString("type");
                
            }
            rs.close();
            s.close();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        if (form_password.equals(DBpass)) {
            //user = gD.getUser(gD.getUserId(uName));

            HttpSession session = request.getSession();
            session.removeAttribute("fail");
            session.setAttribute("username", DBusername);
            session.removeAttribute("error");

            session.setAttribute("Userid", DBId);

            session.setAttribute("fName", DBFname);
            session.setAttribute("lName", DBLname);
            session.setAttribute("phone", DBPhone);
            session.setAttribute("email", DBmail);
            session.setAttribute("address", DBAddress);
            session.setAttribute("userType", DBuserType);
            session.setAttribute("country", DBCountry);
            session.setAttribute("password", DBpass);
            response.sendRedirect(originPage);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("fail", 1);
            response.sendRedirect(originPage);
        }
    }

}
