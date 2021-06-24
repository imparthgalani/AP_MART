<%-- 
    Document   : about_us
    Created on : 18 Feb, 2021, 11:06:11 AM
    Author     : parth
--%>

<%@page import="DAO.ShopDAO"%>
<%@page import="POJO.Shop"%>
<%@page import="POJO.User"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP Mart - About Us</title>
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
                                    <li class="breadcrumb-item active" aria-current="page">About Us</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="life-gambo">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="default-title left-text">
                                <h2>About AP Mart</h2>
                                <p>Customers Deserve Better</p>
                                <img src="images/line.svg" alt="">
                            </div>
                            <div class="about-content">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac sodales sapien.
                                    Sed pellentesque, quam in ornare tincidunt, magna augue placerat nunc, ut facilisis nibh
                                    ipsum non ipsum. Cras ac eros non neque viverra consequat sed at est. Fusce efficitur,
                                    lacus nec dignissim tincidunt, diam sapien rhoncus neque, at tristique sapien nibh sed
                                    neque. Proin in neque in purus luctus facilisis. Donec viverra ligula quis lorem viverra
                                    consequat. Aliquam condimentum id enim volutpat rutrum. Donec semper iaculis convallis.
                                    Praesent quis elit eget ligula facilisis mattis. Praesent sed euismod dui. Suspendisse
                                    imperdiet vel quam nec venenatis. Suspendisse dictum blandit quam, vitae auctor enim
                                    gravida et. Sed id dictum nibh. Proin egestas massa sit amet tincidunt aliquet.</p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="about-img">
                                <img src="images/about.svg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="about-steps-group white-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="about-step">
                                <div class="about-step-img">
                                    <img src="images/about/icon-1.svg" alt="">
                                </div>
                                <h4>400+</h4>
                                <p>People have joined the AP Super Mart team in the past six months</p>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="about-step">
                                <div class="about-step-img">
                                    <img src="images/about/icon-2.svg" alt="">
                                </div>
                                <h4>2x</h4>
                                <p>Rate of growth in our monthly user base</p>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="about-step">
                                <div class="about-step-img">
                                    <img src="images/about/icon-3.svg" alt="">
                                </div>
                                <h4>10 days</h4>
                                <p>Time taken to launch in 8 cities across India</p>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="about-step">
                                <div class="about-step-img">
                                    <img src="images/about/icon-4.svg" alt="">
                                </div>
                                <h4>95k</h4>
                                <p>App downloads on iOS and Android</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="life-gambo">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="default-title" style="margin-bottom:20px;">                            
                                <h2>Owner</h2>
                                <p>Teamwork Makes the Dream Work</p>
                                <img src="images/line.svg" alt="">
                            </div>
                            <div class="row justify-content-center mb-14" >
                                <%
                                    List<User> list = UserDAO.viewData("admin");
                                    for (User e : list) {
                                %>
                                <div class="item col-sm col-lg-3">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="images/user/<%=e.getImage()%>" alt="">
                                        </div>
                                        <h4><%=e.getFull_name()%></h4>
                                        <span>Web Developer</span>
                                        <ul class="team-social">
                                            <li><a href="#" class="scl-btn hover-btn"><i
                                                        class="fab fa-facebook-f"></i></a></li>
                                            <li><a href="#" class="scl-btn hover-btn"><i
                                                        class="fab fa-linkedin-in"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <%}%>
                            </div>

                            <div class="default-title" style="margin-top:50px;">                            
                                <h2>Shop Owner</h2>
                                <p>Teamwork Makes the Dream Work</p>
                                <img src="images/line.svg" alt="">
                            </div>
                            <div class="dd-content">
                                <div class="owl-carousel team-slider owl-theme">
                                    <%
                                        List<Shop> list1 = ShopDAO.viewDataRandom();
                                        for (Shop e : list1) {
                                    %>
                                    <div class="item">
                                        <div class="team-item">
                                            <div class="team-img">
                                                <img src="images/user/<%if(e.getShop_owner_image() != null){out.println(e.getShop_owner_image());}else{out.println("shop_owner.jpg");}%>" alt="">
                                            </div>
                                            <h4><%=e.getShop_owner_name()%></h4>
                                            <span><%=e.getName()%></span>
                                            <ul class="team-social">
                                                <li><a href="#" class="scl-btn hover-btn"><i
                                                            class="fab fa-facebook-f"></i></a></li>
                                                <li><a href="#" class="scl-btn hover-btn"><i
                                                            class="fab fa-linkedin-in"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="how-order-gambo">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="default-title">
                                <h2>How Do I Order?</h2>
                                <p>How Do I order on AP Mart</p>
                                <img src="images/line.svg" alt="">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="how-order-steps">
                                <div class="how-order-icon">
                                    <i class="uil uil-search"></i>
                                </div>
                                <h4>Browse apmart.com for products or use the search feature</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="how-order-steps">
                                <div class="how-order-icon">
                                    <i class="uil uil-shopping-basket"></i>
                                </div>
                                <h4>Add item to your shopping Basket</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="how-order-steps">
                                <div class="how-order-icon">
                                    <i class="uil uil-stopwatch"></i>
                                </div>
                                <h4>Choose a convenient delivery time from our 5 Slots* a day</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="how-order-steps">
                                <div class="how-order-icon">
                                    <i class="uil uil-money-bill"></i>
                                </div>
                                <h4>Select suitable payment option(Cash, Master, Credit Card, Discover)</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="how-order-steps">
                                <div class="how-order-icon">
                                    <i class="uil uil-truck"></i>
                                </div>
                                <h4>Your products will be home-delivered as per your order.</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="how-order-steps">
                                <div class="how-order-icon">
                                    <i class="uil uil-smile"></i>
                                </div>
                                <h4>Happy Curstomers</h4>
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
