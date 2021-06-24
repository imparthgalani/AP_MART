<%-- 
    Document   : view_serviser
    Created on : 19 Feb, 2021, 12:25:08 PM
    Author     : parth
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="POJO.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
     if (session.getAttribute("shop_owner") == null) {
        response.sendRedirect("../sign_in.jsp"); 
    }
%>

<!DOCTYPE html>
<html>
    <head>

        <!-- include the head Link -->
        <jsp:include page="head_link.jsp" />

        <title>AP Mart - View Serviser</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <%  String id = request.getParameter("id");
                        int user_id = Integer.parseInt(id);
                        User e = UserDAO.viewData(user_id);%>
                    <h2 class="mt-30 page-title"><%=e.getType()%></h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="./">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="serviser.jsp"><%=e.getType()%></a></li>
                        <li class="breadcrumb-item active">View <%=e.getType()%></li>
                    </ol>
                    <div class="row">
                        <div class="col-lg-10 col-md-10">
                            <div class="card card-static-2 mb-30">
                                <div class="card-body-table">
                                    <div class="shopowner-content-left text-center pd-20">


                                        <div class="customer_img">
                                            <img src="../images/user//<%if(e.getImage()!=null){%><%=e.getImage()%><%}else{%><%="default.jpg"%><%}%>" alt="">
                                        </div>
                                        <div class="shopowner-dt-left mt-4">
                                            <h4><%=e.getFull_name()%></h4>
                                            <span><%=e.getType()%></span>
                                        </div>

                                        <div class="shopowner-dts">
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Full Name</span>
                                                <span class="right-dt"><%=e.getFull_name()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Email</span>
                                                <span class="right-dt"><%=e.getEmail()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Phone</span>
                                                <span class="right-dt">+91 <%=e.getPhone()%></span>
                                            </div>
                                            <div class="shopowner-dt-list">
                                                <span class="left-dt">Address</span>
                                                <span class="right-dt"><%=e.getAddress()%></span>
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
