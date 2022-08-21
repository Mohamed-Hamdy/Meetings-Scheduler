<%-- 
    Document   : room-details
    Created on : Jan 9, 2021, 9:25:34 PM
    Author     : AA
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.example.client.Program.Meeting" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>jsp page</title>

        <!-- Google Font -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap&libraries=&v=weekly"
            defer
        ></script>
        <!-- Css Styles -->
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/flaticon.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/nice-select.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="CSS/Meetingdetailsjs/style.css" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="CSS/Tables.css" media="screen" type="text/css" />
        <style>
            .carousel-inner img {
                width: 100%;
                height: 100%;
            </style>
            <%
                //delete cache to prevent back button after logout
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            %>

        </head>
        <body>
            <%
                HttpSession usersession = (HttpSession) request.getSession();
                int hotelid = Integer.parseInt(request.getParameter("hid"));
                //int hotelid = Integer.parseInt(hotelnumber);
                String id_session = request.getSession().getAttribute("Userid").toString();
                String meetingid = request.getSession().getAttribute("meetingid").toString();

                ArrayList<Meeting> Meetings = new ArrayList<Meeting>();

                ResultSet rs = null;
                ResultSet Drs = null;

                Connection con = null;
                try {
                    // Load the database driver
                    Class.forName("com.mysql.jdbc.Driver");
                    // Get a Connection to the database
                    con = DriverManager.getConnection("jdbc:postgresql://ec2-52-49-120-150.eu-west-1.compute.amazonaws.com:5432/dbt2n4ufb35tt9", "buctxcvhzkynmq", "ed63df97e3ed14918e622f6cfa76f9b0715a543608324085b8cb3dff6742d7dd");

                    //Add Login user data to the database (Customer Table)
                    String sql = "select * from meeting where id = '" + meetingid + "';";

                    Statement s = con.createStatement();
                    s.executeQuery(sql);
                    rs = s.getResultSet();

                    RoomDAO rD = new RoomDAO();

                    while (rs.next()) {
                        count_of_rooms = rs.getInt("hotel_hotelid");
                        room_id = rs.getInt("room_id");
                        rooms.add(rD.getRoom(room_id));
                        counter++;
                        //out.println("d");
                    }
                    Date RcheckIn = null;
                    Date RcheckOut = null;

                    for (int i = 0; i < rooms.size(); i++) {
                        String room_Date_sql = "select check_in , check_out from booking where room_room_id = '" + rooms.get(i).getRoomNumber() + "';";
                        Statement Date_s = con.createStatement();
                        Date_s.executeQuery(room_Date_sql);
                        Drs = Date_s.getResultSet();
                        while (Drs.next()) {
                            RcheckIn = Drs.getDate("check_in");
                            RcheckOut = Drs.getDate("check_out");
                        }
                        rooms.get(i).setroomcheckIn(RcheckIn);
                        rooms.get(i).setroomcheckOut(RcheckOut);

//                        out.println("<br>");
//                        out.println(rooms.get(i).getRoomNumber());
//                        out.println(rooms.get(i).gethotelid());
//                        out.println(rooms.get(i).getRoomCategoryName());
//                        out.println("<br>");
                    }
                    //out.println("count_of_rooms : " + counter);
                    rs.close();
                    s.close();
                } catch (Exception e) {
                    System.out.println("Exception is ;" + e);
                    out.println(e);
                }

                //String hotel_location = (String) session.getAttribute("hotellocation");
//                int size = (int) session.getAttribute("size");
//                //int counter = (int) session.getAttribute("counter");
//                ArrayList<String> maps_url_array = new ArrayList<String>(); // Create an ArrayList object
//                String name = "";
//                for (int i = 0; i < size; i++) {
//                    String s_name = "map_url_array." + String.valueOf(i);
//                    String spliter[] = s_name.split("\\.");
//                    String url = (String) session.getAttribute(s_name);
//                    maps_url_array.add(i, url);
//                    if(i == (size-1)){
//                       name = ""; 
//                       name =  maps_url_array.get(Integer.parseInt(spliter[1]));
//                      
//                    }
//                }
//                out.print(name);
//                    
//                out.println(img2_url);
//                out.println(img3_url);
//                out.println(img4_url);
%>
            <jsp:include page="Header.jsp" flush="true" />

            <!--            <div class="bg-dark">
                            <div class="tm-container">
                                <form name="searchRoom" method="post">
                                    <div class="form-row">
                                        <div class="col-sm-3 py-3">
                                            <input type="text" id="checkInSide" class="form-control checkIn"
                                                   placeholder="Check-in" readonly>
                                        </div>
                                        <div class="col-sm-3 py-3">
                                            <input type="text" id="checkOutSide" class="form-control checkOut"
                                                   placeholder="Check-out" readonly>
                                        </div>
                                        <div class="col-sm-2 py-3">
                                            <input type="number" class="form-control" placeholder="Guests"
                                                   name="numberOfGuestSide" id="numberOfGuestSide" min="1" max="3"
                                                   value="2" required>
                                        </div>
            
                                        <div class="col-sm-2 py-3">
                                            <button type="button"
                                                    class="btn btn-outline-warning mr-0 float-right btn-block"
                                                    onclick="RoomAvailabilityChecker()">Book</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>-->

            <div id="main_content" class="tm-container clearfix px-0">
                <div class="container fadeIn bg-white pl-0 float-left clearfix">
                    <div class="row my-4">
                        <div class="col-lg-8">
                            <img class="rounded" src="<%=img1_url%>" alt="hotel lounge" />
                        </div>
                        <div class="col-lg-4">
                            <h2 class="brand mt-2"><%=hotelName%></h2>
                            <h4>
                                <q>In a glorious True North setting amid supreme natural
                                    wonders</q>
                            </h4>
                            <p>Inside the hotel, one now finds warm, welcoming rooms that
                                feature the finest quality traditional materials accented by
                                modern touches, bringing to mind a friend's home in the mountains.
                                Here, too, one discovers fine restaurants, fun eateries, a
                                stunning wellness and spa area, conference facilities, a lounge
                                "living room" with unparalleled views and an accompanying
                                fireplace and library of 500 books.</p>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="container fadeIn bg-white float-right pr-0 clearfix">
                    <div class="row my-4">
                        <div class="col-lg-4">
                            <h4>
                                <q>The guestrooms at Patagonia Hotel capture the essence of a
                                    friend's mountain retreat</q>
                            </h4>
                            <p>Double Rooms are either 28 square meters and face north or
                                20 square meters and face south (some south-facing Double rooms
                                have slightly restricted views). Single rooms are south-facing and
                                18 square meters. All rooms include bath and shower, flat-screen
                                televisions, and a "Suitepad" with over 100 complimentary daily
                                newspapers and magazines in German, English, and French.</p>
                            <br>
                        </div>
                        <div class="col-lg-8">
                            <img class="rounded" src="<%=hotelimage%>"
                                 alt="Mountain retreat" />
                        </div>
                    </div>
                </div>
            </div>
            <%
                if (rooms.size() != 0) {
                    for (int i = 0; i < rooms.size(); i++) {

                        String[] options = new String[]{"Standard", "Standard +", "Premium"};
                        String rDetails = rooms.get(i).getRoomDetails();
                        String[] detailsArray = rDetails.split("\\.");
                        String catogry = rooms.get(i).getRoomCategoryName();
                        //String[] options = catogry.split("\\.");

                        out.println("<div class=\"card mb-3\" style=\"max-width: 100%;\">");
                        out.println("<div class=\"row no-gutters\">");
                        out.println("<div class=\"col-md-4\">");
                        out.println("<img src=" + rooms.get(i).getImgURL() + " ckass=card-img alt=Hotel_Image >");
                        out.println("</div>");

                        out.println("<div class=\"col-md-8 \" style=\"max-width: 100%;\">");
                        out.println("<div class=\"card-body d-flex flex-column\" style=\"min-height: 100%;\" >");
                        out.println("<h3 class=\"card-title\">" + rooms.get(i).getRoomNumber() + "</h3>");

                        out.println("<h3 class=\"card-title\">" + options[1] + " Room </h3>");
                        out.println("<p class=\"card-text\">" + rooms.get(i).getRoomDescription() + "</p>");
                        out.println("<div class=\"ml-4 \" ><ul><li>" + detailsArray[0] + "</li>");
                        out.println("<li>" + detailsArray[1] + "</li></ul></div>");
                        out.println("<h5>Price per Night $ " + rooms.get(i).getPricePerNight() + "</h5>");
                        out.println("<p class=\"card-text\"> This room available from " + rooms.get(i).getroomcheckIn() + " To " + rooms.get(i).getroomcheckOut() + "</p>");

                        out.println("<form name=\"select\" class=\"mt-auto\" action=\"SelectedRoom\" method=\"post\">");
                        //out.println("<input name=\"hotelid\" type=\"hidden\" value=\"" + hotel_id + "\"/>");
                        out.println("<input name=\"categ\" type=\"hidden\" value=\"" + options[i] + "\"/>");
                        out.println("<input name=\"img\" type=\"hidden\" value=\"" + rooms.get(i).getImgURL() + "\"/>");
                        out.println("<input name=\"price\" type=\"hidden\" value=\"" + rooms.get(i).getPricePerNight() + "\"/>");
                        out.println("<input name=\"hNum\" type=\"hidden\" value=\"" + rooms.get(i).gethotelid() + "\"/>");
                        out.println("<input name=\"rNum\" type=\"hidden\" value=\"" + rooms.get(i).getRoomNumber() + "\"/>");
                        out.println("<input name=\"cIn\" type=\"hidden\" value=\"" + rooms.get(i).getroomcheckIn() + "\"/>");
                        out.println("<input name=\"cOut\" type=\"hidden\" value=\"" + rooms.get(i).getroomcheckOut() + "\"/>");
                        out.println("<input name=\"numGuest\" type=\"hidden\" value=\"" + rooms.get(i).getMaxGuestAAllowance() + "\"/>");
                        out.println("<input name=\"rDescription\" type=\"hidden\" value=\"" + rooms.get(i).getRoomDescription() + "\"/>");
                        out.println("<input name=\"rDetails\" type=\"hidden\" value=\"" + rDetails + "\"/>");
                        out.println("<button type=\"submit\" class=\"btn btn-outline-warning btn-md btn-block \">Book</button>");
                        out.println("</form>");

//                    out.println("<form name=\"searchRoom\" class=\"mt-auto\" action=\"Room_Check_Availability\" method=\"post\">");
//                    out.println("<input name=\"checkIn\" id=\"checkInSide\" type=\"text\" value=\"" + rooms.get(i).getroomcheckIn() + "\"/>");
//                    out.println("<input name=\"checkOut\"  id=\"checkOutSide\" type=\"text\" value=\"" + rooms.get(i).getroomcheckOut() + "\"/>");
//                    out.println("<input name=\"numberOfGuest\" id=\"numberOfGuestSide\" type=\"hidden\" value=\"" + rooms.get(i).getMaxGuestAAllowance() + "\"/>");
//                    out.println("<button type=\"submit\" class=\"btn btn-outline-warning btn-md btn-block \">Book</button>");
//                    out.println("</form>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                        out.print("</div>");
                    }
                } else {
                    out.println(rooms.size());
                    out.println("<center><div class=\"col-md-4 room_container clearfix\">");
                    out.println("<h2> There are no rooms available in this hotel now Thanks </h2>");
                    out.println("<a href=\"Rooms.jsp\"><button type=\"submit\" class=\"btn btn-outline-warning btn-md btn-block \">Go To Rooms Search</button></a>");
                    out.println("</div></center><br>");
                }


            %>



            <div class="jumbotron marginx-10">
                <h1 class="display-4">Join the family!</h1>
                <p class="lead">In just under one minute join the family, get
                    weekly rewards and invitations for special events.</p>
                <hr class="my-4">
                <p>
                    <em>Did you know that our Hotel donates 10% of annual revenue to
                        fire fighters and forest conservationists?</em>
                </p>
                <a class="btn btn-primary btn-lg" href="Join.jsp" role="button">Learn
                    more</a>
            </div>
            <!-- Room Details Section Begin -->
            <section class="room-details-section spad">

                <div class="container">

                    <div class="row">
                        <div class="col-lg-8">
                            <h2 style="text-align: center;"> Hotel Photos</h2>
                            <div id="demo" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="<%=img1_url%>" alt="Los Angeles"  style="width:1100px; height:450px;">  
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=img2_url%>" alt="Chicago" style="width:1100px; height:450px;">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=img3_url%>" alt="New York" style="width:1100px; height:450px;">  
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=img4_url%>" alt="New York" style="width:1100px; height:450px;">  
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#demo" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                                <ul class="carousel-indicators">
                                    <li style="color:#FFF"  data-target="#demo" data-slide-to="0" class="active"></li>
                                        <li data-target="#demo" data-slide-to="1"></li>
                                        <li data-target="#demo" data-slide-to="2"></li>
                                        <li data-target="#demo" data-slide-to="3"></li>
                                    </ul>
                                </div>
                                <br>
                                <div class="room-details-item">
                                    <div class="rd-text">
                                        <div class="rd-title">
                                            <h3>Premium King Room</h3>
                                            <div class="rdt-right">
                                                <!--                                                <div class="rating">
                                                                                                    <i class="icon_star"></i>
                                                                                                    <i class="icon_star"></i>
                                                                                                    <i class="icon_star"></i>
                                                                                                    <i class="icon_star"></i>
                                                                                                    <i class="icon_star-half_alt"></i>
                                                                                                </div>-->
                                                <!--<a href="join.jsp">Booking Now</a>-->
                                            </div>
                                        </div>
                                        <h2>159$<span>/Pernight</span></h2>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="r-o">Size:</td>
                                                    <td>30 ft</td>
                                                </tr>
                                                <tr>
                                                    <td class="r-o">Capacity:</td>
                                                    <td>Max persion 5</td>
                                                </tr>
                                                <tr>
                                                    <td class="r-o">Bed:</td>
                                                    <td>King Beds</td>
                                                </tr>
                                                <tr>
                                                    <td class="r-o">Services:</td>
                                                    <td>Wifi, Television, Bathroom,...</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <p class="f-para">Motorhome or Trailer that is the question for you. Here are some of the
                                            advantages and disadvantages of both, so you will be confident when purchasing an RV.
                                            When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth
                                            wheeler? The advantages and disadvantages of both are studied so that you can make your
                                            choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an
                                            achievement of a lifetime. It can be similar to sojourning with your residence as you
                                            search the various sites of our great land, America.</p>
                                        <p>The two commonly known recreational vehicle classes are the motorized and towable.
                                            Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth
                                            wheel has the attraction of getting towed by a pickup or a car, thus giving the
                                            adaptability of possessing transportation for you when you are parked at your campsite.
                                        </p>
                                    </div>
                                </div>
                                <div class="rd-reviews">
                                    <h4>Reviews</h4>
                                    <div class="review-item">
                                        <div class="ri-pic">
                                            <img src="img/room/avatar/avatar-1.jpg" alt="">
                                        </div>
                                        <div class="ri-text">
                                            <span>27 Aug 2019</span>
                                            <div class="rating">
                                                <i class="material-icons">favorite</i>
                                                <i class="material-icons">favorite</i>
                                                <i class="material-icons">favorite</i>
                                                <i class="material-icons">favorite</i>
                                                <i class="material-icons-half_alt">favorite</i>
                                            </div>
                                            <h5>Brandon Kelley</h5>
                                            <p>Neque porro qui squam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                                adipisci velit, sed quia non numquam eius modi tempora. incidunt ut labore et dolore
                                                magnam.</p>
                                        </div>
                                    </div>
                                    <div class="review-item">
                                        <div class="ri-pic">
                                            <img src="img/room/avatar/avatar-2.jpg" alt="">
                                        </div>
                                        <div class="ri-text">
                                            <span>27 Aug 2019</span>
                                            <div class="rating">
                                                <i class="icon_star"></i>
                                                <i class="icon_star"></i>
                                                <i class="icon_star"></i>
                                                <i class="icon_star"></i>
                                                <i class="icon_star-half_alt"></i>
                                            </div>
                                            <h5>Brandon Kelley</h5>
                                            <p>Neque porro qui squam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                                adipisci velit, sed quia non numquam eius modi tempora. incidunt ut labore et dolore
                                                magnam.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="review-add">
                                    <h4>Add Review</h4>
                                    <form action="Addreview" method="Post" class="ra-form">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <input type="text" placeholder="HotelName*" value="<%=hotelName%>" name="review_hotelname" >
                                            </div>
                                            <div class="col-lg-6">
                                                <input type="text" placeholder="Email*"  name="review_username"  value="<%= usersession.getAttribute("username")%>" >
                                            </div>
                                            <div class="col-lg-12">
                                                <div>
                                                    <h5>You Rating:</h5>
                                                    <input type="text" placeholder= "Stars*" name="review_rate" min="1" max="5">
                                                </div>
                                                <textarea placeholder="Your Review" name="review_texrarea"></textarea>
                                                <button type="submit">Submit Now</button>
                                                
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="room-booking">
                                    <br><br>
                                    <iframe src="<%=map%>" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

                            </div>
                        </div>
                    </div>
            </section>

            <jsp:include page="Footer.jsp" flush="true" />

            <script src="JS/parallax.js"></script>
            <script src="JS/index.js"></script>
            <script src="JS/Meetingdetailsjs/jquery-3.3.1.min.js"></script>
            <script src="JS/Meetingdetailsjs/bootstrap.min.js"></script>
            <script src="JS/Meetingdetailsjs/jquery.magnific-popup.min.js"></script>
            <script src="JS/Meetingdetailsjs/jquery.nice-select.min.js"></script>
            <script src="JS/Meetingdetailsjs/jquery-ui.min.js"></script>
            <script src="JS/Meetingdetailsjs/jquery.slicknav.js"></script>
            <script src="JS/Meetingdetailsjs/owl.carousel.min.js"></script>
            <script src="JS/Meetingdetailsjs/main.js"></script>
        </body>             
    </html>
