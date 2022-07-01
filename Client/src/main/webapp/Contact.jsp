<%--
  Created by IntelliJ IDEA.
  User: Mohamed Hamdy
  Date: 6/30/2022
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>

<!doctype html>

<html lang="en">
<head>
    <title>Contact</title>
</head>
<body class="themeColor">
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="ISO-8859-1">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="img/index%20page/logo.ico"/>
    <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="CSS/main.css"/>
    <link rel="stylesheet" type="text/css" href="CSS/jquery-ui.css"/>

    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap"
            rel="stylesheet"/>
    <link
            href="https://fonts.googleapis.com/css?family=Capriola&display=swap"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css?family=Quattrocento&display=swap"
            rel="stylesheet">

</head>
<body>
<jsp:include page="Header.jsp" flush="true"/>

</body>
<div class="modal fade" id="logInModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <form action="VerifyLogIn" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="login">Log in</h5>

                </div>
                <div class="modal-body">
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInputGroup">Username</label>
                        <div class="input-group mb-2">
                            <input type="email" name="uN" class="form-control"
                                   id="inlineFormInputGroup" autocomplete="off"
                                   placeholder="Username">
                        </div>
                    </div>
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInput">Password</label> <input
                            type="password" name="password" class="form-control mb-2"
                            id="inlineFormInput" autocomplete="on" placeholder="Password">

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Close
                    </button>
                    <button type="submit" class="btn btn-primary">Log in</button>
                    <input name="originURL" value="Contact.jsp"
                           type="hidden">
                </div>
            </form>
        </div>
    </div>
</div>
</html>

<div class="jumbotron marginx-10 mb-4 py-4 ">
    <h3 class="text-center text-lg-left">We are here to help!</h3>
    <p class="text-center text-lg-left">Our customer service works 24 hours </p>
</div>
<div class="tm-container">
    <div class="row">
        <div class="col-lg-4 mb-2 mb-md-0 card d-flex"
             style="background-color: #fed440">

            <img src="img/phone_small.jpg" class="card-img align-self-center"
                 style="min-width: 80%" alt="contact">

        </div>

        <div class="col-lg-8 opacity-70 pt-2 text-white card">
            <h4>Get in touch!</h4>
            <hr class="bg-white">
            <div class="row">
                <div class="col-sm-6">
                    <h5>You can send us an E-mail</h5>
                    <button type="button" class="btn btn-primary d-block my-4"
                            data-toggle="modal" data-target="#contactForm"
                            data-whatever="@Inquiries">General Questions
                    </button>
                    <button type="button" class="btn btn-primary d-block my-4"
                            data-toggle="modal" data-target="#contactForm"
                            data-whatever="@FrontDesk">Front Desk
                    </button>

                    <button type="button" class="btn btn-primary d-block my-4"
                            data-toggle="modal" data-target="#contactForm"
                            data-whatever="@Careers">Careers
                    </button>


                </div>
                <div class="col-sm-6">
                    <h5 class="mb-2">Or you can give us a call</h5>
                    <p class="pb-0 mb-0">
                        <strong>General Inquiries</strong>
                    </p>
                    <p class="pb-0 mb-0">International: +1-800-INTER</p>
                    <p>Local: 204-6457984</p>
                    <p class="pb-0 mb-0">
                        <strong>Front Desk</strong>
                    </p>
                    <p class="pb-0 mb-0">International: +1-800-INTER</p>
                    <p>Local: 204-6457984</p>

                </div>
            </div>

        </div>

    </div>
</div>
<!-- modal that shows action processing -->
<div class="modal fade" id="processing" tabindex="2" role="dialog"
     aria-labelledby="sentLabel" aria-hidden="true">
    <div class="modal-dialog d-flex justify-content-center"
         role="document">

        <div class="spinner-grow modal-content bg-light"
             style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>

        </div>
    </div>
