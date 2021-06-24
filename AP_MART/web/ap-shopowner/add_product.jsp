<%-- 
    Document   : add_product
    Created on : 19 Feb, 2021, 12:21:07 PM
    Author     : parth
--%>

<%@page import="POJO.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DAO.CategorieDAO"%>
<%@page import="POJO.Categorie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

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

        <title>AP MART - Add Product</title>

    </head>
    <body class="sb-nav-fixed">

        <!-- include the header File -->
        <jsp:include page="header.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h2 class="mt-30 page-title">Products</h2>
                    <ol class="breadcrumb mb-30">
                        <li class="breadcrumb-item"><a href="./">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="products.jsp">Products</a></li>
                        <li class="breadcrumb-item active">Add Product</li>
                    </ol>
                    <div class="row">
                        <div class="col-lg-10 col-md-10">
                            <div class="card card-static-2 mb-30">
                                <div class="card-title-2">
                                    <h4><b>Add New Product</b></h4>
                                </div>
                                <div class="card-body-table px-3">
                                    <%  String id = request.getParameter("id");
                                        int product_id = 0;
                                        if (id != null) {
                                            product_id = Integer.parseInt(id);
                                        }
                                        Product e1 = ProductDAO.viewData(product_id);
                                    %>
                                    <form action="<%if (product_id == 0) {%><%="../productServlet"%><%} else {%><%="../editProductServlet"%><%}%>" method="POST"  enctype="multipart/form-data">
                                        <div class="news-content-right pd-20">

                                            <input type="hidden" name="id" value="<%=e1.getProduct_id()%>">
                                            <input type="hidden" name="file_name" value="<%=e1.getImage()%>">
                                            <input type="hidden" name="user" value="shop_owner">

                                            <div class="form-group">
                                                <label class="form-label">Name*</label>
                                                <input type="text" name="name" id="FullName" value="<%if (product_id != 0) {
                                                        out.println(e1.getName());
                                                    }%>" class="form-control" placeholder="Product Name">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Category*</label>
                                                <select id="Categtory" name="category_id"  class="form-control">
                                                    <option value="" <%if (product_id == 0) {
                                                            out.println("selected");
                                                        }%>>--Select Category--</option>

                                                    <%  List<Categorie> list = CategorieDAO.viewData();

                                                        for (Categorie e2 : list) {
                                                    %>
                                                    <option value="<%=e2.getCategories_id()%>"<%if (e1.getCategory_id() == e2.getCategories_id()) {
                                                            out.println("selected");
                                                        }%> ><%= e2.getName()%></option>
                                                    <%}%>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label class="form-label">Description*</label>
                                                <div class="card card-editor">
                                                    <div class="content-editor">
                                                        <textarea class="text-control" id="Description" name="description"  placeholder="Type Short Description . . ."><%if (product_id != 0) {
                                                                out.println(e1.getDescription());
                                                            }%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                           <div class="form-group">
                                                <label class="form-label">Product Image*</label>
                                                <div class="input-group">
                                                    <div class="file-upload-wrapper" data-text="<%if (product_id != 0) {
                                                            out.println(e1.getImage());
                                                        } else {
                                                            out.println("Choose Image");
                                                        }%>">
                                                        <input id="addimg" name="image" type="file" class="file-upload-field" value="">
                                                    </div>
                                                </div>
                                                <div class="add-customer-img">
                                                    <img id="showimg" src="../images/product/<%if (product_id != 0) {
                                                            out.println(e1.getImage());
                                                        } else {
                                                            out.println("img-11.jpg");
                                                        }%>" alt="">
                                                </div>
                                            </div>

                                            <button type="submit" id="login" class="save-btn hover-btn" >Add New Product</button>
                                        </div>
                                    </form>
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

        <script>
            $(document).ready(function () {

                $('#login').click(function () {

                    var valid = true;

                    var FullName = $('#FullName').val();
                    var Categtory = $('#Categtory').val();
                    var Description = $('#Description').val();

                    $(".error").remove();

                    //FullName validation
                    if (FullName === "") {
                        $("#FullName").css("outline", "1px solid red");
                        $('#FullName').after('<span class="error">Please! Enter Full Name.</span>');
                        valid = false;
                    } else {
                        $("#FullName").css("outline", "1px solid green");
                    }
                    //Categtory validation
                    if (Categtory === "") {
                        $("#Categtory").css("outline", "1px solid red");
                        $('#Categtory').after('<span class="error">Please! Select Categtory.</span>');
                        valid = false;
                    } else {
                        $("#Categtory").css("outline", "1px solid green");
                    }

                    //Description validation
                    if (Description === "") {
                        $("#Description").css("outline", "1px solid red");
                        $('#Description').after('<span class="error">Please! Enter Description.</span>');
                        valid = false;
                    } else {
                        $("#Description").css("outline", "1px solid green");
                    }

                    return valid;

                });

            });
        </script>

    </body>
</html>
