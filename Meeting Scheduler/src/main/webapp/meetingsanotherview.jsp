<%--
  Created by IntelliJ IDEA.
  User: Manzoma
  Date: 7/31/2022
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.example.client.Program.Meeting" %>
<%@ page import="com.example.client.DataBase.MeetingDAO" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarHeader"
                    aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <button class="btn btn-primary" onclick="window.location='CreateMeeting.jsp'">Create Meeting</button>
            <button class="btn btn-outline-primary" onclick="window.location='meetings.jsp'"><svg xmlns="http://www.w3.org/2000/svg" width="27" height="25" fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
            </svg>     List View</button>
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
            String id_session = request.getSession().getAttribute("Userid").toString();
            int userid = Integer.valueOf(id_session);
            String uname = request.getSession().getAttribute("username").toString();

            String sql = "select id from meeting where user_id = '" + userid + "' ;";
            Statement s = connection.createStatement();
            s.executeQuery(sql);
            rs = s.getResultSet();
            int index = 0;
            while (rs.next()) {
                M = rd.getMeeting(rs.getInt("id"));
                meetingArray.add(index, M);
                index++;
            }

            out.println("<div class=\"row\">");

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
                String meetingIDstr = String.valueOf(meetingid);
                if (id_session != null) {
                    //out.println(userid + " " + meetingid);


                    out.println("<div class=\"col-sm-4\" style =\"padding:10px;\" >");
                    out.println("<div  class=\"card\">");
                    out.println("<div class=\"card-body\">");


                    out.println("<h3 class=\"card-title text-center\">" + title + "</h3>");
                    out.println("<h4 class=\"card-subtitle mb-2 text-muted text-center\"> Duration : " + Duration + " </h4>");
                    out.println("<h6 class=\"card-text mb-2 text-muted text-center\"> Type : " + meetingtype + " Meeting</h5>");
                    out.println("<h6 class=\"card-title mb-2 text-muted text-center\"> TimeZone : " + Timezone + "</h6>");
                    out.println("<h6 class=\"card-title mb-2 text-muted text-center\"> Meeting Capacity : " + meetingcapacity + "</h6>");
                    out.println("<hr>");

                    out.println("<form style =\"display:inline;\" action=\"ShowMeetingDetails.jsp\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"meetingid\" value=\"" + meetingIDstr + "\"/>");
                    out.println("<input type=\"hidden\" name=\"timezone\" value=\"" + Timezone + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingdate\" value=\"" + meetingdate + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingtime\" value=\"" + meetingtime + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingrepeat\" value=\"" + meetingrepeat + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingdescription\" value=\"" + meetingdescription + "\"/>");
                    out.println("<input type=\"hidden\" name=\"title\" value=\"" + title + "\"/>");
                    out.println("<input type=\"hidden\" name=\"Duration\" value=\"" + Duration + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingtype\" value=\"" + meetingtype + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingcapacity\" value=\"" + meetingcapacity + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingurl\" value=\"" + meetingurl + "\"/>");
                    out.println("<button class=\"btn btn-secondary \">view</button>");
                    out.println("</form>");


                    out.println("<form style =\"display:inline;\" action=\"EditMeeting.jsp\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"meetingid\" value=\"" + meetingIDstr + "\"/>");
                    out.println("<input type=\"hidden\" name=\"timezone\" value=\"" + Timezone + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingdate\" value=\"" + meetingdate + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingtime\" value=\"" + meetingtime + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingrepeat\" value=\"" + meetingrepeat + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingdescription\" value=\"" + meetingdescription + "\"/>");
                    out.println("<input type=\"hidden\" name=\"title\" value=\"" + title + "\"/>");
                    out.println("<input type=\"hidden\" name=\"Duration\" value=\"" + Duration + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingtype\" value=\"" + meetingtype + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingcapacity\" value=\"" + meetingcapacity + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingurl\" value=\"" + meetingurl + "\"/>");
                    out.println("<button class=\"btn btn-primary \">Edit</button>");
                    out.println("</form>");


                    out.println("<form style =\"display:inline; float:right;\" onsubmit=\"return confirm('Are you sure to delete this meeting?');\"  action=\"deletemeetingServlet\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"meetingid\" value=\"" + meetingIDstr + "\"/>");
                    out.println(" <button  class=\"btn btn-danger\">Delete</button>");
                    out.println("</form>");


                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");

                } else {
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
        out.println("</div>");

    %>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="Footer.jsp" flush="true"/>
<script src="JS/rooms.js"></script>
<script>
    function validate(form) {

        // validation code here ...


        if (!valid) {
            alert('Please correct the errors in the form!');
            return false;
        } else {
            return confirm('Do you really want to submit the form?');
        }
    }
</script>
<form onsubmit="return validate(this);">

</body>
</html>
