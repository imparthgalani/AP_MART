<%-- 
    Document   : panding_orders
    Created on : 19 Feb, 2021, 12:21:26 PM
    Author     : parth
--%>
<%@page import="POJO.Shop"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="POJO.Cart"%>
<%@page import="DAO.OrederDAO"%>
<%@page import="POJO.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
     int user_id = 0;
    int shop_id = 0;
    if (session.getAttribute("shop_owner") == null) {
        response.sendRedirect("../sign_in.jsp");
    } else {
        user_id = Integer.parseInt(session.getAttribute("shop_owner").toString());
        Shop obj = ShopDAO.viewDataUserShop(user_id);
        shop_id = obj.getShop_id();
    }
%>
<!DOCTYPE html>
<html>
    <head>

        <!-- include the head Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Pending Orders</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Pending Orders</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active">Pending Orders</li>
                    </ol>
                    <nav class="navbar navbar-light  justify-content-end">
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="status-btn hover-btn my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </nav>
                    <div class="row justify-content-between">

                        <div class="col-lg-12 col-md-12">
                            <div class="card card-static-2 mb-30">
                                <div class="card-title-2">
                                    <h4><b>All Orders</b></h4>
                                </div>
                                <div class="card-body-table px-3 pb-3">
                                    <div class="table-responsive">
                                        <table class="table ucp-table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="">Order ID</th>
                                                    <th style="">Client Name</th>
                                                    <th>Phone</th>
                                                    <th style="width:260px;">Address</th>
                                                    <th style="">Delivery Time</th>
                                                    <th style="">Status</th>
                                                    <th style="">Total</th>
                                                    <th style="">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Order> list1;
                                                    String condition = "WHERE order_list.status = 1 AND order_list.shop_id="+shop_id;
                                                    list1 = OrederDAO.getOrderListDetails(condition);

                                                    for (Order e1 : list1) {
                                                %>
                                                <tr>
                                                    <td><%=e1.getOrder_list_id()%></td>
                                                    <td><%=e1.getCustmore_name()%></a></td>
                                                    <td><%=e1.getPhone()%></td>
                                                    <td><%=e1.getOrder_address()%></td>
                                                    <td>
                                                        <span class="delivery-time"><%=e1.getOrder_time()%></span>
                                                    </td>
                                                    <td>
                                                        <span class="badge-item badge-status">Placed</span>
                                                    </td>
                                                    <%
                                                        Order e5 = OrederDAO.getOrderListDetail(e1.getOrder_list_id());
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

                                                        List< Cart> list3;
                                                        list3 = OrederDAO.viewOrderData(e1.getOrder_list_id());
                                                        int sub_total_mrp = 0;

                                                        for (Cart e3 : list3) {
                                                            int pro_toal_mrp = e3.getCart_quantity() * e3.getDiscount_mrp();
                                                            sub_total_mrp = sub_total_mrp + pro_toal_mrp;
                                                        }%>
                                                    <td>₹<%=sub_total_mrp + delivery_charge%></td>
                                                    <td class="action-btns">
                                                        <a href="view_order.jsp?order_list_id=<%=e1.getOrder_list_id()%>" class="views-btn"><i class="fas fa-eye"></i></a>
                                                        <a href="edit_order.jsp?order_list_id=<%=e1.getOrder_list_id()%>" class="edit-btn"><i class="fas fa-edit"></i></a>
                                                    </td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
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

        <!-- include the footer Linl -->
        <jsp:include page="footer_link.jsp" />

    </body>
</html>
