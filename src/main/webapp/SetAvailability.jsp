<!doctype html>
<%
    int userid = Integer.valueOf((Integer) session.getAttribute("Userid"));
    String str = String.valueOf(userid);
    String Meetingurl = "meeting0"+str + "room/";
    //System.out.print(str + " " + Meetingurl);

%>
<%= session.getAttribute("username") %>

<html lang="en">
    <head>
        <title>Join</title>
        <style>
            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit] {
                width: 50%;
                background-color: #007bff;
                color: white;
                padding: 14px 20px;
                margin: 8px 25%;
                border-radius: 1px;
                border-color: #007bff;
                cursor: pointer;


            }


            .form {

                width: 43%;
                border-radius: 5px;
                background-color: #f2f2f2;
                margin-left:30%;
                padding: 25px;
            }
        </style>

    </head>

    <body>
        <jsp:include page="Header.jsp" flush="true" />




        <div class="row">
            <div class="col-sm-12 bg-light">
                <br><br><br><br><br>

                <div class="form">
                    <form action="setavailbilityservlet" method="get">
                        <div>
                            <h4>Welcome to meetings calendly!</h4>
                            <p>We take the work out of connecting with other so you can accomplish more </p>
                        </div>
                        <hr>
                        <div >
                            Your General Profile Meetings URL
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div style="height: 38px; margin-top: 8px;" class="input-group-text">meetingscalendly.com/</div>
                                </div>
                                <input type="text" name="meetingsurl" value="<%=Meetingurl%>" class="form-control" id="inlineFormInputGroup" disabled>
                            </div>
                        </div>
                        <hr>
                        <p>Select Your Available Days</p>
                        <div class="form-check"  style="padding-bottom: 15px; padding-left: 40px;">

                            <div class="form-row" >
                                <div class="form-group col-md-2"  style="padding: 5px;" >
                                    <input class="form-check-input" type="checkbox" id="check1" name="Saturday" onclick="enable1()" value="something" checked>
                                    <label  class="form-check-label">Saturday</label>
                                </div>
                                <span style="padding: 5px 10px">From</span>
                                <div class="form-group col-md-3">
                                    <input type="time"  class="form-control" id="fromtime1" name="fromtime1" required>
                                </div>
                                <span style="padding: 5px;">To</span>
                                <div class="form-group col-md-3" >
                                    <input type="time" class="form-control" id="totime1" name="totime1" required>
                                </div>

                            </div>

                            <div class="form-row" >
                                <div class="form-group col-md-2"  style="padding: 5px;" >
                                    <input class="form-check-input" type="checkbox" id="check2" name="Sunday" onclick="enable2()" value="something" checked>
                                    <label style="padding-right:35px; " class="form-check-label">Sunday</label>
                                </div>
                                <span style="padding: 5px 10px">From</span>
                                <div class="form-group col-md-3"  >
                                    <input type="time"  class="form-control" id="fromtime2" name="fromtime2" required>
                                </div>
                                <span style="padding: 5px;">To</span>
                                <div class="form-group col-md-3" >
                                    <input type="time" class="form-control" id="totime2" name="totime2" required>
                                </div>
                            </div>

                            <div class="form-row" >
                                <div class="form-group col-md-2"  style="padding: 5px" >
                                    <input class="form-check-input" type="checkbox" id="check3" name="Monday" onclick="enable3()" value="something" checked>
                                    <label style="padding-right:35px; " class="form-check-label">Monday</label>
                                </div>
                                <span style="padding: 5px 10px">From</span>
                                <div class="form-group col-md-3"  >
                                    <input type="time"  class="form-control" id="fromtime3" name="fromtime3" required>
                                </div>
                                <span style="padding: 5px;">To</span>
                                <div class="form-group col-md-3" >
                                    <input type="time" class="form-control" id="totime3" name="totime3" required>
                                </div>
                            </div>

                            <div class="form-row" >
                                <div class="form-group col-md-2"  style="padding: 5px; " >
                                    <input class="form-check-input" type="checkbox" id="check4" name="Tuesday" onclick="enable4()" value="something" checked>
                                    <label style="padding-right:35px; " class="form-check-label">Tuesday</label>
                                </div>
                                <span style="padding: 5px 10px">From</span>
                                <div class="form-group col-md-3"  >
                                    <input type="time"  class="form-control" id="fromtime4" name="fromtime4" required>
                                </div>
                                <span style="padding: 5px;">To</span>
                                <div class="form-group col-md-3" >
                                    <input type="time" class="form-control" id="totime4" name="totime4" required>
                                </div>
                            </div>

                            <div class="form-row" >
                                <div class="form-group col-md-2"  style="padding: 5px; " >
                                    <input class="form-check-input" type="checkbox" id="check5" name="Wednesday" onclick="enable5()" value="something" checked>
                                    <label style="padding-right:35px; " class="form-check-label">Wednesday</label>

                                </div>
                                <span style="padding: 5px 10px">From</span>
                                <div class="form-group col-md-3"  >
                                    <input type="time"  class="form-control" id="fromtime5" name="fromtime5" required>
                                </div>
                                <span style="padding: 5px;">To</span>
                                <div class="form-group col-md-3" >
                                    <input type="time" class="form-control" id="totime5" name="totime5" required>
                                </div>
                            </div>

                            <div class="form-row" >
                                <div class="form-group col-md-2"  style="padding: 5px; " >
                                    <input class="form-check-input" type="checkbox" id="check6" name="Thursday" onclick="enable6()" value="something" checked>
                                    <label style="padding-right:35px; " class="form-check-label">Thursday</label>
                                </div>
                                <span style="padding: 5px 10px">From</span>
                                <div class="form-group col-md-3"  >
                                    <input type="time"  class="form-control" id="fromtime6" name="fromtime6" required>
                                </div>
                                <span style="padding: 5px;">To</span>
                                <div class="form-group col-md-3" >
                                    <input type="time" class="form-control" id="totime6" name="totime6" required>
                                </div>
                            </div>
                            <div class="form-row" >
                                <div class="form-group col-md-2"  style="padding: 5px; " >
                                    <input class="form-check-input" type="checkbox" id="check7" name="Friday" onclick="enable7()" value="something" checked>
                                    <label style="padding-right:40px; " class="form-check-label">Friday</label>
                                </div>
                                <div></div>
                                <span style="padding: 5px 10px">From</span>
                                <div class="form-group col-md-3" >
                                    <input type="time"  class="form-control" id="fromtime7" name="fromtime7" required>
                                </div>
                                <span style="padding: 5px;">To</span>
                                <div class="form-group col-md-3" >
                                    <input type="time" class="form-control" id="totime7" name="totime7" required>
                                </div>
                            </div>


                        </div>
                        <input type="submit" value="Continue">
                    </form>

                </div><br><br><br><br><br><br><br><br>

            </div>

        </div>

        <jsp:include page="Footer.jsp" flush="true" />

        <script src="JS/join.js"></script>

        <script>
            function enable1() {
                var checkvalue1 = document.getElementById("check1").value;
                if(checkvalue1 == "something"){
                    document.getElementById("check1").value = null;
                    document.getElementById("fromtime1").disabled = true;
                    document.getElementById("totime1").disabled = true;
                }else{
                    document.getElementById("check1").value = "something";
                    document.getElementById("fromtime1").disabled = false;
                    document.getElementById("totime1").disabled = false;
                }
            }
            function enable2() {
                var checkvalue2 = document.getElementById("check2").value;
                if(checkvalue2 == "something"){
                    document.getElementById("check2").value = null;
                    document.getElementById("fromtime2").disabled = true;
                    document.getElementById("totime2").disabled = true;
                }else{
                    document.getElementById("check2").value = "something";
                    document.getElementById("fromtime2").disabled = false;
                    document.getElementById("totime2").disabled = false;
                }
            }function enable3() {
                var checkvalue3 = document.getElementById("check3").value;
                if(checkvalue3 == "something"){
                    document.getElementById("check3").value = null;
                    document.getElementById("fromtime3").disabled = true;
                    document.getElementById("totime3").disabled = true;
                }else{
                    document.getElementById("check3").value = "something";
                    document.getElementById("fromtime3").disabled = false;
                    document.getElementById("totime3").disabled = false;
                }
            }function enable4() {
                var checkvalue4 = document.getElementById("check4").value;
                if(checkvalue4 == "something"){
                    document.getElementById("check4").value = null;
                    document.getElementById("fromtime4").disabled = true;
                    document.getElementById("totime4").disabled = true;
                }else{
                    document.getElementById("check4").value = "something";
                    document.getElementById("fromtime4").disabled = false;
                    document.getElementById("totime4").disabled = false;
                }
            }
            function enable5() {
                var checkvalue5 = document.getElementById("check5").value;
                if(checkvalue5 == "something"){
                    document.getElementById("check5").value = null;
                    document.getElementById("fromtime5").disabled = true;
                    document.getElementById("totime5").disabled = true;
                }else{
                    document.getElementById("check5").value = "something";
                    document.getElementById("fromtime5").disabled = false;
                    document.getElementById("totime5").disabled = false;
                }
            }function enable6() {
                var checkvalue6 = document.getElementById("check6").value;
                if(checkvalue6 == "something"){
                    document.getElementById("check6").value = null;
                    document.getElementById("fromtime6").disabled = true;
                    document.getElementById("totime6").disabled = true;
                }else{
                    document.getElementById("check6").value = "something";
                    document.getElementById("fromtime6").disabled = false;
                    document.getElementById("totime6").disabled = false;
                }
            }function enable7() {
                var checkvalue7 = document.getElementById("check7").value;
                if(checkvalue7 == "something"){
                    document.getElementById("check7").value = null;
                    document.getElementById("fromtime7").disabled = true;
                    document.getElementById("totime7").disabled = true;
                }else{
                    document.getElementById("check7").value = "something";
                    document.getElementById("fromtime7").disabled = false;
                    document.getElementById("totime7").disabled = false;
                }
            }

        </script>
    </body>

</html>