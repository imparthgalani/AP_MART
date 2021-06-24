<%-- 
    Document   : index
    Created on : 18 Feb, 2021, 10:47:32 AM
    Author     : parth
--%>

<%@page import="POJO.Shop"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Util.ShopStatus"%>
<%@page import="DAO.CartDAO"%>
<%@page import="POJO.Cart"%>
<%@page import="POJO.Cart"%>
<%@page import="POJO.Wishlist"%>
<%@page import="java.lang.Integer"%>
<%@page import="DAO.WishlistDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="DAO.ShopProductDAO"%>
<%@page import="POJO.ShopProduct"%>
<%@page import="POJO.Categorie"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CategorieDAO"%>
<%@page import="DAO.CategorieDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int user_id = 0;
    if (session.getAttribute("customer") != null) {
        user_id = Integer.parseInt(session.getAttribute("customer").toString());
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP Mart</title>
    </head>
    <body onload="refresh()">
        <!-- include the header File -->
        <jsp:include page="header.jsp" /> 

        <div class="wrapper">
            <div class="main-banner-slider">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="owl-carousel offers-banner owl-theme">
                                <div class="item">
                                    <div class="offer-item">
                                        <div class="offer-item-img">
                                            <div class="gambo-overlay"></div>
                                            <img src="images/banners/offer-1.jpg" alt="">
                                        </div>
                                        <div class="offer-text-dt">
                                            <div class="offer-top-text-banner">
                                                <p>6% Off</p>
                                                <div class="top-text-1">Buy More & Save More</div>
                                                <span>Fresh Vegetables</span>
                                            </div>
                                            <a href="#" class="Offer-shop-btn hover-btn">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="offer-item">
                                        <div class="offer-item-img">
                                            <div class="gambo-overlay"></div>
                                            <img src="images/banners/offer-2.jpg" alt="">
                                        </div>
                                        <div class="offer-text-dt">
                                            <div class="offer-top-text-banner">
                                                <p>5% Off</p>
                                                <div class="top-text-1">Buy More & Save More</div>
                                                <span>Fresh Fruits</span>
                                            </div>
                                            <a href="#" class="Offer-shop-btn hover-btn">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="offer-item">
                                        <div class="offer-item-img">
                                            <div class="gambo-overlay"></div>
                                            <img src="images/banners/offer-3.jpg" alt="">
                                        </div>
                                        <div class="offer-text-dt">
                                            <div class="offer-top-text-banner">
                                                <p>3% Off</p>
                                                <div class="top-text-1">Hot Deals on New Items</div>
                                                <span>Daily Essentials Eggs & Dairy</span>
                                            </div>
                                            <a href="#" class="Offer-shop-btn hover-btn">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="offer-item">
                                        <div class="offer-item-img">
                                            <div class="gambo-overlay"></div>
                                            <img src="images/banners/offer-4.jpg" alt="">
                                        </div>
                                        <div class="offer-text-dt">
                                            <div class="offer-top-text-banner">
                                                <p>2% Off</p>
                                                <div class="top-text-1">Buy More & Save More</div>
                                                <span>Beverages</span>
                                            </div>
                                            <a href="#" class="Offer-shop-btn hover-btn">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="offer-item">
                                        <div class="offer-item-img">
                                            <div class="gambo-overlay"></div>
                                            <img src="images/banners/offer-5.jpg" alt="">
                                        </div>
                                        <div class="offer-text-dt">
                                            <div class="offer-top-text-banner">
                                                <p>3% Off</p>
                                                <div class="top-text-1">Buy More & Save More</div>
                                                <span>Nuts & Snacks</span>
                                            </div>
                                            <a href="#" class="Offer-shop-btn hover-btn">Shop Now</a>
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
                                    <span>Shop By</span>
                                    <h2>Categories</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="owl-carousel cate-slider owl-theme">
                                <%  List<Categorie> list = null;
                                    list = CategorieDAO.viewData();
                                    for (Categorie e : list) {
                                %>
                                <div class="item">
                                    <a href="shop_grid.jsp?categories_id=<%=e.getCategories_id()%>&categories_name=<%=URLEncoder.encode(e.getName(), "UTF-8")%>" class="category-item">
                                        <div class="cate-img">
                                            <img src="images/category/<%=e.getImage()%>" alt="">
                                        </div>
                                        <h4><%=e.getName()%></h4>
                                    </a>
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
                                    <h2>Best Discount Products</h2>
                                </div>
                                <a href="#" class="see-more-btn">See All</a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="owl-carousel featured-slider owl-theme">
                                <%  String cart_qty_hg = "no";
                                    List<ShopProduct> list1 = ShopProductDAO.viewDataMaxDiscount();
                                    for (ShopProduct e : list1) {
                                        String status = ShopStatus.isOpen(e.getOpening_time(), e.getClosing_time());
                                %>

                                <div class="item" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>filter: grayscale(100%);<%}%>" >
                                    <div class="product-item">
                                        <a href="single_product_view.jsp?shop_product_id=<%=e.getShop_product_id()%>" class="product-img">
                                            <img src="images/product/<%=e.getProduct_image()%>" alt="">
                                            <div class="product-absolute-options">
                                                <span class="offer-badge-1"><%=e.getDiscount() + "% OFF"%></span>

                                                <%
                                                    Wishlist wishlist_product = WishlistDAO.getWishlistProduct(user_id, e.getShop_product_id());
                                                %>

                                                <span id="wishlist"  <%if (user_id != 0 && (wishlist_product.getShop_product_id() == e.getShop_product_id())) {%>class="like-icon liked"<%} else {%>class="like-icon"<%}%> title="wishlist" onclick="wishlist(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>"></span>
                                            </div>
                                        </a>
                                        <div class="product-text-dt">
                                            <%if (e.getQuantity() == 0) {%>
                                            <p><span>Unavailable ( Out Of Stock )</span></p>
                                            <%} else {%>
                                            <p><span>Available ( In Stock )</span></p>
                                            <%}%>
                                            <p><b><%=e.getShop_name()%></b></p>
                                            <h4><%=e.getProduct_name()%></h4>
                                            <div class="product-price">₹<font><%=e.getDiscount_mrp()%></font> / <small id="weight"><%=e.getNet_weigth()%></small> <small id="unit"><%=e.getUnit()%></small><span><%="₹" + e.getMrp()%></span></div>
                                                    <%
                                                        Cart cart_product = CartDAO.getCartProduct(user_id, e.getShop_product_id());
                                                    %>
                                            <div class="qty-cart">
                                                <div class="quantity buttons_added" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>">
                                                    <input type="button"  onclick="cartValueUpdate(this, 'min')" value="-" class="minus minus-btn">
                                                    <input type="number" class="input-text qty text" step="1" min="1" max="<%=e.getQuantity()%>" name="quantity" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" value="<%if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() <= e.getQuantity())) {%><%=cart_product.getQuantity()%><%} else if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() > e.getQuantity())) {%><%=e.getQuantity()%><%cart_qty_hg = "yes";%><%} else {%><%="1"%><%}%>" >
                                                    <input type="button" onclick="cartValueUpdate(this, 'max')" value="+" class="plus plus-btn">
                                                </div>
                                                <span id="cart" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>" <%if (user_id != 0 && (cart_product.getShop_product_id() == e.getShop_product_id())) {%>class="cart-icon clicked"<%} else {%>class="cart-icon"<%}%> onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" title="Cart"  action=""><i class="uil uil-shopping-cart-alt"></i></span>
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
                                    <span>Offers</span>
                                    <h2>Best Values</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <a href="#" class="best-offer-item">
                                <img src="images/best-offers/offer-1.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <a href="#" class="best-offer-item">
                                <img src="images/best-offers/offer-2.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <a href="#" class="best-offer-item offr-none">
                                <img src="images/best-offers/offer-3.jpg" alt="">
                                <div class="cmtk_dt">
                                    <div class="product_countdown-timer offer-counter-text" data-countdown="2021/01/06"></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-12">
                            <a href="#" class="code-offer-item">
                                <img src="images/best-offers/offer-4.jpg" alt="">
                            </a>
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
                                    <h2>Most Delivered Products</h2>
                                </div>
                                <a href="#" class="see-more-btn">See All</a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="owl-carousel featured-slider owl-theme">
                                <%
                                    List<ShopProduct> list2 = ShopProductDAO.viewMostDeliverdProducts();
                                    for (ShopProduct e : list2) {
                                        String status = ShopStatus.isOpen(e.getOpening_time(), e.getClosing_time());
                                %>

                                <div class="item" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>filter: grayscale(100%);<%}%>" >
                                    <div class="product-item">
                                        <a href="single_product_view.jsp?shop_product_id=<%=e.getShop_product_id()%>" class="product-img">
                                            <img src="images/product/<%=e.getProduct_image()%>" alt="">
                                            <div class="product-absolute-options">
                                                <span class="offer-badge-1"><%=e.getDiscount() + "% OFF"%></span>

                                                <%
                                                    Wishlist wishlist_product = WishlistDAO.getWishlistProduct(user_id, e.getShop_product_id());
                                                %>

                                                <span id="wishlist"  <%if (user_id != 0 && (wishlist_product.getShop_product_id() == e.getShop_product_id())) {%>class="like-icon liked"<%} else {%>class="like-icon"<%}%> title="wishlist" onclick="wishlist(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>"></span>
                                            </div>
                                        </a>
                                        <div class="product-text-dt">
                                            <%if (e.getQuantity() == 0) {%>
                                            <p><span>Unavailable ( Out Of Stock )</span></p>
                                            <%} else {%>
                                            <p><span>Available ( In Stock )</span></p>
                                            <%}%>
                                            <p><b><%=e.getShop_name()%></b></p>
                                            <h4><%=e.getProduct_name()%></h4>
                                            <div class="product-price">₹<font><%=e.getDiscount_mrp()%></font> / <small id="weight"><%=e.getNet_weigth()%></small> <small id="unit"><%=e.getUnit()%></small><span><%="₹" + e.getMrp()%></span></div>
                                                    <%
                                                        Cart cart_product = CartDAO.getCartProduct(user_id, e.getShop_product_id());
                                                    %>
                                            <div class="qty-cart">
                                                <div class="quantity buttons_added" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>">
                                                    <input type="button"  onclick="cartValueUpdate(this, 'min')" value="-" class="minus minus-btn">
                                                    <input type="number" class="input-text qty text" step="1" min="1" max="<%=e.getQuantity()%>" name="quantity" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" value="<%if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() <= e.getQuantity())) {%><%=cart_product.getQuantity()%><%} else if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() > e.getQuantity())) {%><%=e.getQuantity()%><%cart_qty_hg = "yes";%><%} else {%><%="1"%><%}%>" >
                                                    <input type="button" onclick="cartValueUpdate(this, 'max')" value="+" class="plus plus-btn">
                                                </div>
                                                <span id="cart" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>" <%if (user_id != 0 && (cart_product.getShop_product_id() == e.getShop_product_id())) {%>class="cart-icon clicked"<%} else {%>class="cart-icon"<%}%> onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" title="Cart"  action=""><i class="uil uil-shopping-cart-alt"></i></span>
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
                                    <h2>Added New Products</h2>
                                </div>
                                <a href="#" class="see-more-btn">See All</a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="owl-carousel featured-slider owl-theme">
                                <%
                                    List<ShopProduct> list3 = ShopProductDAO.viewDataAddNewProducts();
                                    for (ShopProduct e : list3) {
                                        String status = ShopStatus.isOpen(e.getOpening_time(), e.getClosing_time());
                                %>

                                <div class="item" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>filter: grayscale(100%);<%}%>" >
                                    <div class="product-item">
                                        <a href="single_product_view.jsp?shop_product_id=<%=e.getShop_product_id()%>" class="product-img">
                                            <img src="images/product/<%=e.getProduct_image()%>" alt="">
                                            <div class="product-absolute-options">
                                                <span class="offer-badge-1">New</span>

                                                <%
                                                    Wishlist wishlist_product = WishlistDAO.getWishlistProduct(user_id, e.getShop_product_id());
                                                %>

                                                <span id="wishlist"  <%if (user_id != 0 && (wishlist_product.getShop_product_id() == e.getShop_product_id())) {%>class="like-icon liked"<%} else {%>class="like-icon"<%}%> title="wishlist" onclick="wishlist(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>"></span>
                                            </div>
                                        </a>
                                        <div class="product-text-dt">
                                            <%if (e.getQuantity() == 0) {%>
                                            <p><span>Unavailable ( Out Of Stock )</span></p>
                                            <%} else {%>
                                            <p><span>Available ( In Stock )</span></p>
                                            <%}%>
                                            <p><b><%=e.getShop_name()%></b></p>
                                            <h4><%=e.getProduct_name()%></h4>
                                            <div class="product-price">₹<font><%=e.getDiscount_mrp()%></font> / <small id="weight"><%=e.getNet_weigth()%></small> <small id="unit"><%=e.getUnit()%></small><span><%="₹" + e.getMrp()%></span></div>

                                            <%
                                                Cart cart_product = CartDAO.getCartProduct(user_id, e.getShop_product_id());
                                            %>

                                            <div class="qty-cart">
                                                <div class="quantity buttons_added" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>">
                                                    <input type="button"  onclick="cartValueUpdate(this, 'min')" value="-" class="minus minus-btn">
                                                    <input type="number" class="input-text qty text" step="1" min="1" max="<%=e.getQuantity()%>" name="quantity" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" value="<%if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() <= e.getQuantity())) {%><%=cart_product.getQuantity()%><%} else if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() > e.getQuantity())) {%><%=e.getQuantity()%><%cart_qty_hg = "yes";%><%} else {%><%="1"%><%}%>" >
                                                    <input type="button" onclick="cartValueUpdate(this, 'max')" value="+" class="plus plus-btn">
                                                </div>
                                                <span id="cart" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>" <%if (user_id != 0 && (cart_product.getShop_product_id() == e.getShop_product_id())) {%>class="cart-icon clicked"<%} else {%>class="cart-icon"<%}%> onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" title="Cart"  action=""><i class="uil uil-shopping-cart-alt"></i></span>
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
