<!doctype html>

<html lang="en">
<head>
    <title>meeting room</title>
    <%
        //delete cache to prevent back button after logout
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String meetingtype = request.getSession().getAttribute("meetingtype").toString();
        String meetingcapacity = request.getSession().getAttribute("meetingcapacity").toString();
        String duration = request.getSession().getAttribute("duration").toString();
        String repeat = request.getSession().getAttribute("repeat").toString();
        String time = request.getSession().getAttribute("time").toString();
        String title = request.getSession().getAttribute("title").toString();
        String timezone = request.getSession().getAttribute("timezone").toString();
        String Date = request.getSession().getAttribute("Date").toString();
        String userEmail = request.getSession().getAttribute("email").toString();
        String userUsername = request.getSession().getAttribute("username").toString();
    %>
    <script src="https://smtpjs.com/v3/smtp.js"></script>

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
            margin-left: 30%;
            padding: 25px;
        }
    </style>
</head>

<body>
<jsp:include page="Header.jsp" flush="true"/>

<div class="row">
    <div class="col-sm-12 bg-light">
        <br><br><br><br><br>

        <div class="form" >

            <%
                if (meetingtype.equals("Team")) {
                    out.println("<form action=\"meetingroomservlet\" action=\"form2\" method=\"get\">\n");
                    out.println("                <div>\n" +
                            "                    <h4>Add Your Participants List</h4>\n" +
                            "                </div>\n");

                    out.println("<table id=\"myTable\" class=\" table order-list text-center\">\n");
                    out.println("<thead>\n");
                    out.println("<tr>\n");
                    out.println("<td>Name</td>\n");
                    out.println("<td>Mail</td>\n");
                    out.println("</tr>");
                    out.println("</thead>");
                    out.println("<tbody>");

                    out.println("<tr>");
                    out.println("<td class=\"col-sm-4\">");
                    out.println("<input type=\"text\" id=\"name\"  name=\"name\" class=\"form-control\" required>");
                    out.println("</td>");
                    out.println("<td class=\"col-sm-6\">");
                    out.println("<input type=\"text\" id=\"mail\" name=\"mail\" class=\"form-control\" style=\"margin-top:7px;\" required>");
                    out.println("</td>");

                    out.println("<td class=\"col-sm-2\">");
                    out.println("<input id=\"meetingtype\" name=\"meetingtype\"  type=\"hidden\" value=\"" + meetingtype + "\"/>");
                    out.println("<input id=\"meetingcapacity\" name=\"meetingcapacity\"  type=\"hidden\" value=\"" + meetingcapacity + "\"/>");
                    out.println("<input id=\"duration\" name=\"duration\"  type=\"hidden\" value=\"" + duration + "\"/>");
                    out.println("<input id=\"repeat\" name=\"repeat\"  type=\"hidden\" value=\"" + repeat + "\"/>");
                    out.println("<input id=\"time\" name=\"time\"  type=\"hidden\" value=\"" + time + "\"/>");
                    out.println("<input id=\"title\" name=\"title\"  type=\"hidden\" value=\"" + title + "\"/>");
                    out.println("<input id=\"timezone\" name=\"timezone\"  type=\"hidden\" value=\"" + timezone + "\"/>");
                    out.println("<input id=\"Date\" name=\"Date\"  type=\"hidden\" value=\"" + Date + "\"/>");
                    out.println("<input id=\"userEmail\" name=\"userEmail\"  type=\"hidden\" value=\"" + userEmail + "\"/>");
                    out.println("<input id=\"userUsername\" name=\"userUsername\"  type=\"hidden\" value=\"" + userUsername + "\"/>");
                    out.println("<input type=\"button\" onclick=\"sendEmailtoTeam()\" id=\"send\" style=\"margin-top:7px;\" class=\"btn btn-md btn-primary btn-block text-center \" value=\"Send Email\"/>");

                    out.println("</td>");
                    out.println("</tr>");



                    out.println("</tbody>");
                    out.println("<tfoot>");
                    out.println("<tr>");
                    out.println("<td colspan=\"5\" style=\"text-align: left;\">");
                    out.println("<input type=\"button\" class=\"btn btn-md btn-danger btn-block \" id=\"addrow\" value=\"Add Participant\"/>");
                    out.println("</td>");


                    out.println("</tr>");
                    out.println("</tfoot>");


                    out.println("</table>");
                    out.println("<input onclick=\"EmailSenderTeam()\" id=\"submit\" class=\"btn-primary\" type=\"submit\" value=\"Submit\">");
                    out.println("</form>");

                } else {

                    out.println("<form action=\"meetingroomservlet\" method=\"get\">\n");
                    out.println("                <div>\n" +
                            "                    <h4>Add Your Participant</h4>\n" +
                            "                </div>\n");

                    out.println("<table id=\"myTable\" class=\" table order-list text-center\">\n");
                    out.println("<thead>\n");
                    out.println("<tr>\n");
                    out.println("<td>Name</td>\n");
                    out.println("<td>Mail</td>\n");
                    out.println("</tr>");
                    out.println("</thead>");
                    out.println("<tbody>");
                    out.println("<tr>");
                    out.println("<td class=\"col-sm-4\">");
                    out.println("<input type=\"text\" name=\"name\" id=\"name\" class=\"form-control\"/>");
                    out.println("</td>");
                    out.println("<td class=\"col-sm-6\">");
                    out.println("<input type=\"text\" name=\"mail\" id=\"mail\" class=\"form-control\"/>");
                    out.println("</td>");


                    out.println("<td class=\"col-sm-2\">");
                    out.println("<input id=\"meetingtype\" name=\"meetingtype\"  type=\"hidden\" value=\"" + meetingtype + "\"/>");
                    out.println("<input id=\"meetingcapacity\" name=\"meetingcapacity\"  type=\"hidden\" value=\"" + meetingcapacity + "\"/>");
                    out.println("<input id=\"duration\" name=\"duration\"  type=\"hidden\" value=\"" + duration + "\"/>");
                    out.println("<input id=\"repeat\" name=\"repeat\"  type=\"hidden\" value=\"" + repeat + "\"/>");
                    out.println("<input id=\"time\" name=\"time\"  type=\"hidden\" value=\"" + time + "\"/>");
                    out.println("<input id=\"title\" name=\"title\"  type=\"hidden\" value=\"" + title + "\"/>");
                    out.println("<input id=\"timezone\" name=\"timezone\"  type=\"hidden\" value=\"" + timezone + "\"/>");
                    out.println("<input id=\"Date\" name=\"Date\"  type=\"hidden\" value=\"" + Date + "\"/>");
                    out.println("<input id=\"userEmail\" name=\"userEmail\"  type=\"hidden\" value=\"" + userEmail + "\"/>");
                    out.println("<input id=\"userUsername\" name=\"userUsername\"  type=\"hidden\" value=\"" + userUsername + "\"/>");
                    out.println("<input type=\"button\" class=\"btn btn-md btn-danger btn-block text-right \" style=\"margin-top:7px;\" onclick=\"sendEmail()\" value=\"Send Invitation\"/>");
                    out.println("</td>");


                    out.println("</tr>");
                    out.println("</tbody>");
                    out.println("</table>");

                    out.println("<input class=\"btn-primary\" type=\"submit\" value=\"Submit\">");

                    out.println("</form>");

                }
            %>

        </div>
        <br><br><br><br><br><br><br><br>
    </div>
