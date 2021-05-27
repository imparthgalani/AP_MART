<%-- 
    Document   : dashboard_my_orders
    Created on : 18 Feb, 2021, 11:07:01 AM
    Author     : parth
--%>

<%@page import="POJO.Cart"%>
<%@page import="DAO.OrederDAO"%>
<%@page import="POJO.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int user_id = 0;
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("sign_in.jsp");
    } else {
        user_id = Integer.parseInt(session.getAttribute("customer").toString());
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - My Orders</title>

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
                                    <li class="breadcrumb-item active" aria-current="page">My Orders</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-md-12">
                            <div class="dashboard-right">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="main-title-tab">
                                            <h4><i class="uil uil-box"></i>My Orders</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <%
                                            List<Order> list1;
                                            list1 = OrederDAO.getAllTrackingOrderListId(user_id);

                                            for (Order e1 : list1) {
                                                Order obj = OrederDAO.getOrderDetil(e1.getOrder_id());
                                                int delivery_charge = 10;
                                                if (obj.getDelivery_time() == 1) {
                                                    delivery_charge = 50;
                                                } else if (obj.getDelivery_time() == 2) {
                                                    delivery_charge = 30;
                                                }

                                                List< Cart> list3;
                                                list3 = OrederDAO.viewOrderData(e1.getOrder_list_id());
                                                int sub_total_mrp = 0;
                                                int iteams = 0;

                                                for (Cart e3 : list3) {
                                                    int pro_toal_mrp = e3.getCart_quantity() * e3.getDiscount_mrp();
                                                    sub_total_mrp = sub_total_mrp + pro_toal_mrp;
                                                    iteams = iteams + 1;
                                                }


                                        %>
                                        <div class="pdpt-bg" id="deleteOrder">
                                            <div class="pdpt-title flex-row-reverse">
                                                <h6><b style="font-size: 16px; border-radius: 6px;">ORDER ID : </b><%=e1.getOrder_list_id()%><span style="float:right;"> <%=obj.getOrder_plc_time()%></span></h6>
                                            </div>

                                            <div class="order-body10">
                                                <ul class="order-dtsll">
                                                    <li>
                                                        <div class="order-dt-img">
                                                            <img src="images/groceries.svg" alt="">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="order-dt47">
                                                            <h4><%=e1.getShop_name()%></h4>
                                                            <p>Delivered - Gambo</p>
                                                            <div class="order-title"><%=iteams%> Items <a href="order_action.jsp?order_list_id=<%=e1.getOrder_list_id()%>"><span data-inverted="" data-tooltip="View Product" data-position="top center">?</span></a></div>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <div class="total-dt">
                                                    <div class="total-checkout-group">
                                                        <div class="cart-total-dil">
                                                            <h4>Sub Total</h4>
                                                            <span>₹<%=sub_total_mrp%></span>
                                                        </div>
                                                        <div class="cart-total-dil pt-3">
                                                            <h4>Delivery Charges</h4>
                                                            <span>₹<%=delivery_charge%></span>
                                                        </div>
                                                    </div>
                                                    <div class="main-total-cart">
                                                        <h2>Total</h2>
                                                        <span>₹<%=sub_total_mrp + delivery_charge%></span>
                                                    </div>
                                                </div>
                                                <% Order e5 = OrederDAO.getOrderListDetail(e1.getOrder_list_id());
                                                    int status = e5.getStatus();
                                                %>
                                                <input type="hidden" name="success" order_list_id="<%=e1.getOrder_list_id()%>" status="<%=status%>" update_time="<%=e5.getUpadte_time()%>">
                                                <div class="track-order">
                                                    <h4>Track Order</h4>
                                                    <div class="bs-wizard" style="border-bottom:0;">
                                                        <div class="bs-wizard-step <%if (status > 1) {%>complete<%} else if (status == 1) {%>active<%}%>">
                                                            <div class="text-center bs-wizard-stepnum">Placed</div>
                                                            <div class="progress"><div class="progress-bar"></div></div>
                                                            <a href="#" class="bs-wizard-dot"></a>
                                                        </div>
                                                        <div class="bs-wizard-step <%if (status > 2) {%>complete<%} else if (status == 2) {%>active<%} else {%>disabled<%}%>">
                                                            <div class="text-center bs-wizard-stepnum">Packed</div>
                                                            <div class="progress"><div class="progress-bar"></div></div>
                                                            <a href="#" class="bs-wizard-dot"></a>
                                                        </div>
                                                        <div class="bs-wizard-step <%if (status > 3) {%>complete<%} else if (status == 3) {%>active<%} else {%>disabled<%}%>">
                                                            <div class="text-center bs-wizard-stepnum">On the way</div>
                                                            <div class="progress"><div class="progress-bar"></div></div>
                                                            <a href="#" class="bs-wizard-dot"></a>
                                                        </div>
                                                        <div class="bs-wizard-step <%if (status == 4) {%>active<%} else if (status < 4) {%>disabled<%}%>">
                                                            <div class="text-center bs-wizard-stepnum">Delivered</div>
                                                            <div class="progress"><div class="progress-bar"></div></div>
                                                            <a href="#" class="bs-wizard-dot"></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="total-dt">
                                                    <div class="total-checkout-group">
                                                        <div class="cart-total-dil">
                                                            Delivery Boy - <a href="#" style="color: #f55d2c;"><i class="uil uil-phone "></i> Call Us</a>
                                                            <span <%if (status == 2 || status == 3) {%>style="pointer-events:none;filter: grayscale(100%);"<%}%><%if (status == 4) {%>style="pointer-events:none;"<%}%>><a class="collapsed add-address hover-btn flex-row-reverse" style="float: right; margin-bottom: 30px;"  role="button"  href="order_action.jsp?order_list_id=<%=e1.getOrder_list_id()%>&action=delete"><%if (status == 4) {%>Success<%} else {%>Cancel Order<%}%></a>
                                                            </span>
                                                        </div>
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
            </div>
        </div>

        <!-- include the footer File -->
        <jsp:include page="footer.jsp" />

        <!-- include the footer link -->
        <jsp:include page="footer_link.jsp" />

        <script>
           $(document).ready(function () {
                $("input[name='success']").each(function () {
                    var order_list_id = $(this).attr("order_list_id");
                    var status = $(this).attr("status");
                    var update_time = $(this).attr("update_time");

                    if (status == 4) {
                        statusUpdate(order_list_id, status, update_time);
                    }
                });
            });
            function statusUpdate(order_list_id, status, update_time) {


                var now = new Date();
                var then = new Date(update_time);

                then.setHours(then.getHours() + 6);

                var timeout = (then.getTime() - now.getTime());

                setTimeout(function () {
                    $.ajax({
                        url: 'orderStatusUpadateServlet',
                        type: "post",
                        data: {order_list_id:order_list_id, status:'5'},
                        success: function (new_value) {
                        }
                    });
                }, timeout);
            }
        </script> 
    </body>
</html>
