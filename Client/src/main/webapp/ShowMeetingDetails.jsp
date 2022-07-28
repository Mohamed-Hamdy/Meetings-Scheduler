<%@ page import="com.example.client.Program.Attendee" %>
<%@ page import="com.example.client.DataBase.AttendeeDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="static java.lang.System.out" %><%--
  Created by IntelliJ IDEA.
  User: Mohamed Hamdy
  Date: 6/28/2022
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Meetings List</title>

    <%
        //delete cache to prevent back button after logout
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    %>
</head>
<body>
<jsp:include page="Header.jsp" flush="true"/>
<div class="tm-container my-3">
    <div class="row">
        <%--@declare id="\"attendeemail\""--%><%--@declare id="\"attendename\""--%>
        <div class="col-lg-8  card bg-light order-lg-first order-last" style="margin-top:45px; margin-left: 15%;">
            <form name="gInfo" class="d-flex flex-column needs-validation"
                  style="height: 100%;" action="" method=""
                  novalidate>
                <%
                    if (session.getAttribute("error") != null) {
                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-sm-12 bg-light \">");
                        out.println("\n");
                        out.println("<h4 style= margin-left:40%; class=text-danger>Wrong! Please try again.</h4>");
                        out.println("</div>");
                        out.println("</div>");
                        session.removeAttribute("error");
                    }
                %>


                <%
                    String meetingid = request.getParameter("meetingid");
                    String timezone = request.getParameter("timezone");
                    String Date = request.getParameter("meetingdate");

                    String time = request.getParameter("meetingtime");
                    String title = request.getParameter("title");

                    String description = request.getParameter("meetingdescription");
                    String duration = request.getParameter("Duration");

                    String repeat = request.getParameter("meetingrepeat");
                    String meetingtype = request.getParameter("meetingtype");

                    String meetingcapacity = request.getParameter("meetingcapacity");
                    String meetingurl = request.getParameter("meetingurl");


                %>

                <h4 class="mt-4">Edit Your Meeting Info</h4>

                <hr>
                <div class="form-row">
                    <input type="hidden" class="form-control" id="meetingid" name="meetingid" value="<%=meetingid%>"
                           disabled="disabled">


                    <div class="form-group col-md-6">
                        <%--@declare id="tz"--%><label for="timezone">Timezone</label>

                        <input type="text"
                               class="form-control" id="timezone" name="timezone"
                               placeholder="Continent/Timezone" list="tz" value="<%=timezone%>" disabled="disabled"
                               required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">What is your Timezone?</div>

                    </div>

                    <div class="form-group col-md-6">
                        <%--@declare id="inputdate4"--%><label for="inputDate4">Date</label>
                        <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
                        <input type="date"
                               class="form-control" id="inputDate4"
                               name="Date"
                               placeholder="YYYY-MM-DD" min="<%=Date%>" value="<%=Date%>"
                               disabled="disabled" required>
                        <div class="date-val" id="dateValidator"></div>
                        <div class="invalid-feedback">Check your input please.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <%--@declare id="time"--%><label for="inputTime4">Time</label>
                        <input type="time"
                               class="form-control" id="inputTime4"
                               name="time"
                               placeholder="HH:MM"
                               value="<%=time%>" disabled="disabled" required>
                        <div class="time-val" id="timeValidator"></div>
                        <div class="invalid-feedback">Please provide a valid
                            time.
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <%--@declare id="title"--%><label for="title">Title</label>
                        <input type="text"
                               class="form-control" id="title" name="title"
                               placeholder="My awesome meeting" type="text" value="<%=title%>" disabled="disabled"
                               required>
                        <div class="valid-feedback">Super!</div>
                        <div class="invalid-feedback">Please Don't forget meeting title.
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Description">Description</label>
                    <input type="text"
                           class="form-control" id="Description"
                           name="description" value="<%=description%>"
                           placeholder="Meeting description"
                           disabled="disabled" required>
                    <div class="valid-feedback">So good!</div>
                    <div class="invalid-feedback">Please write meeting description
                    </div>
                </div>
                <div class="form-row ">
                    <div class="form-group col-md-6">
                        <label for="inputDuration">Duration</label>
                        <input type="number"
                               class="form-control" id="inputDuration" name="duration"
                               value="<%=duration%>" placeholder="Enter Meeting Duration in Minutes"
                               min="30" max="120"
                               disabled="disabled" required>

                        <div class="valid-feedback">Right on!</div>
                        <div class="invalid-feedback">min 30 Minutes max 120 Minutes
                        </div>

                    </div>

                    <div class="form-group col-md-6">
                        <%--@declare id="inputrepeat"--%><label for="inputRepeat">Repeat?</label>
                        <select name="repeat" class="form-control" aria-label="Default select example"
                                disabled="disabled">
                            <option selected><%=repeat%>
                            </option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <%--@declare id="inputtype"--%><label for="inputtype">Meeting Type</label>
                        <select name="meetingtype" id="meetingtype" class="form-control"
                                aria-label="Default select example" disabled="disabled">
                            <option selected><%=meetingtype%>
                            </option>
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="inputDuration">Meeting Capacity</label>

                        <input type="number"
                               class="form-control" name="add_fields_placeholderValue"
                               value="<%=meetingcapacity%>" placeholder="Enter Your Meeting Capacity" min="2" max="50"
                               disabled="disabled" required>

                        <div class="valid-feedback">Good</div>
                        <div class="invalid-feedback">Min 3 participant max 50 participant
                        </div>

                    </div>

                    <div class="form-group col-md-8">
                        <%--@declare id="inputtype"--%><label for="inputtype">Meeting URL</label>
                        <select name="meetingurl" id="meetingurl" class="form-control"
                                aria-label="Default select example" disabled="disabled">
                            <option selected><%=meetingurl%>
                            </option>
                        </select>
                    </div>


                </div>

                <!--
                <div class="my-auto w-100 ">
                    <button type="hidden" id="joinSubmitButton" class="btn btn-primary btn-block mb-2">Submit
                    </button>
                </div>
                -->
            </form>
            <hr>
            <h4 class="mt-4">List of meeting attendee</h4><br>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/meetingscheduler";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    System.out.println("0");

                    con = DriverManager.getConnection(url, user, password);
                    System.out.println("1");
                    // get values from attendee
                    String query = "SELECT * FROM attendee WHERE meeting_id= ?";
                    System.out.println("2");

                    //int Rows = Stmt.executeUpdate(line);
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(1, meetingid);
                    pst.execute();
                    ResultSet rs = pst.getResultSet();
                    System.out.println("3");
                    while (rs.next()) {
                        //rs.getInt("id");


                        out.println("<div class=\"form-row \">");
                        out.println("<div class=\"form-group col-md-6\">");
                        out.println("<label for=\"attendename\">Attendee Name</label>");
                        out.println("<input class=\"form-control\" name=\"attendeename\" disabled=\"disabled\" value=\"" + rs.getString("name") + "\"/>");
                        out.println("</div>");


                        out.println("<div class=\"form-group col-md-6\">");
                        out.println("<label for=\"attendeemail\">Attendee Email</label>");
                        out.println("<input class=\"form-control\" name=\"attendeeemail\" disabled=\"disabled\" value=\"" + rs.getString("email") + "\"/>");
                        out.println("</div>");
                        out.println("</div><br>");

                    }
                    out.println("<div class=\"form-row \">");
                    out.println("<div class=\"form-group col-md-6\">");
                    out.println("<form style =\"\" action=\"EditMeeting.jsp\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"meetingid\" value=\"" + meetingid + "\"/>");
                    out.println("<input type=\"hidden\" name=\"timezone\" value=\"" + timezone + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingdate\" value=\"" + Date + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingtime\" value=\"" + time + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingrepeat\" value=\"" + repeat + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingdescription\" value=\"" + description + "\"/>");
                    out.println("<input type=\"hidden\" name=\"title\" value=\"" + title + "\"/>");
                    out.println("<input type=\"hidden\" name=\"Duration\" value=\"" + duration + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingtype\" value=\"" + meetingtype + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingcapacity\" value=\"" + meetingcapacity + "\"/>");
                    out.println("<input type=\"hidden\" name=\"meetingurl\" value=\"" + meetingurl + "\"/>");
                    out.println("<div > <button style=\"width:100%; padding:6px 60px;\" class=\"btn btn-primary \">Edit Meeting </button></div>");
                    out.println("</form>");
                    out.println("</div>");

                    out.println("<div class=\"form-group col-md-6\">");
                    out.println("<form onsubmit=\"return confirm('Are you sure to delete this meeting?');\" style =\"\" action=\"deletemeetingServlet\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"meetingid\" value=\"" + meetingid + "\"/>");
                    out.println("<div\"> <button style=\"width:100%; padding:6px 50px;\" class=\"btn btn-danger \">Delete Meeting</button></div>");
                    out.println("</form>");
                    out.println("</div>");



                    con.close();
                    pst.close();

                } catch (Exception ex) {
                    out.println(ex);
                }

            %>

        </div>
    </div>
</div>
<br><br>
<jsp:include page="Footer.jsp" flush="true"/>
<script src="JS/CreateMeeting.js"></script>

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
