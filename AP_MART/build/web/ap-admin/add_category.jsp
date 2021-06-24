<%-- 
    Document   : add_category
    Created on : 19 Feb, 2021, 12:20:32 PM
    Author     : parth
--%>

<%@page import="DAO.CategorieDAO"%>
<%@page import="POJO.Categorie"%>
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

        <title>AP MART - Add Category</title>

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
                        <li class="breadcrumb-item"><a href="category.jsp">Categories</a></li>
                        <li class="breadcrumb-item active">Add Category</li>
                    </ol>
                    <div class="row">
                        <div class="col-lg-10 col-md-10">
                            <div class="card card-static-2 mb-30">
                                <div class="card-title-2">
                                    <h4><b>Add New Category</b></h4>
                                </div>
                                <div class="card-body-table px-3">
                                    <%  String id = request.getParameter("id");
                                        int category_id = 0;
                                        if (id != null) {
                                            category_id = Integer.parseInt(id);
                                        }
                                        Categorie e = CategorieDAO.viewData(category_id);
                                    %>
                                    <form action="<%if (category_id == 0) {%><%="../categorieServlet"%><%} else {%><%="../editCategoryServlet"%><%}%>" method="POST" enctype="multipart/form-data">
                                        <div class="news-content-right pd-20">

                                            <input type="hidden" name="id" value="<%=e.getCategories_id()%>">
                                            <input type="hidden" name="file_name" value="<%=e.getImage()%>">

                                            <div class="form-group">
                                                <label class="form-label">Name*</label>
                                                <input type="text" id="FullName" name="name"  value="<%if (category_id != 0) {
                                                        out.println(e.getName());
                                                    }%>" class="form-control" placeholder="Category Name">
                                            </div>

                                            <div class="form-group">
                                                <label class="form-label">Category Image*</label>
                                                <div class="input-group">
                                                    <div class="file-upload-wrapper" data-text="<%if (category_id != 0) {
                                                            out.println(e.getImage());
                                                        } else {
                                                            out.println("Choose Image");
                                                        }%>">
                                                        <input id="addimg" name="image" type="file" class="file-upload-field" value="">
                                                    </div>
                                                </div>
                                                <div class="add-customer-img">
                                                    <img id="showimg" src="../images/category/<%if (category_id != 0) {
                                                            out.println(e.getImage());
                                                        } else {
                                                            out.println("icon-1.svg");
                                                        }%>" alt="">
                                                </div>
                                            </div>                                           
                                            <input type="hidden" name="type" value="Category">
                                            <div class="align-self-center mx-auto"> 
                                                <input type="submit" id="login" class="save-btn hover-btn " value="Add New Category">
                                            </div>
                                            <!-- <button type="submit" id="login" class="save-btn hover-btn" >Add New Category</button>-->
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

                    $(".error").remove();

                    //FullName validation
                    //FullName validation
                    if (FullName === "") {
                        $("#FullName").css("outline", "1px solid red");
                        $('#FullName').after('<span class="error">Please! Enter Full Name.</span>');
                        valid = false;
                    } else {
                        $("#FullName").css("outline", "1px solid green");
                    }

                    return valid;

                });

            });
        </script>

    </body>
</html>
