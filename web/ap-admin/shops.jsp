<%-- 
    Document   : shops
    Created on : 19 Feb, 2021, 12:19:56 PM
    Author     : parth
--%>

<%@page import="DAO.ShopDAO"%>
<%@page import="POJO.Shop"%>
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

        <title>AP Mart - Shops</title>

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
                        <li class="breadcrumb-item active">Shops</li>
                    </ol>
                    <nav class="navbar navbar-light  justify-content-between">
                        <div class="mr-auto p-2">
                            <a href="add_shop_owner.jsp" class="add-btn hover-btn">Add New</a>
                        </div>
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="status-btn hover-btn my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </nav>

                    <div class="row justify-content-between">
                        <div class="col-lg-12 col-md-12">
                            <div class="card card-static-2 mt-30 mb-30">
                                <div class="card-title-2">
                                    <h4><b>All Shops</b></h4>
                                </div>
                                <div class="card-body-table px-3 pb-3">
                                    <div class="table-responsive ">
                                        <table class="table ucp-table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width:60px">ID</th>
                                                    <th>Shop Name</th>
                                                    <th>Shop Owner</th>
                                                    <th>Contact NO.</th>
                                                    <th >Locations</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                 <%  List<Shop> list = ShopDAO.viewData();
                                                        int n=0;
                                                        for (Shop e : list) {
                                                        n=n+1;   
                                                %>
                                                
                                                <tr>
                                                    <td><%=n%></td>
                                                    <td><%=e.getName()%></td>
                                                    <td><%=e.getShop_owner_name()%></td>
                                                    <td><%=e.getPhone()%></td>
                                                    <td><%=e.getLocation()%></td>
                                                    <td class="action-btns">
                                                        <a href="view_shop.jsp?id=<%=e.getShop_id()%>" class="view-shop-btn" title="View"><i class="fas fa-eye"></i></a>
                                                        <a href="shop_products.jsp?shop_id=<%=e.getShop_id()%>" class="list-btn" title="Shop Product"><i class="fas fa-list-alt"></i></a>
                                                        <a href="add_shop_owner.jsp?id=<%=e.getShop_owner_id()%>" class="edit-btn" title="Edit"><i class="fas fa-edit"></i></a>
                                                        <a href="../deleteImgServlet?id=<%=e.getShop_owner_id()%>&image=<%= e.getShop_owner_image()%>&shop_id=<%=e.getShop_id()%>&shop_image=<%= e.getImage()%>" class="delete-btn" title="Delete"><i class="fas fa-trash-alt"></i></a>
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
