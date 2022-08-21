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
            <button class="btn btn-outline-primary" onclick="window.location='meetingsanotherview.jsp'"><svg xmlns="http://www.w3.org/2000/svg" width="27" height="25" fill="currentColor" class="bi bi-grid" viewBox="0 0 16 16">
                <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
            </svg>     Cards View</button>

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
            connection = DriverManager.getConnection("jdbc:postgresql://ec2-52-49-120-150.eu-west-1.compute.amazonaws.com:5432/dbt2n4ufb35tt9", "buctxcvhzkynmq", "ed63df97e3ed14918e622f6cfa76f9b0715a543608324085b8cb3dff6742d7dd");
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
                HttpSession meetingsession = (HttpSession) request.getSession();
                meetingsession.removeAttribute("error");
                meetingsession.setAttribute("meetingid", meetingid);
                String meetingIDstr = String.valueOf(meetingid);
                if (id_session != null) {
                    //out.println(userid + " " + meetingid);

                    out.println("<div class=\"card mb-4\">");

                    out.println("<div class=\"card-body\">");






                    out.println("<h3 class=\"card-title  text-center\">" + title + "</h3>");
                    out.println("<h4 class=\"card-subtitle mb-2 text-muted\"> Duration : " + Duration + " Minute Meeting</h4>");
                    out.println("<h6 class=\"card-text mb-2 text-muted\"> Type : " + meetingtype + " Meeting</h5>");
                    out.println("<h6 class=\"card-title mb-2 text-muted\"> TimeZone : " + Timezone + "</h6>");
                    out.println("<h6 class=\"card-title mb-2 text-muted\"> Meeting Capacity : " + meetingcapacity + "</h6>");

                    out.println("<form  onsubmit=\"return confirm('Are you sure to delete this meeting?');\" style =\"position:absolute;right:1.7%; bottom:60%;\" action=\"deletemeetingServlet\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"meetingid\" value=\"" + meetingIDstr + "\"/>");
                    out.println("<div class=\"text-right\"> <button style=\"padding:6px 50px;\" class=\"btn btn-outline-danger \">Delete Meeting</button></div>");
                    out.println("</form>");

                    out.println("<form style =\"position:absolute;right:1.7%; bottom:35%;\" action=\"EditMeeting.jsp\" method=\"post\">");
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
                    out.println("<div  class=\"text-right\"> <button style=\"padding:6px 60px;\" class=\"btn btn-outline-secondary \">Edit Meeting </button></div>");
                    out.println("</form>");


                    out.println("<form style =\"position:absolute;right:1.7%; bottom:10%;\" action=\"ShowMeetingDetails.jsp\" method=\"post\">");
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

                    out.println("<div class=\"text-right\"> <button style=\"padding:6px 59px;\" class=\"btn btn-outline-primary \">Show Details</button></div>");

                    out.println("</form>");

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

    %>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="Footer.jsp" flush="true"/>
<script src="JS/rooms.js"></script>
<script>
    function validate(form) {

        // validation code here ...


        if(!valid) {
            alert('Please correct the errors in the form!');
            return false;
        }
        else {
            return confirm('Do you really want to submit the form?');
        }
    }
</script>
<form onsubmit="return validate(this);">

</body>
</html>