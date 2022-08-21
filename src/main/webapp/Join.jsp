<!doctype html>
<html lang="en">
    <head>
        <title>Join</title>

        <%
            //delete cache to prevent back button after logout
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    </head>

    <body>
        <jsp:include page="Header.jsp" flush="true" />

        <%
            if (session.getAttribute("error") != null) {
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-sm-12 bg-light \">");
                out.println("\n");
                out.println("<h4 style= margin-left:40%; class=text-danger>Something went wrong! Please try again.</h4>");
                out.println("</div>");
                out.println("</div>");
                session.removeAttribute("error");
            }
        %>


        <div class="row">
            <div class="col-sm-12 bg-light ">
                <form name="gInfo" class="d-flex flex-column needs-validation"
                      style="height: 100%; margin-left: 15%; width: 70%" action="NewGuest" method="Get" novalidate>
                    <h2 class="mt-4" style="margin-left:40%;  font-weight: bold;">Join Our Meeting Scheduler Family</h2>
                    <br>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputFName4"  style="font-weight: bold;">First Name</label>
                            <input type="text" class="form-control" id="inputFName4" name="fName"
                                   placeholder="First Name" required>
                            <div class="valid-feedback">Good!</div>
                            <div class="invalid-feedback">Enter your First name?</div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputLName4" style="font-weight: bold;">Last Name</label> 
                            <input type="text"
                                   class="form-control" id="inputLName4" name="lName" placeholder="Last Name" required>
                            <div class="valid-feedback">Good job!</div>
                            <div class="invalid-feedback">Don't forget your Last Name.
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputUsername" style="font-weight: bold;">Username</label> 
                            <input type="text"
                                   class="form-control" id="inputUsername" placeholder="Username" name="username" required>
                            <div class="valid-feedback">Right on!</div>
                            <div class="invalid-feedback">your Username  Please</div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputEmail4"style="font-weight: bold;">E-mail</label> 
                            <input type="email"
                                   class="form-control" id="inputEmail4" name="email" placeholder="E-mail" required>
                            <div class="email-val" id="emailValidator"></div>
                            <div class="invalid-feedback">Please provide a valid e-mail.</div>
                        </div>


                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCountry" style="font-weight: bold;">Country</label>
                            <input type="text"
                                   class="form-control" id="inputCountry" name="country" placeholder="Country" required>
                            <div class="valid-feedback">Nice country!</div>
                            <div class="invalid-feedback">Are forgetting something?</div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPhone4" style="font-weight: bold;">Phone</label> 
                            <input type="number"
                                   class="form-control" id="inputPhone4" name="phone" placeholder="Mobile or home" min="0" required>
                            <div class="valid-feedback">Good!</div>
                            <div class="invalid-feedback">Please provide a valid phone.
                            </div>
                        </div>

                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputAddress"style="font-weight: bold;">Address</label> 
                            <input type="text"
                                   class="form-control" id="inputAddress" placeholder="1234 Main St Apt. 3B"
                                   name="address" required>
                            <div class="valid-feedback">So good!</div>
                            <div class="invalid-feedback">Please provide a valid Address.</div>
                        </div>
                        <div class="form-group col-md-6">
                            <%--@declare id="inputpassword"--%><label for="inputpassword"style="font-weight: bold;">Password</label>
                            <input type="password"
                                   class="form-control" id="password" placeholder="Enter Password"
                                   name="password" required>
                            <div class="valid-feedback">yeah!</div>
                            <div class="invalid-feedback">Write password please.</div>
                        </div>

                    </div>
                    <br>
                    
                    <div>
                        <div  class="g-recaptcha" style="margin-left: 40%;" 
                              data-sitekey="6Lf8cCIaAAAAAPqsR_LFohTU02bMyeTRwKoS4pYO" >
                        </div>
                    </div>   
                    <br>
                    <div class="mt-auto">
                        <button type="submit" class="btn btn-primary btn-block mb-2"
                                id="joinSubmitButton">Submit</button>
                    </div>
                </form>
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