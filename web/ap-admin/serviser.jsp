<%-- 
    Document   : serviser
    Created on : 19 Feb, 2021, 12:21:48 PM
    Author     : parth
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="POJO.User"%>
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

        <title>AP Mart - Serviser</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Serviser</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active">Serviser</li>
                    </ol>
                    <nav class="navbar navbar-light bg-light justify-content-between">
                        <a href="add_serviser.jsp" class="add-btn hover-btn">Add New</a>
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="status-btn hover-btn my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </nav>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="card card-static-2 mb-30">
                                <div class="card-title-2">
                                    <h4><b>All Serviser</b></h4>
                                </div>
                                <div class="card-body-table px-3 pb-3">
                                    <div class="table-responsive">
                                        <table class="table ucp-table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width:60px">ID</th>
                                                    <th style="width:100px">Image</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  List<User> list = UserDAO.viewData("Servicer");
                                                    int n=0;
                                                    for (User e : list) {
                                                        n=n+1;
                                                %>
                                                <tr>
                                                    <td class="align-middle"><%=n%></td>
                                                    <td>
                                                        <div class="cate-img-6">
                                                            <img src="../images/user/<%if(e.getImage() != null){out.println(e.getImage());}else{out.println("default.jpg");}%>" alt="">
                                                        </div>
                                                    </td>
                                                    <td class="align-middle"><%= e.getFull_name() %></td>
                                                    <td class="align-middle"><%=e.getEmail()%></td>
                                                    <td class="align-middle">+91 <%= e.getPhone() %></td>
                                                    <td class="action-btns" style="padding-top: 2.5em;">
                                                        <a href="view_user.jsp?id=<%= e.getUser_id()%>" class="view-shop-btn" title="View"><i class="fas fa-eye"></i></a>
                                                        <a href="add_serviser.jsp?id=<%= e.getUser_id()%>" class="edit-btn" title="Edit"><i class="fas fa-edit"></i></a>
                                                        <a href="../deleteImgServlet?id=<%= e.getUser_id()%>&type=Servicer&image=<%= e.getImage()%>" class="delete-btn" title="Delete"><i class="fas fa-trash-alt"></i></a>
                                                    </td>
                                                </tr>
                                                <%  }
                                                %>
                                                
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
