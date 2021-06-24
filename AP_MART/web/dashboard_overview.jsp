<%-- 
    Document   : dashboard_overview
    Created on : 18 Feb, 2021, 11:07:17 AM
    Author     : parth
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="POJO.User"%>
<%@page import="java.util.List"%>
<%@page import="POJO.DeliveryAddress"%>
<%@page import="DAO.DeliveryAddressDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User e1 = null;
    int user_id = 0;
    String image = null;
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("sign_in.jsp");
    } else {
        user_id = Integer.parseInt(session.getAttribute("customer").toString());
        e1 = UserDAO.viewData(user_id);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Dashboard</title>
        <style>
            .collapse2{
                overflow-y:scroll;
                max-height:260px;
            }
        </style>
    </head>
    <body>
        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div class="wrapper">
            <div class="gambo-Breadcrumb">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">User Dashboard</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="dashboard-group">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="user-dt">
                                <div class="user-img">
                                    <form action="editUserServlet" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="id" value="<%=user_id%>">
                                        <input type="hidden" name="full_name" value="<%=e1.getFull_name()%>">
                                        <input type="hidden" name="email" value="<%=e1.getEmail()%>">
                                        <input type="hidden" name="phone" value="<%=e1.getPhone()%>">
                                        <input type="hidden" name="password" value="<%=e1.getPassword()%>">
                                        <input type="hidden" name="address" value="<%=e1.getAddress()%>">
                                        <input type="hidden" name="file_name" value="<%=e1.getImage()%>">
                                        <input type="hidden" name="type" value="Customer">
                                        <img src="images/user/<%if (e1.getImage() != null) {%><%=e1.getImage()%><%} else {%>default.jpg<%}%>">
                                        <div class="img-add">
                                            <input type="file" onchange="this.form.submit()" name="image" id="file">
                                            <label for="file"><i class="uil uil-camera-plus"></i></label>
                                        </div>
                                    </form>
                                </div>
                                <h4><%=e1.getFull_name()%></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-4">
                            <div class="left-side-tabs">
                                <div class="dashboard-left-links">
                                    <a href="#Profile" class="user-item active"><i class="uil uil-apps"></i>Profile</a>
                                    <a href="dashboard_my_orders.jsp" class="user-item"><i class="uil uil-box"></i>My Orders</a>
                                    <a href="dashboard_my_wishlist.jsp" class="user-item"><i class="uil uil-heart"></i>Shopping Wishlist</a>
                                    <a href="#Address" class="user-item"><i class="uil uil-location-point"></i>My Address</a>
                                    <a href="sign_in.jsp" class="user-item"><i class="uil uil-exit"></i>Logout</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-8">
                            <div class="dashboard-right">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="main-title-tab">
                                            <h4><i class="uil uil-apps"></i>My Profile</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="pdpt-bg">
                                            <div class="collapse multi-collapse1  show ml-3" id="multiCollapseExample1">
                                                <div class="address-body">
                                                    <div class="address-item">

                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Full Name</h6>
                                                                </div>
                                                                <div class="col-sm-9 full_name">
                                                                    <%=e1.getFull_name()%>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Email</h6>
                                                                </div>
                                                                <div class="col-sm-9 email">
                                                                    <%=e1.getEmail()%>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Phone</h6>
                                                                </div>
                                                                <div class="col-sm-9 phone">
                                                                    <%=e1.getPhone()%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a class="collapsed add-address hover-btn" onclick="editProfile(this)" role="button" data-toggle="collapse" data-target=".multi-collapse1" href=""> Edit Profile </a>
                                                </div>
                                            </div>
                                            <form action="editUserServlet" method="POST" enctype="multipart/form-data" >
                                                <div class="collapse multi-collapse1 row ml-1 address-item" id="multiCollapseExample2">
                                                    <input type="hidden" name="id" value="<%=user_id%>">
                                                    <input type="hidden" name="password" value="<%=e1.getPassword()%>">
                                                    <input type="hidden" name="address" value="<%=e1.getAddress()%>">
                                                    <input type="hidden" name="file_name" value="<%=e1.getImage()%>">
                                                    <input type="file" style="display: none;" name="image" value="<%=e1.getImage()%>">
                                                    <input type="hidden" name="type" value="Customer">
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Full Name*</label>
                                                            <input  id="FullName" name="full_name" type="text" placeholder="Please Enter Full Name" class="form-control input-md">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Email *</label>
                                                            <input id="Email"  name="email" type="text" placeholder="Please Enter Address" class="form-control input-md" >
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Phone *</label>
                                                            <input id="Phone"  name="phone" type="number" placeholder="Please Enter Phone" class="form-control input-md">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <input id="CDetails"  class="collapsed next-btn16 hover-btn" type="submit" value="Edit Profile">
                                                        <a class="collapsed next-btn16 hover-btn" role="button" data-toggle="collapse" data-target=".multi-collapse1" href=""> Back </a>

                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="row opp" ><!--id="Address"-->
                                    <div class="col-md-12">
                                        <div class="main-title-tab">
                                            <h4><i class="uil uil-location-point"></i>My Address</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="pdpt-bg">
                                            <div class="collapse multi-collapse2  show ml-3" id="multiCollapseExample3">
                                                <div class="address-body">
                                                    <div class="grouped fields insert12 collapse2">
                                                        <div class=" remove12">
                                                            <%
                                                                List<DeliveryAddress> list15 = DeliveryAddressDAO.viewData(user_id);
                                                                for (DeliveryAddress e : list15) {
                                                            %>
                                                            <div class="field">
                                                                    <div class="address-item">
                                                                        <div class="address-icon1">
                                                                            <i class="uil uil-home-alt"></i>
                                                                        </div>
                                                                        <div class="address-dt-all">
                                                                            <h4><%=e.getTitle()%></h4>
                                                                            <p>#<%=e.getFlat()%>,  <%=e.getStreet()%>,  <%=e.getLocality()%> - <%=e.getPincode()%>.</p>
                                                                            <ul class="action-btns">
                                                                                <li><a  href="" onclick="editAddress(this,<%=e.getDelivery_address_id()%>)" data-toggle="collapse" data-target=".multi-collapse2" class="action-btn"><i class="uil uil-edit"></i></a></li>
                                                                                <li><a onclick ="changeAddress(this,<%=e.getDelivery_address_id()%>)"  class="action-btn"><i class="uil uil-trash-alt"></i></a></li>
                                                                            </ul>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            <%}%>

                                                        </div>

                                                    </div>
                                                </div>
                                                <a class="collapsed add-address hover-btn" onclick="addAddress()" role="button" data-toggle="collapse" data-target=".multi-collapse2" href=""> Add New Address </a>
                                            </div>
                                                <div class="collapse multi-collapse2 row ml-1 address-item" id="multiCollapseExample4">
                                                    <input type="hidden" name="delivery_address_id" value="0">
                                                    <input type="hidden" name="user_id" value="<%=user_id%>">
                                                    <input type="hidden" name="action" value="insert">
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Title.*</label>
                                                            <select id="Title" name="title" class="form-control">
                                                                <option selected value="">--Please Select Title--</option>
                                                                <option value="Home">Home</option>
                                                                <option value="Office">Office</option>
                                                                <option value="Other">Other</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Flat / House No.*</label>
                                                            <input id="Flat" name="flat" type="text" placeholder="Please Enter Flat / House No" class="form-control input-md" required="">
                                                        </div>
                                                    </div>	
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Street / Society*</label>
                                                            <input id="Street" name="street" type="text" placeholder="Please Enter Street / Society" class="form-control input-md">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Pincode*</label>
                                                            <input id="Pincode" name="pincode" type="text" placeholder="Please Enter Pincode" class="form-control input-md" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Locality*</label>
                                                            <input id="Locality" name="locality" type="text" placeholder="Please Enter City" class="form-control input-md" required="">
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="redirect" value ="profile">
                                                    <div class="col-lg-12 col-md-12">
                                                        <a href="" id="DAdd" class="collapsed next-btn16 hover-btn" data-toggle="collapse" data-target=".multi-collapse2" onclick ="" type="submit">Add New Address</a>
                                                        <a class="collapsed next-btn16 hover-btn" role="button" data-toggle="collapse" data-target=".multi-collapse2" href=""> Back </a>

                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- include the footer File -->
<jsp:include page="footer.jsp" />

<!-- include the footer link -->
<jsp:include page="footer_link.jsp" />


</body>
</html>
