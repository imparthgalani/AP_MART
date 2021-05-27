<%-- 
    Document   : footer_link
    Created on : 22 Feb, 2021, 10:31:13 AM
    Author     : parth
--%>

<%@page import="DAO.CartDAO"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="POJO.Shop"%>
<%@page import="POJO.ShopProduct"%>
<%@page import="DAO.ShopProductDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    int user_id = 0;
    if (session.getAttribute("customer") != null) {
        user_id = Integer.parseInt(session.getAttribute("customer").toString());
    }
%>

<!-- Footer Link Include-->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/OwlCarousel/owl.carousel.js"></script>
<script src="vendor/semantic/semantic.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/product.thumbnail.slider.js"></script>
<script src="js/offset_overlay.js"></script>
<script src="js/night-mode.js"></script>
<script src="js/validation.js"></script>
<!--Social Share Link-->
<script src="https://kit.fontawesome.com/7368c40b21.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.jssocials/1.4.0/jssocials.min.js"></script>
<script src="js/share.js"></script>


<script>

    // Wishlist => Add & Remove

    function wishlist(e)
    {
        var user_id = $(e).attr("user_id");
        var shop_product_id = $(e).attr("shop_product_id");
        var class_value = $(e).attr("class").trim();

        if (user_id != "0")
        {
            var isSingle;
            if (class_value == "like-icon" || class_value == "like-icon save-icon")
            {
                $.ajax({
                    url: 'AjaxWishlistServlet',
                    type: "post",
                    data: {user_id: user_id, shop_product_id: shop_product_id, action: "insert"},
                    success: function (res) {
                        $(".wishlist_count").html(res);
                        $("#wishlist[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "'][class='like-icon save-icon']").attr("class", "like-icon save-icon liked");
                        $("#wishlist[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "'][class='like-icon']").attr("class", "like-icon liked");
                    }
                });
            } else
            {
                $.ajax({
                    url: 'AjaxWishlistServlet',
                    type: "post",
                    data: {user_id: user_id, shop_product_id: shop_product_id},
                    success: function (res) {
                        $(".wishlist_count").html(res);
                        $("#wishlist[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "'][class='like-icon save-icon liked']").attr("class", "like-icon save-icon");
                        $("#wishlist[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "'][class='like-icon liked']").attr("class", "like-icon");
                        $(e).parent().parent().parent().parent().has("#wishlist-hide").hide();
                    }
                });
            }
        } else
        {
            location.href = 'sign_in.jsp';
        }
    }

    // Cart => Add & Remove

    function cart(e)
    {
        var user_id = $(e).attr("user_id");
        var shop_product_id = $(e).attr("shop_product_id");
        var qty = $(e).parent().find(".qty").val();

        if (qty == null)
        {
            qty = $(".qty[action='abc']").val();
        }

        var class_value = $(e).attr("class").trim();
        if (user_id != "0")
        {
            if (class_value == "cart-icon" || class_value == "cart-icon cart-icon-save")
            {
                $.ajax({
                    url: 'AjaxCartServlet',
                    type: "post",
                    data: {user_id: user_id, shop_product_id: shop_product_id, quantity: qty, action: "insert"},
                    success: function (res) {
                        $(".cart_count").html(res);
                        $("#cart[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "'][class='cart-icon cart-icon-save']").attr("class", "cart-icon cart-icon-save clicked");
                        $("#cart[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "'][class='cart-icon']").attr("class", "cart-icon clicked");
                    }
                });
            } else
            {
                $.ajax({
                    url: 'AjaxCartServlet',
                    type: "post",
                    data: {user_id: user_id, shop_product_id: shop_product_id, action: "delete"},
                    success: function (res) {
                        $(".cart_count").html(res);
                        $("#cart[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "'][class='cart-icon cart-icon-save clicked']").attr("class", "cart-icon cart-icon-save");
                        $("#cart[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "'][class='cart-icon clicked']").attr("class", "cart-icon");
                    }
                });
            }

            window.setTimeout(function () {
                $.ajax({
                    url: 'AjaxCartData.jsp',
                    type: "post",
                    data: {user_id: user_id},
                    success: function (cartData) {
                        //alert("hiiii2");
                        $("#cart_delete").remove();
                        $("#cart_insert").html(cartData);
                        cart_items();
                    }
                });
            });

        } else
        {
            location.href = 'sign_in.jsp';
        }
    }

    // shop_product quantity change => For user

    function cartValueUpdate(e, act)
    {
        window.setTimeout(function () {
            var user_id = $(e).parent().find(".qty").attr("user_id");
            var shop_product_id = $(e).parent().find(".qty").attr("shop_product_id");
            var max_qty = parseInt($(e).parent().find(".qty").attr("max"));
            var qty = parseInt($(e).parent().find(".qty").val());
            $(".qty[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "']").val(qty);
            $.ajax({
                url: 'AjaxCartServlet',
                type: "post",
                data: {user_id: user_id, shop_product_id: shop_product_id, quantity: qty, action: "update"},
                success: function (res) {
                    $(".cart_count").html(res);
                    $(".qty[user_id='" + user_id + "'][shop_product_id='" + shop_product_id + "']").val(qty);
                }
            });
        });
    }

    // shop open-close => Page Auto Refresh For User

    $(document).ready(function () {
    <%List<Shop> list5 = ShopDAO.viewData();
        String hours_closing;
        String minutes_closing;
        String hours_opening;
        String minutes_opening;
        for (Shop e1 : list5) {
            hours_closing = e1.getClosing_time().split(":")[0];
            minutes_closing = e1.getClosing_time().split(":")[1];
            hours_opening = e1.getOpening_time().split(":")[0];
            minutes_opening = e1.getOpening_time().split(":")[1];
    %>
        refreshAt(<%=hours_closing%>, <%=minutes_closing%>, 00);
        refreshAt(<%=hours_opening%>, <%=minutes_opening%>, 00);
    <%}%>
    });

    function refreshAt(hours, minutes, seconds) {
        var now = new Date();
        var then = new Date();
        if (now.getHours() > hours ||
                (now.getHours() == hours && now.getMinutes() > minutes) ||
                now.getHours() == hours && now.getMinutes() == minutes && now.getSeconds() >= seconds) {
            then.setDate(now.getDate() + 1);
        }
        then.setHours(hours);
        then.setMinutes(minutes);
        then.setSeconds(seconds);
        var timeout = (then.getTime() - now.getTime());
        setTimeout(function () {
            location.reload(true);
        }, timeout);
    }

    //Shop open-close & open-close change time & shop_product quantity change => Page Auto Refresh for Admin

    $(document).ready(function () {

        //shop status change

        var status = [];
    <%  List<Shop> list9 = ShopDAO.viewData();
        for (Shop e1 : list9) {
    %>
        status = status + "<%=e1.getStatus()%>";
    <%}%>
        var old_status = status.length;
        //Shop opening - closing time change

        var old_sum = 0;
        var hours_o;
        var minites_o;
        var hours_c;
        var minites_c;
    <%  List<Shop> list10 = ShopDAO.viewData();
        for (Shop e1 : list10) {
    %>
        hours_o = <%=e1.getOpening_time().split(":")[0]%>
        minites_o = <%=e1.getOpening_time().split(":")[1]%>
        hours_c = <%=e1.getClosing_time().split(":")[0]%>
        minites_c = <%=e1.getClosing_time().split(":")[1]%>
        old_sum = old_sum + hours_o + minites_o + hours_c + minites_c;
    <%}%>

        //ShopProduct Qunatity change

        var old_quntity = 0;
    <% List<ShopProduct> list11 = ShopProductDAO.viewAllDataProducts(" ");
        for (ShopProduct e1 : list11) {
    %>
        old_quntity = old_quntity + <%=e1.getQuantity()%>
    <%}%>


        var intervalId = window.setInterval(function () {
            pageReload(old_status, old_sum, old_quntity);
        }, 1000);
    });

    function pageReload(old_status, old_sum, old_quntity)
    {
        $.ajax({
            url: 'AjaxPageReloadServlet',
            type: "post",
            data: {},
            success: function (new_value) {
                var new_status = new_value.split(" ")[0];
                var new_sum = new_value.split(" ")[1];
                var new_quntity = new_value.split(" ")[2];
                if ((new_status != old_status) || (new_sum != old_sum) || (new_quntity != old_quntity))
                {
                    location.reload(true);
                }

            }
        });
    }

    //Page back => Page Auto Refresh For User

    $(document).ready(function () {
        if (performance.navigation.type == 2) {
            location.reload(true);
        }
    });

    // Pop-Pup Cart => Value calculate

    function cart_items()
    {
        var total_dis = 0;
        var total_pri = 0;
        var total_sav = 0;
        $(".cart_items").each(function () {
            var sub_total_dis = 0;
            var sub_total_pri = 0;
            $(this).find(".cart-item").each(function () {
                var qty = $(this).find(".cart_qty").val();
                var dis_price = $(this).find(".abc1 font").text().replace('₹', '');
                var price = $(this).find(".abc1 span").text().replace('₹', '');
                //alert(qty+" "+dis_price+" "+price);
                var row_total_dis = qty * dis_price;
                var row_total_pri = qty * price;
                //alert(row_total_dis);
                $(this).find(".abc2 font").text("₹" + row_total_dis);
                $(this).find(".abc2 span").text("₹" + row_total_pri);
                sub_total_dis = sub_total_dis + row_total_dis;
                sub_total_pri = sub_total_pri + row_total_pri;
            });
            total_dis = total_dis + sub_total_dis;
            total_pri = total_pri + sub_total_pri;
            $(this).find(".abc3 font").text("₹" + sub_total_dis);
            $(this).find(".abc3 span").text("₹" + sub_total_pri);
        });
        total_sav = total_pri - total_dis;
        $(".saving-total span").text("₹" + total_sav);
        $(".abc4 font").text("₹" + total_dis);
        $(".abc4 span").text("₹" + total_pri);
    }

    // Shop-grid Page => Filter 

    $(document).ready(function () {
        $("input#popularity").on("change keyup paste", function (event) {
            event.preventDefault();
            var action = $("input#popularity").val();
            var shop_id = $("input[name='shop_id']").val();
            var categories_id = $("input[name='categories_id']").val();
            var product_id = $("input[name='product_id']").val();
            var user_id = <%=user_id%>;
            $.ajax({
                url: 'AjaxPopularity.jsp',
                type: "post",
                data: {action: action, shop_id: shop_id, categories_id: categories_id, product_id: product_id, user_id: user_id},
                success: function (res) {
                    $("div#clear").remove();
                    $("div#format").html(res.trim());
                }
            });
        });
    });

    //Profile Page => Edit Profile

    function editProfile(e)
    {
        var full_name = $(".card-body").find(".full_name").text().trim();
        var email = $(".card-body").find(".email").text().trim();
        var phone = $(".card-body").find(".phone").text().trim();
        $("#multiCollapseExample2").find("input[name='full_name']").val(full_name);
        $("#multiCollapseExample2").find("input[name='email']").val(email);
        $("#multiCollapseExample2").find("input[name='phone']").val(phone);
    }

    //Profile & Chekout Page => Edit Adrress Show Data

    function editAddress(e, id)
    {
        $.ajax({
            url: 'AjaxAddressServlet',
            type: "post",
            data: {id: id},
            success: function (res) {
                $("#multiCollapseExample4").find("input[name='delivery_address_id']").val(res.split("@")[0]);
                $("#multiCollapseExample4").find("input[name='user_id']").val(res.split("@")[1]);
                $("#multiCollapseExample4").find("select[name='title']").val(res.split("@")[2]);
                $("#multiCollapseExample4").find("input[name='flat']").val(res.split("@")[3]);
                $("#multiCollapseExample4").find("input[name='street']").val(res.split("@")[4]);
                $("#multiCollapseExample4").find("input[name='pincode']").val(res.split("@")[5]);
                $("#multiCollapseExample4").find("input[name='locality']").val(res.split("@")[6]);
                $("#multiCollapseExample4").find("input[name='action']").val('update');
            }
        });
    }

    //Profile & Chekout Page => Add New Address show empty filed

    function addAddress()
    {
        $("#multiCollapseExample4").find("input[name='delivery_address_id']").val('');
        $("#multiCollapseExample4").find("select[name='title']").val('');
        $("#multiCollapseExample4").find("input[name='flat']").val('');
        $("#multiCollapseExample4").find("input[name='street']").val('');
        $("#multiCollapseExample4").find("input[name='pincode']").val('');
        $("#multiCollapseExample4").find("input[name='locality']").val('');
        $("#multiCollapseExample4").find("input[name='action']").val('insert');
    }


    //Profile & Chekout Page => Change Address

    function changeAddress(e, delivery_address_id)
    {
        var user_id = <%=user_id%>;
        if (delivery_address_id == 0)
        {
            delivery_address_id = $("#multiCollapseExample4").find("input[name='delivery_address_id']").val();
            var action = $("#multiCollapseExample4").find("input[name='action']").val();
            var title = $("#multiCollapseExample4").find("select[name='title']").val();
            var flat = $("#multiCollapseExample4").find("input[name='flat']").val();
            var street = $("#multiCollapseExample4").find("input[name='street']").val();
            var pincode = $("#multiCollapseExample4").find("input[name='pincode']").val();
            var locality = $("#multiCollapseExample4").find("input[name='locality']").val();
        }
        var redirect = $("#multiCollapseExample4").find("input[name='redirect']").val();
        $.ajax({
            url: 'AjaxDeliveryAddress.jsp',
            type: "post",
            data: {user_id: user_id, delivery_address_id: delivery_address_id, action: action, title: title, flat: flat, street: street, pincode: pincode, locality: locality, redirect: redirect},
            success: function (address) {
                //alert("hiiii2");
                $(".remove12").remove();
                $(".insert12").html(address);
            }
        });
    }

    //Chekout Page => Get delivery_address_id

    function getAddresId(e)
    {
        var delivery_address_id = $(e).find("input").val();
        $("input[name='delivery_address_id']").val(delivery_address_id);
    }

    //Chekout Page => Get Delivery Time

    function deliveryTimeCharge(e)
    {
        var delivery_time = $(e).find("input").val();
        $("input[name='delivery_time']").val(delivery_time);
    }


    // after

    

</script>