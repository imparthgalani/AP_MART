<%-- 
    Document   : add_shop
    Created on : 19 Feb, 2021, 12:20:07 PM
    Author     : parth
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="POJO.Shop"%>
<%@page import="DAO.ShopDAO"%>
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

        <title>AP Mart - Add Shop</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />



        <!-- Edit Shop Details-->
        <%
            String id = request.getParameter("user_id");
            int user_id = Integer.parseInt(id);

            int shop_id = 0;
            String name = "";
            String email = "";
            String phone = "";
            String password = "";
            String city = "";
            String area = "";
            String opening_time = "";
            String closing_time = "";
            String status ="";
            String address = "";
            String image = "";

            String type = request.getParameter("type");

            if (type != null) {

                Shop e = ShopDAO.viewDataUserShop(user_id);

                shop_id = e.getShop_id();
                name = e.getName();
                email = e.getEmail();
                phone = e.getPhone();
                String location = e.getLocation();
                city = location.split(",")[1].trim();
                area = location.split(",")[0].trim();
                opening_time = e.getOpening_time();
                closing_time = e.getClosing_time();
                status = e.getStatus();
                address = e.getAddress();
                image = e.getImage();

            }

        %>


        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Shops</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
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
                                                <h4><b>Add New Shop</b></h4>
                                            </div>
                                            <div class="card-body-table px-3">
                                                <form action="<%if (type == null) {%><%="../shopServlet"%><%} else {%><%="../editShopServlet"%><%}%>" method="POST"  enctype="multipart/form-data">
                                                    <div class="add-shop-content pd-20">

                                                        <input type="hidden" name="shop_id" value="<%=shop_id%>">
                                                        <input type="hidden" name="shop_owner_id" value="<%=user_id%>">
                                                        <input type="hidden" name="file_name" value="<%=image%>">
                                                        <input type="hidden" name="user" value="Servicer">

                                                        <div class="form-group">
                                                            <label class="form-label">Name*</label>
                                                            <input type="text" name="name" class="form-control" id="FullName" value="<%=name%>" placeholder=" Enter Shop Name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Email Address*</label>
                                                            <input type="text" id="Email" name="email" class="form-control"  value="<%=email%>" placeholder=" Enter Email Address">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Phone*</label>
                                                            <input type="text" name="phone" class="form-control" id="Phone" value="<%=phone%>" placeholder=" Enter Phone Number">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">City*</label>
                                                            <select id="City" name="city" class="form-control">
                                                                <option value="" <%if (type == null) {
                                                                        out.println("selected");
                                                                    }%>>Select Location</option>
                                                                <option value="Botad" <%if (type != null && city.equals("Botad")) {
                                                                        out.println("selected");
                                                                    }%>>Botad</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Area*</label>
                                                            <select id="Area" name="area" class="form-control">
                                                                <option value="" <%if (type == null) {
                                                                        out.println("selected");
                                                                    }%>>Select Area</option>
                                                                <option value="Hifali" <%if (type != null && area.equals("Hifali")) {
                                                                        out.println("selected");
                                                                    }%>>Hifali</option>
                                                                <option value="Managal Para" <%if (type != null && area.equals("Managal Para")) {
                                                                        out.println("selected");
                                                                    }%>>Managal Para</option>
                                                                <option value="Panjavani Kato" <%if (type != null && area.equals("Panjavani Kato")) {
                                                                        out.println("selected");
                                                                    }%>>Panjavani Kato</option>
                                                                <option value="Haweli Chowk" <%if (type != null && area.equals("Haweli Chowk")) {
                                                                        out.println("selected");
                                                                    }%>>Haweli Chowk</option>
                                                                <option value="Mali Ni Vadi" <%if (type != null && area.equals("Mali Ni Vadi")) {
                                                                        out.println("selected");
                                                                    }%>>Mali Ni Vadi</option>
                                                                <option value="Bhagavan Para" <%if (type != null && area.equals("Bhagavan Para")) {
                                                                        out.println("selected");
                                                                    }%>>Bhagavan Para</option>
                                                                <option value="Presh" <%if (type != null && area.equals("Presh")) {
                                                                        out.println("selected");
                                                                    }%>>Presh</option>
                                                                <option value="Depo" <%if (type != null && area.equals("Depo")) {
                                                                        out.println("selected");
                                                                    }%>>Depo</option>
                                                                <option value="Railway Station" <%if (type != null && area.equals("Railway Station")) {
                                                                        out.println("selected");
                                                                    }%>>Railway Station</option>
                                                                <option value="Khodiyar Nagar" <%if (type != null && area.equals("Khodiyar Nagark")) {
                                                                        out.println("selected");
                                                                    }%>>Khodiyar Nagar</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="form-group">
                                                                <label class="form-label">Opening Time*</label>
                                                                <input type="time" id="OTime" name="opening_time" id="default-picker" class="form-control" value="<%=opening_time%>" placeholder="Select time">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="form-label">Close Time*</label>
                                                                <input type="time" id="CTime" name="closing_time" id="default-picker" class="form-control" value="<%=closing_time%>" placeholder="Select time">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Current Shop Status*</label>
                                                            <select id="CSSTime" name="status" class="form-control">
                                                                <option value="Open" <%if (type != null && status.equals("Open")) {
                                                                        out.println("selected");
                                                                    }%>>Open</option>
                                                                <option value="Closed" <%if (type != null && status.equals("Closed")) {
                                                                        out.println("selected");
                                                                    }%>>Closed</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label">Address*</label>
                                                            <div class="card card-editor">
                                                                <div class="content-editor">
                                                                    <textarea  name="address" class="text-control" id="Address" placeholder="Enter Address"><%=address.trim()%></textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="form-label">Owner Image*</label>
                                                            <div class="input-group">
                                                                <div  class="file-upload-wrapper" data-text="<%if (type != null) {
                                                                        out.println(image);
                                                                    } else {
                                                                        out.println("Choose Image");
                                                                    }%>">
                                                                    <input id="addimg" name="image" type="file" class="file-upload-field" value="">
                                                                </div>
                                                            </div>
                                                            <div class="add-customer-img">
                                                                <img id="showimg" src="<%if (type != null) {
                                                                        out.println("../images/shop/" + image);
                                                                    } else {
                                                                        out.println("../images/shop.svg");
                                                                    }%>" alt="">
                                                            </div>
                                                        </div>
                                                        <button type="submit" id="login" class="save-btn hover-btn" >Save</button>
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
                    var City = $('#City').val();
                    var Area = $('#Area').val();
                    var OTime = $('#OTime').val();
                    var CTime = $('#CTime').val();
                    var CSSTime = $('#CSSTime').val();
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

                   

                    //City validation
                    if (City === "") {
                        $("#City").css("outline", "1px solid red");
                        $('#City').after('<span class="error">Please! Select An City.</span>');
                        valid = false;
                    } else {
                        $("#City").css("outline", "1px solid green");
                    }

                    //Area validation
                    if (Area === "") {
                        $("#Area").css("outline", "1px solid red");
                        $('#Area').after('<span class="error">Please! Select An Area.</span>');
                        valid = false;
                    } else {
                        $("#Area").css("outline", "1px solid green");
                    }

                    //Opening Time validation
                    if (OTime === "") {
                        $("#OTime").css("outline", "1px solid red");
                        $('#OTime').after('<span class="error">Please! Select Opening Time.</span>');
                        valid = false;
                    } else {
                        $("#OTime").css("outline", "1px solid green");
                    }

                    //Closeing Time validation
                    if (CTime === "") {
                        $("#CTime").css("outline", "1px solid red");
                        $('#CTime').after('<span class="error">Please! Select Closeing Time.</span>');
                        valid = false;
                    } else {
                        $("#CTime").css("outline", "1px solid green");
                    }
                    
                    //Current Shop Status validation
                    if (CTime === "") {
                        $("#CSSTime").css("outline", "1px solid red");
                        $('#CSSTime').after('<span class="error">Please! Select Closeing Time.</span>');
                        valid = false;
                    } else {
                        $("#CSSTime").css("outline", "1px solid green");
                    }

                    //Address validation
                    if (Address === "") {
                        $("#Address").css("outline", "1px solid red");
                        $('#Address').after('<span class="error">Please! Enter Full Name.</span>');
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
