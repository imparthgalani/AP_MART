<%-- 
    Document   : category
    Created on : 19 Feb, 2021, 12:20:23 PM
    Author     : parth
--%>

<%@page import="DAO.CategorieDAO"%>
<%@page import="POJO.Categorie"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
     if (session.getAttribute("Servicer") == null) {
        response.sendRedirect("../sign_in.jsp"); 
    }
%>

<!DOCTYPE html>
<html>
    <head>

        <!-- include the head Link -->
        <jsp:include page="head_link.jsp" />

        <title>AP Mart - Categories</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Categories</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active">Categories</li>
                    </ol>
                    <nav class="navbar navbar-light bg-light justify-content-between">
                        <a href="add_category.jsp" class=""></a>
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="status-btn hover-btn my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </nav>
                    <div class="row justify-content-between">

                        <div class="col-lg-12 col-md-12">
                            <div class="card card-static-2 mt-30 mb-30">
                                <div class="card-title-2">
                                    <h4><b>All Categories</b></h4>
                                </div>
                                <div class="card-body-table px-3 pb-3">
                                    <div class="table-responsive">
                                        <table class="table ucp-table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width:60px">ID</th>
                                                    <th >Image</th>
                                                    <th>Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <%  List<Categorie> list = CategorieDAO.viewData();
                                                        int n=0;
                                                        for (Categorie e : list) {
                                                        n=n+1;   
                                                %>
                                                <tr>
                                                    <td class="align-middle"><%=n%></td>
                                                    <td>
                                                        <div class="cate-img">
                                                            <img src="../images/category/<%= e.getImage()%>" alt="">
                                                        </div>
                                                    </td>
                                                    <td class="align-middle"><%=e.getName()%></td>

                                                    <td class="action-btns" style="padding-top: 1.8em;">
                                                        <a href="add_category.jsp?id=<%= e.getCategories_id()%>" class="edit-btn"><i class="fas fa-edit"></i></a>
                                                        <a href="../deleteImgServlet?id=<%= e.getCategories_id()%>&image=<%= e.getImage()%>&source=category" class="edit-btn"><i class="fas fa-trash-alt"></i></a>
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
            
        <!-- include the footer Link -->
        <jsp:include page="footer_link.jsp" />

    </body>
</html>
