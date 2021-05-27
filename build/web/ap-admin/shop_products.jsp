<%-- 
    Document   : shop_products
    Created on : 19 Feb, 2021, 12:23:45 PM
    Author     : parth
--%>

<%@page import="POJO.Categorie"%>
<%@page import="DAO.CategorieDAO"%>
<%@page import="DAO.ShopProductDAO"%>
<%@page import="POJO.ShopProduct"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="POJO.Product"%>
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

        <title>AP Mart - Shop Products</title>

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
                        <li class="breadcrumb-item active">Shop Products</li>
                    </ol>
                    <div class="row">
                        <div class="col-lg-5 col-md-6">
                            <div class="card card-static-2 mb-30">
                                <div class="card-title-2">
                                    <h4><b>Add New Product</b></h4>
                                </div>
                                <form action="../shopProductServlet" method="POST" enctype="multipart/form-data">
                                    <div class="card-body-table px-3">
                                        <div class="news-content-right pd-20">

                                            <% String shop_id1 = request.getParameter("shop_id");
                                                int shop_id = Integer.parseInt(shop_id1);

                                                String shop_product_id1 = request.getParameter("shop_product_id");
                                                int shop_product_id = 0;
                                                if (shop_product_id1 != null) {
                                                    shop_product_id = Integer.parseInt(shop_product_id1);
                                                }
                                                ShopProduct e1 = ShopProductDAO.viewShopProductData(shop_product_id);
                                                Product e2 = ProductDAO.viewData(e1.getProduct_id());

                                            %>


                                            <input type="hidden" name="shop_id" value="<%=shop_id%>">
                                            <input type="hidden" name="shop_product_id" value="<%=shop_product_id%>">

                                            <div class="form-group">
                                                <label class="form-label">Category*</label>
                                                <select id="categeory" class="form-control">
                                                        <option <%if (shop_product_id == 0) {
                                                            out.println("selected");
                                                        }%> value="0">-- Please Select Category --</option>

                                                    <%  List<Categorie> list = CategorieDAO.viewData();
                                                        for (Categorie e : list) {
                                                    %>
                                                    <option value="<%=e.getCategories_id()%>" <%if (e.getCategories_id() == e2.getCategory_id()) {
                                                            out.println("selected");
                                                        }%> ><%= e.getName()%></option>
                                                    <%}%>

                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label class="form-label">Product*</label>
                                                <select id="products" name="product_id" class="form-control"> </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">MRP*</label>
                                                <input type="text" name="mrp" value="<%if (shop_product_id != 0) {
                                                        out.println(e1.getMrp());
                                                    }%>" class="form-control" placeholder="Enter MRP">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Discount MRP*</label>
                                                <input type="text" class="form-control"  name="discount_mrp" value="<%if (shop_product_id != 0) {
                                                        out.println(e1.getDiscount_mrp());
                                                    }%>" placeholder="Enter Discount MRP">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Net Weight & Item*</label>
                                                <input type="number" min="1" class="form-control"  name="net_weigth" value="<%if (shop_product_id != 0) {%><%=e1.getNet_weigth()%><%}%>" placeholder="Enter Net Weight">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Unit*</label>
                                                <select id="status" name="unit" class="form-control">
                                                    <option value="-- Plese Select Unit --" selected>-- Please Select Unit --</option>
                                                    <option value="gm"  <%if (shop_product_id != 0 && e1.getUnit().equals("gm")) {
                                                            out.println("selected");
                                                        }%> >gm</option>
                                                    <option value="kg" <%if (shop_product_id != 0 && e1.getUnit().equals("kg")) {
                                                            out.println("selected");
                                                        }%>>kg</option>
                                                    <option value="ml"  <%if (shop_product_id != 0 && e1.getUnit().equals("ml")) {
                                                            out.println("selected");
                                                        }%> >ml</option>
                                                    <option value="liters"  <%if (shop_product_id != 0 && e1.getUnit().equals("liters")) {
                                                            out.println("selected");
                                                        }%> >liters</option>
                                                    <option value="dazon"  <%if (shop_product_id != 0 && e1.getUnit().equals("dazon")) {
                                                            out.println("selected");
                                                        }%> >dazon</option>
                                                    <option value="pieces"  <%if (shop_product_id != 0 && e1.getUnit().equals("pieces")) {
                                                            out.println("selected");
                                                        }%> >pieces</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Quantity*</label>
                                                <input type="number" min="0" class="form-control" name="quantity" value="<%if (shop_product_id != 0) {%><%=e1.getQuantity()%><%}%>" placeholder="Please Enter Quantity">
                                            </div>
                                   
                                        </div>
                                    </div>
                                    <input type="hidden" id="product_id" value="<%if (shop_product_id != 0) {%><%=e1.getProduct_id()%><%}%>">
                                    <div class="col-lg-12">
                                        <button class="save-btn1 hover-btn" type="submit"><%if (shop_product_id != 0) {
                                                out.println("Edit Product");
                                            } else {
                                                out.println("Add New Product");
                                            }%></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                            <div class="all-cate-tags">
                                <div class="row  justify-content-end">
                                    <div class="col-lg-5 col-md-7">
                                        <div class="bulk-section text-left mb-30">
                                            <div class="search-by-name-input mr-0">
                                                <input type="text" class="form-control" placeholder="Search">
                                            </div>
                                            <button class="status-btn hover-btn" type="submit">Search</button>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="card card-static-2 mb-30">
                                            <div class="card-title-2">
                                                <h4><b>All Shop Products</b></h4>
                                            </div>
                                            <div class="card-body-table px-3 pb-3">
                                                <div class="table-responsive">
                                                    <table class="table ucp-table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width:60px">ID</th>
                                                                <th>Name</th>
                                                                <th>MRP</th>
                                                                <th>Dis. MRP</th>
                                                                <th>Net Unit</th>
                                                                <th>Quantity</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                List<ShopProduct> list_shop = ShopProductDAO.viewShopData(shop_id);
                                                                int n = 0;
                                                                for (ShopProduct e : list_shop) {
                                                                    n = n + 1;
                                                            %>
                                                            <tr>
                                                                <td><%=n%></td>
                                                                <td><%=e.getProduct_name()%></td>
                                                                <td><%=e.getMrp()%></td>
                                                                <td><%=e.getDiscount_mrp()%></td>
                                                                <td><%=e.getNet_weigth() + " " + e.getUnit()%></td>
                                                                <td><%=e.getQuantity()%></td>
                                                                <td class="action-btns">
                                                                    <a href="shop_products.jsp?shop_product_id=<%=e.getShop_product_id()%>&shop_id=<%=e.getShop_id()%>" class="edit-btn" title="Edit"><i class="fas fa-edit"></i></a>
                                                                    <a href="../shopProductServlet?shop_product_id=<%=e.getShop_product_id()%>&shop_id=<%=e.getShop_id()%>" class="delete-btn" title="Delete"><i class="fas fa-trash-alt"></i></a>
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
            $("select#categeory").change(function () {
                var cst_id = $(this).children("option:selected").val();
                $.ajax({
                    url: '../AjaxShopProductServlet',
                    type: "post",
                    data: {cst_id: cst_id},
                    success: function (res) {
                        $("#products").html(res);
                    }
                });
            });

           $(document).ready(function () {
                var cst_id = $("#categeory").children("option:selected").val();
                var prd_id = $("#product_id").val();
                if (cst_id == "0")
                {
                    $("#products").html("<option>-- Pease Selcetd Product --</option>");
                }else
                {

                    $.ajax({
                        url: '../AjaxShopProductServlet',
                        type: "post",
                        data: {cst_id: cst_id},
                        success: function (res) {
                            $("#products").html(res);
                            $("#products").children("option").each(function () {
                                if ($(this).val() == prd_id) {
                                    $(this).attr("selected", "true");
                                }
                            });
                        }
                    });
                }
            });


        </script>
    </body>
</html>
