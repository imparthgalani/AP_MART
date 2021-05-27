<%-- 
    Document   : bill
    Created on : 18 Feb, 2021, 11:06:32 AM
    Author     : parth
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="POJO.User"%>
<%@page import="POJO.Order"%>
<%@page import="DAO.OrederDAO"%>
<%@page import="POJO.Cart"%>
<%@page import="java.util.List"%>
<%@page import="email.EmailUtility"%>
<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("sign_in.jsp");
    }

    String order_id1 = request.getParameter("order_id");
    int order_id = Integer.parseInt(order_id1);


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Bill Invoice</title>
        <style>
            #collapse1{
                overflow-y:scroll;
                max-height:255px;
            }
            thead th {
                background: #f5bdab;
                color : #000;
                font-weight: bold;
                letter-spacing: 1.2px;
                border-top: 0px solid #dee2e6 !important;
            }
            .TPadding{
                padding-top: 1em;
                padding-right: 1em;                
            }
            .TColor{
                color: #f55d2c;
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

                            <%                                Order obj = OrederDAO.getOrderDetil(order_id);
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

                            %>
                            <div class="bill-dt-step">
                                <div class="bill-title">
                                    <h4><%=e.getShop_name()%></h4>
                                </div>

                                <table id="collapse1" class="table text-right table-striped table-hover table-responsive">
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
                                    <a class="print-btn hover-btn"  href="dashboard_my_orders.jsp">Tracking Order</a>
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
<%
    String full_name = "";
    int user_id = Integer.parseInt(session.getAttribute("customer").toString());

    User user1;
    user1 = UserDAO.viewData(user_id);

    full_name = user1.getFull_name();

    int final_total_mrp1 = 0;

    String content = "<!DOCTYPE html>\n"
            + "<html lang=\"en\">\n"
            + "	<head>\n"
            + "		<meta charset=\"UTF-8\">\n"
            + "		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
            + "		<title>Bill</title>\n"
            + "		<style>\n"
            + "			body{\n"
            + "				margin: 3em 1em;\n"
            + "			}\n"
            + "			.logo {\n"
            + "				text-align: center;\n"
            + "				font-size: 12px;\n"
            + "				background-color: #007bff;\n"
            + "				padding: 0.2em;\n"
            + "				border-radius: 6px;\n"
            + "				margin: 0em 20em;				\n"
            + "				color: #FFF;\n"
            + "				border-bottom: 1px solid #FFF;\n"
            + "			}\n"
            + "			.header {\n"
            + "				padding: 0 1.3em;\n"
            + "				padding-bottom: 1.2em;\n"
            + "				background-color: #007bff;\n"
            + "				border-radius: 6px;\n"
            + "				color: #FFF;\n"
            + "				margin-bottom: 5px;\n"
            + "			}\n"
            + "			.text-right {\n"
            + "				text-align: right;\n"
            + "				float: right;\n"
            + "				padding-top: 25px;\n"
            + "				}\n"
            + "\n"
            + "			.text-right1 {\n"
            + "				text-align: center;\n"
            + "				background-color: #f8f9fa;\n"
            + "				margin-top: 16px;\n"
            + "				float: right;\n"
            + "				border-radius: 6px;\n"
            + "				padding: 0.5em;\n"
            + "				color: #000;\n"
            + "			}\n"
            + "			table {\n"
            + "				border-collapse: collapse;\n"
            + "				border-spacing: 0;\n"
            + "				width: 100%;\n"
            + "				border: 1px solid #ddd;\n"
            + "				border-radius: 6px;\n"
            + "			}\n"
            + "			.bill-table>th {\n"
            + "				background-color: #212529;\n"
            + "				color: white;\n"
            + "				padding: 18px;\n"
            + "			}\n"
            + "\n"
            + "			th, td {\n"
            + "				text-align: left;\n"
            + "				padding: 14px;\n"
            + "			}\n"
            + "			.id {\n"
            + "				padding-left: 1.3em;\n"
            + "				font-size: 25px;\n"
            + "				background-color: #e9ecef;\n"
            + "			}\n"
            + "			.footer {\n"
            + "				padding: 0 1.3em;\n"
            + "				background-color: #007bff;\n"
            + "				border-radius: 6px;\n"
            + "				color: #FFF;\n"
            + "				margin-top: 5px;\n"
            + "			}\n"
            + "			tr{\n"
            + "				border-top: 0.1px solid #000;\n"
            + "				background-color: #f8f9fa;\n"
            + "			}\n"
            + "			.text-buttom {\n"
            + "				margin-bottom: -0.2px;\n"
            + "			}\n"
            + "			.total {\n"
            + "				background-color: #e9ecef;\n"
            + "			}\n"
            + "			.T-bill {\n"
            + "				margin-right: 8px;\n"
            + "			}\n"
            + "			.TOrder{\n"
            + "				padding-top: 15px;\n"
            + "				vertical-align: center;\n"
            + "				padding-bottom: 1.2em;\n"
            + "			}\n"
            + "			@media only screen and (max-width:1500px) {\n"
            + "				.logo {\n"
            + "					text-align: center;\n"
            + "					background-color: #007bff;\n"
            + "					padding: 0.1em;\n"
            + "					border-radius: 6px;\n"
            + "					margin: 0em 6em;\n"
            + "                                       font-size:13px;\n"
            + "					color: #FFF;\n"
            + "					border-bottom: 1px solid #FFF;\n"
            + "				}\n"
            + "				.text-right {\n"
            + "					text-align: left;\n"
            + "					margin-top: 20px;\n"
            + "				}\n"
            + "				.text-right1 {\n"
            + "					text-align: center;\n"
            + "					margin-top: 1px;\n"
            + "					background-color: #f8f9fa;\n"
            + "					margin-left: 0em;\n"
            + "					border-radius: 6px;\n"
            + "					padding: 1em;\n"
            + "					padding-right: 0em;\n"
            + "					color: #000;\n"
            + "				}\n"
            + "				\n"
            + "				.TOrder{\n"
            + "				font-size: 10px;\n"
            + "					text-align: center;\n"
            + "					margin-bottom: 15px;\n"
            + "				}\n"
            + "			}\n"
            + "		</style>\n"
            + "	</head>\n"
            + "	<body>\n"
            + "		<div class=\"logo\">\n"
            + "			<h1>AP MART</h1>\n"
            + "		</div>\n"
            + "		<div class=\"header\">\n"
            + "			<div>\n"
            + "				<div style=\"display: inline-block;\">\n"
            + "					<h1 >INVOICE</h1>\n"
            + "					<div >Order Time of Invoice: " + obj.getOrder_plc_time() + "</div>	\n"
            + "				</div>	\n"
            + "								\n"
            + "				<h2 style=\"display: inline;\" class=\"text-right\">" + full_name + "</h2>\n"
            + "			</div>\n"
            + "			\n"
            + "				\n"
            + "			\n"
            + "		</div>\n"
            + "		\n"
            + "		<div style=\"overflow-x:auto; border-radius: 6px; margin: 0em 1.2em;\">\n"
            + "			<table>\n"
            + "				<tr class=\"bill-table\">\n"
            + "					<th>Order Id</th>\n"
            + "					<th>Shop Name</th>\n"
            + "					<th>Total Iteams</th>\n"
            + "					<th>Delivery Charges</th>\n"
            + "					<th>Sub Total</th>\n"
            + "					<th>Total Prize</th>\n"
            + "				</tr>\n";

    for (Order e : list9) {
        int sub_total_mrp = 0;
        List<Cart> list10;
        list10 = OrederDAO.viewOrderData(e.getOrder_list_id());
        int n = 0;
        for (Cart e1 : list10) {
            n = n + 1;
            int pro_toal_mrp = e1.getCart_quantity() * e1.getDiscount_mrp();
            sub_total_mrp = sub_total_mrp + pro_toal_mrp;

        }

        content = content + "<tr>\n"
                + "					<td class=\"id\">" + e.getOrder_list_id() + "</td>\n"
                + "					<td>" + e.getShop_name() + "</td>\n"
                + "					<td>" + n + "</td>\n"
                + "					<td>" + delivery_charge + "</td>\n"
                + "					<td>" + sub_total_mrp + "</td>\n"
                + "					<th class=\"total\">" + (sub_total_mrp + delivery_charge) + "</th>\n"
                + "				</tr>\n";

        final_total_mrp1 = final_total_mrp1 + sub_total_mrp + delivery_charge;
    }
    content = content + "</table>\n"
            + "		</div>\n"
            + "		<div class=\"footer\">\n"
            + "			<div class=\"TOrder\">\n"
            + "				<h1 style=\"display: inline-block;\">Thank You For Your Order !</h1>\n"
            + "				<h2 style=\"display: inline-block;\" class=\"text-right1\"><span class=\"T-bill\">Total Bill </span> &#8377;" + final_total_mrp1 + "</h2>\n"
            + "			</div>\n"
            + "		</div>\n"
            + "	</body>\n"
            + "</html>";

//    ServletContext context = pageContext.getServletContext();
//    String host = context.getInitParameter("host");
//    String port = context.getInitParameter("port");
//    String user = context.getInitParameter("user");
//    String pass = context.getInitParameter("pass");
//    String email = "parthgalani250@gmail.com";
    
    String host = "smtp.gmail.com";
    String port = "587";
    String user = "pgalani193@rku.ac.in";
    String pass = "stoatajahvolkazw";
    String email = "parthgalani250@gmail.com"; //Sender Email ID

    String recipient = email;
    String subject = "Order Placed";

    EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);

%>  