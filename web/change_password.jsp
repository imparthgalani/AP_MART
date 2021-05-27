<%-- 
    Document   : forgot_password
    Created on : 23 Mar, 2021, 10:43:11 AM
    Author     : Parth
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Sign In</title>

    </head>
    <body>   
        <div class="sign-inup">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="sign-form">
                            <div class="sign-inner">
                                <div class="sign-logo" id="logo">
                                    <a href="./"><img src="images/logo.png" alt=""></a>
                                    <a href="./"><img class="logo-inverse" src="images/dark-logo.png" alt=""></a>
                                </div>
                                <div class="form-dt">
                                    <div class="form-inpts checout-address-step">
                                        <form action="changePassword" method="post">
                                            <div class="form-title"><h6>Request a Password Reset</h6></div>
                                            <div class="form-title" style="color: red">
                                                <%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""%>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input id="Email" name="email" type="email" placeholder="Your Email Address" class="form-control lgn_input" required="">
                                                <i class="uil uil-envelope lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input id="OPassword" name="OldPassword" type="password" placeholder="Enter Old Password" class="form-control lgn_input" required="">
                                                <i class="uil uil-padlock lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input id="Password1" name="passwordnew" type="password" placeholder="Enter New Password" class="form-control lgn_input" required="">
                                                <i class="uil uil-padlock lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input id="RePassword" name="passwordcon" type="password" placeholder="Enter Confirm Password" class="form-control lgn_input" required="">
                                                <i class="uil uil-padlock lgn_icon"></i>
                                            </div>
                                            <button class="login-btn hover-btn" id="login" type="submit">Reset Password</button>
                                        </form>
                                    </div>
                                    <div class="signup-link">
                                        <p>Go Back - <a href="sign_in.jsp">Sign In Now</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="copyright-text text-center mt-3">
                            Copyright <i class="uil uil-copyright"></i> 2020 <b>AP MART</b>
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

                    var Email = $('#Email').val();
                    var OPassword = $('#OPassword').val();
                    var Password1 = $('#Password1').val();
                    var RePassword = $('#RePassword').val();

                    $(".error").remove();

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

                    //password validation
                    if (OPassword === "") {
                        $("#OPassword").css("outline", "1px solid red");
                        $('#OPassword').after('<span class="error">Please! Enter Password.</span>');
                        valid = false;
                    } else {
                        if (!(OPassword.length >= 6)) {
                            $("#OPassword").css("outline", "1px solid red");
                            $('#OPassword').after('<span class="error">Please! Enter Password Must Be 6 Characters Long.</span>');
                            valid = false;
                        } else {
                            $("#OPassword").css("outline", "1px solid green");
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
                            $('#Password1').after('<span class="error">Please! New Password Must Be 6 Characters Long.</span>');
                            $('#RePassword').after('<span class="error">Please! Confirm Password Must Be 6 Characters Long.</span>');
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

