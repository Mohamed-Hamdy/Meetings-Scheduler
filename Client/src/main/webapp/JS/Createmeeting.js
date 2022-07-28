// Validator for form
(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();

//email validator

$(document).ready(function () {
    //grab target
    var timevalidator = $('#timeValidator');
    var datevalidator = $('#dateValidator');

    $('#inputTime4').blur(function () {
        //grab value from input field

        const SlotDate = $('#inputDate4').val();
        const SlotTime = $('#inputTime4').val();

        //console.log(SlotTime);
        if (SlotTime != "") {
            //post to servlet
            $.ajax({
                type: "post",
                url: "SlotChecker",
                data: {
                    'SlotTime': SlotTime,
                    'SlotDate':SlotDate
                },
                success: function (response) {
                    timevalidator.fadeIn(1000);
                    timevalidator.html(response);

                    datevalidator.fadeIn(1000);
                    datevalidator.html(response);

                }
            });
        } else {
            timevalidator.fadeIn(1000);
            timevalidator.html(" ");

            datevalidator.fadeIn(1000);
            datevalidator.html(" ");
        }

    });
    //when on focus, clean previous output
    $('#inputTime4').focus(function () {
        timevalidator.fadeOut(1000);
        datevalidator.fadeOut(1000);

    });
});



//on submit, hide output for validator
$('#joinSubmitButton').click(function () {
    $('#timeValidator').hide();
    $('#datevalidator').hide();

});
