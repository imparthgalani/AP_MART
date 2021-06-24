<%-- 
    Document   : contact_us
    Created on : 18 Feb, 2021, 11:06:52 AM
    Author     : parth
--%>

<%@page import="POJO.Shop"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Contact Us</title>

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
                                    <li class="breadcrumb-item active" aria-current="page">Contact Us</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="all-product-grid">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="panel-group accordion" id="accordion0">
                                <%
                                    int n = 0;
                                    List<Shop> list = ShopDAO.viewDataRandom();
                                    for (Shop e : list) {
                                        n = n + 1;
                                %>
                                <div class="panel panel-default">
                                    <div class="panel-heading" id="headingOne">
                                        <div class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-target="#<%=e.getName().split(" ")[0]%>" href="#" aria-expanded="false" aria-controls="collapseOne">
                                                <i class="uil uil-location-point chck_icon"></i><%=e.getName()%>
                                            </a>
                                        </div>
                                    </div>
                                    <div id="<%=e.getName().split(" ")[0]%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion0" style="">
                                        <div class="panel-body">
                                            <%=e.getAddress()%>
                                            <div class="color-pink">Tel: <%=" +91 " + e.getPhone()%></div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="contact-title">
                                <h2>Submit customer service request</h2>
                                <p>If you have a question about our service or have an issue to report, please send a request and we will get back to you as soon as possible.</p>
                            </div>
                            <div class="contact-form">
                                <form action="contact_usServlet" method="POST" enctype="multipart/form-data">
                                    <div class="alert alert-danger d-none" id="msg" role="alert" style="letter-spacing: 2.5px;"></div>
                                    <div class="form-group mt-1">
                                        <label class="control-label">Full Name*</label>
                                        <div class="ui search focus">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input  class="prompt srch_explore" type="text" name="full_name" id="FullName" placeholder="Your Full">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-1">
                                        <label class="control-label">Email Address*</label>
                                        <div class="ui search focus">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input  class="prompt srch_explore" type="email" name="email" id="Email"  placeholder="Your Email Address">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-1">
                                        <label class="control-label">Subject*</label>
                                        <div class="ui search focus">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input  class="prompt srch_explore" type="text" name="subject" id="Subject"  placeholder="Subject">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-1">
                                        <div class="field">
                                            <label class="control-label">Message*</label>
                                            <textarea  rows="2" class="form-control" id="Mess" name="message"  placeholder="Write Message"></textarea>
                                        </div>
                                    </div>
                                    <button id="CDetails" class="next-btn16 hover-btn mt-3" type="submit" data-btntext-sending="Sending...">Submit Request</button>
                                </form>
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
