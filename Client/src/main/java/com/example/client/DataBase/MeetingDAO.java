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


//    public ArrayList<Meeting> checkFunction(PrintWriter out, Date desiredCheckIn, Date desiredCheckOut, String location, int numberOfGuest, String filter) {
//
////        out.println("From HotelDAO_function");
////        out.println(desiredCheckIn);
////        out.println(desiredCheckOut);
////        out.println(location);
////        out.println(numberOfGuest);
//        ArrayList<Meeting> meetings = new ArrayList<Meeting>();
//        int controller = numberOfGuest;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            String url = "jdbc:mysql://localhost:3306/meeting-scheduler";
//            String user = "root";
//            String password = "root";
//            Connection con = null;
//            int hotelNumber = 0;
//            boolean meeting_availability;
//            boolean meetingvailable;
//            String name = "";
//            int values[] = new int[2];
//            boolean meeting_vailable = false;
//            con = DriverManager.getConnection(url, user, password);
//            Statement Stmt = con.createStatement();
//            ResultSet filter_rs = Stmt.executeQuery("SELECT * FROM meeting ORDER BY "+ filter +" DESC");
//            
//            while (filter_rs.next()){
//                String DBLocation = filter_rs.getString("hotel_Location");
//                int capacity = filter_rs.getInt("max_allowance");
//
//                if ((location.equals(DBLocation)) && (numberOfGuest == capacity )) {
//                    // First check if room with assigned roomNumber is FREE
//                    hotelNumber = filter_rs.getInt("hotelid");
//                    hotel_availability = filter_rs.getBoolean("hotel_availability");
//                    //name = rs.getString("hotel_name");
//
//                    if (hotel_availability == true) {
//                        values = checkusingDate(out, hotelNumber, desiredCheckIn, desiredCheckOut, location);
//                        hotel_vailable = (values[1] == 100); // convert from int to boolean
//                        hotel_vailable = true;
//                    } else {
//                        hotel_vailable = false;
//                    }
////                out.println("id :" + values[0]);
////                out.println("<br>");
////                out.println("int valid : " +values[1]);
////                out.println("<br>");
////                out.println("bool valid :" + hotel_vailable);
//
//                    if (hotel_vailable == true && (values[0] != 0)) {
//                        HotelDAO rD = new HotelDAO();
//                        hotels.add(rD.getHotel(values[0]));
//                    }
//                }
//            }
//
//            //hotelid = hotels.get(i).getHotelNumber();
////            HttpSession sessionid = request.getSession();
////            sessionid.setAttribute("hotelid", hotelid);
//            //System.out.println(hotelNumber);
//            con.close();
//
//        } catch (Exception ex) {
//            System.out.println(ex);
//        }
//
//        return hotels;
//    }
//
//    public int[] checkusingDate(PrintWriter out, int desiredRoom, Date desiredCheckIn, Date desiredCheckOut, String Location) {
//        // Method to avoid creating a booking on a room that is already booked
//        // Based on date
//        boolean HotelAvailable = true;
//        int isValid = 0;
//        int id = 0;
//
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            String url = "jdbc:mysql://localhost:3306/hrsystem";
//            String user = "root";
//            String password = "root";
//            Connection con = null;
//
//            con = DriverManager.getConnection(url, user, password);
//
//            String query = "SELECT b.hotelid , b.hotel_availability FROM hotel AS b WHERE"
//                    /*
//			Date equal or in between
//                     */
//                    + " (b.hotelid = ? "
//                    + "AND b.check_in <= ? "
//                    + "AND b.check_out >= ?) "
//                    /*
//                        Date starting before checkIn and concluding on anytime after checkIn
//                     */
//                    + "OR "
//                    + "(b.hotelid = ? "
//                    + "AND b.check_in >= ? "
//                    + "AND b.check_in < ?) "
//                    // Date starting after checkIn but before checkOut
//                    + "OR "
//                    + "(b.hotelid = ? "
//                    + "AND b.check_in < ? "
//                    + "AND b.check_out > ?)";
//
//            PreparedStatement pst = con.prepareStatement(query);
//            pst.setInt(1, desiredRoom);
//            pst.setDate(2, desiredCheckIn);
//            pst.setDate(3, desiredCheckOut);
//            pst.setInt(4, desiredRoom);
//            pst.setDate(5, desiredCheckIn);
//            pst.setDate(6, desiredCheckOut);
//            pst.setInt(7, desiredRoom);
//
//            pst.setDate(8, desiredCheckIn);
//            pst.setDate(9, desiredCheckIn);
//            pst.execute();
//            ResultSet rs = pst.getResultSet();
//            while (rs.next()) {
//                isValid = rs.getInt("hotel_availability");
//                id = rs.getInt("hotelid");
//                //out.println(rs.getInt(rs.getInt("is_valid")));
////                out.println(name);
////                out.println(isValid);
////                out.println("<br>");
//                if (isValid == 1) {
//                    HotelAvailable = false;
//                }
//                if (isValid == 0) {
//                    continue;
//                }
//            }
//            con.close();
//            pst.close();
//
//        } catch (Exception ex) {
//            System.out.println(ex);
//        }
//
//        return new int[]{id, isValid};
//    }
}
