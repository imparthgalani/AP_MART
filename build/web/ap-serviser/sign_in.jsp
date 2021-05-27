<%-- 
    Document   : sign_in
    Created on : 19 Feb, 2021, 12:24:08 PM
    Author     : parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- include the head Link -->
        <jsp:include page="head_link.jsp" />

        <title>AP MART - Sign In</title>

    </head>
    <body class="bg-sign">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header card-sign-header">
                                        <h3 class="text-center font-weight-light my-4">Sign In</h3>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-group">
                                                <label class="form-label" for="inputEmailAddress">Email*</label>
                                                <input class="form-control py-3" id="inputEmailAddress" type="email" placeholder="Enter email address">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label" for="inputPassword">Password*</label>
                                                <input class="form-control py-3" id="inputPassword" type="password" placeholder="Enter password">
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                    <label class="custom-control-label" for="rememberPasswordCheck">Remember password</label>
                                                </div>
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="btn btn-sign hover-btn" href="sign_in.jsp">Sign In Now</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- include the footer Link -->
        <jsp:include page="footer_link.jsp" /> 

    </body>
</html>
