package cn.techtutorial.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import cn.techtutorial.dao.OrderDao;
import cn.techtutorial.model.*;

@WebServlet("/cart-order")
public class CartOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User auth = (User) request.getSession().getAttribute("auth");
        if (auth == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Cart> cartList = (List<Cart>) request.getSession().getAttribute("cart-list");
        if (cartList == null || cartList.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        List<Order> orderList = new ArrayList<>();
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        for (Cart c : cartList) {
            Order order = new Order();
            order.setOrderId(new Random().nextInt(100000)); // Optional: better use UUID in real projects
            order.setUserId(auth.getId());
            order.setName(c.getName());
            order.setCategory(c.getCategory());
            order.setQuantity(c.getQuantity());
            order.setPrice(c.getPrice() * c.getQuantity());
            order.setDate(currentDate);

            orderList.add(order);
        }

        OrderDao orderDao = new OrderDao(getServletContext());
        orderDao.addOrder(orderList);

        cartList.clear(); // empty the cart after ordering
        request.getSession().setAttribute("cart-list", cartList);

        response.sendRedirect("orders.jsp");
    }
}