</div>
<jsp:include page="Footer.jsp" flush="true"/>

<script>
    var meetingcapacityjs = <%= meetingcapacity %>;
    var counter = 2;
    var testcounter = 1;

    document.getElementById("addrow").disabled = true;
    document.getElementById("submit").disabled=true;
    $(document).ready(function () {

        $("#addrow").on("click", function () {
            document.getElementById("addrow").disabled=true;
            var newRow = $("<tr>");
            var cols = "";

            cols += '<td><input type="text" class="form-control" name="iname' + counter + '" id="iname' + counter + '"/></td>';
            cols += '<td><input type="text" class="form-control" name="imail' + counter + '" id="imail' + counter + '"/></td>';

            //cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger" style="margin-top: 10px;"  value="Delete"></td>';
            cols += '<td><input type="button" onclick="sendEmailtoTeam()" class="btnDel btn btn-md btn-primary" id="isend"  style="margin-top: 10px;" value="Send Email"></td>';


            newRow.append(cols);
            $("table.order-list").append(newRow);
            if(counter <= meetingcapacityjs){
                ++counter;
                if(counter > meetingcapacityjs){
                    document.getElementById("addrow").disabled=true;
                }
            }
        });


        $("table.order-list").on("click", ".ibtnDel", function (event) {
            $(this).closest("tr").remove();
            counter -= 1
            document.getElementById("addrow").disabled=true;

        });
    });


    function calculateRow(row) {
        var price = +row.find('input[name^="price"]').val();

    }

    function calculateGrandTotal() {
        var grandTotal = 0;
        $("table.order-list").find('input[name^="price"]').each(function () {
            grandTotal += +$(this).val();
        });
        $("#grandtotal").text(grandTotal.toFixed(2));
    }
    function sendEmail() {
        var meetingtype = document.getElementById("meetingtype").value;
        var meetingcapacity = document.getElementById("meetingcapacity").value;
        var duration = document.getElementById("duration").value;
        var repeat = document.getElementById("repeat").value;
        var time = document.getElementById("time").value;
        var title = document.getElementById("title").value;
        var timezone = document.getElementById("timezone").value;
        var Date = document.getElementById("Date").value;
        var userEmail = document.getElementById("userEmail").value;
        var userUsername = document.getElementById("userUsername").value;

        //alert(meetingtype + " " + meetingcapacity + " " + duration + " " + repeat + " " + time + " " + title + " " + timezone + " " + Date + " " + userEmail + " " + userUsername);
        const name = document.getElementById("name").value;
        const emailTo = document.getElementById("mail").value;
        //alert(userEmail + "  " + emailTo);

        const message = "Hi " + name + ",\n" + " A new Meeting has been Scheduled .\n" + "Meeting Type : \n" + meetingtype + "\nMeeting Date/Time :\n" + time + ", " +
            Date + "(" + timezone + ")\n" + "Invitee Email :\n" + userEmail + "Meeting Guests :\n" + emailTo;
        const sub = "New Event : " + title + " - " + time + ", " + Date + " - " + duration + " Minute Meeting";
        //alert(sub + " " + userEmail +" "+ userUsername + "  "+ " " + message);

        Email.send({

            // ec2-52-49-120-150.eu-west-1.compute.amazonaws.com -> 93cf4e1f-9b98-4bfe-a19e-43961df8334e

            Host : "smtp.gmail.com",
            Username : "meetingschedulerteam@gmail.com",
            Password : "fvwmxdedppdpgyqm",
            To: emailTo,
            From: "meetingschedulerteam@gmail.com",
            Subject: sub,
            Body: message
        }).then(
            alert("Invitation Sent successfully"),
        );
    }


    function sendEmailtoTeam() {

        var meetingtype = document.getElementById("meetingtype").value;
        var meetingcapacity = document.getElementById("meetingcapacity").value;
        var duration = document.getElementById("duration").value;
        var repeat = document.getElementById("repeat").value;
        var time = document.getElementById("time").value;
        var title = document.getElementById("title").value;
        var timezone = document.getElementById("timezone").value;
        var Date = document.getElementById("Date").value;
        var userEmail = document.getElementById("userEmail").value;
        var userUsername = document.getElementById("userUsername").value;

        //alert(meetingtype + " " + meetingcapacity + " " + duration + " " + repeat + " " + time + " " + title + " " + timezone + " " + Date + " " + userEmail + " " + userUsername);
        var name ;
        var emailTo;

        if(testcounter < 2){
            name = document.getElementById("name").value;
            emailTo = document.getElementById("mail").value;
            //alert(name + " " + emailTo + " " + testcounter);
            ++testcounter;
            document.getElementById("addrow").disabled = false;
            document.getElementById("send").disabled = true;


        }else{

            name = document.getElementById("iname" + testcounter).value;
            emailTo = document.getElementById("imail" + testcounter).value;

            //alert(name + " " + emailTo);
            ++testcounter;
            document.getElementById("addrow").disabled=false;
            document.getElementById("isend").disabled=true;
            if(testcounter > meetingcapacity){
                document.getElementById("addrow").hidden=true;
                document.getElementById("submit").disabled=false;
                document.getElementById("isend").disabled=true;
            }
        }


        //alert(userEmail + "  " + emailTo);

        const message = "Hi " + name + ",\n" + " A new Meeting has been Scheduled .\n" + "Meeting Type : \n" + meetingtype + "\nMeeting Date/Time :\n" + time + ", " +
            Date + "(" + timezone + ")\n" + "Invitee Email :\n" + userEmail + "Meeting Guests :\n" + emailTo;
        const sub = "New Event : " + title + " - " + time + ", " + Date + " - " + duration + " Minute Meeting";
        //alert(sub + " " + userEmail +" "+ userUsername + "  "+ " " + message);
        Email.send({

            // ec2-52-49-120-150.eu-west-1.compute.amazonaws.com -> 93cf4e1f-9b98-4bfe-a19e-43961df8334e
            SecureToken: "ae5fbaf1-a872-417c-89cd-e47433eb965e",
            To: emailTo,
            From: userEmail,
            Subject: sub,
            Body: message
        }).then(
            alert("Invitation Sent successfully"),
        );


    }

</script>
</body>
</html>

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
