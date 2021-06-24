<%-- 
    Document   : add_shop_owner
    Created on : 20 Feb, 2021, 3:23:00 PM
    Author     : parth
--%>

<%@page import="POJO.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("shop_owner") == null) {
        response.sendRedirect("../sign_in.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>

        <!-- include the head Link -->
        <jsp:include page="head_link.jsp" />

        <title>AP Mart - Add Shop Owner</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Shops</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="./">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="shops.jsp">Shops</a></li>
                        <li class="breadcrumb-item active">Add Shop</li>
                    </ol>
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="add-new-shop">
                                <div class="card card-static-2 mb-30">
                                    <div class="row no-gutters">
                                        <div class="col-lg-12 col-md-12">
                                            <div class="card-title-2">
                                                <h4><b>Shop Owner</b></h4>
                                            </div>
                                            <div class="card-body-table px-3">
                                                <%  String id = request.getParameter("id");
                                                    int user_id = 0;
                                                    if (id != null) {
                                                        user_id = Integer.parseInt(id);
                                                    }
                                                    User e = UserDAO.viewData(user_id);
                                                %>
                                                <form action="<%if (user_id == 0) {%><%="../userServlet"%><%} else {%><%="../editUserServlet"%><%}%>" method="POST"  enctype="multipart/form-data">
                                                    <div class="add-shop-content pd-20">

                                                        <input type="hidden" name="id" value="<%=e.getUser_id()%>">
                                                        <input type="hidden" name="file_name" value="<%=e.getImage()%>">
                                                        <input type="hidden" name="user" value="shop_owner">

                                                        <div class="form-group">
                                                            <label class="form-label">Full Name*</label>
                                                            <input class="form-control" id="FullName" name="full_name" type="text" value="<%if (user_id != 0) {
                                                                    out.println(e.getFull_name());
                                                                }%>" placeholder="Enter Full Name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Email Address*</label>
                                                            <input class="form-control" id="Email" name="email" type="email" value="<%if (user_id != 0) {
                                                                    out.println(e.getEmail());
                                                                }%>" placeholder="Enter Email Address">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Phone*</label>
                                                            <input class="form-control" id="Phone" name="phone" type="text" value="<%if (user_id != 0) {
                                                                    out.println(e.getPhone());
                                                                }%>" placeholder="Enter Phone Number">
                                                        </div>
                                                         <div class="form-group">
                                                            <label class="form-label">Password*</label>
                                                            <input type="Password" class="form-control" id="Password" name="password" value="<%if (user_id != 0) {
                                                                    out.println(e.getPassword());
                                                                }%>" placeholder="Enter Password">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Confirm Password*</label>
                                                            <input type="Password" class="form-control" id="RePassword" name="re_password" value="<%if (user_id != 0) {
                                                                    out.println(e.getPassword());
                                                                }%>" placeholder="Enter Password">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Owner Address*</label>
                                                            <div class="card card-editor">
                                                                <div class="content-editor">
                                                                    <textarea class="text-control"  name="address" id="Address" placeholder="Enter Address"><%if (user_id != 0) {
                                                                            out.println(e.getAddress().trim());
                                                                        }%></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Owner Image*</label>
                                                            <div class="input-group">
                                                                <div class="file-upload-wrapper" data-text="<%if (user_id != 0) {
                                                                        out.println(e.getImage());
                                                                    } else {
                                                                        out.println("Choose Image");
                                                                    }%>">
                                                                    <input id="addimg" name="image" type="file" class="file-upload-field" value="">
                                                                </div>
                                                            </div>
                                                            <div class="add-customer-img">
                                                                <img id="showimg" src="../images/<%if (user_id != 0) {
                                                                        out.println("user/" + e.getImage());
                                                                    } else {
                                                                        out.println("user/default.jpg");
                                                                    }%>" alt="">
                                                            </div>
                                                        </div>
                                                        <input type="hidden" name="type" value="shop_owner">
                                                        <input type="hidden" name="action" value="add_shop">
                                                        <div class="align-self-center mx-auto"> 
                                                            <input type="submit" id="login" class="save-btn hover-btn " value="Next">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- include the footer File -->
            <jsp:include page="footer.jsp" />

        </div>


        <!-- include the footer Link -->
        <jsp:include page="footer_link.jsp" />

        <script>
            $(document).ready(function () {

                $('#login').click(function () {

                    var valid = true;

                    var FullName = $('#FullName').val();
                    var Email = $('#Email').val();
                    var Phone = $('#Phone').val();
                    var Password = $('#Password').val();
                    var RePassword = $('#RePassword').val();
                    var Address = $('#Address').val();
                    
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
                        }else {
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
                    
                    if (Password.length < 6 || RePassword.length < 6) {
                        $("#Password").css("outline", "1px solid red");
                        $("#RePassword").css("outline", "1px solid red");
                        $('#Password').after('<span class="error">Please! Enter Password Must Be Least 6 Characters Long.</span>');
                        $('#RePassword').after('<span class="error">Please! Enter Password Must Be Least 6 Characters Long.</span>');
                        valid = false;
                    } else if (Password !== RePassword)
                    {
                        $("#RePassword").css("outline", "1px solid red");
                        $('#RePassword').after('<span class="error">Please! Enter Password Is Not Match.</span>');
                        valid = false;
                    } else {
                        $("#Password").css("outline", "1px solid green");
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
                    
                    return valid;

                });

            });
        </script>

    </body>
</html>
