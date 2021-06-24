
<%@page import="DAO.DeliveryAddressDAO"%>
<%@page import="POJO.DeliveryAddress"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    

    String delivery_address_id1 = request.getParameter("delivery_address_id");
    String action = request.getParameter("action");
    String user_id1 = request.getParameter("user_id");
    String title = request.getParameter("title");
    String flat1 = request.getParameter("flat");
    String street = request.getParameter("street");
    String pincode1 = request.getParameter("pincode");
    String locality = request.getParameter("locality");
    String redirect = request.getParameter("redirect");

    
    int user_id = Integer.parseInt(user_id1);


    if (action != null && action.equals("insert")) {
        int flat = Integer.parseInt(flat1);
        int pincode = Integer.parseInt(pincode1);
        DeliveryAddress obj = new DeliveryAddress(user_id, title, flat, street, pincode, locality);
        DeliveryAddressDAO.insert(obj);
    } else if (action != null && action.equals("update")) {
        int delivery_address_id = Integer.parseInt(delivery_address_id1);
        int flat = Integer.parseInt(flat1);
        int pincode = Integer.parseInt(pincode1);
        DeliveryAddress obj = new DeliveryAddress(delivery_address_id, user_id, title, flat, street, pincode, locality);
        DeliveryAddressDAO.update(obj);
    } else {
        int delivery_address_id = Integer.parseInt(delivery_address_id1);
        DeliveryAddressDAO.delete(delivery_address_id);
    }
%>

    <%
        List<DeliveryAddress> list15 = DeliveryAddressDAO.viewData(user_id);
        for (DeliveryAddress e : list15) {
    %>
    <div class="field remove12">
        <%if(redirect == null){%><div class="ui radio checkbox chck-rdio" onclick="getAddresId(this)">
            <input type="radio"  name="fruit" value="<%=e.getDelivery_address_id()%>" class="hidden"><%}%>
            <div class="address-item">
                <div class="address-icon1">
                    <i class="uil uil-home-alt"></i>
                </div>
                <div class="address-dt-all">
                    <h4><%=e.getTitle()%></h4>
                    <p>#<%=e.getFlat()%>,  <%=e.getStreet()%>,  <%=e.getLocality()%> - <%=e.getPincode()%>.</p>
                    <ul class="action-btns">
                        <li><a  href="" onclick="editAddress(this,<%=e.getDelivery_address_id()%>)" data-toggle="collapse" data-target=".multi-collapse2" class="action-btn"><i class="uil uil-edit"></i></a></li>
                        <li><a onclick ="changeAddress(this,<%=e.getDelivery_address_id()%>)"  class="action-btn"><i class="uil uil-trash-alt"></i></a></li>
                    </ul>
                </div>
            </div>
        <%if(redirect == null){%></div><%}%>
    </div>
    <%}%>
    <script src="js/custom.js"></script>