// ====== Profile From Validation ====== //

$('#CDetails').click(function () {

    var valid = true;

    var FullName = $('#FullName').val();
    var Email = $('#Email').val();
    var Phone = $('#Phone').val();
    var APhone = $('#APhone').val();
    var Address = $('#Address').val();
    var Categeory = $('#categeory').val();
    var Subject = $('#Subject').val();
    var Mess = $('#Mess').val();
    
    
    $(".error").remove();
    
    //FullName validation
    if ((FullName != undefined) && FullName === "") {
        $("#FullName").css("outline", "1px solid red");
        $('#FullName').after('<span class="error">Please! Enter Full Name.</span>');
        valid = false;
    } else {
        $("#FullName").css("outline", "1px solid green");
    }
    
    //Email validation
    if ((Email != undefined) && Email === "") {
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
    if ((Phone != undefined) && Phone === "") {
        $("#Phone").css("outline", "1px solid red");
        $('#Phone').after('<span class="error">Please! Enter Phone Number.</span>');
        valid = false;

    } else {
        var regEy = /^\(?(\d{3})\)?[-\. ]?(\d{3})[-\. ]?(\d{4})$/;
        var validPhone = regEy.test(Phone);
        if ((Phone != undefined) && (!validPhone || Phone.length < 10)) {
            $("#Phone").css("outline", "1px solid red");
            $('#Phone').after('<span class="error">Enter A Valid Phone Numder.</span>');
            valid = false;
        } else {
            $("#Phone").css("outline", "1px solid green");
        }
    }
    
    //APhone validation
    if ((APhone != undefined) && APhone === "") {
        $("#APhone").css("outline", "1px solid red");
        $('#APhone').after('<span class="error">Please! Enter Phone Number.</span>');
        valid = false;

    } else {
        var regEy = /^\(?(\d{3})\)?[-\. ]?(\d{3})[-\. ]?(\d{4})$/;
        var validPhone = regEy.test(APhone);
        if ((APhone != undefined) && (!validPhone || APhone.length < 10)) {
            $("#APhone").css("outline", "1px solid red");
            $('#APhone').after('<span class="error">Enter A Valid Phone Numder.</span>');
            valid = false;
        } else {
            $("#APhone").css("outline", "1px solid green");
        }
    }
    
    //Address validation
    if ((Address != undefined) && Address === "") {
        $("#Address").css("outline", "1px solid red");
        $('#Address').after('<span class="error">Please! Enter Address.</span>');
        valid = false;
    } else {
        $("#Address").css("outline", "1px solid green");
    }
    
    //Categeory validation
    if ((Categeory != undefined) && Categeory === "") {
        $("#Categeory").css("outline", "1px solid red");
        $('#Categeory').after('<span class="error">Please! Select Categeory.</span>');
        valid = false;
    } else {
        $("#Categeory").css("outline", "1px solid green");
    }
    //Subject validation
    if ((Subject != undefined) && Subject === "") {
        $("#Subject").css("outline", "1px solid red");
        $('#Subject').after('<span class="error">Please! Enter Subject.</span>');
        valid = false;
    } else {
        $("#Subject").css("outline", "1px solid green");
    }
    
    //Message validation
    if ((Mess != undefined) && Mess === "") {
        $("#Mess").css("outline", "1px solid red");
        $('#Mess').after('<span class="error">Please! Enter Short Message.</span>');
        valid = false;
    } else {
        $("#Mess").css("outline", "1px solid green");
    }
    
    return valid;
    

});

// ====== Delivery Address Select From Validation ====== //

$('#DAdd').click(function () { 
    
    var valid = true;

    var Title = $('#Title').val();
    var Flat = $('#Flat').val();
    var Street = $('#Street').val();
    var Pincode = $('#Pincode').val();
    var Locality = $('#Locality').val();

    $(".error").remove();

    //Title validation
    if (Title === "") {
        $("#Title").css("outline", "1px solid red");
        $('#Title').after('<span class="error">Please! Select An Title.</span>');
        valid = false;
    } else {
        $("#Title").css("outline", "1px solid green");
    }

    //Flat validation
    if (Flat === "") {
        $("#Flat").css("outline", "1px solid red");
        $('#Flat').after('<span class="error">Please! Enter Flat.</span>');
        valid = false;
    } else {
        $("#Flat").css("outline", "1px solid green");
    }

    //Street validation
    if (Street === "") {
        $("#Street").css("outline", "1px solid red");
        $('#Street').after('<span class="error">Please! Enter Street.</span>');
        valid = false;
    } else {
        $("#Street").css("outline", "1px solid green");
    }

    //Pincode validation
    if (Pincode === "") {
        $("#Pincode").css("outline", "1px solid red");
        $('#Pincode').after('<span class="error">Please! Enter Pincode.</span>');
        valid = false;

    } else if (Pincode.length < 6) {
        $("#Pincode").css("outline", "1px solid red");
        $('#Pincode').after('<span class="error">Please! Pincode should only be 6 digits.</span>');
        valid = false;
    } else {
        $("#Pincode").css("outline", "1px solid green");
    }

    //Locality validation
    if (Locality === "") {
        $("#Locality").css("outline", "1px solid red");
        $('#Locality').after('<span class="error">Please! Enter Locality.</span>');
        valid = false;
    } else {
        $("#Locality").css("outline", "1px solid green");
    }
    
    if(valid){        
       changeAddress(this, 0);        
    }

    return valid;

});


/*$('#validation').click(function () {
    var FullName = $("#FullName").val();
    var Email = $("#Email").val();
    var Phone = $("#Phone").val();
    var Address = $("#Address").val();

    //FullName validation
    if (FullName === "") {
        $("#FullName").css("outline", "1px solid red");
        $("#Email,#Phone,#Address").css("outline", "none");
        $("#msg").removeClass('d-none');
        $("#msg").html("<h6 class='text-dark my-2 text-center'>Please! Enter FullName.</h6>");
        return false;
    }
    //Email validation
    if (Email === "") {
        $("#Email").css("outline", "1px solid red");
        $("#FullName,#Phone,#Address").css("outline", "none");
        $("#msg").removeClass('d-none');
        $("#msg").html("<h6 class='text-dark my-2 text-center'>Please! Enter Email Address.</h6>");
        return false;
    } else {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!(regex.test(Email))) {

            $("#Email").css("outline", "1px solid red");
            $("#FullName,#Phone,#Address").css("outline", "none");
            $("#msg").removeClass('d-none');
            $("#msg").html("<h6 class='text-dark my-2 text-center'>Please! Enter Valid Email Address.</h6>");
            return false;
        }
    }
    //password validation
    if (Phone === "") {
        $("#Phone").css("outline", "1px solid red");
        $("#FullName,#Email,#Address").css("outline", "none");
        $("#msg").removeClass('d-none');
        $("#msg").html("<h6 class='text-dark my-2 text-center'>Please! Enter Phone Number.</h6>");
        return false;
    } else {
        if (!(Phone.length == 10)) {
            $("#Phone").css("outline", "1px solid red");
            $("#FullName,#Email,#Address").css("outline", "none");
            $("#msg").removeClass('d-none');
            $("#msg").html("<h6 class='text-dark my-2 text-center'>Phone Number must be 10 digit long</h6>");
            return false;
        }
    }
    //Address validation
    if (Address === "") {
        $("#Address").css("outline", "1px solid red");
        $("#FullName,#Email,#Phone").css("outline", "none");
        $("#msg").removeClass('d-none');
        $("#msg").html("<h6 class='text-dark my-2 text-center'>Please! Enter Address.</h6>");
        return false;
    }
});*/