<%-- 
    Document   : edit_order
    Created on : 19 Feb, 2021, 12:22:50 PM
    Author     : parth
--%>
<%@page import="POJO.Cart"%>
<%@page import="java.util.List"%>
<%@page import="POJO.Order"%>
<%@page import="DAO.OrederDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
     if (session.getAttribute("Servicer") == null) {
        response.sendRedirect("../sign_in.jsp"); 
    }
%>

<!DOCTYPE html>
<html>
    <head>

        <!-- include the head Link -->
        <jsp:include page="head_link.jsp" />

        <title>AP MART - Edit Order</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Orders</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="./">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="tracking_order.jsp">Tracking Orders</a></li>
                        <li class="breadcrumb-item active">Edit Order</li>
                    </ol>
                    <div class="row">
                        <div class="col-xl-12 col-md-12">
                            <div class="card card-static-2 mb-30">
                                 <%
                                    String order_list_id1 = request.getParameter("order_list_id");

                                    int order_list_id = Integer.parseInt(order_list_id1);

                                    Order e5 = OrederDAO.getOrderListDetail(order_list_id);
                                    String shop_name = e5.getShop_name();
                                    int order_id = e5.getOrder_id();

                                    Order obj = OrederDAO.getOrderDetil(order_id);
                                    int delivery_charge = 10;
                                    if (obj.getDelivery_time() == 1) {
                                        delivery_charge = 50;
                                    } else if (obj.getDelivery_time() == 2) {
                                        delivery_charge = 30;
                                    }

                                    String status = "";
                                    if (e5.getStatus() == 1) {
                                        status = "Placed";
                                    } else if (e5.getStatus() == 2) {
                                        status = "Packed";
                                    } else if (e5.getStatus() == 3) {
                                        status = "On the way";
                                    } else if (e5.getStatus() == 4) {
                                        status = "Success";
                                    } else if (e5.getStatus() == 6) {
                                        status = "Cancel";
                                    }

                                    int final_total_mrp = 0;
                                %>
                                <div class="card-title-2">
                                    <h2 class="title1458"><%=shop_name%></h2>
                                    <span class="order-id">Order Id : <%=order_list_id%></span>
                                </div>
                                <div class="invoice-content">
                                    <div class="row">
                                        <div class="col-lg-6 col-sm-6">
                                            <div class="ordr-date">
                                                <b>Order Time :</b> <%=obj.getOrder_plc_time()%>
                                            </div>
                                            <div class="ordr-date">
                                                <b>Client Name :</b> <%=obj.getCustmore_name()%>
                                            </div>
                                            <div class="ordr-date">
                                                <b>Client No :</b> <%=obj.getPhone()%>, <%=obj.getAlt_phone()%>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-sm-6">                                            
                                            <div class="ordr-date right-text">
                                                <b style="padding-right:10px;">Order Address :</b>
                                                <p style="float:right;text-align: left; width: 200px; margin-top: 0px;">
                                                    <%=obj.getOrder_address()%>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="card card-static-2 mb-30 mt-30">
                                                <div class="card-title-2">
                                                    <h4><b>Recent Orders</b></h4>
                                                </div>
                                                <div class="card-body-table px-3 pb-3">
                                                    <div class="table-responsive">
                                                        <table class="table ucp-table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width:130px">#</th>
                                                                    <th style="" class="">Product Name</th>
                                                                    <th style="" class="">MRP</th>
                                                                    <th style="" class="">Dis.MRP</th>
                                                                    <th style="" class="">Quantity</th>
                                                                    <th style="" class="">Total MRP</th>
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
                                                                </tr>
                                                                <%}%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7"></div>
                                        <div class="col-lg-5">
                                            <div class="order-total-dt">
                                                <div class="order-total-left-text">
                                                    Sub Total
                                                </div>
                                                <div class="order-total-right-text">
                                                    ₹<%=final_total_mrp%>
                                                </div>
                                            </div>
                                            <div class="order-total-dt">
                                                <div class="order-total-left-text">
                                                    Delivery Fees
                                                </div>
                                                <div class="order-total-right-text">
                                                    ₹<%=delivery_charge%>
                                                </div>
                                            </div>
                                            <div class="order-total-dt">
                                                <div class="order-total-left-text fsz-18">
                                                    Total Amount
                                                </div>
                                                <div class="order-total-right-text fsz-18">
                                                    ₹<%=delivery_charge + final_total_mrp%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7"></div>
                                        <div class="col-lg-5">
                                            <form method="post" action="../orderStatusUpadateServlet">
                                                <div class="select-status">
                                                    <input type="hidden" name="order_list_id" value="<%=order_list_id%>">
                                                    <input type="hidden" name="type" value="Servicer">
                                                    <label for="status">Status*</label>
                                                    <div class="input-group">
                                                        <select id="status" name="status" class="custom-select">
                                                            <option value="3">On the way</option>
                                                            <option value="4">Delivered</option>
                                                        </select>
                                                        <div class="input-group-append">
                                                            <button class="status-btn hover-btn" type="submit">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <!-- include the footer File -->
            <jsp:include page="footer.jsp" /> 

        </div>

        <!-- include the footer Link -->
        <jsp:include page="footer_link.jsp" /> 

    </body>
</html>
