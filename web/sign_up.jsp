<%-- 
    Document   : sign_up
    Created on : 18 Feb, 2021, 11:07:52 AM
    Author     : parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Sign Up</title>

    </head>
    <body>
        <div class="sign-inup">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="sign-form">
                            <div class="sign-inner">
                                <div class="sign-logo" id="logo">
                                    <a href="index.jsp"><img src="images/logo.png" alt=""></a>
                                    <a href="index.jsp"><img class="logo-inverse" src="images/dark-logo.png" alt=""></a>
                                </div>
                                <div class="form-dt">
                                    <div class="form-inpts checout-address-step">
                                        <form action="userServlet" method="POST" enctype="multipart/form-data">
                                            <div class="form-title"><h6>Sign Up</h6></div>
                                            <div class="form-group pos_rel">
                                                <input type="text" id="FullName" name="full_name"  placeholder="Full name" class="form-control lgn_input" required="">
                                                <i class="uil uil-user-circle lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input type="email" id="Email" name="email"  placeholder="Email Address" class="form-control lgn_input" required="">
                                                <i class="uil uil-envelope lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input type="text" id="Phone" name="phone" placeholder="Phone Number" class="form-control lgn_input" required="">
                                                <i class="uil uil-mobile-android-alt lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input type="password" id="Password1" name="password"  placeholder="Password" class="form-control lgn_input" required="">
                                                <i class="uil uil-padlock lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input type="password" id="RePassword"  placeholder="Password confirm" class="form-control lgn_input" required="">
                                                <i class="uil uil-padlock lgn_icon"></i>
                                            </div>
                                            <input type="hidden" name="type" value="Customer">
                                            <div class="align-self-center mx-auto"> 
                                                <input type="submit" id="login" class="login-btn hover-btn" value="Sign Up Now">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="signup-link">
                                        <p>I have an account? - <a href="sign_in.jsp">Sign In Now</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="copyright-text text-center mt-3">
                            Copyright <i class="uil uil-copyright"></i> 2020 <b>AP SUPER MART</b>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- include the footer link -->
        <jsp:include page="footer_link.jsp" />

        <script>
            $(document).ready(function () {

                $('#login').click(function () {

                    var valid = true;

                    var FullName = $('#FullName').val();
                    var Email = $('#Email').val();
                    var Phone = $('#Phone').val();
                    var Password1 = $('#Password1').val();
                    var RePassword = $('#RePassword').val();

                    $(".error").remove();

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

                    //Password & RePassword validation
                    if (Password1 === "" && RePassword === "") {
                        $("#Password1").css("outline", "1px solid red");
                        $("#RePassword").css("outline", "1px solid red");
                        $('#Password1').after('<span class="error">Please! Enter New Password.</span>');
                        $('#RePassword').after('<span class="error">Please! Enter Confirm Password.</span>');
                        valid = false;
                    } else {
                        if (Password1.length < 6 && RePassword.length < 6) {
                            $("#Password1").css("outline", "1px solid red");
                            $("#RePassword").css("outline", "1px solid red");
                            $('#Password1').after('<span class="error">Please! Enter Password Must Be 6 Characters Long.</span>');
                            $('#RePassword').after('<span class="error">Please! Enter Password Must Be 6 Characters Long.</span>');
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
                    }


                    return valid;

                });

            });
        </script>

    </body>
</html>
