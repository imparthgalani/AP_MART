<%-- 
    Document   : AjaxReviewServlet
    Created on : 27 Mar, 2021, 8:57:43 PM
    Author     : Ankit Chauhan
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="POJO.User"%>
<%@page import="DAO.OrderReviewDAO"%>
<%@page import="POJO.OrderReview"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String full_name = "";
    String email = "";
    int user_id = Integer.parseInt(session.getAttribute("customer").toString());

    User user;
    user = UserDAO.viewData(user_id);

    full_name = user.getFull_name();
    email = user.getEmail();

    int order_list_id = Integer.parseInt(request.getParameter("order_list_id"));
    int shop_product_id = Integer.parseInt(request.getParameter("shop_product_id"));

    OrderReview obj = OrderReviewDAO.viewReviewUpdateData(order_list_id, shop_product_id);
    int star = obj.getStar();
%>
<div class="product-dt-right">
    <input type="hidden" name="user_id" value="<%=user_id%>">
    <input id="order_list_id2" type="hidden" name="order_list_id" value="<%=order_list_id%>">
    <input id="shop_product_id2" type="hidden" name="shop_product_id" value="<%=shop_product_id%>">
    <input type="hidden" name="star" value="">
    <%if (star != 0) {%><input type="hidden" name="action" value="update"><%}%>
    <p>Your email will not be published. Required fields are marked *</p>

    <div class="form-group Yrating">
        Your rating: * 
        <span class="fa fa-star <%if (obj != null && star >= 1) {%>checked<%}%>" id="st1" star="1"></span>
        <span class="fa fa-star <%if (obj != null && star >= 2) {%>checked<%}%>" id="st2" star="2"></span>
        <span class="fa fa-star <%if (obj != null && star >= 3) {%>checked<%}%>" id="st3" star="3"></span>
        <span class="fa fa-star <%if (obj != null && star >= 4) {%>checked<%}%>" id="st4" star="4"></span>
        <span class="fa fa-star <%if (obj != null && star == 5) {%>checked<%}%>" id="st5" star="5"></span>
    </div>
    <div class="from_M">
        <div class="form-group">
            <label class="control-label">Name*</label>
            <input id="" name="custmore_name" type="text" placeholder="Name" class="form-control input-md" required="" value="<%if (star != 0) {%><%=obj.getCustmore_name()%><%} else {%><%=full_name%><%}%>">
        </div>

        <div class="form-group">
            <label class="control-label">Email Address*</label>
            <input id="" name="email" type="text" placeholder="Email Address" class="form-control input-md" required="" value="<%if (star != 0) {%><%=obj.getEmail()%><%} else {%><%=email%><%}%>">
        </div>
        <div class="form-group">
            <div class="field">
                <label class="control-label">Review*</label>
                <textarea rows="2" class="form-control MyM" id="Message" name="message" placeholder="Write Review"><%if (star != 0) {%><%=obj.getMessage()%><%}%></textarea>
            </div>
        </div>
        <button class="collapsed next-btn16 hover-btn" type="submit" id="C_Validation" data-btntext-sending="Sending...">Submit Review</button>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#st1").click(function () {
            $(".fa-star").attr("class", "fa fa-star");
            $("#st1").attr("class", "fa fa-star checked");
            var rating = $("#st1").attr("star");
            $("input[name='star']").val(rating);

        });
        $("#st2").click(function () {
            $(".fa-star").attr("class", "fa fa-star");
            $("#st1, #st2").attr("class", "fa fa-star checked");
            var rating = $("#st2").attr("star");
            $("input[name='star']").val(rating);
            alert("hii");

        });
        $("#st3").click(function () {
            $(".fa-star").attr("class", "fa fa-star");
            $("#st1, #st2, #st3").attr("class", "fa fa-star checked");
            var rating = $("#st3").attr("star");
            $("input[name='star']").val(rating);
        });
        $("#st4").click(function () {
            $(".fa-star").attr("class", "fa fa-star");
            $("#st1, #st2, #st3, #st4").attr("class", "fa fa-star checked");
            var rating = $("#st4").attr("star");
            $("input[name='star']").val(rating);
        });
        $("#st5").click(function () {
            $(".fa-star").attr("class", "fa fa-star");
            $("#st1, #st2, #st3, #st4, #st5").attr("class", "fa fa-star checked");
            var rating = $("#st5").attr("star");
            $("input[name='star']").val(rating);
        });
    });
</script>