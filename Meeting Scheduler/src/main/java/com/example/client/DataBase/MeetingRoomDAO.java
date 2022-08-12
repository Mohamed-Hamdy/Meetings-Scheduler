package com.example.client.DataBase;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.example.client.Program.Attendee;
import com.example.client.Program.MeetingRoom;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author AA
 */
@WebServlet(urlPatterns = {"/MeetingRoomDAO"})
public class MeetingRoomDAO extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
            out.println("<title>Servlet MeetingRoomDAO</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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

    public MeetingRoom getMeetingRoom(int roomNumber) {
        MeetingRoom room = new MeetingRoom();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/meetingscheduler";
            String user = "root";
            String password = "root";
            Connection con = null;

            con = DriverManager.getConnection(url, user, password);

            // get values from MeetingRoom
            String query = "SELECT r.meeting_id, r.attendee_id"
                    + "FROM meetingroom AS r "
                    + "WHERE r.id= ?";

            //int Rows = Stmt.executeUpdate(line);
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, roomNumber);
            pst.execute();
            ResultSet rs = pst.getResultSet();

            while (rs.next()) {
                room.setId(roomNumber);

                room.setMeeting_id(rs.getInt("meeting_id"));
                room.setAttendee_id(rs.getInt("attendee_id"));

            }

            con.close();
            pst.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return room;
    }
    
    
    public MeetingRoom getRoom_by_meeting_id(int MeetingId) {
        MeetingRoom room = new MeetingRoom();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/meetingscheduler";
            String user = "root";
            String password = "root";
            Connection con = null;

            con = DriverManager.getConnection(url, user, password);

            // get values from MeetingRoom
            String query = "SELECT  r.id, r.attendee_id"
                    + "FROM meetingroom AS r "
                    + "WHERE r.meeting_id= ?";

            //int Rows = Stmt.executeUpdate(line);
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, MeetingId);
            pst.execute();
            ResultSet rs = pst.getResultSet();

            while (rs.next()) {
                //out.println(rs.getString("category_name"));
                room.setMeeting_id(MeetingId);
                room.setId(rs.getInt("id"));
                room.setAttendee_id(rs.getInt("attendee_id"));

            }

            con.close();
            pst.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return room;
    }
    public void addMeetingRoom(MeetingRoom Room) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/meetingscheduler";
            String user = "root";
            String password = "root";
            Connection con = null;

            con = DriverManager.getConnection(url, user, password);

                String query = "INSERT into meetingroom(meeting_id, attendee_id) values (?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, Room.getMeeting_id());
            pst.setInt(2, Room.getAttendee_id());
            pst.executeUpdate();
            con.close();
            pst.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

}
//public void addRoomType(RoomType newRoomType) {
//		connect();
//		
//		try {
//			String query = "INSERT into room_type values (?,?,?)";
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setString(1, newRoomType.getCategory());
//			pst.setDouble(2, newRoomType.getPricePerNight());
//			pst.setInt(3, newRoomType.getMaxGuestAAllowance());
//			pst.executeUpdate();
//			con.close();
//			pst.close();
//			
//		} catch (Exception ex) {
//			System.out.println(ex);
//		}
//	}
//
//	public void updateCategoryName(String categoryName, String newName) {
//		connect();
//		
//		try {
//			String query = "UPDATE room_type SET category_name= ? "
//						+"WHERE category_name= ?";
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setString(1, categoryName);
//			pst.setString(2, newName);
//			pst.executeUpdate();
//			con.close();
//			pst.close();
//			
//		} catch (Exception ex) {
//			System.out.println(ex);
//		}
//	}
//
//	public void updatePPNight(String categoryName, double pPNight) {
//		connect();
//		try {
//			String query = "UPDATE room_type SET price_per_night= ? "
//							+"WHERE category_name= ?";
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setDouble(1, pPNight);
//			pst.setString(2, categoryName);
//			pst.executeUpdate();
//			con.close();
//			pst.close();
//			
//		} catch (Exception ex) {
//			System.out.println(ex);
//		}
//	}
//
//	public void updateMaxAllowance(String categoryName, int maxAllowance) {
//		connect();
//		
//		try {
//			String query = "UPDATE room_type SET max_allowance= ? "
//							+"WHERE category_name= ?";
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setDouble(1, maxAllowance);
//			pst.setString(2, categoryName);
//			pst.executeUpdate();
//			con.close();
//			pst.close();
//			
//		} catch (Exception ex) {
//			System.out.println(ex);
//		}
//	}
//
//	public void updateImg(String categoryName, String imgURL) {
//		connect();
//		
//		try {
//			String query = "UPDATE room_type SET image= ? "
//							+"WHERE category_name= ?";
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setString(1, imgURL);
//			pst.setString(2, categoryName);
//			pst.executeUpdate();
//			con.close();
//			pst.close();
//			
//		} catch (Exception ex) {
//			System.out.println(ex);
//		}
//	}
//
//	public void updateRoomDescription(String categoryName, String roomDescription) {
//		connect();
//		try {
//			String query = "UPDATE room_type SET room_description= ? "
//							+"WHERE category_name= ?";
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setString(1, roomDescription);
//			pst.setString(2, categoryName);
//			pst.executeUpdate();
//			con.close();
//			pst.close();
//			
//		} catch (Exception ex) {
//			System.out.println(ex);
//		}
//	}
//
//	public void updateRoomDetails(String categoryName, String roomDetails) {
//		connect();
//		
//		try {
//			String query = "UPDATE room_type SET room_details= ? "
//							+"WHERE category_name= ?";
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setString(1, roomDetails);
//			pst.setString(2, categoryName);
//			pst.executeUpdate();
//			con.close();
//			pst.close();
//			
//		} catch (Exception ex) {
//			System.out.println(ex);
//		}
//	}
