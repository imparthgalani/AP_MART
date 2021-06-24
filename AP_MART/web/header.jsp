<%-- 
    Document   : header.jsp
    Created on : 10 Mar, 2021, 3:13:45 PM
    Author     : parth
--%>
<%@page import="DAO.OrederDAO"%>
<%@page import="DAO.DeliveryAddressDAO"%>
<%@page import="POJO.DeliveryAddress"%>
<%@page import="POJO.Cart"%>
<%@page import="DAO.CartDAO"%>
<%@page import="Util.ShopStatus"%>
<%@page import="DAO.WishlistDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="POJO.Shop"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UserDAO"%>
<%@page import="POJO.User"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String full_name = "Login";
    String email = "";
    String info = "Sign Up";
    int wishlist_count = 0;
    int user_id = 0;
    int cart_count = 0;
    int order_count = 0;

    if (session.getAttribute("customer") != null) {

        user_id = Integer.parseInt(session.getAttribute("customer").toString());

        User user;
        user = UserDAO.viewData(user_id);

        full_name = user.getFull_name();
        email = user.getEmail();
        info = "Logout";

        wishlist_count = WishlistDAO.count(user_id);

        cart_count = CartDAO.count(user_id);

        order_count = OrederDAO.orderCount(user_id);

    }
%> 

<style>
    .dropdown {
        position: relative;
        display: inline-block;

    }
    .ui[class*="left icon"].swdh10.input>input{
        padding-left: 3.2em !important;
        padding-right: 1em !important;
        font-size: 14px;
        font-weight: 500;
        border: 0 !important;
        width: 320px;
    }
    .dropdown-content {
        display: none;        
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.1);
        z-index: 999;
        width: 99.2%;
        border-radius: 0px 0px 5px 5px;
    }   

    .dropdown-content a {
        color: #000;
        padding: 12px 16px;
        text-decoration: none;
        display: block;

    }

    .dropdown-content a:hover {
        color: #fff !important;
        background-color: #f55d2c;
    }

    .dropdown .dc1 {display: block; margin-top:2.6em;}
    .dropdown .dc2 {display: block; margin-top:2.6em; height: 172px;overflow-y: scroll;}

    .dropdown:hover .dropdown-content {display: block;}
    .container-fluid {
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
        z-index: 1;
    }
    .product-dt-right p{
        color: #3e3f5e;
        margin-top: 15px;
    }
    .product-dt-right .Yrating{
        margin-top: 30px;
    }
    .from_M{
        margin: 0px 20px 0px 0px;
    }
    .MyM{
        height: 110px !important;
    }

    .modal-dialog1{
        width:45% !important;

    }
    .review__box{
        border: 1px solid #dddddd;
        height: auto;
        padding: 30px 20px;
        margin-top: 20px;
        margin-bottom: 20px;
        border-radius: 6px;
    }
    .cart-product-img1 img{
        margin-top: 0px;
    }
    .fa {
        font-size: 20px;
    }
    .checked {
        color: orange;
    }
    .cart-text h6{
        color: #000;
        margin-top: 15px;
    }
    .cart-text p{
        color: #3e3f5e;
        margin-top: 15px;
    }
    .review__box h2{
        font-size: 45px;
        color: #ff7200;
        font-weight: bold;
    }
    .review__box p{
        color: #3e3f5e;  
        font-size: 16px;
    }
    .review__box p span{
        color: #000;  
        font-weight: bold;
        font-size: 16px;
    }
    .review__progress {
        padding-top: 25px;
    }
    .progress-item {
        display: flex;
        align-items: center;
        margin-bottom: 5px;

    }
    .progress-item .star {
        flex: 0 0 65px;
        padding-right: 10px;
    }
    .progress-item .progress {
        flex-grow: 1;
    }
    .bg-warning {
        background-color: #ff7200 !important;
    }
    .progress-item .percent {
        flex: 0 0 45px;
        text-align: right;
        padding-left: 10px;
    }
    .wishlist-body-dtt{
        border: 1px solid #dddddd;

        border-radius: 6px;
        margin-top: 20px;
        margin-bottom: 20px;
    }
    .wishlist-body-dtt h2{
        margin-left: 20px;
        margin-top: 5px;
        color: #ff7200;                
    }
    .ScrollReviews{
        height: 302px;
        overflow-y: scroll;
    }
    .product-dt-right-R{
        padding-right: 25px;
        padding-left: 10px;
        letter-spacing: 1px;
        line-height: 1.6rem;
    }
</style>

