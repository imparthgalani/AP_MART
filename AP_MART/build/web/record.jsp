<%@page import="java.net.URLEncoder"%>
<%@page import="POJO.Shop"%>
<%@page import="DAO.ShopDAO"%>
<%@page import="POJO.ShopProduct"%>
<%@page import="DAO.ShopProductDAO"%>
<%@page import="POJO.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("key") != null) {
        String key = request.getParameter("key");
        String wild = "%" + key + "%";

        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ap_mart?user=root");
            PreparedStatement shop = null;
            PreparedStatement categories = null;
            PreparedStatement product = null;
            shop = conn.prepareStatement("SELECT * FROM shop WHERE name LIKE ?");
            shop.setString(1, wild);
            ResultSet rows = shop.executeQuery();
            categories = conn.prepareStatement("SELECT * FROM categories WHERE name LIKE ?");
            categories.setString(1, wild);
            ResultSet rows1 = categories.executeQuery();
            product = conn.prepareStatement("SELECT * FROM product WHERE name LIKE ?");
            product.setString(1, wild);
            ResultSet rows2 = product.executeQuery();

            while (rows.next()) {
%>
<a href='shop_grid.jsp?shop_id=<%=rows.getInt("shop_id")%>&shop_name=<%=URLEncoder.encode(rows.getString("name"), "UTF-8")%>'><%=rows.getString("name")%></a>
<%
    }while (rows1.next()) {
    System.out.println(rows1.getString("name"));
%>
<a href='shop_grid.jsp?categories_id=<%=rows1.getInt("categories_id")%>&categories_name=<%=URLEncoder.encode(rows1.getString("name"), "UTF-8")%>'><%=rows1.getString("name")%></a>
<%
    }while (rows2.next()) {

%>

<a href='shop_grid.jsp?product_id=<%=rows2.getInt("product_id")%>&product_name=<%=rows2.getString("name")%>'><%=rows2.getString("name")%></a>

<%      }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>


<%
    if (request.getParameter("key1") != null) {
        String key = request.getParameter("key1");
        String wild = "%" + key + "%";

        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ap_mart?user=root");

            PreparedStatement item = null;
            item = conn.prepareStatement("SELECT * FROM product WHERE name LIKE ?");
            item.setString(1, wild);
            ResultSet rows = item.executeQuery();

            while (rows.next()) {
%>
<a href='compere.jsp?shop_product_id=<%=rows.getInt("product_id")%>&name=<%=URLEncoder.encode(rows.getString("name"), "UTF-8")%>'><%=rows.getString("name")%></a>

<%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
