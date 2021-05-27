<%@page import="DAO.CartDAO"%>
<%@page import="POJO.Cart"%>
<%@page import="POJO.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="cart_delete">
    <%
        String user_id1 = request.getParameter("user_id");
        int user_id = Integer.parseInt(user_id1);

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
                        <div class="cart-item-price abc1"><font style="padding-right:4px;"><%="₹" + e1.getDiscount_mrp()%></font>/<small id="weight" style="padding-left: 3px;"><%=e1.getNet_weigth()%></small><small id="unit"><%=e1.getUnit()%></small><span><%="₹" + e1.getMrp()%></span></div>
                    </div>
                    <div class="qty-group">
                        <div class="quantity buttons_added" id="change">
                            <input type="button"  onclick="cartValueUpdate(this, 'min')" value="-" class="minus minus-btn">
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