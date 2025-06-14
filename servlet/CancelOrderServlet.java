package cn.techtutorial.servlet;

import cn.techtutorial.dao.OrderDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CancelOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        if (orderIdStr != null && !orderIdStr.isEmpty()) {
            try {
                int orderId = Integer.parseInt(orderIdStr);
                OrderDao orderDao = new OrderDao(getServletContext());
                boolean isCancelled = orderDao.cancelOrder(orderId);

                if (isCancelled) {
                    response.sendRedirect("orders.jsp?status=cancelled");
                } else {
                    response.sendRedirect("orders.jsp?status=notfound");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("orders.jsp?status=error");
            }
        } else {
            response.sendRedirect("orders.jsp?status=invalid");
        }
    }
}
