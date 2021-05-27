<%-- 
    Document   : checkout
    Created on : 18 Feb, 2021, 11:06:42 AM
    Author     : parth
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="POJO.User"%>
<%@page import="DAO.DeliveryAddressDAO"%>
<%@page import="POJO.DeliveryAddress"%>
<%@page import="POJO.DeliveryAddress"%>
<%@page import="java.util.List"%>
<%
    int user_id = 0;
    User e1 = null;
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("sign_in.jsp");
    } else {
        user_id = Integer.parseInt(session.getAttribute("customer").toString());
        e1 = UserDAO.viewData(user_id);
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP Mart - Checkout</title>
        <style>
            .collapse2{
                overflow-y:scroll;
                max-height:273px;
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
                                    <li class="breadcrumb-item"><a href="./">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="all-product-grid">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 mb-4">
                            <form action="deliveryDetailServlet" method="POST">
                                <div id="checkout_wizard" class="checkout accordion left-chck145">

                                    <div class="checkout-step">
                                        <div class="checkout-card" id="headingOne">
                                            <span class="checkout-step-number">1</span>
                                            <h4 class="checkout-step-title">
                                                <button class="wizard-btn collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">Customer Details</button>
                                            </h4>
                                        </div>
                                        <input type="hidden" name="user_id" value="<%=user_id%>">
                                        <div id="collapseOne" class="collapse" aria-labelledby="headingTwo" data-parent="#checkout_wizard">
                                            <div class="checkout-step-body M-Select">
                                                <div class="checout-address-step">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="address-fieldset">
                                                                <div class="row">
                                                                    <div class="col-lg-6 col-md-12">
                                                                        <div class="form-group">
                                                                            <label class="control-label">Name*</label>
                                                                            <input id="FullName" name="custmore_name" type="text" placeholder="Name" class="form-control input-md" value="<%=e1.getFull_name()%>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 col-md-12">
                                                                        <div class="form-group">
                                                                            <label class="control-label">Email Address*</label>
                                                                            <input id="Email" name="email" type="text" placeholder="Email Address" class="form-control input-md" value="<%=e1.getEmail()%>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 col-md-12">
                                                                        <div class="form-group">
                                                                            <label class="control-label">Phone Number*</label>
                                                                            <input id="Phone" name="phone" type="number" placeholder="Phone Number" class="form-control input-md" value="<%=e1.getPhone()%>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 col-md-12">
                                                                        <div class="form-group">
                                                                            <label class="control-label">Alternate Phone Number*</label>
                                                                            <input id="APhone" name="alt_phone" type="number" placeholder="Phone Number" class="form-control input-md">
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-12 col-md-12">
                                                                        <div class="form-group">
                                                                            <div class="address-btns">
                                                                                <a id="CDetails" class="collapsed next-btn16 hover-btn " role="button" data-toggle="collapse" data-parent="#checkout_wizard" href="#collapseTwo"> Next </a>
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
                                    <div class="checkout-step">
                                        <div class="checkout-card" id="headingTwo">
                                            <span class="checkout-step-number">2</span>
                                            <h4 class="checkout-step-title">
                                                <button class="wizard-btn collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"> Delivery Address</button>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#checkout_wizard">
                                            <div class="checkout-step-body M-Select">
                                                <div class="checout-address-step">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="address-fieldset ">
                                                                <div class="row ">
                                                                    <div class="collapse multi-collapse2  show ml-3" id="multiCollapseExample3" style="width:100%">
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <div class="form-group">
                                                                                <label class="control-label"><b>Select Address*</b></label>
                                                                                <div class="time-radio">
                                                                                    <div class="ui form">
                                                                                        <input type="hidden" name="delivery_address_id" value="">
                                                                                        <div class="grouped fields ">
                                                                                            <div class="collapse2 insert12" style="width:100%;">
                                                                                                <%
                                                                                                    int n = 0;
                                                                                                    List<DeliveryAddress> list15 = DeliveryAddressDAO.viewData(user_id);
                                                                                                    for (DeliveryAddress e : list15) {
                                                                                                        n=n+1;
                                                                                                       
                                                                                                %>
                                                                                                <div class="field remove12">
                                                                                                    <div class="ui radio checkbox chck-rdio" onclick="getAddresId(this)">
                                                                                                        <input type="radio"  name="fruit" value="<%=e.getDelivery_address_id()%>" class="hidden">
                                                                                                        <div class="address-item">
                                                                                                            <div class="address-icon1">
                                                                                                                <i class="uil uil-home-alt"></i>
                                                                                                            </div>
                                                                                                            <div class="address-dt-all">
                                                                                                                <h4><%=e.getTitle()%></h4>
                                                                                                                <p>#<%=e.getFlat()%>,  <%=e.getStreet()%>,  <%=e.getLocality()%> - <%=e.getPincode()%>.</p>
                                                                                                                <ul class="action-btns">
                                                                                                                    <li><a  href="" onclick="editAddress(this,<%=e.getDelivery_address_id()%>)" data-toggle="collapse" data-target=".multi-collapse2" class="action-btn"><i class="uil uil-edit"></i></a></li>
                                                                                                                    <li><a onclick ="changeAddress(this,<%=e.getDelivery_address_id()%>)"  class="action-btn"><i class="uil uil-trash-alt"></i></a></li>
                                                                                                                </ul>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <%}%>

                                                                                            </div>

                                                                                        </div>
                                                                                        <div class="col-lg-12 col-md-12">
                                                                                            <div class="form-group">
                                                                                                <div class="address-btns">
                                                                                                    <div>
                                                                                                        <a class="collapsed next-btn16 hover-btn " role="button" data-toggle="collapse" data-parent="#checkout_wizard" href="#collapseThree"> Next </a>
                                                                                                    </div>
                                                                                                    <div class="ml-1">
                                                                                                        <a class="collapsed next-btn16 hover-btn" onclick="addAddress()" role="button" data-toggle="collapse" data-target=".multi-collapse2" href=""> Add New Address </a>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="collapse multi-collapse2 row ml-1 address-item" id="multiCollapseExample4">
                                                                        <input type="hidden" name="delivery_address_id" value="0">
                                                                        <input type="hidden" name="user_id" value="<%=user_id%>">
                                                                        <input type="hidden" name="action" value="insert">
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <div class="form-group">
                                                                                <label class="control-label">Title.*</label>
                                                                                <select id="Title" name="title" class="form-control">
                                                                                    <option value="" selected>--Please Select Title--</option>
                                                                                    <option value="Home">Home</option>
                                                                                    <option value="Office">Office</option>
                                                                                    <option value="Other">Other</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <div class="form-group">
                                                                                <label class="control-label">Flat / House No.*</label>
                                                                                <input id="Flat" name="flat" type="text" placeholder="Please Enter Flat / House No" class="form-control input-md" required="">
                                                                            </div>
                                                                        </div>	
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <div class="form-group">
                                                                                <label class="control-label">Street / Society*</label>
                                                                                <input id="Street" name="street" type="text" placeholder="Please Enter Street / Society" class="form-control input-md">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-12">
                                                                            <div class="form-group">
                                                                                <label class="control-label">Pincode*</label>
                                                                                <input id="Pincode" name="pincode" type="text" placeholder="Please Enter Pincode" class="form-control input-md" required="">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-12">
                                                                            <div class="form-group">
                                                                                <label class="control-label">Locality*</label>
                                                                                <input id="Locality" name="locality" type="text" placeholder="Please Enter City" class="form-control input-md" required="">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <a href="" id="DAdd" class="collapsed next-btn16 hover-btn" data-toggle="collapse" data-target=".multi-collapse2" onclick =""  >Add New Address</a>
                                                                            <a class="collapsed next-btn16 hover-btn" role="button" data-toggle="collapse" data-target=".multi-collapse2" href=""> Back </a>

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
                                    <div class="checkout-step">
                                        <div class="checkout-card" id="headingThree">
                                            <span class="checkout-step-number">3</span>
                                            <h4 class="checkout-step-title">
                                                <button class="wizard-btn collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"> Delivery Day & Charge </button>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#checkout_wizard">
                                            <div class="checkout-step-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group M-Select">
                                                            <label class="control-label">Select Day*</label>

                                                            <div class="time-radio">
                                                                <div class="ui form">
                                                                    <input type="hidden" name="delivery_time" value="">
                                                                    <div class="grouped fields">
                                                                        <div class="field">
                                                                            <div class="ui radio checkbox chck-rdio" onclick="deliveryTimeCharge(this)">
                                                                                <input type="radio" name="fruit" checked="" value="1" class="hidden">
                                                                                <label>1 Hour - <b>RS 50</b></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="field">
                                                                            <div class="ui radio checkbox chck-rdio" onclick="deliveryTimeCharge(this)">
                                                                                <input type="radio" name="fruit" value="2" class="hidden">
                                                                                <label>2 Hour - <b>RS 30</b></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="field">
                                                                            <div class="ui radio checkbox chck-rdio" onclick="deliveryTimeCharge(this)">
                                                                                <input type="radio" name="fruit" value="5" class="hidden">
                                                                                <label>3-5 Hour <b>RS 10</b></label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a class="collapsed next-btn16 hover-btn M-Select" role="button" data-toggle="collapse" href="#collapseFour"> Proccess to payment </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="checkout-step">
                                        <div class="checkout-card" id="headingFour">
                                            <span class="checkout-step-number">4</span>
                                            <h4 class="checkout-step-title">
                                                <button class="wizard-btn collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">Payment</button>
                                            </h4>
                                        </div>
                                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#checkout_wizard">
                                            <div class="checkout-step-body">
                                                <div class="payment_method-checkout">
                                                    <div class="row">
                                                        <div class="col-md-12 M-Select">
                                                            <div class="rpt100">
                                                                <ul class="radio--group-inline-container_1">
                                                                    <li>
                                                                        <div class="radio-item_1">
                                                                            <input id="cashondelivery1" value="Cash on Delivery" name="paymentmethod" type="radio" data-minimum="50.0">
                                                                            <label for="cashondelivery1" class="radio-label_1">Cash on Delivery</label>
                                                                        </div>
                                                                    </li>
                                                                    <li style="pointer-events:none;">
                                                                        <div class="radio-item_1">
                                                                            <input id="card1" value="card" name="paymentmethod" type="radio" data-minimum="50.0">
                                                                            <label for="card1" class="radio-label_1">Credit / Debit Card</label>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="form-group return-departure-dts" data-method="cashondelivery">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="pymnt_title">
                                                                            <h4>Cash on Delivery</h4>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group return-departure-dts" data-method="card">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="pymnt_title mb-4">
                                                                            <h4>Credit / Debit Card</h4>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-5">
                                                                        <div class="form-group mt-1">
                                                                            <label class="control-label">Holder Name*</label>
                                                                            <div class="ui search focus">
                                                                                <div class="ui left icon input swdh11 swdh19">
                                                                                    <input class="prompt srch_explore" type="text" name="holdername" value="" id="holder[name]" required="" maxlength="64" placeholder="Holder Name">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-5">
                                                                        <div class="form-group mt-1">
                                                                            <label class="control-label">Card Number*</label>
                                                                            <div class="ui search focus">
                                                                                <div class="ui left icon input swdh11 swdh19">
                                                                                    <input class="prompt srch_explore" type="text" name="cardnumber" value="" id="card[number]" required="" maxlength="64" placeholder="Card Number">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3">
                                                                        <div class="form-group mt-1">
                                                                            <label class="control-label">Expiration Month*</label>
                                                                            <select class="ui fluid search dropdown form-dropdown" name="card[expire-month]">
                                                                                <option value="">Month</option>
                                                                                <option value="1">January</option>
                                                                                <option value="2">February</option>
                                                                                <option value="3">March</option>
                                                                                <option value="4">April</option>
                                                                                <option value="5">May</option>
                                                                                <option value="6">June</option>
                                                                                <option value="7">July</option>
                                                                                <option value="8">August</option>
                                                                                <option value="9">September</option>
                                                                                <option value="10">October</option>
                                                                                <option value="11">November</option>
                                                                                <option value="12">December</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3">
                                                                        <div class="form-group mt-1">
                                                                            <label class="control-label">Expiration Year*</label>
                                                                            <div class="ui search focus">
                                                                                <div class="ui left icon input swdh11 swdh19">
                                                                                    <input class="prompt srch_explore" type="text" name="card[expire-year]" maxlength="4" placeholder="Year">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3">
                                                                        <div class="form-group mt-1">
                                                                            <label class="control-label">CVV*</label>
                                                                            <div class="ui search focus">
                                                                                <div class="ui left icon input swdh11 swdh19">
                                                                                    <input class="prompt srch_explore" name="card[cvc]" maxlength="3" placeholder="CVV">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <input type="submit" value="Place Order" onclick="this.form.submit()" class="next-btn16 hover-btn">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

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
