<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="ISO-8859-1">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="favicon.ico"/>
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
<header class="themeColor-nav sticky-top " id="start">
    <%
        //delete cache to prevent back button after logout
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    %>
    <div class="tm-container ">
        <div class="form-row ">
            <div class="col-8 ">
                <nav class="navbar navbar-expand-lg navbar-light px-0 py-2 py-lg-0">
                    <a class="navbar-brand brand" id="logo"
                       onclick="location.href = 'index.jsp';">
                        <img
                                src="img/index%20page/logo.ico" width="40" height="40"
                                class="d-inline-block align-top order-first order-sm-   last order-lg-first "
                                alt="logo">

                        <a style="font-size: 20px; margin-right: 10px;">Meeting's Calendly</a>
                    </a>
                    <button
                            class="navbar-toggler order-last order-sm-first order-lg-last "
                            type="button" data-toggle="collapse"
                            data-target="#navbarNavAltMarkup"
                            aria-controls="navbarNavAltMarkup" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <!--<a class="nav-item nav-link " href="Index.jsp#start"></a>-->

                            <% if (session.getAttribute("Userid") != null ){ %>
                                <a class="nav-item nav-link " href="index.jsp">Home</a>
                                <a class="nav-item nav-link " href="meetings.jsp">Meetings</a>
                                <a class="nav-item nav-link " href="availbilityList.jsp">Availability</a>
                                <!--<a class="nav-item nav-link" href="help.jsp">Help</a>-->
                                <a class="nav-item nav-link" href="Contact.jsp">Contact</a>
                            <% } else { %>
                                <a class="nav-item nav-link " href="index.jsp">Home</a>
                                <a class="nav-item nav-link" href="Contact.jsp">Contact</a>
                                <!--<a class="nav-item nav-link" href="help.jsp">Help</a>-->
                            <% } %>

                        </div>
                    </div>
                </nav>
            </div>

            <div class="col-4 mr-0 float-right" style="margin-top: 0px;">

                <%
                    if (session.getAttribute("username") == null) {
                                /*if login failed VerifyLogin.java sends the value "fail"=1
                                        through session
                                 */
                        String fail = String.valueOf(session.getAttribute("fail"));
                        String message = "";
                        if (fail.equals("1")) {
                            message = "Wrong credentials ";
                            session.removeAttribute("fail");
                        }
                        //else, empty message will be displayed
                        out.println("<div style=\"margin:10px; 10px;\" class=\"tm-log float-right text-right\" "
                                + ">"
                                + "<span class=\"text-danger \">"
                                + message
                                + "</span><button type=\"button\" "
                                + "class=\"btn btn-primary mt-2 mt-sm-0 float-right float-md-none\""
                                + " style=\"min-width: 55px; \" "
                                + "onclick=\"location.href='Join.jsp'\">Sign up</button>");
                        out.println(
                                "<button type=\"button\" "
                                        + "class=\"btn btn-outline-secondary "
                                        + "ml-0 ml-sm-2 mr-0 mt-3 mb-2 mt-sm-0 mb-sm-0 "
                                        + "float-right float-md-none\" "
                                        + "data-toggle=\"modal\" data-target=\"#logInModal\">"
                                        + "Log in</button>");
                        out.println("</div>");

                    } else {
                        String uname = String.valueOf(session.getAttribute("username"));
                        String pass = String.valueOf(session.getAttribute("password"));
                        out.println(
                                "<div class=\"tm-log float-right text-right\"></p><form action=\"Edit_Profile.jsp\" method=\"post\""
                                        + "class=\"float-right\"><button type=\"submit\""
                                        + " class=\"btn btn-outline-secondary ml-2 float-right\">"
                                        + "Edit Profile</button></form>");

                        out.println("Hi "
                                + "<p class=\"text-warning d-inline\">");
                        out.print(uname);

                        out.println(
                                "</p><form action=\"LogOut\" method=\"post\""
                                        + "class=\"float-right\"><button type=\"submit\""
                                        + " class=\"btn btn-outline-secondary ml-2 float-right\">"
                                        + "Log out</button></form></div>");

                    }
                %>
            </div>
        </div>
    </div>

</header>

<div class="bg-dark  p-4"></div>

</body>
<div class="modal fade" id="logInModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <form action="VerifyLogIn" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Log in</h5>

                </div>
                <div class="modal-body">
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInputGroup">Email</label>
                        <div class="input-group mb-2">
                            <input type="email" name="email" class="form-control"
                                   id="inlineFormInputGroup" autocomplete="off"
                                   placeholder="Email">
                        </div>
                    </div>
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInput">Password</label> <input
                            type="password" name="password" class="form-control mb-2"
                            id="inlineFormInput" autocomplete="on" placeholder="Password">

                    </div>
                    <!--                        <div style="margin-left:15px; " class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                <label class="form-check-label" for="exampleCheck1">Remember Me</label>
                                            </div>-->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Close
                    </button>
                    <button type="submit" class="btn btn-primary">Log in</button>
                    <input name="originURL" value="<%=request.getRequestURL()%>" type="hidden">
                </div>

            </form>
        </div>
    </div>
</div>
</html>