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

    String order_id1 = request.getParameter("order_id");
    int order_id = Integer.parseInt(order_id1);

    System.out.println(order_id);


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
            .TPadding{
                padding-right: 1em;                
            }
            .TColor{
                color: #f55d2c;
            }
            .bill-detail {
                background: #fff;
                border-radius: 3px;
                box-shadow: 0 1px 2px 0 #e9e9e9;
                margin: 0px 0px 60px 0px;
            }
        </style>
    </head>
    <body>
        <div class="bill-dt-bg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="bill-detail">
                            <div class="bill-dt-step">
                                <div class="bill-title">
                                    <h1 class="TColor" style="font-family:cursive;">Order Bill</h1>
                                </div>
                            </div>
                            <%                        

                                Order obj = OrederDAO.getOrderDetil(order_id);
                                int total_delivery_charge = 0;
                                int delivery_charge = 10;
                                if (obj.getDelivery_time() == 1) {
                                    delivery_charge = 50;
                                } else if (obj.getDelivery_time() == 2) {
                                    delivery_charge = 30;
                                }
                                int final_total_mrp = 0;

                                List<Order> list9;
                                list9 = OrederDAO.getAllOrderListId(order_id);
                                for (Order e : list9) {
                                    int sub_total_mrp = 0;
                                    int sub_total_dis = 0;
                            %>
                            <div class="bill-dt-step">
                                <div class="bill-title">
                                    <h4><%=e.getShop_name()%></h4>
                                </div>

                                <table id="" class="table text-right table-striped table-hover table-responsive">
                                    <thead style="background-color: #f55d2c;color: white;">
                                        <tr >
                                            <th scope="col" class="sticky-top">Id</th>
                                            <th scope="col" style="width:270px;" class="sticky-top">Product Name</th>
                                            <th scope="col" style="width:200px;" class="sticky-top">MRP</th>
                                            <th scope="col" style="width:200px;" class="sticky-top">Dis.MRP</th>
                                            <th scope="col" style="width:200px;" class="sticky-top">Quantity</th>
                                            <th scope="col" style="width:200px;" class="sticky-top">Total MRP</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Cart> list10;
                                            list10 = OrederDAO.viewOrderData(e.getOrder_list_id());
                                            int n = 0;
                                            for (Cart e1 : list10) {
                                                n = n + 1;
                                                int pro_toal_mrp = e1.getCart_quantity() * e1.getDiscount_mrp();
                                                sub_total_mrp = sub_total_mrp + pro_toal_mrp;
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
                                <div class="itm-ttl text-right TPadding">
                                    Total : <span class="TColor">₹<%=sub_total_mrp%></span>
                                </div>
                            </div>
                            <%      total_delivery_charge = total_delivery_charge + delivery_charge;
                                    final_total_mrp = final_total_mrp + sub_total_mrp;
                                }
                            %>
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
                                            <span>₹<%=total_delivery_charge%></span>
                                        </div>
                                    </div>
                                    <div class="main-total-cart pl-0 pr-0 pb-0 border-bottom-0">
                                        <h2>All Total</h2>
                                        <span>₹<%=total_delivery_charge + final_total_mrp%></span>
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
                                <div class="bill-bottom">
                                    <div class="thnk-ordr">Thanks for Ordering</div>   
                                    <a class="print-btn hover-btn" href="javascript:window.print();">Print</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- include the footer link -->
        <jsp:include page="footer_link.jsp" />

    </body>
</html>
