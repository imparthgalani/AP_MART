<%-- 
    Document   : view_product
    Created on : 19 Feb, 2021, 12:24:56 PM
    Author     : parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
     if (session.getAttribute("admin") == null) {
        response.sendRedirect("../sign_in.jsp"); 
    }
%>

<!DOCTYPE html>
<html>
    <head>
                             
        <!-- include the head Link -->
        <jsp:include page="head_link.jsp" />
        
        <title>AP Mart - View Shop</title>
        
    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Shops</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="shops.jsp">Shops</a></li>
                        <li class="breadcrumb-item active">View Shop</li>
                    </ol>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="card card-static-2 mb-30">
                                <div class="card-body-table">
                                    <div class="shopowner-content-left text-center pd-20">
                                        <div class="shop_img">
                                            <img src="../images/product/img-1.jpg" alt="">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-lg-3"></div>
                                            <div class="shopowner-dts col-md-6 col-lg-6" >
                                                <div class="shopowner-dt-list">
                                                    <span class="left-dt">Name*</span>
                                                    <span class="right-dt">KOBO</span>
                                                </div>
                                                <div class="shopowner-dt-list">
                                                    <span class="left-dt">Category*</span>
                                                    <span class="right-dt">KOBO</span>
                                                </div>
                                                <div class="shopowner-dt-list">
                                                    <span class="left-dt">Price*</span>
                                                    <span class="right-dt">$15</span>
                                                </div>
                                                <div class="shopowner-dt-list">
                                                    <span class="left-dt">Discount Price*</span>
                                                    <span class="right-dt">$15</span>
                                                </div>
                                                <div class="shopowner-dt-list">
                                                    <span class="left-dt">Status*</span>
                                                    <span class="right-dt">Available (in stock)</span>
                                                </div>
                                                <div class="col-md-3 col-lg-3"></div>
                                            </div>
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
