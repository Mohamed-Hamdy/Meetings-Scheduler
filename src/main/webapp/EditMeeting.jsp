<%@ page import="java.sql.Date" %><%--
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
        <div class="col-lg-8  card bg-light order-lg-first order-last" style="margin-top:45px; margin-left: 15%;">
            <form name="gInfo" class="d-flex flex-column needs-validation"
                  style="height: 100%;" action="Editmeeting" method="get"
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
                    String roomservice = null;
                    if(meetingurl.substring(0,13).equals("https://video")){
                        roomservice = "Room Powered by herokuapp";
                    }else{
                        roomservice = "Room Powered by xirsys Cloud";
                    }
                    //System.out.println(meetingtype + " " +meetingcapacity );
                %>

                <h4 class="mt-4">Edit Your Meeting Info</h4>
                <hr>
                <div class="form-row">
                    <input type="hidden" class="form-control" id="meetingid" name="meetingid" value="<%=meetingid%>">
                    <input type="hidden" class="form-control" id="meetingurl" name="meetingurl" value="<%=meetingurl%>">

                    <input type="hidden" class="form-control" id="hiddenmeetingtype" name="hiddenmeetingtype" value="<%=meetingtype%>">
                    <input type="hidden" class="form-control" id="hiddenmeetingcapacity" name="hiddenmeetingcapacity" value="<%=meetingcapacity%>">


                    <div class="form-group col-md-6">
                        <%--@declare id="tz"--%><label for="timezone">Timezone</label>

                        <input type="text"
                               class="form-control" id="timezone" name="timezone"
                               placeholder="Continent/Timezone" list="tz" value="<%=timezone%>"
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
                               placeholder="YYYY-MM-DD"  min="<%=Date%>" value="<%=Date%>"
                               required>
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
                               value="<%=time%>" required>
                            <div class="time-val" id="timeValidator"></div>
                            <div class="invalid-feedback">Please provide a valid
                            time.
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <%--@declare id="title"--%><label for="title">Title</label>
                        <input type="text"
                               class="form-control" id="title" name="title"
                               placeholder="My awesome meeting" type="text" value="<%=title%>" required>
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
                           required>
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
                               required>

                        <div class="valid-feedback">Right on!</div>
                        <div class="invalid-feedback">min 30 Minutes max 120 Minutes
                        </div>

                    </div>

                    <div class="form-group col-md-6">
                        <%--@declare id="inputrepeat"--%><label for="inputRepeat">Repeat?</label>
                        <select name="repeat" class="form-control" aria-label="Default select example">
                            <option selected><%=repeat%></option>
                            <option value="Never">Never</option>
                            <option value="Daily">Daily</option>
                            <option value="Weekly">Weekly</option>
                            <option value="Monthly">Monthly</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <%--@declare id="inputtype"--%><label for="inputtype">Meeting Type</label>
                        <select name="meetingtype" id="meetingtype" class="form-control" aria-label="Default select example">
                            <option selected><%=meetingtype%></option>
                            <option value="One to One">One to One</option>
                            <option value="Team">Team</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <%--@declare id="inputtype"--%><label for="inputtype">Room Service</label>
                        <select name="roomservice" id="roomservice" class="form-control" aria-label="Default select example">
                            <option selected><%=roomservice%></option>
                            <option value="xirsys">Room Powered by xirsys Cloud</option>
                            <option value="herokuapp">Room Powered by herokuapp</option>
                        </select>
                    </div>


                    <div class="form-group col-md-12" id="add_fields_placeholderdiv">
                        <label for="inputDuration">Meeting Capacity</label>

                        <input type="number"
                               class="form-control" name="add_fields_placeholderValue" id="add_fields_placeholderinput"
                               value="<%=meetingcapacity%>" placeholder="Enter Your Meeting Capacity" min="2" max="50"
                               required>

                        <div class="valid-feedback">Good</div>
                        <div class="invalid-feedback">Min 3 participant max 50 participant
                        </div>

                    </div>
                </div>

                <div class="my-auto w-100 ">
                    <button type="hidden" id="joinSubmitButton" class="btn btn-primary btn-block mb-2">Submit
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<br><br>
<jsp:include page="Footer.jsp" flush="true"/>
<script src="JS/CreateMeeting.js"></script>

