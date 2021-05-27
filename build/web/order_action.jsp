<%-- 
    Document   : bill
    Created on : 18 Feb, 2021, 11:06:32 AM
    Author     : parth
--%>

<%@page import="POJO.Order"%>
<%@page import="DAO.OrederDAO"%>
<%@page import="POJO.Cart"%>
<%@page import="java.util.List"%>
<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("sign_in.jsp");
    }
    String action = request.getParameter("action");

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Bill Invoice</title>
        <style>
            thead th {
                background: #f5bdab;
                color : #000;
                font-weight: bold;
                letter-spacing: 1.2px;
            }

        </style>
    </head>
    <body>

        <!-- include the header File -->
        <jsp:include page="header.jsp" /> 

        <div class="bill-dt-bg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="bill-detail">

                            <%                                String order_list_id1 = request.getParameter("order_list_id");
                                int order_list_id = Integer.parseInt(order_list_id1);

                                Order e5 = OrederDAO.getOrderListDetail(order_list_id);
                                String shop_name = e5.getShop_name();
                                int order_id = e5.getOrder_id();
                                System.out.println(order_id);

                                Order obj = OrederDAO.getOrderDetil(order_id);

                                int delivery_charge = 10;
                                if (obj.getDelivery_time() == 1) {
                                    delivery_charge = 50;
                                } else if (obj.getDelivery_time() == 2) {
                                    delivery_charge = 30;
                                }

                                int final_total_mrp = 0;
                            %>
                            <div class="bill-dt-step">
                                <div class="bill-title">
                                    <h2><%=shop_name%></h2>
                                </div>

                                <table class="table text-right table-striped table-hover table-responsive" style="margin-top: 2em;">
                                    <thead style="background-color: #f55d2c;color: white;">
                                        <tr >
                                            <th scope="col" class="sticky-top">Id</th>
                                            <th scope="col" style="width:270px;" class="sticky-top">Product Name</th>
                                            <th scope="col" style="width:200px;" class="sticky-top">MRP</th>
                                            <th scope="col" style="width:200px;" class="sticky-top">Dis.MRP</th>
                                            <th scope="col" style="width:200px;" class="sticky-top">Quantity</th>
                                            <th scope="col" style="width:200px;" class="sticky-top">Total MRP</th>
                                            <th scope="col" style="width:200px; <%if (action == null) {%>display:none;<%}%>}" class="sticky-top text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Cart> list10;
                                            list10 = OrederDAO.viewOrderData(order_list_id);
                                            int n = 0;
                                            for (Cart e1 : list10) {
                                                n = n + 1;
                                                int pro_toal_mrp = e1.getCart_quantity() * e1.getDiscount_mrp();
                                                final_total_mrp = final_total_mrp + pro_toal_mrp;
                                        %>
                                        <tr>
                                            <th scope="row"><%=n%></th>
                                            <td><%=e1.getProduct_name()%></td>
                                            <td><%=e1.getMrp()%></td>
                                            <td><%=e1.getDiscount()%>%</td>
                                            <td><%=e1.getCart_quantity()%></td>
                                            <td><%=pro_toal_mrp%></td>
                                            <td class="action-btns text-center"  Style="<%if (action == null || action.equals("review")) {%>display:none;<%}%>"> <a href=""  shop_product_id="<%=e1.getShop_product_id()%>" order_list_id="<%=order_list_id%>" data-toggle="modal" data-target="#RCancellation" class="fas fa-trash-alt orderCancel" title="Review"> <span style="margin-left:10px;">Cancel</span></a></td>
                                            <td class="action-btns text-center" Style="<%if (action == null || action.equals("delete")) {%>display:none;<%}%>"><a href="#" shop_product_id="<%=e1.getShop_product_id()%>" order_list_id="<%=order_list_id%>" data-toggle="modal" data-target="#riview_modal" class="fas fa-pen review" title="Review"> <span style="margin-left:10px;">Review</span></a></td>
                                        </tr>
                                        <%}%>

                                    </tbody>
                                </table> 
                            </div>
                            <div class="bill-dt-step">
                                <div class="bill-title">
                                    <h4>Delivery Address</h4>
                                </div>
                                <div class="bill-descp">
                                    <div class="itm-ttl"><%=obj.getTitle()%></div>
                                    <p class="bill-address"><%=obj.getOrder_address()%></p>
                                </div>
                            </div>
                            <div class="bill-dt-step">
                                <div class="bill-title">
                                    <h4>Payment</h4>
                                </div>
                                <div class="bill-descp">
                                    <div class="total-checkout-group p-0 border-top-0">
                                        <div class="cart-total-dil">
                                            <h4>Sub Total</h4>
                                            <span>₹<%=final_total_mrp%></span>
                                        </div>
                                        <div class="cart-total-dil pt-3">
                                            <h4>Total Delivery Charges</h4>
                                            <span>₹<%=delivery_charge%></span>
                                        </div>
                                    </div>
                                    <div class="main-total-cart pl-0 pr-0 pb-0 border-bottom-0">
                                        <h2>Total</h2>
                                        <span>₹<%=delivery_charge + final_total_mrp%></span>
                                    </div>
                                </div>
                            </div>                            
                            <div class="bill-dt-step">
                                <div class="bill-title">
                                    <h4>Payment Option</h4>
                                </div>
                                <div class="bill-descp">
                                    <p class="bill-dt-sl"><span class="dlr-ttl25 mr-1"><i class="uil uil-check-circle"></i></span><%=obj.getPaymentmethod()%></p>
                                </div>
                            </div>
                            <div class="bill-dt-step">
                                <div class=" bill-bottom">
                                    <a   shop_product_id="0" order_list_id="<%=order_list_id%>" class="print-btn hover-btn orderCancel" <% if (action == null || action.equals("review")) {%> style="pointer-events:none" <%}%> data-toggle="modal" data-target="#RCancellation" href=""> <%if (action != null && action.equals("delete")) {%>Cancel Order<%} else {%>Thanks for Ordering<%}%></a>
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


            function resonRadio(e) {
                var reason = $(e).parent().find("label").text();

                $(e).parent().parent().parent().parent().parent().find("input[name='cancelReson']").val(reason);
            }

            $(".orderCancel").click(function () {
                var order_list_id = $(this).attr("order_list_id");
                var shop_product_id = $(this).attr("shop_product_id");
                //alert(order_list_id +" "+shop_product_id);
                $("#order_list_id1").val(order_list_id);
                $("#shop_product_id1").val(shop_product_id);
                //alert($("#order_list_id").val()+" "+$("#shop_product_id").val());
            });

            $(".review").click(function () {
                var order_list_id = $(this).attr("order_list_id");
                var shop_product_id = $(this).attr("shop_product_id");
                //alert(shop_product_id);
                //$("#order_list_id2").val(order_list_id);
                //$("#shop_product_id2").val(shop_product_id);
                //alert($("#shop_product_id2").val());

                $.ajax({
                    url: 'AjaxReviewServlet.jsp',
                    type: "post",
                    data: {order_list_id: order_list_id, shop_product_id: shop_product_id},
                    success: function (res) {
                        $("#insert456").html(res.trim());
                    }
                });

            });

            

        </script>

    </body>
</html>
