package com.example.client.DataBase;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.example.client.Program.Meeting;
import com.example.client.Program.MeetingRoom;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import static java.lang.System.out;


/**
 * @author AA
 */
@WebServlet(urlPatterns = {"/HotelDAO"})
public class MeetingDAO extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    //out.println(roomNumber);
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MeetingDAO</title>");
            out.println("</head>");
            out.println("<body>");
            //out.println("sssssssss");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public Meeting getMeeting(int meetingNumber) {
        Meeting meeting = new Meeting();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/meetingscheduler";
            String user = "root";
            String password = "root";
            Connection con = null;

            con = DriverManager.getConnection(url, user, password);
            // get values from room
            String query = "SELECT * FROM meeting WHERE id = ? ";

            //int Rows = Stmt.executeUpdate(line);
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, meetingNumber);
            pst.execute();
            ResultSet rs = pst.getResultSet();

            while (rs.next()) {
                //out.println(rs.getString("category_name"));
                meeting.setId(meetingNumber);

                meeting.setTimezone(rs.getString("Timezone"));
                meeting.setDate(rs.getString("meetingdate"));
                meeting.setTime(rs.getString("meetingtime"));

                meeting.setRepeat(rs.getString("meetingrepeat"));
                meeting.setDescription(rs.getString("meetingdescription"));
                meeting.setmeetingTinyIntToIsAvailable(rs.getInt("MeetingAvaliablity"));
                meeting.setMeetingtype(rs.getString("meetingtype"));

                meeting.setTitle(rs.getString("Title"));
                meeting.setMeetingUrl(rs.getString("meetingurl"));
                meeting.setDuration(rs.getString("Duration"));
                meeting.setCapacity(rs.getString("capacity"));
                meeting.setUserId(rs.getString("user_id"));
            }

            con.close();
            pst.close();

        } catch (Exception ex) {
            out.println(ex);
        }
        return meeting;
    }

    public void addMeeting(Meeting meeting) {
        try {
            //out.println("From add meeting");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/meetingscheduler";
            String user = "root";
            String password = "root";
            Connection con = null;
            //out.println(meeting.getmeetingTinyIntTranslate());

            con = DriverManager.getConnection(url, user, password);
            /*
            out.println(meeting.getTimezone() + " " + meeting.getDate() + " "+meeting.getTime() );
            out.println();
            out.println(meeting.getRepeat()+" "+  meeting.getDescription()+ " "+ meeting.getmeetingTinyIntTranslate() + " " + meeting.getTitle() + "  ");
            out.println();
            out.println(meeting.getMeetingUrl() + " " + meeting.getDuration() + "  "+ meeting.getMeetingtype() + "  " + meeting.getUserId());
             */
            try (PreparedStatement pstmt = con.prepareStatement(
                    "INSERT INTO meeting(Timezone,meetingdate,meetingtime,meetingrepeat,meetingdescription,MeetingAvaliablity,Title,meetingurl,Duration,meetingtype,capacity,user_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)")) {

                pstmt.setString(1, meeting.getTimezone());
                pstmt.setString(2, meeting.getDate());
                pstmt.setString(3, meeting.getTime());
                pstmt.setString(4, meeting.getRepeat());
                pstmt.setString(5, meeting.getDescription());
                pstmt.setInt(6, meeting.getmeetingTinyIntTranslate());
                pstmt.setString(7, meeting.getTitle());

                pstmt.setString(8, meeting.getMeetingUrl());
                pstmt.setString(9, meeting.getDuration());
                pstmt.setString(10, meeting.getMeetingtype());
                pstmt.setString(11, meeting.getCapacity());
                pstmt.setString(12, meeting.getUserId());

                pstmt.executeUpdate();
                pstmt.close();

            }
            //out.println("after insert");

            con.close();

        } catch (Exception ex) {
            out.println(ex);
        }
    }


    public void updateMeeting(Meeting meeting , String meetingID) {
        try {
            //out.println("From add meeting");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/meetingscheduler";
            String user = "root";
            String password = "root";
            Connection con = null;

            con = DriverManager.getConnection(url, user, password);
            HttpServletRequest request = null;
            //System.out.println("from update");



            PreparedStatement pstmt = con.prepareStatement(
                    "UPDATE meeting SET Timezone = ?, meetingdate = ?,  meetingtime = ? , meetingrepeat = ? , meetingdescription = ? , Title = ?, Duration = ?, capacity = ? , meetingtype = ?  WHERE id = ? ");

            pstmt.setString(1, meeting.getTimezone());
            pstmt.setString(2, meeting.getDate());
            pstmt.setString(3, meeting.getTime());
            pstmt.setString(4, meeting.getRepeat());
            pstmt.setString(5, meeting.getDescription());
            pstmt.setString(6, meeting.getTitle());

            pstmt.setString(7, meeting.getDuration());
            pstmt.setString(8, meeting.getCapacity());
            pstmt.setString(9, meeting.getMeetingtype());
            pstmt.setString(10, meetingID);
            //System.out.println("before execute");

            pstmt.executeUpdate();
            //System.out.println("after execute");


            pstmt.close();

            con.close();
            //System.out.println("Done update");

        } catch (Exception ex) {
            out.println(ex);
        }
    }

    public void deleteMeeting(String meetingID) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/meetingscheduler";
            String user = "root";
            String password = "root";
            Connection con = null;

            con = DriverManager.getConnection(url, user, password);

            PreparedStatement stmt = con.prepareStatement("DELETE from meetingroom where meeting_id=?");
            stmt.setString(1, meetingID);
            int i = stmt.executeUpdate();

            PreparedStatement stmt1 = con.prepareStatement("DELETE from attendee where meeting_id=?");
            stmt1.setString(1, meetingID);
            int i1 = stmt1.executeUpdate();

            PreparedStatement stmt2 = con.prepareStatement("DELETE from calender where meeting_id=?");
            stmt2.setString(1, meetingID);
            int i2 = stmt2.executeUpdate();

            PreparedStatement stmt3 = con.prepareStatement("DELETE from meeting where id=?");
            stmt3.setString(1, meetingID);
            int i3 = stmt3.executeUpdate();

            con.close();
            //out.println("Deleted");
        } catch (Exception ex) {
            out.println(ex);
        }
    }
}
