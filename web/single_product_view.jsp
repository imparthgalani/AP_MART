<%-- 
    Document   : single_product_view
    Created on : 18 Feb, 2021, 11:08:01 AM
    Author     : parth
--%>

<%@page import="DAO.OrderReviewDAO"%>
<%@page import="POJO.OrderReview"%>
<%@page import="DAO.CartDAO"%>
<%@page import="POJO.Cart"%>
<%@page import="DAO.WishlistDAO"%>
<%@page import="DAO.WishlistDAO"%>
<%@page import="POJO.Wishlist"%>
<%@page import="Util.ShopStatus"%>
<%@page import="POJO.Shop"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="POJO.ShopProduct"%>
<%@page import="DAO.ShopProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    int user_id = 0;
    if (session.getAttribute("customer") != null) {
        user_id = Integer.parseInt(session.getAttribute("customer").toString());
    }
%>

<%
    ShopProduct e = null;

    String shop_product_id = request.getParameter("shop_product_id");

    e = ShopProductDAO.viewSingalShopProductData(Integer.parseInt(shop_product_id));

    String status1 = ShopStatus.isOpen(e.getOpening_time(), e.getClosing_time());

%>
<!DOCTYPE html>
<html>
    <head>

        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Single Product View</title>


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
                                    <li class="breadcrumb-item"><a href="<%if (status1 == "Open") {%>shop_grid.jsp?shop_id=<%=e.getShop_id()%>&shop_name=<%=URLEncoder.encode(e.getShop_name(), "UTF-8")%><%}%>"><%=e.getShop_name()%></a></li>
                                    <li class="breadcrumb-item"><a href="shop_grid.jsp?categories_id=<%=e.getCategory_id()%>&categories_name=<%=URLEncoder.encode(e.getCategory_name(), "UTF-8")%>"><%=e.getCategory_name()%></a></li>
                                    <li class="breadcrumb-item active" aria-current="page"><%=e.getProduct_name()%></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="all-product-grid" style="<%if (status1 == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>filter: grayscale(100%);<%}%>">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product-dt-view">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div id="sync1" class="owl-carousel owl-theme">
                                            <div>
                                                <img src="images/product/<%=e.getProduct_image()%>" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                        <div class="product-dt-right">
                                            <h2><%=e.getProduct_name()%></h2>
                                            <div class="no-stock">
                                                <p class="pd-no">Product No.<span><%=e.getShop_product_id()%></span></p>
                                                <%if (e.getQuantity() == 0) {%>
                                                <p>Unavailable<span>Out Of Stock</span></p>
                                                <%} else {%>
                                                <p>Available<span>In Stock</span></p>
                                                <%}%>
                                            </div>
                                            <p class="pp-descp"><%=e.getProduct_description()%></p>
                                            <div class="product-group-dt">
                                                <ul>
                                                    <li><div class="main-price color-discount">Discount Price<span><%="₹" + e.getDiscount_mrp() + "<small> / " + e.getNet_weigth() + " " + e.getUnit() + "</small>"%></span></div></li>
                                                    <li><div class="main-price mrp-price">MRP Price<span><%="₹" + e.getMrp()%></span></div></li>
                                                </ul>
                                                <ul class="gty-wish-share">
                                                    <li>
                                                        <%
                                                            String cart_qty_hg = "no";

                                                            Cart cart_product1 = CartDAO.getCartProduct(user_id, e.getShop_product_id());
                                                        %>
                                                        <div class="qty-product">
                                                            <div class="quantity buttons_added" style="<%if (status1 == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>">
                                                                <input type="button"  onclick="cartValueUpdate(this, 'min')" value="-" class="minus minus-btn">
                                                                <input type="number" class="input-text qty text" step="1" min="1" max="<%=e.getQuantity()%>" name="quantity" action="abc" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" value="<%if (user_id != 0 && cart_product1.getQuantity() != 0 && (cart_product1.getQuantity() <= e.getQuantity())) {%><%=cart_product1.getQuantity()%><%} else if (user_id != 0 && cart_product1.getQuantity() != 0 && (cart_product1.getQuantity() > e.getQuantity())) {%><%=e.getQuantity()%><%cart_qty_hg = "yes";%><%} else {%><%="1"%><%}%>" >
                                                                <input type="button" onclick="cartValueUpdate(this, 'max')" value="+" class="plus plus-btn">
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <span id="cart" style="<%if (status1 == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>" <%if (user_id != 0 && (cart_product1.getShop_product_id() == e.getShop_product_id())) {%>class="cart-icon cart-icon-save clicked"<%} else {%>class="cart-icon cart-icon-save"<%}%> onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" title="Cart"  ><i class="uil uil-shopping-cart-alt"></i></span>
                                                    </li> 
                                                    <li><%
                                                        Wishlist wishlist_product1 = WishlistDAO.getWishlistProduct(user_id, e.getShop_product_id());
                                                        %>
                                                        <span id="wishlist" <%if (user_id != 0 && (wishlist_product1.getShop_product_id() == e.getShop_product_id())) {%>class="like-icon save-icon liked"<%} else {%>class="like-icon save-icon"<%}%> title="wishlist" onclick="wishlist(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>"></span>

                                                    </li>
                                                </ul>
                                                <ul class="ordr-crt-share" style="<%if (status1 == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>">
                                                    <li><button onclick="window.location.href = 'checkout.jsp'" class="order-btn hover-btn">Order Now</button></li>
                                                </ul>
                                            </div>
                                            <div id="share" style="color:#FFF;">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="all-product-grid">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product-dt-view">
                                <div class="row">
                                    <div class="col-lg-5 col-md-5">
                                        <div class="review__box">
                                            <%float avgRating = OrderReviewDAO.avgReviewCount(Integer.parseInt(shop_product_id));%>
                                            <h2><%=avgRating%></h2>
                                            <p>Avg. Star Rating:<span> (<%=OrderReviewDAO.count(Integer.parseInt(shop_product_id), "")%> Rating) </span></p>
                                            <div class="form-group Yrating">                                               
                                                <span class="fa fa-star <%if (avgRating >= 0.5) {%>checked<%}%>"></span>
                                                <span class="fa fa-star <%if (avgRating >= 1.5) {%>checked<%}%>"></span>
                                                <span class="fa fa-star <%if (avgRating >= 2.5) {%>checked<%}%>"></span>
                                                <span class="fa fa-star <%if (avgRating >= 3.5) {%>checked<%}%>"></span>
                                                <span class="fa fa-star <%if (avgRating >= 4.5) {%>checked<%}%>"></span>
                                            </div>
                                            <div class="review__progress">
                                                <div class="progress-item"><span class="star">5 Stars</span>
                                                    <%int straCount5 = OrderReviewDAO.reviewCount(Integer.parseInt(shop_product_id), 5);%>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: <%=straCount5%>%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="percent"><%=straCount5%>%</span>
                                                </div>
                                                <div class="progress-item"><span class="star">4 Stars</span>
                                                    <%int straCount4 = OrderReviewDAO.reviewCount(Integer.parseInt(shop_product_id), 4);%>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: <%=straCount4%>%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="percent"><%=straCount4%>%</span>
                                                </div>
                                                <div class="progress-item"><span class="star">3 Stars</span>
                                                    <%int straCount3 = OrderReviewDAO.reviewCount(Integer.parseInt(shop_product_id), 3);%>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: <%=straCount3%>%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="percent"><%=straCount3%>%</span>
                                                </div>
                                                <div class="progress-item"><span class="star">2 Stars</span>
                                                    <%int straCount2 = OrderReviewDAO.reviewCount(Integer.parseInt(shop_product_id), 2);%>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: <%=straCount2%>%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="percent"><%=straCount2%>%</span>
                                                </div>
                                                <div class="progress-item"><span class="star">1 Stars</span>
                                                    <%int straCount1 = OrderReviewDAO.reviewCount(Integer.parseInt(shop_product_id), 1);%>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: <%=straCount1%>%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="percent"><%=straCount1%>%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-7 col-md-7">
                                        <div class="wishlist-body-dtt wishlist-body-dtt1">
                                            <h2>Reviews ( <%=OrderReviewDAO.count(Integer.parseInt(shop_product_id), "AND message != ''")%> )</h2>
                                            <div class="ScrollReviews">
                                                <%
                                                    List<OrderReview> list4 = OrderReviewDAO.viewReviewData(Integer.parseInt(shop_product_id));
                                                    for (OrderReview e1 : list4) {
                                                %>
                                                <div class="cart-item">
                                                    <div class="cart-product-img cart-product-img1">
                                                        <img src="images/user/<%=e1.getImage()%>" alt="">
                                                    </div>
                                                    <div class="cart-text">

                                                        <span class="fa fa-star <%if (e1.getStar() >= 1) {%>checked<%}%>"></span>
                                                        <span class="fa fa-star <%if (e1.getStar() >= 2) {%>checked<%}%>"></span>
                                                        <span class="fa fa-star <%if (e1.getStar() >= 3) {%>checked<%}%>"></span>
                                                        <span class="fa fa-star <%if (e1.getStar() >= 4) {%>checked<%}%>"></span>
                                                        <span class="fa fa-star <%if (e1.getStar() == 5) {%>checked<%}%>"></span>

                                                        <h6><%=e1.getCustmore_name()%> - <%=e1.getTime()%></h6>
                                                        <p>
                                                            <%=e1.getMessage()%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section145">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="main-title-tt">
                                <div class="main-title-left">
                                    <span>For You</span>
                                    <h2>Similar Products</h2>
                                </div>
                                <a href="#" class="see-more-btn">See All</a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="owl-carousel featured-slider owl-theme">
                                <%
                                    List<ShopProduct> list1 = ShopProductDAO.viewProductData(e.getProduct_id(), "ORDER By RAND()");
                                    for (ShopProduct e1 : list1) {
                                        System.out.println();
                                        String status = ShopStatus.isOpen(e1.getOpening_time(), e1.getClosing_time());
                                %>
                                <div class="item" style="<%if (status == "Closed" || e1.getShop_status().equals("Closed") || e1.getQuantity() == 0) {%>filter: grayscale(100%);<%}%>">
                                    <div class="product-item" >
                                        <a href="single_product_view.jsp?shop_product_id=<%=e1.getShop_product_id()%>" class="product-img">
                                            <img src="images/product/<%=e1.getProduct_image()%>" alt="">
                                            <div class="product-absolute-options">
                                                <span class="offer-badge-1"><%=e1.getDiscount() + "% OFF"%></span>
                                                <%
                                                    Wishlist wishlist_product = WishlistDAO.getWishlistProduct(user_id, e1.getShop_product_id());
                                                %>

                                                <span id="wishlist"  <%if (user_id != 0 && (wishlist_product.getShop_product_id() == e1.getShop_product_id())) {%>class="like-icon liked"<%} else {%>class="like-icon"<%}%> title="wishlist" onclick="wishlist(this)" user_id="<%=user_id%>" shop_product_id="<%=e1.getShop_product_id()%>"></span>

                                            </div>
                                        </a>
                                        <div class="product-text-dt">
                                            <%if (e1.getQuantity() == 0) {%>
                                            <p><span>Unavailable ( Out Of Stock )</span></p>
                                            <%} else {%>
                                            <p><span>Available ( In Stock )</span></p>
                                            <%}%>
                                            <p><b><%=e1.getShop_name()%></b></p>
                                            <h4><%=e1.getProduct_name()%></h4>
                                            <div class="product-price">₹<font><%=e1.getDiscount_mrp()%></font> / <small id="weight"><%=e1.getNet_weigth()%></small> <small id="unit"><%=e1.getUnit()%></small><span><%="₹" + e1.getMrp()%></span></div>
                                                    <%
                                                        Cart cart_product = CartDAO.getCartProduct(user_id, e1.getShop_product_id());
                                                    %>
                                            <div class="qty-cart">
                                                <div class="quantity buttons_added" style="<%if (status == "Closed" || e1.getShop_status().equals("Closed") || e1.getQuantity() == 0) {%>pointer-events:none;<%}%>">
                                                    <input type="button"  onclick="cartValueUpdate(this, 'min')" value="-" class="minus minus-btn">
                                                    <input type="number" class="input-text qty text" step="1" min="1" max="<%=e1.getQuantity()%>" name="quantity" user_id="<%=user_id%>" shop_product_id="<%=e1.getShop_product_id()%>" value="<%if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() <= e1.getQuantity())) {%><%=cart_product.getQuantity()%><%} else if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() > e1.getQuantity())) {%><%=e1.getQuantity()%><%cart_qty_hg = "yes";%><%} else {%><%="1"%><%}%>" >
                                                    <input type="button" onclick="cartValueUpdate(this, 'max')" value="+" class="plus plus-btn">
                                                </div>
                                                <span id="cart" style="<%if (status == "Closed" || e1.getShop_status().equals("Closed") || e1.getQuantity() == 0) {%>pointer-events:none;<%}%>" <%if (user_id != 0 && (cart_product.getShop_product_id() == e1.getShop_product_id())) {%>class="cart-icon clicked"<%} else {%>class="cart-icon"<%}%> onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e1.getShop_product_id()%>" title="Cart"><i class="uil uil-shopping-cart-alt"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section145">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="main-title-tt">
                                <div class="main-title-left">
                                    <span>For You</span>
                                    <h2>Related Products</h2>
                                </div>
                                <a href="#" class="see-more-btn">See All</a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="owl-carousel featured-slider owl-theme">
                                <%
                                    List<ShopProduct> list2 = ShopProductDAO.viewCategoriesDataProduct(e.getCategory_id(), "ORDER By RAND()");
                                    for (ShopProduct e1 : list2) {
                                        System.out.println();
                                        String status = ShopStatus.isOpen(e1.getOpening_time(), e1.getClosing_time());
                                %>
                                <div class="item" style="<%if (status == "Closed" || e1.getShop_status().equals("Closed") || e1.getQuantity() == 0) {%>filter: grayscale(100%);<%}%>">
                                    <div class="product-item" >
                                        <a href="single_product_view.jsp?shop_product_id=<%=e1.getShop_product_id()%>" class="product-img">
                                            <img src="images/product/<%=e1.getProduct_image()%>" alt="">
                                            <div class="product-absolute-options">
                                                <span class="offer-badge-1"><%=e1.getDiscount() + "% OFF"%></span>
                                                <%
                                                    Wishlist wishlist_product = WishlistDAO.getWishlistProduct(user_id, e1.getShop_product_id());
                                                %>

                                                <span id="wishlist"  <%if (user_id != 0 && (wishlist_product.getShop_product_id() == e1.getShop_product_id())) {%>class="like-icon liked"<%} else {%>class="like-icon"<%}%> title="wishlist" onclick="wishlist(this)" user_id="<%=user_id%>" shop_product_id="<%=e1.getShop_product_id()%>"></span>

                                            </div>
                                        </a>
                                        <div class="product-text-dt">
                                            <%if (e1.getQuantity() == 0) {%>
                                            <p><span>Unavailable ( Out Of Stock )</span></p>
                                            <%} else {%>
                                            <p><span>Available ( In Stock )</span></p>
                                            <%}%>
                                            <p><b><%=e1.getShop_name()%></b></p>
                                            <h4><%=e1.getProduct_name()%></h4>
                                            <div class="product-price">₹<font><%=e1.getDiscount_mrp()%></font> / <small id="weight"><%=e1.getNet_weigth()%></small> <small id="unit"><%=e1.getUnit()%></small><span><%="₹" + e1.getMrp()%></span></div>
                                                    <%
                                                        Cart cart_product = CartDAO.getCartProduct(user_id, e1.getShop_product_id());
                                                    %>
                                            <div class="qty-cart">
                                                <div class="quantity buttons_added" style="<%if (status == "Closed" || e1.getShop_status().equals("Closed") || e1.getQuantity() == 0) {%>pointer-events:none;<%}%>">
                                                    <input type="button"  onclick="cartValueUpdate(this, 'min')" value="-" class="minus minus-btn">
                                                    <input type="number" class="input-text qty text" step="1" min="1" max="<%=e1.getQuantity()%>" name="quantity" user_id="<%=user_id%>" shop_product_id="<%=e1.getShop_product_id()%>" value="<%if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() <= e1.getQuantity())) {%><%=cart_product.getQuantity()%><%} else if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() > e1.getQuantity())) {%><%=e1.getQuantity()%><%cart_qty_hg = "yes";%><%} else {%><%="1"%><%}%>" >
                                                    <input type="button" onclick="cartValueUpdate(this, 'max')" value="+" class="plus plus-btn">
                                                </div>
                                                <span id="cart" style="<%if (status == "Closed" || e1.getShop_status().equals("Closed") || e1.getQuantity() == 0) {%>pointer-events:none;<%}%>" <%if (user_id != 0 && (cart_product.getShop_product_id() == e1.getShop_product_id())) {%>class="cart-icon clicked"<%} else {%>class="cart-icon"<%}%> onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e1.getShop_product_id()%>" title="Cart"><i class="uil uil-shopping-cart-alt"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%
            if (cart_qty_hg.equals("yes")) {
                CartDAO.cartValueHigh();
            }%>
        <input type="hidden" value="<%=user_id%>" id="user_id">
        <!-- include the footer File -->
        <jsp:include page="footer.jsp" />


        <!-- include the footer link -->
        <jsp:include page="footer_link.jsp" />

    </body>
</html>
