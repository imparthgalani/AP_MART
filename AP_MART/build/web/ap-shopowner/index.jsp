<%-- 
    Document   : index.jsp
    Created on : 18 Feb, 2021, 11:48:15 AM
    Author     : parth
--%>
<%@page import="DAO.ShopDAO"%>
<%@page import="POJO.Shop"%>
<%@page import="POJO.Order"%>
<%@page import="POJO.Cart"%>
<%@page import="DAO.OrederDAO"%>
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

        <title>AP MART - Shop Owner</title>
        <style>
            .dashboard-report-card{
                width: 244px;
            }
            .dashboard-report-card .card-media {
                width: 70px;
                height: 70px;
                border-radius: 50%;
                flex-shrink: 0;
                margin-left: 15px;
                display: flex;
                align-items: center;
                text-align: center;
                background-color: rgba(255, 255, 255, .2);
                justify-content: center;
                right: 9px;
                top: 31px;
                position: absolute;
            }
            .mdp{
                margin-left: 37px;
            }

            .dashboard-report-card.blue {
                background-color: #bc42bb;
                border-color: #bc42bb;

            }

            @media(max-width:1500.98px) {
                .dashboard-report-card{
                    width: auto;
                }
                .mdp{
                    margin-left: 0px;
                }
            }
        </style>
    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" /> 

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Dashboard</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                    <div class="row">
                        <div class="col-xl-2 col-md-6">
                            <div class="dashboard-report-card purple">
                                <div class="card-content">
                                    <span class="card-title">Order Pending</span>
                                    <%
                                        String condition1 = "WHERE status = 1  AND order_list.shop_id="+shop_id;
                                        int count1 = OrederDAO.statusCount(condition1);
                                    %>
                                    <span class="card-count"><%=count1%></span>
                                </div>
                                <div class="card-media">
                                    <i class="fab fa-rev"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-6 mdp">
                            <div class="dashboard-report-card info">
                                <div class="card-content">
                                    <span class="card-title">Order Process</span>
                                     <%
                                        String condition2 = "WHERE (status = 3 OR status = 2) AND order_list.shop_id="+shop_id;
                                        int count2 = OrederDAO.statusCount(condition2);
                                    %>
                                    <span class="card-count"><%=count2%></span>
                                </div>
                                <div class="card-media">
                                    <i class="fas fa-sync-alt rpt_icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-6 mdp">
                            <div class="dashboard-report-card blue">
                                <div class="card-content">
                                    <span class="card-title">ORDER Delivered</span>
                                     <%
                                        String condition3 = "WHERE (status = 4 OR status = 5)  AND order_list.shop_id="+shop_id;
                                        int count3 = OrederDAO.statusCount(condition3);
                                    %>
                                    <span class="card-count"><%=count3%></span>
                                </div>
                                <div class="card-media">
                                    <i class="fas fa-check"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-6 mdp">
                            <div class="dashboard-report-card red">
                                <div class="card-content">
                                    <span class="card-title">Order Cancel</span>
                                    <%
                                        String condition4 = "WHERE status = 6  AND order_list.shop_id="+shop_id;
                                        int count4 = OrederDAO.statusCount(condition4);
                                    %>
                                    <span class="card-count"><%=count4%></span>
                                </div>
                                <div class="card-media">
                                    <i class="far fa-times-circle"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-6 mdp">
                            <div class="dashboard-report-card success">
                                <div class="card-content">
                                    <span class="card-title">Total Amount</span>
                                    <span class="card-count" id="amount">0</span>
                                </div>
                                <div class="card-media">
                                    <i class="fas fa-money-bill rpt_icon"></i>
                                </div>
                            </div>
                        </div>




                        <div class="col-xl-12 col-md-12">
                            <div class="card card-static-2 mb-30">
                                <div class="card-title-2">
                                    <h4><b>Recent Orders</b></h4>
                                </div>
                                <div class="card-body-table px-3 pb-3">
                                    <div class="table-responsive">
                                        <table class="table ucp-table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width:80px;">Order ID</th>
                                                    <th style="width:150px;">Client Name</th>
                                                    <th style="">Address</th>
                                                    <th style="">Delivery Time</th>
                                                    <th style="">Servicer</th>
                                                    <th style="">Status</th>
                                                    <th style="">Total</th>
                                                    <th style="width:100px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Order> list1;
                                                    String condition = "WHERE order_list.status > 3  AND order_list.shop_id="+shop_id;
                                                    list1 = OrederDAO.getOrderListDetails(condition);
                                                    int total_amount = 0;
                                                    for (Order e1 : list1) {
                                                        String status = "";
                                                        if (e1.getStatus() == 4 || e1.getStatus() == 5) {
                                                            status = "Success";
                                                        } else {
                                                            status = "Cancel";
                                                        }
                                                %>
                                                <tr>
                                                    <td><%=e1.getOrder_list_id()%></td>
                                                    <td><%=e1.getCustmore_name()%></a></td>
                                                    <td><%=e1.getOrder_address()%></td>
                                                    <td>
                                                        <span class="delivery-time"><%=e1.getOrder_time()%></span>
                                                    </td>
                                                    <td><%=e1.getServicer_name()%></td>
                                                    <td>
                                                        <span class="badge-item badge-status"><%=status%></span>
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
                                                    <%if(e1.getStatus() != 6){total_amount = total_amount + sub_total_mrp;}%>
                                                    <td class="action-btns">
                                                        <a href="view_order.jsp?order_list_id=<%=e1.getOrder_list_id()%>" class="views-btn"><i class="fas fa-eye"></i> View</a>
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
        <script>
            $(document).ready(function () {
                var amount = <%=total_amount%>;
                $("#amount").text(amount);
            });
        </script>
    </body>
</html>