<jsp:include page="searchScript.jsp"></jsp:include>

    <div id="category_model" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area"  role="document">
            <div class="category-area-inner">
                <div class="cate-header modal-header">
                    <h4 class="mt-3">Select Shop</h4>
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
                        <i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content">

                    <ul class="category-by-cat">
                    <%
                        String image = null;
                        List<Shop> list8;
                        list8 = ShopDAO.viewDataRandom();

                        String status;
                        for (Shop e : list8) {
                            image = "default.svg";
                            if (e.getImage() != null) {
                                image = e.getImage();
                            }
                            status = ShopStatus.isOpen(e.getOpening_time(), e.getClosing_time());
                    %>
                    <li>
                        <div class="single-cat-item " style="cursor: pointer;" onclick="<%if (e.getStatus().equals("Open") && status == "Open") {%>location.href = 'shop_grid.jsp?shop_id=<%=e.getShop_id()%>&shop_name=<%=URLEncoder.encode(e.getName(), "UTF-8")%>'<%}%>">
                            <div class="icon">
                                <p class="s-status" style="<%if (status == "Closed" || e.getStatus().equals("Closed")) {%>background-color:red;z-index:1;<%}%>" >     
                                    <%if (e.getStatus().equals("Open")) {%><%=status%><%} else {%><%=e.getStatus()%><%}%>
                                </p>
                                <img src="images/shop/<%=image%>" style="<%if (status == "Closed" || e.getStatus().equals("Closed")) {%>filter: grayscale(100%);<%}%>" class="img-responsive" alt="">
                            </div>
                            <div class="text"><%=e.getName()%></div>
                        </div>    
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="search_model" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
    <div class="modal-dialog search-ground-area" role="document">
        <div class="category-area-inner">
            <div class="modal-header">
                <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
                    <i class="uil uil-multiply"></i>
                </button>
            </div>
            <div class="category-model-content modal-content dropdown">
                <div class="search-header sticky-top">
                    <form action="#">
                        <input type="search" id="Itemshop1"  placeholder="Search for products...">
                        <button type="submit"><i class="uil uil-search"></i></button>
                    </form>
                </div>
                <div class="dropdown-content" id="showList1">

                </div>
            </div>
        </div>
    </div>
</div>
<div class="bs-canvas bs-canvas-left position-fixed bg-cart h-100">
    <div class="bs-canvas-header side-cart-header p-3 ">
        <div class="d-inline-block  main-cart-title">My Cart (<span class="cart_count"><%=cart_count%> </span>)</div>
        <button type="button" class="bs-canvas-close close" aria-label="Close"><i class="uil uil-multiply"></i></button>
    </div>
    <div class="bs-canvas-body" id="cart_insert">
        <div id="cart_delete">
            <%

                List<Cart> list9;
                list9 = CartDAO.viewCartShop(user_id);
                for (Cart e : list9) {%>
            <div class="cart_items">
                <div class="cart-top-total">
                    <div class="cart-total-dil" id="cart-total-dil1">
                        <h2 ><%=e.getShop_name()%></h2>
                    </div>
                </div>
                <div class="side-cart-items" id="collapse1">
                    <% List<Cart> list10;
                        list10 = CartDAO.viewCartData(user_id, e.getShop_id());
                        for (Cart e1 : list10) {
                    %>

                    <div class="cart-item">
                        <div class="cart-product-img" >
                            <img src="images/product/<%=e1.getProduct_image()%>" alt="">
                            <div class="offer-badge"><%=e1.getDiscount()%>% OFF</div>
                        </div>
                        <div class="cart-text">
                            <h4><%=e1.getProduct_name()%></h4>
                            <div class="cart-radio">
                                <div class="cart-item-price abc1"><font style="padding-right:4px;"><%="₹" + e1.getDiscount_mrp()%> </font>/<small id="weight" style="padding-left: 3px;"><%=e1.getNet_weigth()%></small> <small id="unit"><%=e1.getUnit()%></small><span><%="₹" + e1.getMrp()%></span></div>
                            </div>
                            <div class="qty-group">
                                <div class="quantity buttons_added" id="change">
                                    <input type="button"  onclick="cartValueUpdate(this, 'min')"  value="-" class="minus minus-btn">
                                    <input type="number" onchange="cart_items()" class="input-text qty text cart_qty"  step="1" min="1" max="<%=e1.getProduct_quantity()%>" name="quantity" user_id="<%=user_id%>" shop_product_id="<%=e1.getShop_product_id()%>" value="<%if (user_id != 0 && e1.getCart_quantity() != 0 && (e1.getCart_quantity() <= e1.getProduct_quantity())) {%><%=e1.getCart_quantity()%><%} else if (user_id != 0 && e1.getCart_quantity() != 0 && (e1.getCart_quantity() > e1.getProduct_quantity())) {%><%=e1.getProduct_quantity()%><%} else {%><%="1"%><%}%>" >

                                    <input type="button" onclick="cartValueUpdate(this, 'max')" value="+" class="plus plus-btn">
                                </div>
                                <div class="cart-item-price abc2"><font></font><span></span></div>
                            </div>
                            <button type="button" class="cart-close-btn" onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e1.getShop_product_id()%>"><i class="uil uil-multiply"></i></button>
                        </div>
                    </div>

                    <%}%>  
                </div>
                <div class="main-total-cart" id="main-total-cart1">
                    <h2>Total</h2>
                    <div class="cart-item-price abc3"><font></font><span></span></div>
                </div>
            </div>
            <%}%>

        </div>

    </div>


    <div class="bs-canvas-footer">
        <div class="cart-total-dil saving-total ">
            <h4>Total Saving</h4>
            <span>$11</span>
        </div>
        <div class="main-total-cart">
            <h2>Total</h2>
            <div class="cart-item-price abc4"><font></font><span></span></div>
        </div>
        <div class="checkout-cart">
            <a href="checkout.jsp" class="cart-checkout-btn hover-btn">Proceed to Checkout</a>
        </div>
    </div>
</div>
<div id="riview_modal" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
    <div class="modal-dialog modal-dialog1 category-area"  role="document">
        <div class="category-area-inner">
            <div class="cate-header modal-header">
                <h3 class="mt-3">Add A Review</h3>
                <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
                    <i class="uil uil-multiply"></i>
                </button>
            </div>
            <form action="orderReviewServlet" method="POST" >
                <div class="category-model-content modal-content" id="insert456" style="height:100%;padding-bottom: 30px;">
                </div>
            </form>
        </div>
    </div>
</div>
<div id="RCancellation" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
    <div class="modal-dialog modal-dialog1 category-area"  role="document">
        <div class="category-area-inner">
            <div class="cate-header modal-header">
                <h4 class="mt-3">Cancel Order</h4>
                <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
                    <i class="uil uil-multiply"></i>
                </button>
            </div>
            <div class="category-model-content modal-content">
                <div class="product-dt-right product-dt-right-R">                 
                    <form action="orderDeleteServlet" method="POST" >
                        <input id="order_list_id1" type="hidden" name="order_list_id" value="">
                        <input id="shop_product_id1" type="hidden" name="shop_product_id" value="">
                        <input type="hidden" name="cancelReson" value="">

                        <div class="card-header ">

                            <h4 >Reason For Cancellation</h4>
                            <div class="px-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" onclick="resonRadio(this)" id="flexRadioDefault1">
                                    <label class="form-check-label" for="flexRadioDefault1">I have purchased the product elsewhere</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" onclick="resonRadio(this)" id="flexRadioDefault2">
                                    <label class="form-check-label" for="flexRadioDefault2">I want to change my phone number</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" onclick="resonRadio(this)" id="flexRadioDefault3">
                                    <label class="form-check-label" for="flexRadioDefault3">I want to change address for the order </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" onclick="resonRadio(this)" id="flexRadioDefault4">
                                    <label class="form-check-label" for="flexRadioDefault4">I want to convert my order to Prepaid</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" onclick="resonRadio(this)" id="flexRadioDefault5">
                                    <label class="form-check-label" for="flexRadioDefault5">Expected delivery time is very long</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" onclick="resonRadio(this)" id="flexRadioDefault6">
                                    <label class="form-check-label" for="flexRadioDefault6">Price for the product has decreased</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" onclick="resonRadio(this)" id="flexRadioDefault7">
                                    <label class="form-check-label" for="flexRadioDefault7">I have changed my mind</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" onclick="resonRadio(this)" id="flexRadioDefault8">
                                    <label class="form-check-label" for="flexRadioDefault8">I want to cancel due to product quality issues</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field">
                                <textarea rows="2" class="form-control mt-3 MyM" id="Message" name="message" placeholder="Write Comments (Optional)"></textarea>
                            </div>
                        </div>                       
                        <div class="card-header mt-2">
                            <h5 >Refund Status</h5>
                            <p class="card-text card-text1 px-3">There will be no refund as the order is purchased using Case-On-Delivery</p>                                
                        </div>
                        <button class="collapsed next-btn16 hover-btn mt-3" type="submit" data-btntext-sending="Sending...">Submit Request</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<header class="header clearfix">
    <div class="top-header-group">
        <div class="top-header">
            <div class="res_main_logo">
                <a href="./"><img src="images/dark-logo-1.png" alt=""></a>
            </div>
            <div class="main_logo" id="logo">
                <a href="./"><img src="images/logo.png" alt=""></a>
                <a href="./"><img class="logo-inverse" src="images/dark-logo.png" alt=""></a>
            </div>
            <div class="select_location">
                <div class="ui inline dropdown loc-title">
                    <div class="text">
                        <i class="uil uil-location-point"></i>
                        Rajkot
                    </div>
                </div>
            </div>
            <div class="search120">
                <div class="ui search dropdown ">
                    <form autocomplete="off">
                        <div class="ui left icon input swdh10 ">
                            <input class="prompt srch10 Itemshop" id="Itemshop"  type="text" placeholder="Search for products.." autocomplete="off">
                            <i class='uil uil-search-alt icon icon1'></i>
                            <div class="dropdown-content dc1 showList" id="showList"></div>
                        </div>  
                    </form> 
                </div>
            </div>
            <div class="header_right">
                <ul>
                    <li>
                        <a href="#" class="offer-link"><i class="uil uil-phone-alt"></i>8200-033-848</a>
                    </li>
                    <li></li>
                    <li>
                        <!--<a href="compere.jsp" class="option_links" title="Wishlist"><i class="uil uil-exchange icon_wishlist"></i><span></span></a>-->
                    </li>
                    <li>
                        <a href="dashboard_my_wishlist.jsp" class="option_links" title="Wishlist"><i class='uil uil-heart icon_wishlist'></i><span class="noti_count1 wishlist_count"><%=wishlist_count%></span></a>
                        <a href="dashboard_my_orders.jsp" class="option_links" title="Order Tracking"><i class='uil uil-box icon_wishlist'></i><span class="noti_count1"><%=order_count%></span></a>
                    </li>
                    <li class="ui dropdown">
                        <a href="<%if (full_name.equals("Login")) {
                                out.println("sign_in.jsp");
                            }%>" accesskey=""class="opts_account">
                            <img src="images/avatar/img-5.jpg" alt="">
                            <span class="user__name" id=""><%=full_name%></span>
                            <i class="uil uil-angle-down"></i>
                        </a>
                        <div class="menu dropdown_account">
                            <div class="night_mode_switch__btn">
                                <a href="#" id="night-mode" class="btn-night-mode">
                                    <i class="uil uil-moon"></i> Night mode
                                    <span class="btn-night-mode-switch">
                                        <span class="uk-switch-button"></span>
                                    </span>
                                </a>
                            </div>
                            <a href="dashboard_overview.jsp" class="item channel_item"><i class="uil uil-apps icon__1"></i>Account</a>
                            <a href="dashboard_my_orders.jsp" class="item channel_item"><i class="uil uil-box icon__1"></i>My Orders</a>
                            <a href="dashboard_my_wishlist.jsp" class="item channel_item"><i class="uil uil-heart icon__1"></i>My Wishlist</a>
                            <a href="order_history.jsp" class="item channel_item"><i class="uil uil-list-ul icon__1"></i>Orders History</a>
                            <a href="<%if (info.equals("Sign Up")) {
                                    out.println("sign_up.jsp");
                                } else {
                                    out.println("UserLogout?type=customer");
                                }%>" class="item channel_item"><i class="uil uil-lock-alt icon__1"></i><%=info%></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="sub-header-group">
        <div class="sub-header">
            <div class="ui dropdown">
                <a href="#" class="category_drop hover-btn" data-toggle="modal" data-target="#category_model" title="Categories"><i class="uil uil-apps"></i><span class="cate__icon">Select Shop</span></a>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light py-3">
                <div class="container-fluid">
                    <button class="navbar-toggler menu_toggle_btn" type="button" data-target="#navbarSupportedContent"><i class="uil uil-bars"></i></button>
                    <div class="collapse navbar-collapse d-flex flex-column flex-lg-row flex-xl-row justify-content-lg-end bg-dark1 p-3 p-lg-0 mt1-5 mt-lg-0 mobileMenu" id="navbarSupportedContent">
                        <ul class="navbar-nav main_nav align-self-stretch">
                            <li class="nav-item"><a href="index.jsp" class="nav-link active" title="Home">Home</a></li>
                            <li class="nav-item"><a href="shop_grid.jsp" class="nav-link" title="Products">Products</a></li>
                            <li class="nav-item"><a href="about_us.jsp" class="nav-link" title="New Products">About Us</a></li>
                            <li class="nav-item"><a href="contact_us.jsp" class="nav-link" title="Contact">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="catey__icon">
                <a href="#" class="cate__btn" data-toggle="modal" data-target="#category_model" title="Categories"><i class="uil uil-apps"></i></a>
            </div>
            <div class="header_cart order-1" onclick="cart_items()">
                <a href="<%if (full_name.equals("Login")) {
                        out.println("sign_in.jsp");
                    }%>" class="cart__btn hover-btn  <%if (!full_name.equals("Login")) {
                            out.println("pull-bs-canvas-left");
                        }%>" title="Cart"><i class="uil uil-shopping-cart-alt"></i><span>Cart</span><ins class="cart_count"><%=cart_count%></ins><i class="uil uil-angle-down"></i></a>
            </div>
            <div class="search__icon order-1">
                <a href="#" class="search__btn hover-btn" data-toggle="modal" data-target="#search_model" title="Search"><i class="uil uil-search"></i></a>
            </div>
        </div>
    </div>
</header>

