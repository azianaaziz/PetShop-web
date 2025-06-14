package cn.techtutorial.servlet;

import cn.techtutorial.dao.OrderDao;
import cn.techtutorial.model.Cart;
import cn.techtutorial.model.Order;
import cn.techtutorial.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CheckoutPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User auth = (User) request.getSession().getAttribute("auth");
        if(auth != null){
            String paymentMethod = request.getParameter("paymentMethod");

            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

            if(cart_list != null && !cart_list.isEmpty()){
                OrderDao orderDao = new OrderDao(getServletContext());

                for(Cart c : cart_list){
                    Order order = new Order();
                    order.setProductCode(c.getProductCode());
                    order.setUserId(auth.getId());
                    order.setQuantity(c.getQuantity());
                    order.setPrice(c.getPrice() * c.getQuantity());
                    order.setCategory(c.getCategory());
                    order.setName(c.getName());
                    order.setPaymentMethod(paymentMethod);
                    orderDao.addOrder(order);
                }

                // Prepare data for confirmation page BEFORE clearing cart
                List<Map<String, Object>> checkoutItems = new ArrayList<>();
                for(Cart c : cart_list){
                    Map<String, Object> item = new HashMap<>();
                    item.put("name", c.getName());
                    item.put("quantity", c.getQuantity());
                    checkoutItems.add(item);
                }
                request.getSession().setAttribute("checkoutItems", checkoutItems);

                // Clear the cart AFTER preparing confirmation data
                cart_list.clear();
                request.getSession().setAttribute("cart-list", cart_list);

                request.setAttribute("paymentMethod", paymentMethod);
                RequestDispatcher dispatcher = request.getRequestDispatcher("payment-confirmation.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("cart.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
