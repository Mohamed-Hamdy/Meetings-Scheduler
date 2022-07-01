<!doctype html>

<html lang="en">
<head>
    <title>meeting room</title>
    <%
        //delete cache to prevent back button after logout
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    %>

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
<jsp:include page="Header.jsp" flush="true"/>

<div class="row">
    <div class="col-sm-12 bg-light">
        <br><br><br><br><br>

        <div class="form">
            <form action="meetingroomservlet" method="get">
                <div>
                    <h4>Add Your Participants List</h4>
                </div>
                <hr>
                <!------ Include the above in your HEAD tag ---------->

                <table id="myTable" class=" table order-list text-center">
                    <thead>
                    <tr>
                        <td>Name</td>
                        <td>Gmail</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="col-sm-6">
                            <input type="text" name="name" class="form-control"/>
                        </td>
                        <td class="col-sm-6">
                            <input type="text" name="mail" class="form-control"/>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="5" style="text-align: left;">
                            <input type="button" class="btn btn-md btn-danger btn-block " id="addrow" value="Add Participant"/>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    </tfoot>
                </table>
                <input class="btn-primary" type="submit" value="Submit">
            </form>

        </div>
        <br><br><br><br><br><br><br><br>
    </div>
</div>
<jsp:include page="Footer.jsp" flush="true"/>

<script>
    $(document).ready(function () {
        var counter = 0;

        $("#addrow").on("click", function () {
            var newRow = $("<tr>");
            var cols = "";

            cols += '<td><input type="text" class="form-control" name="name' + counter + '"/></td>';
            cols += '<td><input type="text" class="form-control" name="mail' + counter + '"/></td>';

            cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger" style="margin-top: 10px; "  value="Delete"></td>';
            newRow.append(cols);
            $("table.order-list").append(newRow);
            counter++;
        });


        $("table.order-list").on("click", ".ibtnDel", function (event) {
            $(this).closest("tr").remove();
            counter -= 1
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
