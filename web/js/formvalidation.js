$(document).ready(function () {

    $('#login').click(function () {

        var valid = true;

        var FullName = $('#FullName').val();
        var Email = $('#Email').val();
        var Phone = $('#Phone').val();
        var Password = $('#Password').val();
        var Password1 = $('#Password1').val();
        var RePassword = $('#RePassword').val();
        var Address = $('#Address').val();
        var Description = $('#Description').val();
        var City = $('#City').val();

        $(".error").remove();

        if (City === "") {           
            $("#FullName").css("outline", "1px solid red");
            $('#FullName').after('<span class="error">Please! select an option.</span>');
            valid = false;
        }

        //FullName validation
        if (FullName === "") {
            $("#FullName").css("outline", "1px solid red");
            $('#FullName').after('<span class="error">Please! Enter Full Name.</span>');
            valid = false;
        } else {
            $("#FullName").css("outline", "1px solid green");
        }

        //Email validation
        if (Email === "") {
            $("#Email").css("outline", "1px solid red");
            $('#Email').after('<span class="error">Please! Enter Email Address.</span>');
            valid = false;
        } else {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!(regex.test(Email))) {

                $("#Email").css("outline", "1px solid red");
                $('#Email').after('<span class="error">Please! Enter Valid Email Address.</span>');

                valid = false;
            } else {
                $("#Email").css("outline", "1px solid green");
            }
        }

        //Phone validation
        if (Phone === "") {
            $("#Phone").css("outline", "1px solid red");
            $('#Phone').after('<span class="error">Please! Enter Phone Number.</span>');
            valid = false;

        } else {
            var regEy = /^\(?(\d{3})\)?[-\. ]?(\d{3})[-\. ]?(\d{4})$/;
            var validPhone = regEy.test(Phone);
            if (!validPhone || Phone.length < 10) {
                $("#Phone").css("outline", "1px solid red");
                $('#Phone').after('<span class="error">Enter A Valid Phone Numder.</span>');
                valid = false;
            } else {
                $("#Phone").css("outline", "1px solid green");
            }
        }

        //password validation
        if (Password === "") {
            $("#Password").css("outline", "1px solid red");
            $('#Password').after('<span class="error">Please! Enter Password.</span>');
            valid = false;
        } else {
            if (!(Password.length === 6)) {
                $("#Password").css("outline", "1px solid red");
                $('#Password').after('<span class="error">Please! Enter Password Must Be 6 Characters Long.</span>');
                valid = false;
            } else {
                $("#Password").css("outline", "1px solid green");
            }
        }

        //Password1 validation
        if (Password1.length < 8 || RePassword.length < 8) {
            $("#Password1").css("outline", "1px solid red");
            $("#RePassword").css("outline", "1px solid red");
            $('#Password1').after('<span class="error">Please! Enter Password Must Be Least 8 Characters Long.</span>');
            $('#RePassword').after('<span class="error">Please! Enter Password Must Be Least 8 Characters Long.</span>');
            valid = false;
        } else if (Password1 !== RePassword)
        {
            $("#RePassword").css("outline", "1px solid red");
            $('#RePassword').after('<span class="error">Please! Enter Password Is Not Match.</span>');
            valid = false;
        } else {
            $("#Password1").css("outline", "1px solid green");
            $("#RePassword").css("outline", "1px solid green");
        }

        //Address validation
        if (Address === "") {
            $("#Address").css("outline", "1px solid red");
            $('#Address').after('<span class="error">Please! Enter Address.</span>');
            valid = false;
        } else {
            $("#Address").css("outline", "1px solid green");
        }

        //Description validation
        if (Description === "") {
            $("#Description").css("outline", "1px solid red");
            $('#Description').after('<span class="error">Please! Enter Description.</span>');
            valid = false;
        } else {
            $("#Description").css("outline", "1px solid green");
        }


        return valid;

    });

});