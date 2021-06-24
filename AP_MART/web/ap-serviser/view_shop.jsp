<%-- 
    Document   : view_shop
    Created on : 19 Feb, 2021, 12:25:24 PM
    Author     : parth
--%>

<%@page import="POJO.User"%>
<%@page import="DAO.UserDAO"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="POJO.Shop"%>
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

        <title>AP Mart - View Shop</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Shops</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="shops.jsp">Shops</a></li>
                        <li class="breadcrumb-item active">View Shop</li>
                    </ol>
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <%  String id = request.getParameter("id");
                                int shop_id = Integer.parseInt(id);
                                Shop e1 = ShopDAO.viewData(shop_id);
                                
                                User e2 = UserDAO.viewData(e1.getShop_owner_id());

                                SimpleDateFormat _24HourSDF = new SimpleDateFormat("HH:mm");
                                SimpleDateFormat _12HourSDF = new SimpleDateFormat("hh:mm a");
                                
                                Date _24HourDt_Opening = _24HourSDF.parse(e1.getOpening_time());
                                String opening_time = _12HourSDF.format(_24HourDt_Opening);
                                
                                Date _24HourDt_closing = _24HourSDF.parse(e1.getClosing_time());
                                String closing_time = _12HourSDF.format(_24HourDt_closing);

                            %>   
                            <div class="card card-static-2 mb-30">
                                <div class="card-body-table">
                                    <div class="shop-content-left pd-20">
                                        <div class=" shop_img">
                                            <img src="../images/shop/<%if (e1.getImage() != null) {
                                                    out.println(e1.getImage());
                                                } else {
                                                    out.println("default.svg");
                                                }%>" alt="">
                                        </div>
                                        <div class="shop-dt-left " style="margin: 30px 0px 0px 35px;">
                                            <h4><b><%=e1.getName()%></b></h4>
                                            <span><%=e1.getLocation()%></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card card-static-2 mb-30">
                                <div class="card-body-table">
                                    <div class="shopowner-content-left pd-20">
                                        <div class="shopowner-dt-left1">
                                            <h4><%=e2.getFull_name()%></h4>
                                            <span>Shop Owner</span>
                                        </div>
                                        <div class="shopowner-dts">
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Email</span>
                                                <span class="right-dt"><%=e2.getEmail()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Phone</span>
                                                <span class="right-dt">+91 <%=e2.getPhone()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Address</span>
                                                <span class="right-dt"><%=e2.getAddress()%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7">
                            <div class="card card-static-2 mb-30">
                                <div class="card-body-table">
                                    <div class="shopowner-content-left pd-20">
                                        <div class="shopowner-dts mt-0">
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt"><b>Shop Details :</b></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Name :</span>
                                                <span class="right-dt"><%=e1.getName()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Email</span>
                                                <span class="right-dt"><%=e1.getEmail()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Phone</span>
                                                <span class="right-dt">+91 <%=e1.getPhone()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Location</span>
                                                <span class="right-dt"><%=e1.getLocation()%></span>
                                            </div>
                                            
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Opening Time</span>
                                                <span class="right-dt"><%=opening_time%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Close Time</span>
                                                <span class="right-dt"><%=closing_time%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Address</span>
                                                <span class="right-dt col-lg-5 col-md-5"><%=e1.getAddress()%></span>
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

    </body>
</html>
