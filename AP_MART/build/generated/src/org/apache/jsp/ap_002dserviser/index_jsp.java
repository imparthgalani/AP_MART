package org.apache.jsp.ap_002dserviser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DAO.UserDAO;
import POJO.User;
import POJO.Order;
import POJO.Cart;
import DAO.OrederDAO;
import java.util.List;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    User user = new User();
    int user_id = 0;
    if (session.getAttribute("Servicer") != null) {
        user_id = Integer.parseInt(session.getAttribute("Servicer").toString());
        user = UserDAO.viewData(user_id);
    } else {
        response.sendRedirect("../sign_in.jsp");
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <!-- include the head Link -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "head_link.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("        <title>AP MART - Serviser</title>\n");
      out.write("        <style>\n");
      out.write("            .dashboard-report-card{\n");
      out.write("                width: 244px;\n");
      out.write("            }\n");
      out.write("            .dashboard-report-card .card-media {\n");
      out.write("                width: 70px;\n");
      out.write("                height: 70px;\n");
      out.write("                border-radius: 50%;\n");
      out.write("                flex-shrink: 0;\n");
      out.write("                margin-left: 15px;\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                text-align: center;\n");
      out.write("                background-color: rgba(255, 255, 255, .2);\n");
      out.write("                justify-content: center;\n");
      out.write("                right: 9px;\n");
      out.write("                top: 31px;\n");
      out.write("                position: absolute;\n");
      out.write("            }\n");
      out.write("            .mdp{\n");
      out.write("                margin-left: 37px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dashboard-report-card.blue {\n");
      out.write("                background-color: #bc42bb;\n");
      out.write("                border-color: #bc42bb;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media(max-width:1500.98px) {\n");
      out.write("                .dashboard-report-card{\n");
      out.write("                    width: auto;\n");
      out.write("                }\n");
      out.write("                .mdp{\n");
      out.write("                    margin-left: 0px;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"sb-nav-fixed\">\n");
      out.write("\n");
      out.write("        <!-- include the header File -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write(" \n");
      out.write("\n");
      out.write("        <div id=\"layoutSidenav_content\">\n");
      out.write("            <main>\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <h2 class=\"mt-30 page-title\">Dashboard</h2>\n");
      out.write("                    <ol class=\"breadcrumb mb-30\">\n");
      out.write("                        <li class=\"breadcrumb-item active\">Dashboard</li>\n");
      out.write("                    </ol>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-xl-2 col-md-6\">\n");
      out.write("                            <div class=\"dashboard-report-card purple\">\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <span class=\"card-title\">Order Pending</span>\n");
      out.write("                                    ");

                                        String condition1 = "WHERE status = 1 AND order_list.servicer_id =" + user_id;
                                        int count1 = OrederDAO.statusCount(condition1);
                                    
      out.write("\n");
      out.write("                                    <span class=\"card-count\">");
      out.print(count1);
      out.write("</span>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-media\">\n");
      out.write("                                    <i class=\"fab fa-rev\"></i>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-xl-2 col-md-6 mdp\">\n");
      out.write("                            <div class=\"dashboard-report-card info\">\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <span class=\"card-title\">Order Process</span>\n");
      out.write("                                    ");

                                        String condition2 = "WHERE (status = 3  OR status = 2) AND order_list.servicer_id =" + user_id;
                                        int count2 = OrederDAO.statusCount(condition2);
                                    
      out.write("\n");
      out.write("                                    <span class=\"card-count\">");
      out.print(count2);
      out.write("</span>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-media\">\n");
      out.write("                                    <i class=\"fas fa-sync-alt rpt_icon\"></i>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-xl-2 col-md-6 mdp\">\n");
      out.write("                            <div class=\"dashboard-report-card blue\">\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <span class=\"card-title\">ORDER Delivered</span>\n");
      out.write("                                    ");

                                        String condition3 = "WHERE status = 4 OR status = 5 AND order_list.servicer_id =" + user_id;
                                        int count3 = OrederDAO.statusCount(condition3);
                                    
      out.write("\n");
      out.write("                                    <span class=\"card-count\">");
      out.print(count3);
      out.write("</span>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-media\">\n");
      out.write("                                    <i class=\"fas fa-check\"></i>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-xl-2 col-md-6 mdp\">\n");
      out.write("                            <div class=\"dashboard-report-card red\">\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <span class=\"card-title\">Order Cancel</span>\n");
      out.write("                                    ");

                                        String condition4 = "WHERE status = 6 AND order_list.servicer_id =" + user_id;
                                        int count4 = OrederDAO.statusCount(condition4);
                                    
      out.write("\n");
      out.write("                                    <span class=\"card-count\">");
      out.print(count4);
      out.write("</span>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-media\">\n");
      out.write("                                    <i class=\"far fa-times-circle\"></i>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-xl-2 col-md-6 mdp\">\n");
      out.write("                            <div class=\"dashboard-report-card success\">\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <span class=\"card-title\">Total Amount</span>\n");
      out.write("                                    <span class=\"card-count\" id=\"amount\">0</span>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-media\">\n");
      out.write("                                    <i class=\"fas fa-money-bill rpt_icon\"></i>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>      \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"col-xl-12 col-md-12\">\n");
      out.write("                            <div class=\"card card-static-2 mb-30\">\n");
      out.write("                                <div class=\"card-title-2\">\n");
      out.write("                                    <h4><b>Recent Orders</b></h4>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-body-table px-3 pb-3\">\n");
      out.write("                                    <div class=\"table-responsive\">\n");
      out.write("                                        <table class=\"table ucp-table table-hover\">\n");
      out.write("                                            <thead>\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <th style=\"width:80px\">Order ID</th>\n");
      out.write("                                                    <th style=\"\">Shop</th>\n");
      out.write("                                                    <th style=\"width:150px\">Client Name</th>\n");
      out.write("                                                    <th style=\"\">Address</th>\n");
      out.write("                                                    <th style=\"\">Phone</th>\n");
      out.write("                                                    <th style=\"\">Delivery Time</th>\n");
      out.write("                                                    <th style=\"\">Status</th>\n");
      out.write("                                                    <th style=\"\">Total</th>\n");
      out.write("                                                    <th style=\"width:100px\">Action</th>\n");
      out.write("                                                </tr>\n");
      out.write("                                            </thead>\n");
      out.write("                                            <tbody>\n");
      out.write("                                                ");

                                                    List<Order> list1;
                                                    String condition = "WHERE order_list.status > 3  AND order_list.servicer_id =" + user_id;
                                                    list1 = OrederDAO.getOrderListDetails(condition);
                                                    int total_delivery_charge = 0;
                                                    for (Order e1 : list1) {
                                                        String status = "";
                                                        if (e1.getStatus() == 4 || e1.getStatus() == 5) {
                                                            status = "Success";
                                                        } else {
                                                            status = "Cancel";
                                                        }
                                                
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td>");
      out.print(e1.getOrder_list_id());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(e1.getShop_name());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(e1.getCustmore_name());
      out.write("</a></td>\n");
      out.write("                                                    <td>");
      out.print(e1.getOrder_address());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(e1.getPhone());
      out.write("</td>\n");
      out.write("                                                    <td>\n");
      out.write("                                                        <span class=\"delivery-time\">");
      out.print(e1.getOrder_time());
      out.write("</span>\n");
      out.write("                                                    </td>\n");
      out.write("                                                    <td>\n");
      out.write("                                                        <span class=\"badge-item badge-status\">");
      out.print(status);
      out.write("</span>\n");
      out.write("                                                    </td>\n");
      out.write("                                                    ");

                                                        Order e5 = OrederDAO.getOrderListDetail(e1.getOrder_list_id());
                                                        String shop_name = e5.getShop_name();
                                                        int order_id = e5.getOrder_id();
                                                        System.out.println(order_id);

                                                        Order obj = OrederDAO.getOrderDetil(order_id);

                                                        int delivery_charge = 10;
                                                        if (obj.getDelivery_time() == 1) {
                                                            delivery_charge = 50;
                                                        } else if (obj.getDelivery_time() == 2) {
                                                            delivery_charge = 30;
                                                        }

                                                        List< Cart> list3;
                                                        list3 = OrederDAO.viewOrderData(e1.getOrder_list_id());
                                                        int sub_total_mrp = 0;

                                                        for (Cart e3 : list3) {
                                                            int pro_toal_mrp = e3.getCart_quantity() * e3.getDiscount_mrp();
                                                            sub_total_mrp = sub_total_mrp + pro_toal_mrp;

                                                        }
      out.write("\n");
      out.write("                                                    <td>₹");
      out.print(sub_total_mrp + delivery_charge);
      out.write("</td>\n");
      out.write("                                                    ");
if(e1.getStatus() != 6){total_delivery_charge = total_delivery_charge + delivery_charge;}
      out.write("\n");
      out.write("                                                    <td class=\"action-btns\">\n");
      out.write("                                                        <a href=\"view_order.jsp?order_list_id=");
      out.print(e1.getOrder_list_id());
      out.write("\" class=\"views-btn\"><i class=\"fas fa-eye\"></i> View</a>\n");
      out.write("                                                    </td>\n");
      out.write("                                                </tr>\n");
      out.write("                                                ");
}
      out.write("\n");
      out.write("                                            </tbody>\n");
      out.write("                                        </table>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </main>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!-- include the footer File -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write(" \n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- include the footer Link -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer_link.jsp", out, false);
      out.write(" \n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                var amount = ");
      out.print(total_delivery_charge);
      out.write(";\n");
      out.write("                $(\"#amount\").text(amount);\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
