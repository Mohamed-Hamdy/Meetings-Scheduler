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
    var validator = $('#Date');

    $('#inputEmail4').blur(function () {
        //grab value from input field

        var SlotDate = $('#inputDate4').val();
        if (SlotDate != "") {
            //post to servlet
            $.ajax({
                type: "post",
                url: "SlotChecker",
                data: {
                    'SlotDate': SlotDate
                },
                success: function (response) {
                    validator.fadeIn(1000);
                    validator.html(response);

                }
            });
        } else {
            validator.fadeIn(1000);
            validator.html(" ");
        }

    });
    //when on focus, clean previous output
    $('#inputEmail4').focus(function () {
        validator.fadeOut(1000);

    });
});


//on submit, hide output for validator
$('#joinSubmitButton').click(function () {
    $('#emailValidator').hide();

});
