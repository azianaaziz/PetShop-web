package cn.techtutorial.dao;

import cn.techtutorial.model.Order;
import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private ServletContext context;

    public OrderDao(ServletContext context) {
        this.context = context;
    }

    // Add a single order
    public void addOrder(Order order) {
        List<Order> orderList = (List<Order>) context.getAttribute("orders");
        if (orderList == null) {
            orderList = new ArrayList<>();
        }
        orderList.add(order);
        context.setAttribute("orders", orderList);
    }

    // Add multiple orders
    public void addOrder(List<Order> orders) {
        List<Order> orderList = (List<Order>) context.getAttribute("orders");
        if (orderList == null) {
            orderList = new ArrayList<>();
        }
        orderList.addAll(orders);
        context.setAttribute("orders", orderList);
    }

    // Get all orders
    public List<Order> getAllOrders() {
        List<Order> orderList = (List<Order>) context.getAttribute("orders");
        if (orderList == null) {
            orderList = new ArrayList<>();
        }
        return orderList;
    }

    // Get orders by userId
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> allOrders = getAllOrders();
        List<Order> userOrders = new ArrayList<>();
        for (Order order : allOrders) {
            if (order.getUserId() == userId) {
                userOrders.add(order);
            }
        }
        return userOrders;
    }

    // Cancel order and return boolean
    public boolean cancelOrder(int orderId) {
        List<Order> orderList = (List<Order>) context.getAttribute("orders");
        if (orderList != null) {
            Order toRemove = null;
            for (Order order : orderList) {
                if (order.getOrderId() == orderId) {
                    toRemove = order;
                    break;
                }
            }
            if (toRemove != null) {
                orderList.remove(toRemove);
                context.setAttribute("orders", orderList);
                return true;  // Successfully removed
            }
        }
        return false;  // Not found
    }
}
