<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.example.client.Program.Meeting" %>
<%@ page import="com.example.client.DataBase.MeetingDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Meetings List</title>


    <%
        //delete cache to prevent back button after logout
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    %>

</head>
<body class="themeColor">
<jsp:include page="Header.jsp" flush="true"/>

<div class="container" style="padding-top:20px; ">
    <div class="w-100" style="position: relative; ">
        <div style=" position: absolute; font-size: 25px;">Our Meetings</div>
        <div class="text-right" style="padding-bottom:25px; ">

            <button class="btn btn-primary" onclick="window.location='CreateMeeting.jsp'">Create Meeting</button>
        </div>
    </div>

    <%
        Connection connection = null;

        Connection connection_1 = null;
        ResultSet rs;
        ResultSet result;
        int number_of_rows = 0;
        int first_id = 0;

        ArrayList<Meeting> meetingArray = new ArrayList<Meeting>();
        MeetingDAO rd = new MeetingDAO();
        Meeting M = new Meeting();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            // Get a Connection to the database
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/meetingscheduler", "root", "root");
            //connection_1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hrsystem", "root", "root");
            String id_session = request.getSession().getAttribute("Userid").toString();
            int userid = Integer.valueOf(id_session);
            String uname =request.getSession().getAttribute("username").toString();

            String sql ="select id from meeting where user_id = '" + userid + "' ;";
                    Statement s = connection.createStatement();
            s.executeQuery(sql);
            rs = s.getResultSet();
            int index = 0;
            while (rs.next()) {
                M = rd.getMeeting(rs.getInt("id"));
                meetingArray.add(index, M);
                index++;
            }


            for (int i = 0; i < meetingArray.size(); i++) {

                //h = hotelArray.get(i);

                String Timezone = meetingArray.get(i).getTimezone();

                String meetingdate = meetingArray.get(i).getDate();

                String meetingtime = meetingArray.get(i).getTime();

                String meetingrepeat = meetingArray.get(i).getRepeat();

                String meetingdescription = meetingArray.get(i).getDescription();

                int MeetingAvaliablity = meetingArray.get(i).getmeetingTinyIntTranslate();
                boolean available;

                // Check if it's greater than equal to 1
                if (MeetingAvaliablity >= 1) {
                    available = true;
                } else {
                    available = false;
                }
                String title = meetingArray.get(i).getTitle();
                String meetingurl = meetingArray.get(i).getMeetingUrl();
                String Duration = meetingArray.get(i).getDuration();
                String meetingtype = meetingArray.get(i).getMeetingtype();
                String meetingcapacity = meetingArray.get(i).getCapacity();

                //String uid = meetingArray.get(i).getUserId();
                int meetingid = meetingArray.get(i).getId();
                HttpSession meetingsession = request.getSession();
                meetingsession.removeAttribute("error");
                meetingsession.setAttribute("meetingid", meetingid);

                if(id_session != null) {
                        //out.println(userid + " " + meetingid);
                        out.println("<div class=\"card mb-4\">");
                        out.println("<div class=\"card-body\">");
                        out.println("<h3 class=\"card-title  text-center\">" + title + "</h3>");
                        out.println("<h4 class=\"card-subtitle mb-2 text-muted\"> Duration : " + Duration + " Minute Meeting</h4>");
                        out.println("<h6 class=\"card-text mb-2 text-muted\"> Type : " + meetingtype + " Meeting</h5>");
                        out.println("<h6 class=\"card-title mb-2 text-muted\"> TimeZone : " + Timezone + "</h6>");
                        out.println("<h6 class=\"card-title mb-2 text-muted\"> Meeting Capacity : " + meetingcapacity + "</h6>");
                        out.println("<div class=\"text-right\"> <button href=\"#\" class=\"btn btn-primary \">Show Details</button></div>");
                        out.println("</div>");
                        out.println("</div>");
                    }

                    else{
                        out.println("<div class=\"jumbotron marginx-10\">");
                        out.println("<h1 class=\"display-4\">Join the family!</h1>\n" + "");

                        out.println("<p class=\"lead\">In just under one minute join the family, get\n" + "weekly rewards and invitations for special events.</p>");
                        out.println("<hr class=\"my-4\">\n" + "");

                        out.println("<p>\n" +
                                "                <em>Did you know that our Hotel donates 10% of annual revenue to\n" +
                                "                    fire fighters and forest conservationists?</em>\n" +
                                "            </p>\n" +
                                "            ");
                        out.println("<a class=\"btn btn-primary btn-lg\" href=\"Join.jsp\" role=\"button\">Learn\n" +
                                "                more</a>\n" +
                                "        ");

                        out.println("</div>");

                    }
            }

        } catch (NullPointerException e) {
            M = null;
            meetingArray.add(M);
            System.out.println(e);
        }

    %>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="Footer.jsp" flush="true"/>
<script src="JS/rooms.js"></script>


</body>
</html>