<script>
    $(document).ready(function()
    {


        $("#meetingtype").change(function()
        {
            if($(this).val() == "Team")
            {
                $("#add_fields_placeholderdiv").show();
                $("#add_fields_placeholderinput").show();
            }
            else
            {
                $("#add_fields_placeholderdiv").hide();
                $("#add_fields_placeholderinput").hide();
                document.getElementById("add_fields_placeholderinput").value = "2";
            }
        });
        $("#add_fields_placeholderdiv").hide();
        $("#add_fields_placeholderinput").hide();


    });
</script>

</body>
</html>
<!-- http://en.wikipedia.org/wiki/List_of_tz_database_time_zones -->
<datalist id="tz">
    <option>Africa/Abidjan</option>
    <option>Africa/Accra</option>
    <option>Africa/Addis Ababa</option>
    <option>Africa/Algiers</option>
    <option>Africa/Asmara</option>
    <option>Africa/Bamako</option>
    <option>Africa/Bangui</option>
    <option>Africa/Banjul</option>
    <option>Africa/Bissau</option>
    <option>Africa/Blantyre</option>
    <option>Africa/Brazzaville</option>
    <option>Africa/Bujumbura</option>
    <option>Africa/Cairo</option>
    <option>Africa/Casablanca</option>
    <option>Africa/Ceuta</option>
    <option>Africa/Conakry</option>
    <option>Africa/Dakar</option>
    <option>Africa/Dar es Salaam</option>
    <option>Africa/Djibouti</option>
    <option>Africa/Douala</option>
    <option>Africa/El Aaiun</option>
    <option>Africa/Freetown</option>
    <option>Africa/Gaborone</option>
    <option>Africa/Harare</option>
    <option>Africa/Johannesburg</option>
    <option>Africa/Juba</option>
    <option>Africa/Kampala</option>
    <option>Africa/Khartoum</option>
    <option>Africa/Kigali</option>
    <option>Africa/Kinshasa</option>
    <option>Africa/Lagos</option>
    <option>Africa/Libreville</option>
    <option>Africa/Lome</option>
    <option>Africa/Luanda</option>
    <option>Africa/Lubumbashi</option>
    <option>Africa/Lusaka</option>
    <option>Africa/Malabo</option>
    <option>Africa/Maputo</option>
    <option>Africa/Maseru</option>
    <option>Africa/Mbabane</option>
    <option>Africa/Mogadishu</option>
    <option>Africa/Monrovia</option>
    <option>Africa/Nairobi</option>
    <option>Africa/Ndjamena</option>
    <option>Africa/Niamey</option>
    <option>Africa/Nouakchott</option>
    <option>Africa/Ouagadougou</option>
    <option>Africa/Porto-Novo</option>
    <option>Africa/Sao Tome</option>
    <option>Africa/Tripoli</option>
    <option>Africa/Tunis</option>
    <option>Africa/Windhoek</option>
    <option>America/Adak</option>
    <option>America/Anchorage</option>
    <option>America/Anguilla</option>
    <option>America/Antigua</option>
    <option>America/Araguaina</option>
    <option>America/Argentina/Buenos Aires</option>
    <option>America/Argentina/Catamarca</option>
    <option>America/Argentina/Cordoba</option>
    <option>America/Argentina/Jujuy</option>
    <option>America/Argentina/La Rioja</option>
    <option>America/Argentina/Mendoza</option>
    <option>America/Argentina/Rio Gallegos</option>
    <option>America/Argentina/Salta</option>
    <option>America/Argentina/San Juan</option>
    <option>America/Argentina/San Luis</option>
    <option>America/Argentina/Tucuman</option>
    <option>America/Argentina/Ushuaia</option>
    <option>America/Aruba</option>
    <option>America/Asuncion</option>
    <option>America/Atikokan</option>
    <option>America/Bahia</option>
    <option>America/Bahia Banderas</option>
    <option>America/Barbados</option>
    <option>America/Belem</option>
    <option>America/Belize</option>
    <option>America/Blanc-Sablon</option>
    <option>America/Boa Vista</option>
    <option>America/Bogota</option>
    <option>America/Boise</option>
    <option>America/Cambridge Bay</option>
    <option>America/Campo Grande</option>
    <option>America/Cancun</option>
    <option>America/Caracas</option>
    <option>America/Cayenne</option>
    <option>America/Cayman</option>
    <option>America/Chicago</option>
    <option>America/Chihuahua</option>
    <option>America/Costa Rica</option>
    <option>America/Creston</option>
    <option>America/Cuiaba</option>
    <option>America/Curacao</option>
    <option>America/Danmarkshavn</option>
    <option>America/Dawson</option>
    <option>America/Dawson Creek</option>
    <option>America/Denver</option>
    <option>America/Detroit</option>
    <option>America/Dominica</option>
    <option>America/Edmonton</option>
    <option>America/Eirunepe</option>
    <option>America/El Salvador</option>
    <option>America/Fortaleza</option>
    <option>America/Glace Bay</option>
    <option>America/Godthab</option>
    <option>America/Goose Bay</option>
    <option>America/Grand Turk</option>
    <option>America/Grenada</option>
    <option>America/Guadeloupe</option>
    <option>America/Guatemala</option>
    <option>America/Guayaquil</option>
    <option>America/Guyana</option>
    <option>America/Halifax</option>
    <option>America/Havana</option>
    <option>America/Hermosillo</option>
    <option>America/Indiana/Indianapolis</option>
    <option>America/Indiana/Knox</option>
    <option>America/Indiana/Marengo</option>
    <option>America/Indiana/Petersburg</option>
    <option>America/Indiana/Tell City</option>
    <option>America/Indiana/Vevay</option>
    <option>America/Indiana/Vincennes</option>
    <option>America/Indiana/Winamac</option>
    <option>America/Inuvik</option>
    <option>America/Iqaluit</option>
    <option>America/Jamaica</option>
    <option>America/Juneau</option>
    <option>America/Kentucky/Louisville</option>
    <option>America/Kentucky/Monticello</option>
    <option>America/La Paz</option>
    <option>America/Lima</option>
    <option>America/Los Angeles</option>
    <option>America/Maceio</option>
    <option>America/Managua</option>
    <option>America/Manaus</option>
    <option>America/Martinique</option>
    <option>America/Matamoros</option>
    <option>America/Mazatlan</option>
    <option>America/Menominee</option>
    <option>America/Merida</option>
    <option>America/Metlakatla</option>
    <option>America/Mexico City</option>
    <option>America/Miquelon</option>
    <option>America/Moncton</option>
    <option>America/Monterrey</option>
    <option>America/Montevideo</option>
    <option>America/Montreal</option>
    <option>America/Montserrat</option>
    <option>America/Nassau</option>
    <option>America/New York</option>
    <option>America/Nipigon</option>
    <option>America/Nome</option>
    <option>America/Noronha</option>
    <option>America/North Dakota/Beulah</option>
    <option>America/North Dakota/Center</option>
    <option>America/North Dakota/New Salem</option>
    <option>America/Ojinaga</option>
    <option>America/Panama</option>
    <option>America/Pangnirtung</option>
    <option>America/Paramaribo</option>
    <option>America/Phoenix</option>
    <option>America/Port of Spain</option>
    <option>America/Port-au-Prince</option>
    <option>America/Porto Velho</option>
    <option>America/Puerto Rico</option>
    <option>America/Rainy River</option>
    <option>America/Rankin Inlet</option>
    <option>America/Recife</option>
    <option>America/Regina</option>
    <option>America/Resolute</option>
    <option>America/Rio Branco</option>
    <option>America/Santa Isabel</option>
    <option>America/Santarem</option>
    <option>America/Santiago</option>
    <option>America/Santo Domingo</option>
    <option>America/Sao Paulo</option>
    <option>America/Scoresbysund</option>
    <option>America/Sitka</option>
    <option>America/St Johns</option>
    <option>America/St Kitts</option>
    <option>America/St Lucia</option>
    <option>America/St Thomas</option>
    <option>America/St Vincent</option>
    <option>America/Swift Current</option>
    <option>America/Tegucigalpa</option>
    <option>America/Thule</option>
    <option>America/Thunder Bay</option>
    <option>America/Tijuana</option>
    <option>America/Toronto</option>
    <option>America/Tortola</option>
    <option>America/Vancouver</option>
    <option>America/Whitehorse</option>
    <option>America/Winnipeg</option>
    <option>America/Yakutat</option>
    <option>America/Yellowknife</option>
    <option>Antarctica/Casey</option>
    <option>Antarctica/Davis</option>
    <option>Antarctica/DumontDUrville</option>
    <option>Antarctica/Macquarie</option>
    <option>Antarctica/Mawson</option>
    <option>Antarctica/McMurdo</option>
    <option>Antarctica/Palmer</option>
    <option>Antarctica/Rothera</option>
    <option>Antarctica/Syowa</option>
    <option>Antarctica/Vostok</option>
    <option>Asia/Aden</option>
    <option>Asia/Almaty</option>
    <option>Asia/Amman</option>
    <option>Asia/Anadyr</option>
    <option>Asia/Aqtau</option>
    <option>Asia/Aqtobe</option>
    <option>Asia/Ashgabat</option>
    <option>Asia/Baghdad</option>
    <option>Asia/Bahrain</option>
    <option>Asia/Baku</option>
    <option>Asia/Bangkok</option>
    <option>Asia/Beirut</option>
    <option>Asia/Bishkek</option>
    <option>Asia/Brunei</option>
    <option>Asia/Choibalsan</option>
    <option>Asia/Chongqing</option>
    <option>Asia/Colombo</option>
    <option>Asia/Damascus</option>
    <option>Asia/Dhaka</option>
    <option>Asia/Dili</option>
    <option>Asia/Dubai</option>
    <option>Asia/Dushanbe</option>
    <option>Asia/Gaza</option>
    <option>Asia/Harbin</option>
    <option>Asia/Hebron</option>
    <option>Asia/Ho Chi Minh</option>
    <option>Asia/Hong Kong</option>
    <option>Asia/Hovd</option>
    <option>Asia/Irkutsk</option>
    <option>Asia/Jakarta</option>
    <option>Asia/Jayapura</option>
    <option>Asia/Jerusalem</option>
    <option>Asia/Kabul</option>
    <option>Asia/Kamchatka</option>
    <option>Asia/Karachi</option>
    <option>Asia/Kashgar</option>
    <option>Asia/Kathmandu</option>
    <option>Asia/Kolkata</option>
    <option>Asia/Krasnoyarsk</option>
    <option>Asia/Kuala Lumpur</option>
    <option>Asia/Kuching</option>
    <option>Asia/Kuwait</option>
    <option>Asia/Macau</option>
    <option>Asia/Magadan</option>
    <option>Asia/Makassar</option>
    <option>Asia/Manila</option>
    <option>Asia/Muscat</option>
    <option>Asia/Nicosia</option>
    <option>Asia/Novokuznetsk</option>
    <option>Asia/Novosibirsk</option>
    <option>Asia/Omsk</option>
    <option>Asia/Oral</option>
    <option>Asia/Phnom Penh</option>
    <option>Asia/Pontianak</option>
    <option>Asia/Pyongyang</option>
    <option>Asia/Qatar</option>
    <option>Asia/Qyzylorda</option>
    <option>Asia/Rangoon</option>
    <option>Asia/Riyadh</option>
    <option>Asia/Sakhalin</option>
    <option>Asia/Samarkand</option>
    <option>Asia/Seoul</option>
    <option>Asia/Shanghai</option>
    <option>Asia/Singapore</option>
    <option>Asia/Taipei</option>
    <option>Asia/Tashkent</option>
    <option>Asia/Tbilisi</option>
    <option>Asia/Tehran</option>
    <option>Asia/Thimphu</option>
    <option>Asia/Tokyo</option>
    <option>Asia/Ulaanbaatar</option>
    <option>Asia/Urumqi</option>
    <option>Asia/Vientiane</option>
    <option>Asia/Vladivostok</option>
    <option>Asia/Yakutsk</option>
    <option>Asia/Yekaterinburg</option>
    <option>Asia/Yerevan</option>
    <option>Atlantic/Azores</option>
    <option>Atlantic/Bermuda</option>
    <option>Atlantic/Canary</option>
    <option>Atlantic/Cape Verde</option>
    <option>Atlantic/Faroe</option>
    <option>Atlantic/Madeira</option>
    <option>Atlantic/Reykjavik</option>
    <option>Atlantic/South Georgia</option>
    <option>Atlantic/St Helena</option>
    <option>Atlantic/Stanley</option>
    <option>Australia/Adelaide</option>
    <option>Australia/Brisbane</option>
    <option>Australia/Broken Hill</option>
    <option>Australia/Currie</option>
    <option>Australia/Darwin</option>
    <option>Australia/Eucla</option>
    <option>Australia/Hobart</option>
    <option>Australia/Lindeman</option>
    <option>Australia/Lord Howe</option>
    <option>Australia/Melbourne</option>
    <option>Australia/Perth</option>
    <option>Australia/Sydney</option>
    <option>Europe/Amsterdam</option>
    <option>Europe/Andorra</option>
    <option>Europe/Athens</option>
    <option>Europe/Belgrade</option>
    <option>Europe/Berlin</option>
    <option>Europe/Brussels</option>
    <option>Europe/Bucharest</option>
    <option>Europe/Budapest</option>
    <option>Europe/Chisinau</option>
    <option>Europe/Copenhagen</option>
    <option>Europe/Dublin</option>
    <option>Europe/Gibraltar</option>
    <option>Europe/Helsinki</option>
    <option>Europe/Istanbul</option>
    <option>Europe/Kaliningrad</option>
    <option>Europe/Kiev</option>
    <option>Europe/Lisbon</option>
    <option>Europe/London</option>
    <option>Europe/Luxembourg</option>
    <option>Europe/Madrid</option>
    <option>Europe/Malta</option>
    <option>Europe/Minsk</option>
    <option>Europe/Monaco</option>
    <option>Europe/Moscow</option>
    <option>Europe/Oslo</option>
    <option>Europe/Paris</option>
    <option>Europe/Prague</option>
    <option>Europe/Riga</option>
    <option>Europe/Rome</option>
    <option>Europe/Samara</option>
    <option>Europe/Simferopol</option>
    <option>Europe/Sofia</option>
    <option>Europe/Stockholm</option>
    <option>Europe/Tallinn</option>
    <option>Europe/Tirane</option>
    <option>Europe/Uzhgorod</option>
    <option>Europe/Vaduz</option>
    <option>Europe/Vienna</option>
    <option>Europe/Vilnius</option>
    <option>Europe/Volgograd</option>
    <option>Europe/Warsaw</option>
    <option>Europe/Zaporozhye</option>
    <option>Europe/Zurich</option>
    <option>Indian/Antananarivo</option>
    <option>Indian/Chagos</option>
    <option>Indian/Christmas</option>
    <option>Indian/Cocos</option>
    <option>Indian/Comoro</option>
    <option>Indian/Kerguelen</option>
    <option>Indian/Mahe</option>
    <option>Indian/Maldives</option>
    <option>Indian/Mauritius</option>
    <option>Indian/Mayotte</option>
    <option>Indian/Reunion</option>
    <option>Pacific/Apia</option>
    <option>Pacific/Auckland</option>
    <option>Pacific/Chatham</option>
    <option>Pacific/Chuuk</option>
    <option>Pacific/Easter</option>
    <option>Pacific/Efate</option>
    <option>Pacific/Enderbury</option>
    <option>Pacific/Fakaofo</option>
    <option>Pacific/Fiji</option>
    <option>Pacific/Funafuti</option>
    <option>Pacific/Galapagos</option>
    <option>Pacific/Gambier</option>
    <option>Pacific/Guadalcanal</option>
    <option>Pacific/Guam</option>
    <option>Pacific/Honolulu</option>
    <option>Pacific/Johnston</option>
    <option>Pacific/Kiritimati</option>
    <option>Pacific/Kosrae</option>
    <option>Pacific/Kwajalein</option>
    <option>Pacific/Majuro</option>
    <option>Pacific/Marquesas</option>
    <option>Pacific/Midway</option>
    <option>Pacific/Nauru</option>
    <option>Pacific/Niue</option>
    <option>Pacific/Norfolk</option>
    <option>Pacific/Noumea</option>
    <option>Pacific/Pago Pago</option>
    <option>Pacific/Palau</option>
    <option>Pacific/Pitcairn</option>
    <option>Pacific/Pohnpei</option>
    <option>Pacific/Port Moresby</option>
    <option>Pacific/Rarotonga</option>
    <option>Pacific/Saipan</option>
    <option>Pacific/Tahiti</option>
    <option>Pacific/Tarawa</option>
    <option>Pacific/Tongatapu</option>
    <option>Pacific/Wake</option>
    <option>Pacific/Wallis</option>
    <option>UTC</option>
</datalist>