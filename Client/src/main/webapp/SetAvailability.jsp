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
                        <div  class="col-auto">
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
                        <div class="form-check mb-2"  style="margin-left:25px; padding-bottom: 15px;">
                            <!--
                            <div >
                                <input class="form-check-input" type="checkbox" id="check1" name="Saturday" value="something" checked>
                                <label style="padding-right:20px; " class="form-check-label">Saturday</label>

                                <label for="inputState" class="form-label">State</label>

                                <select id="inputState" class="form-select" style="width: 35%">
                                    <option selected>Choose...</option>
                                    <option>...</option>
                                </select>

                                <label for="inputState" class="form-label">State</label>
                                <select id="inputState2" class="form-select" style="width: 37%" >
                                    <option selected>Choose...</option>
                                    <option>...</option>
                                </select>

                            </div>
                            -->
                            <input class="form-check-input" type="checkbox" id="check1" name="Saturday" value="something" checked>
                            <label style="padding-right:35px; " class="form-check-label">Saturday</label>

                            <input class="form-check-input" type="checkbox" id="check2" name="Sunday" value="something" checked>
                            <label style="padding-right:35px; " class="form-check-label">Sunday</label>

                            <input class="form-check-input" type="checkbox" id="check3" name="Monday" value="something" checked>
                            <label style="padding-right:35px; " class="form-check-label">Monday</label>

                            <input class="form-check-input" type="checkbox" id="check4" name="Tuesday" value="something" checked>
                            <label style="padding-right:35px; " class="form-check-label">Tuesday</label>

                            <input class="form-check-input" type="checkbox" id="check5" name="Wednesday" value="something" checked>
                            <label style="padding-right:35px; " class="form-check-label">Wednesday</label>


                            <input class="form-check-input" type="checkbox" id="check6" name="Thursday" value="something" checked>
                            <label style="padding-right:35px; " class="form-check-label">Thursday</label>


                            <input class="form-check-input" type="checkbox" id="check7" name="Friday" value="something" checked>
                            <label style="padding-right:40px; " class="form-check-label">Friday</label>
                        </div>

                        <input type="submit" value="Submit">
                    </form>

                </div><br><br><br><br><br><br><br><br>

            </div>

        </div>

                <!--
        <script>
                                  function submituser() {
                                      var response = grecaptcha.getResponse();
                                      console.log(response.length);
                                      if (response.length === 0) {
                                          document.getElementById('CaptchaError').innerHTML = 'fff';
                                          $("gInfo").submit(function (e) {
                                              e.preventDefault();
                                          });
        
        
                                          return false;
                                      }
                                      return true;
                                  }
                                  function VerfiyCaptcha() {
                                      console.log('True');
                                      document.getElementById('CaptchaError').innerHTML = 'ddd';
                                  }
                </script>-->
        <jsp:include page="Footer.jsp" flush="true" />

        <script src="JS/join.js"></script>


    </body>
</html>