<!doctype html>
<html lang="en">

    <head>

        <title>Index</title>

        <%
            //delete cache to prevent back button after logout
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
    </head>

    <body>
        	<div class="parallax-window" data-parallax="scroll" data-speed="0.2"
                        data-natural-width="1200"   data-image-src="img/index page/meeting.jpg"
                        iosFix="true" androidFix="true" zIndex="-10">
                        <section class="sectionParallax">
                                <ul class="heroText">
                                        <li class="scroll " data-rateY="1" data-rateX="-1"
                                                data-direction="horizontal">Meetings</li>
                                        <li class="scroll " data-rate="1" data-direction="vertical">Calendrly</li>
                                        <li class="scroll " data-rateY="1" data-rateX="1"
                                                data-direction="horizontal">Community</li>
        
                                </ul>
                        </section>
                </div>

        <jsp:include page="Header.jsp" flush="true" />



        <div id="main_content" class="tm-container clearfix px-0">
            <div class="container fadeIn bg-white pl-0 float-left clearfix">
                <div class="row my-4 ">
                    <div class="col-lg-8 ">
                        <img class="rounded " src="img/index%20page/Meeting1.jpg" alt="hotel lounge" />
                    </div>
                    <div class="col-lg-4">
                        <h2 class="brand mt-2">Meeting's Calendly </h2>
                        <h4>
                            <q>In a glorious True North setting amid supreme natural
                                wonders</q>
                        </h4>
                        <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                    </div>
                </div>
                <hr>
            </div>
            <div class="container fadeIn bg-white float-right pr-0 clearfix">
                <div class="row my-4">
                    <div class="col-lg-4">
                        <h4>
                            <q>The guestrooms at Patagonia Meeting's Calendly capture the essence of a
                                friend's mountain retreat</q>
                        </h4>
                        <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                        <br>
                    </div>
                    <div class="col-lg-8 ">
                        <img class="rounded " src="img/index%20page/Meeting%202.png"
                             alt="Mountain retreat" />
                    </div>
                </div>
            </div>
        </div>

        <div class="jumbotron marginx-10  ">
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
        <!--                <div class="tm-container ">
                                <div class="row">
                                        <div class="col-lg-8  fadeIn" id="target_bottom">
                                                <div class="imgFood mx-0 card" style="max-width: 100%;">
                                                        <div class="row ">
                
                                                                <div class="col-lg-4 ">
                                                                        <div class="card-header opacity-70 text-light ">
                                                                                <h5 class="card-title">Savour Winnipeg's Freshest Flavours</h5>
                                                                                <p class="card-text">The Patagonia Hotel, serves
                                                                                        sophisticated European cuisine with an International twist.
                                                                                        Menus change regularly to showcase the seasons' freshest
                                                                                        flavors, including sweet corn, late summer berries, apples and
                                                                                        plums.</p>
                
                                                                                <small>*If you have any special request, please let us
                                                                                        know in advance and we will take care of you</small>
                
                                                                                <h5 class="mt-2">Hours:</h5>
                                                                                <p>Monday - Friday: 6am - 7am</p>
                                                                                <p>Pastry and Coffee only 7am - 10am Full hot breakfast</p>
                                                                        </div>
                                                                </div>
                                                                <div class="col-lg-8 ">
                                                                         <img src="img/food1.jpg" class="card-img " alt="food fest"> 
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                
                                        <div class="col-lg-4 card mt-2 mt-lg-0">
                                                <form name="searchRoomB" method="post" class="d-flex flex-column"
                                                        style="height: 100%;">
                
                                                        <div class="py-2 ml-4">
                                                                <h4>Check Availability and Reserve</h4>
                                                                <small>Find the best accommodation for your upcoming stay.<a
                                                                        href="#"> Why book with us?</a></small>
                                                        </div>
                
                
                                                        <div class="form-group my-2 my-md-auto card opacity-70">
                                                                <label for="formGroupExampleInput" class="ml-4 text-white">Check-in
                                                                        Date</label> <input type="text" id="cIBottom"
                                                                        class="form-control checkIn pl-4 " placeholder="Select a date"
                                                                        readonly>
                                                        </div>
                                                        <div class="form-group my-2 my-md-auto card opacity-70">
                                                                <label for="formGroupExampleInput2" class="ml-4 text-white">Check-out
                                                                        Date</label> <input type="text" id="cOBottom"
                                                                        class="form-control checkOut pl-4" placeholder="Select a date"
                                                                        readonly>
                                                        </div>
                                                        <div class="form-group my-2 my-md-auto card opacity-70">
                                                                <label for="formGroupExampleInput2" class="ml-4 text-white">Number
                                                                        of Guests</label> <input type="text" id="gBottom"
                                                                        class="form-control pl-4" value="2"
                                                                        placeholder="How many adults?">
                                                        </div>
                                                        <div class=" my-2 my-md-auto">
                                                                <button type="button"
                                                                        class="btn btn-outline-warning btn-md btn-block mt-2"
                                                                        onclick="AvailabilityCheckerBottom()">Search</button>
                                                        </div>
                                                </form>
                                        </div>
                                </div>
                        </div>-->
        <jsp:include page="Footer.jsp" flush="true" />
        <script src="JS/parallax.js"></script>
        <script src="JS/index.js">
        </script>


    </body>

</html>