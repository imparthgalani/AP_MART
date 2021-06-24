<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.CartDAO"%>
<%@page import="POJO.Cart"%>
<%@page import="DAO.WishlistDAO"%>
<%@page import="POJO.Wishlist"%>
<%@page import="Util.ShopStatus"%>
<%@page import="DAO.ShopProductDAO"%>
<%@page import="POJO.ShopProduct"%>
<%@page import="java.util.List"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%          List<ShopProduct> list = null;
    String shop_id1 = request.getParameter("shop_id");
    String categories_id1 = request.getParameter("categories_id");
    String product_id1 = request.getParameter("product_id");
    String action = request.getParameter("action");
    String user_id1 = request.getParameter("user_id");
    String cart_qty_hg = request.getParameter("cart_qty_hg");

    int user_id = Integer.parseInt(user_id1);

    String title = null;
    String popularity = null;
    String result = "";

    if (action.equals("0")) {
        popularity = "ORDER BY RAND()";
    } else if (action.equals("1")) {
        popularity = "ORDER BY shop_product.discount_mrp ASC";
    } else if (action.equals("2")) {
        popularity = "ORDER BY shop_product.discount_mrp DESC";
    } else if (action.equals("3")) {
        popularity = "ORDER BY ROUND(100-shop_product.discount_mrp/shop_product.mrp*100) DESC";
    } else if (action.equals("4")) {
        popularity = "ORDER BY ROUND(100-shop_product.discount_mrp/shop_product.mrp*100) ASC";
    }
    
    if(!product_id1.equals("null")){
        list = ShopProductDAO.viewProductData(Integer.parseInt(product_id1), popularity);
        title = request.getParameter("product_name");
    }
    else if (!categories_id1.equals("null")) {
        list = ShopProductDAO.viewCategoriesDataProduct(Integer.parseInt(categories_id1), popularity);
        title = request.getParameter("categories_name");
    } else if (!shop_id1.equals("null")) {
        list = ShopProductDAO.viewShopsDataProduct(Integer.parseInt(shop_id1), popularity);
        title = request.getParameter("shop_name");
    } else {
        list = ShopProductDAO.viewAllDataProducts(popularity);
        title = "All Products";
    }

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
                    <input type="number" class="input-text qty text" step="1" min="1" max="<%=e.getQuantity()%>" name="quantity" value="<%if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() <= e.getQuantity())) {%><%=cart_product.getQuantity()%><%} else if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() > e.getQuantity())) {%><%=e.getQuantity()%><%cart_qty_hg = "yes";%><%} else {%><%="1"%><%}%>" >
                    <input type="button" onclick="cartValueUpdate(this, 'max')" value="+" class="plus plus-btn">
                </div>
                <span  style="<%if (status == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {%>pointer-events:none;<%}%>" class="<%if (user_id != 0 && (cart_product.getShop_product_id() == e.getShop_product_id())) {
                        out.println("cart-icon clicked");
                    } else {
                        out.println("cart-icon");
                    }%>" onclick="cart(this)" user_id="<%=user_id%>" shop_product_id="<%=e.getShop_product_id()%>" title="Cart"  action=""><i class="uil uil-shopping-cart-alt"></i></span>
            </div>
        </div>
    </div>

</div>
<%}%>
<script src="js/custom.js"></script>
