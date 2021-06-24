<%-- 
    Document   : sign_in
    Created on : 18 Feb, 2021, 11:07:43 AM
    Author     : parth
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
        <%
            Cookie[] cookies = request.getCookies();
            String email = "", password = "", rememberVal = "";
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("cookuser")) {
                        email = cookie.getValue();
                    }
                    if (cookie.getName().equals("cookpass")) {
                        password = cookie.getValue();
                    }
                    if (cookie.getName().equals("cookrem")) {
                        rememberVal = cookie.getValue();
                    }
                }
            }
        %>
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
                                        <form action="UserSignin" method="POST">
                                            <div class="form-title">
                                                <h6>Sign In</h6>
                                            </div>
                                            <div class="form-title" <%if(request.getAttribute("msg") != null && request.getAttribute("msg").equals("Password Changed SuccessFully.")){%>style="color: green"<%}else if(request.getAttribute("msg") != null && request.getAttribute("msg").equals("You have successfully logged out.")){%>style="color: green"<%}else{%>style="color: red"<%}%>>
                                                <%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""%>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input type="email" id="Email" name="email" 
                                                       placeholder="Enter Email Address" value="<%=email%>"  class="form-control lgn_input"
                                                       required="">
                                                <i class="uil uil-mobile-android-alt lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input type="password" id="Password" name="password" 
                                                       placeholder="Enter Password" value="<%=password%>" class="form-control lgn_input" required="">
                                                <i class="uil uil-padlock lgn_icon"></i>
                                            </div>
                                            <div class="form-group pos_rel custom-control custom-checkbox FAText">
                                                <input class="custom-control-input" id="rememberPasswordCheck" name="remember" type="checkbox" value="1" value="1" <%= "1".equals(rememberVal.trim()) ? "checked=\"checked\"" : ""%> />
                                                <label class="custom-control-label" for="rememberPasswordCheck">Remember</label>
                                                <a href="change_password.jsp" class="float-right" style="color:#2b2f4c;">Change Password?</a>
                                            </div>
                                            <button type="submit" id="login" class="login-btn hover-btn">Sign In Now</button>
                                        </form>
                                    </div>
                                    <div class="signup-link">
                                        <p>Don't have an account? - <a href="sign_up.jsp">Sign Up Now</a></p>
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

                    var Email = $('#Email').val();
                    var Password = $('#Password').val();

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
                    if (Password === "") {
                        $("#Password").css("outline", "1px solid red");
                        $('#Password').after('<span class="error">Please! Enter Password.</span>');
                        valid = false;
                    } else {
                        if (!(Password.length >= 6)) {
                            $("#Password").css("outline", "1px solid red");
                            $('#Password').after('<span class="error">Please! Enter Password Must Be 6 Characters Long.</span>');
                            valid = false;
                        } else {
                            $("#Password").css("outline", "1px solid green");
                        }
                    }

                    return valid;

                });

            });
        </script>

    </body>
</html>
