<%-- 
    Document   : contact_us
    Created on : 20 Feb, 2021, 3:14:50 PM
    Author     : parth
--%>

<%@page import="DAO.Contact_usDAO"%>
<%@page import="POJO.Contact_us"%>
<%@page import="java.util.List"%>
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

        <title>AP Mart - Contact Us</title>

    </head>
   <body class="sb-nav-fixed">
       
        <!-- include the header File -->
        <jsp:include page="header.jsp" /> 

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Contact Us</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="./">Dashboard</a></li>
                        <li class="breadcrumb-item active">Contact Us</li>
                    </ol>
                    <nav class="navbar navbar-light justify-content-end">
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
                            <button class="status-btn hover-btn my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </nav>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="card card-static-2 mb-30">
                                <div class="card-title-2">
                                    <h4><b>All Contact Us</b></h4>
                                </div>
                                <div class="card-body-table px-3 pb-3">
                                    <div class="table-responsive">
                                        <table class="table ucp-table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 60px;">ID</th>
                                                    <th style="width: 200px;">Full Name</th>
                                                    <th style="width: 200px;">Email Address</th>
                                                    <th style="width: 260px;">Subject</th>
                                                    <th style="width: 400px;">Message</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  List<Contact_us> list = Contact_usDAO.viewData();
                                                        int n=0;
                                                        for (Contact_us e : list) {
                                                        n=n+1;   
                                                %>
                                                <tr>
                                                    <td><%=n%></td>
                                                    <td><%=e.getFull_name()%></td>
                                                    <td><%=e.getEmail()%></td>
                                                    <td><%=e.getSubject()%></td>
                                                    <td><%=e.getMessage()%></td>
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
            <!-- include the header File -->
            <jsp:include page="footer.jsp" />
        </div>

        <!-- include the footer Link -->
        <jsp:include page="footer_link.jsp" />

    </body>
</html>
