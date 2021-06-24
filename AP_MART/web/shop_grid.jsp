<%-- 
    Document   : shop_grid
    Created on : 18 Feb, 2021, 11:07:30 AM
    Author     : parth
--%>

<%@page import="POJO.Cart"%>
<%@page import="DAO.WishlistDAO"%>
<%@page import="POJO.Wishlist"%>
<%@page import="Util.ShopStatus"%>
<%@page import="DAO.CartDAO"%>
<%@page import="POJO.Shop"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="POJO.ShopProduct"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ShopProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int user_id = 0;
    String cart_qty_hg = "no";
    if (session.getAttribute("customer") != null) {
        user_id = Integer.parseInt(session.getAttribute("customer").toString());
    }
%>


<%
    List<ShopProduct> list = null;
    String shop_id1 = request.getParameter("shop_id");
    String categories_id1 = request.getParameter("categories_id");
    String product_id1 = request.getParameter("product_id");
    String title = null;
    String popularity = "ORDER BY RAND()";
    if(product_id1 != null){
        list = ShopProductDAO.viewProductData(Integer.parseInt(product_id1),popularity);
        title = request.getParameter("product_name");
    }
    else if (categories_id1 != null) {
        list = ShopProductDAO.viewCategoriesDataProduct(Integer.parseInt(categories_id1), popularity);
        title = request.getParameter("categories_name");
    } else if (shop_id1 != null) {
        list = ShopProductDAO.viewShopsDataProduct(Integer.parseInt(shop_id1), popularity);
        title = request.getParameter("shop_name");
    } else {
        list = ShopProductDAO.viewAllDataProducts(popularity);
        title = "All Products";
    }
%>

<!DOCTYPE html>
<html>
    <head id="abc3">
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" />
        <title>AP MART - Shop Grid</title>

    </head>
    <body>
        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <input type="hidden" name="shop_id" value="<%=shop_id1%>">
        <input type="hidden" name="categories_id" value="<%=categories_id1%>">
        <input type="hidden" name="product_id" value="<%=product_id1%>">

        <div class="wrapper">
            <div class="gambo-Breadcrumb">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Products</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="all-product-grid">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product-top-dt">
                                <div class="product-left-title">
                                    <h2><%=title%></h2>
                                </div>
                                <div class="product-sort">
                                    <div class="ui selection dropdown vchrt-dropdown">
                                        <input id="popularity" name="gender" type="hidden" value="default">
                                        <i class="dropdown icon d-icon"></i>
                                        <div class="text">Popularity</div>
                                        <div class="menu" >
                                            <div class="item" data-value="0">Popularity</div>
                                            <div class="item" data-value="1">Price - Low to High</div>
                                            <div class="item" data-value="2">Price - High to Low</div>
                                            <div class="item" data-value="3">% Off - High to Low</div>
                                            <div class="item" data-value="4">% Off - Low to High</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="product-list-view">
                        <div class="row" id="format">
                            <%
                                for (ShopProduct e : list) {
                                    String status = ShopStatus.isOpen(e.getOpening_time().trim(), e.getClosing_time().trim());
                            %>
                            <div class="col-lg-3 col-md-6 showMore" id="clear" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>filter: grayscale(100%);<%}%>">

                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp?shop_product_id=<%=e.getShop_product_id()%>" class="product-img">
                                        <img src="images/product/<%=e.getProduct_image()%>" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1"><%=e.getDiscount() + "% OFF"%></span>

                                            <%
                                                Wishlist wishlist_product = WishlistDAO.getWishlistProduct(user_id, e.getShop_product_id());
                                            %>

                                            <span class="<%if (user_id != 0 && (wishlist_product.getShop_product_id() == e.getShop_product_id())) {
                                                    out.println("like-icon liked");
                                                } else {
                                                    out.println("like-icon");
                                                }%>" title="wishlist" onclick="wishlist(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>"></span>

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
                                            <span id="cart" style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>" class="<%if (user_id != 0 && (cart_product.getShop_product_id() == e.getShop_product_id())) {
                                                    out.println("cart-icon clicked");
                                                } else {
                                                    out.println("cart-icon");
                                                }%>" onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" title="Cart"  action=""><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <%}%>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="more-product-btn">
                            <button class="show-more-btn hover-btn loadMore">Show More</button>
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