</div>
<!-- Modal that opens when email is send -->
<div class="modal fade" id="emailSent" tabindex="1" role="dialog"
     aria-labelledby="sentLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="sentLabel">Success</h5>
            </div>
            <div class="modal-body">
                <p>Your message reached our desk!</p>
            </div>
        </div>
    </div>
</div>

<!-- Modal that opens the new message panel -->
<div class="modal fade" id="contactForm" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="contact_form">
                    <div class="form-group">
                        <label for="subject" class="col-form-label">Subject:</label> <input
                            type="text" class="form-control" id="subject">

                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Message:</label>
                        <textarea class="form-control" id="message-text"></textarea>
                    </div>
                    <input type="email" value="<%=session.getAttribute("email")%>"
                           id="emailTo" hidden="true">

                    <input type="email" value="javam8ail@gmail.com"
                           id="emailFrom" hidden="true">


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">Close
                </button>
                <button type="button" class="btn btn-primary"
                        onclick="EmailSender()">Send message
                </button>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron marginx-10 my-4 py-4 ">
    <h1 class="display-6">Join the family!</h1>
    <p class="lead">In just under one minute join the family, get
        weekly rewards and invitations for special events.</p>
    <hr class="my-4">
    <p>
        <em>Did you know that the ingredients we use in our food are
            locally sourced?</em>
    </p>
    <a class="btn btn-primary btn-lg" href="Join.jsp" role="button">Learn
        more</a>
</div>
<div class="tm-container">
    <div class="row h-100">
        <div class="col-lg-8 mb-2">

            <img src="img/contact.png" class="card-img align-self-center"
                 style="height: 80%; min-width: 60%" alt="contact">

        </div>

        <div class="col-lg-4  mb-4 ">
            <h4>Our Location</h4>
            <hr>
            <div class="row h-75 px-3"
                 style="min-height: 300px; min-width: 300px">
                <div id="map" class="col-md-8 mb-2 h-75"></div>
                <div class="col-md-4 ">
                    2323 Portrage Av, Winnipeg <br>(7 km northwest of MITT) <br>Phone:
                    207-548-5377
                </div>
            </div>
        </div>

    </div>
</div>

<footer class="tm-footer bg-dark ">
    <div class="tm-container bg-dark text-white text-left">
        <div class="form-row">
            <div class="col-sm-3">
                <h4>Meeting's Calendly Community</h4>
                <p>About</p>
                <p>Patagonia Rewards</p>
                <p>Site Map</p>
            </div>
            <div class="col-sm-3">
                <h4>Corporate Resources</h4>
                <p>Media Center</p>
                <p>Careers</p>
                <p>Travel Advisors</p>
            </div>
            <div class="col-sm-3">
                <h4>Terms and Policies</h4>
                <p>Privacy Notice</p>
                <p>Terms of Use</p>
                <p>About Safemark</p>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
    <script src="JS/jquery-3.4.1.min.js"></script>
    <script src="JS/bootstrap.js"></script>
    <script src="JS/jquery-ui.js"></script>
    <script src="JS/footer.js"></script>


</footer>

<script src="JS/contact.js"></script>
<script src="https://smtpjs.com/v3/smtp.js">
</script>
<script>
    function EmailSender() {
        var sub = document.getElementById("subject").value;
        var message = document.getElementById("message-text").value;
        var emailTo = document.getElementById("emailTo").value;
        var useremail = emailTo;
        message = message + " this email Sent From " + useremail;
        var emailFrom = document.getElementById("emailFrom").value;
        //document.getElementById("demo").innerHTML = "From Script";

        Email.send({

            // localhost -> 93cf4e1f-9b98-4bfe-a19e-43961df8334e
            SecureToken: "ae5fbaf1-a872-417c-89cd-e47433eb965e",
            To: "mohamed547754@gmail.com",
            From: emailFrom,
            Subject: sub,
            Body: message
        }).then(
            alert("Mail Sent successfully"),
            window.location = 'Contact.jsp'
        );
    }

</script>
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgNTGthkooR5NTMU3_91kMN6zDg_m1Yz4&callback=initMap"
        async defer></script>

</body>
</html>