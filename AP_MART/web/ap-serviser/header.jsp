<%-- 
    Document   : navbar
    Created on : 18 Feb, 2021, 1:08:08 PM
    Author     : parth
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="POJO.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = null;
    String full_name = "";
    if (session.getAttribute("Servicer") != null) {
        int user_id = Integer.parseInt(session.getAttribute("Servicer").toString());
        user = UserDAO.viewData(user_id);
        full_name = user.getFull_name();
    }
%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-light bg-clr">
            <a class="navbar-brand logo-brand" href="./">AP MART</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <a href="../" class="frnt-link"><i class="fas fa-external-link-alt"></i>Home</a>
            <ul class="navbar-nav ml-auto mr-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i><span> <%=" " + full_name%> </span></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item admin-dropdown-item" href="edit_profile.jsp">Edit Profile</a>
                        <a class="dropdown-item admin-dropdown-item" href="../sign_in.jsp">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link active" href="./">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <a class="nav-link" href="shops.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-store"></i></div>
                                Shop
                            </a>
                            <a class="nav-link" href="category.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                Categories
                            </a>
                            <a class="nav-link" href="products.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-box"></i></div>
                                Products
                            </a>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOrders" aria-expanded="false" aria-controls="collapseOrders">
                                <div class="sb-nav-link-icon"><i class="fas fa-cart-arrow-down	"></i></div>
                                Orders
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseOrders" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link sub_nav_link" href="pending_orders.jsp">Pending Orders</a>
                                    <a class="nav-link sub_nav_link" href="tracking_order.jsp">Tracking Order</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="serviser.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                Serviser
                            </a>
                            <a class="nav-link" href="customers.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Customers
                            </a>
                            <a class="nav-link" href="contact_us.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-envelope-open-text"></i></div>
                                Message
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
    </body>
</html>
