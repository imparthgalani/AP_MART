<%-- 
    Document   : edit_profile
    Created on : 19 Feb, 2021, 12:23:05 PM
    Author     : parth
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="POJO.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = new User();
    if (session.getAttribute("Servicer") != null) {
        int user_id = Integer.parseInt(session.getAttribute("Servicer").toString());
        user = UserDAO.viewData(user_id);
    } else {
        response.sendRedirect("../sign_in.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>

        <!-- include the head Link -->
        <jsp:include page="head_link.jsp" />

        <title>AP Mart - Edit Profile</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Edit Profile</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="./">Dashboard</a></li>
                        <li class="breadcrumb-item active">Edit Profile</li>
                    </ol>
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="card card-static-2 mb-30">
                                <div class="card-body-table">
                                    <div class="shopowner-content-left text-center pd-20">
                                        <div class="shop_img mb-3">
                                            <img id="showimg" src="../images/<%if (user != null) {
                                                    out.println("user/" + user.getImage());
                                                } else {
                                                    out.println("user/default.jpg");
                                                }%>" alt="">
                                        </div>
                                        <div class="shopowner-dt-left">
                                            <h4>AP Mart</h4>
                                            <span>Servicer</span>
                                        </div>
                                        <div class="shopowner-dts">
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Full Name</span>
                                                <span class="right-dt"><%=user.getFull_name()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Email</span>
                                                <span class="right-dt"><%=user.getEmail()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Phone</span>
                                                <span class="right-dt"><%=user.getPhone()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Address</span>
                                                <span class="right-dt"><%=user.getAddress()%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7">
                            <div class="card card-static-2 mb-30">
                                <div class="card-title-2">
                                    <h4><b>Edit Profile</b></h4>
                                </div>
                                <div class="card-body-table">
                                    <div class="news-content-right pd-20">
                                        <form action="../editUserServlet" method="POST" enctype="multipart/form-data">
                                            <div class="row">
                                                <input type="hidden" name="id" value="<%=user.getUser_id()%>">
                                                <input type="hidden" name="file_name" value="<%=user.getImage()%>">
                                                <input type="hidden" name="password" value="<%=user.getPassword()%>">
                                                <input type="hidden" name="user" value="Servicer">

                                                <div class="col-lg-12">
                                                    <div class="form-group mb-3">
                                                        <label class="form-label">Full Name*</label>
                                                        <input type="text" class="form-control" id="FullName" value="<%=user.getFull_name()%>" name="full_name" placeholder="Enter Full Name">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group mb-3">
                                                        <label class="form-label">Email*</label>
                                                        <input type="email" class="form-control" id="Email" value="<%=user.getEmail()%>" name="email" placeholder="Enter Email Address">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group mb-3">
                                                        <label class="form-label">Phone*</label>
                                                        <input type="text" class="form-control" id="Phone" value="<%=user.getPhone()%>" name="phone" placeholder="Enter Phone Number">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label class="form-label">Profile Image*</label>
                                                        <div class="input-group">
                                                            <div class="file-upload-wrapper" data-text="<%=user.getImage()%>">
                                                                <input id="addimg" name="image" type="file" class="file-upload-field" value="<%=user.getImage()%>">
                                                            </div>
                                                        </div>
                                                        <div class="add-customer-img">
                                                            <img id="showimg" src="../images/<%if (user != null) {
                                                                    out.println("user/" + user.getImage());
                                                                } else {
                                                                    out.println("user/default.jpg");
                                                                }%>" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group mb-3">
                                                        <label class="form-label">Address*</label>
                                                        <textarea class="text-control" id="Address"  name="address" placeholder=""><%=user.getAddress().trim()%></textarea>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="type" value="Servicer">
                                                <div class="col-lg-12">
                                                    <button class="save-btn hover-btn" id="CDetails" type="submit">Save Changes</button>
                                                </div>
                                            </div>
                                        </form>
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

    </body>
</html>
