<%--
Document   : order_history
Created on : 12 Mar, 2021, 6:54:08 PM
Author     : Parth
--%>
<%@page import="POJO.Cart"%>
<%@page import="DAO.OrederDAO"%>
<%@page import="POJO.Order"%>
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
        <style>
            .fa-eye{
                padding-right:0.7em;
            }
            .badge-item{
                display: inline-block;
                padding: .55em .5em;
                font-size: 12px;
                color: #fff;
                background-color: #f55d2c;
                font-weight: 600;
                line-height: 1;
                text-align: center;
                white-space: nowrap;
                vertical-align: baseline;
                border-radius: 3px;
                transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            }
        </style>
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
                                            <h4><i class="fas fa-list"></i> Orders History</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="pdpt-bg">
                                            <div class="card-body-table px-3">
                                                <div class="table-responsive">
                                                    <table class="table  table-hover text-center mt-2 mb-2">
                                                        <thead style="background-color: #f55d2c; color: white;">
                                                            <tr>
                                                                <th scope="col">Id</th>
                                                                <th scope="col">Order Id</th>
                                                                <th scope="col" >Order Time</th>
                                                                <th scope="col" >Shop Name</th>
                                                                <th scope="col">Total MRP</th>
                                                                <th scope="col">Status</th>
                                                                <th scope="col" >Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                List<Order> list1;
                                                                System.out.println(user_id);
                                                                String condition = "WHERE order_list.status > 4 AND order_list.user_id = " + user_id;
                                                                list1 = OrederDAO.getOrderListDetails(condition);
                                                                int n = 0;
                                                                for (Order e1 : list1) {
                                                                    String status = "";
                                                                    if (e1.getStatus() == 5) {
                                                                        status = "Success";
                                                                    } else {
                                                                        status = "Cancel";
                                                                    }
                                                                    n = n + 1;
                                                            %>
                                                            <tr>
                                                                <th scope="row"><%=n%></th>
                                                                <th><%=e1.getOrder_list_id()%></th>
                                                                <td><%=e1.getOrder_plc_time()%></td>
                                                                <td><%=e1.getShop_name()%></td>
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
                                                                <td><span class="badge-item badge-status"><%=status%></span></td>
                                                                <td>
                                                                    <a href="order_action.jsp?order_list_id=<%=e1.getOrder_list_id()%><%if(e1.getStatus() == 5){%>&action=review<%}%>" class="view-shop-btn view-shop-btn1"> <i class="fas fa-eye"></i>View</a>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- include the footer File -->
        <jsp:include page="footer.jsp" />
        <!-- include the footer link -->
        <jsp:include page="footer_link.jsp" />
    </body>
</html>