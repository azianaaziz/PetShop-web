package com.petshop.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteItem(request, response);
        } else if ("addToCart".equals(action)) {
            addToCart(request, response);
        } else if ("checkout".equals(action)) {
            handleCheckout(request, response);
        } else if ("updateQuantity".equals(action)) {
            updateQuantity(request, response);
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        String productCode = request.getParameter("productCode");
        boolean found = false;
        for (Map<String, Object> item : cart) {
            if (item.get("productCode").equals(productCode)) {
                item.put("quantity", (Integer) item.get("quantity") + 1);
                found = true;
                break;
            }
        }

        if (!found) {
            Map<String, Object> item = new HashMap<>();
            item.put("productCode", productCode);
            item.put("name", request.getParameter("name"));
            item.put("price", Double.parseDouble(request.getParameter("price")));
            item.put("image", request.getParameter("image"));
            item.put("quantity", 1);
            cart.add(item);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("products.jsp");
    }

    private void handleCheckout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        if (cart != null) {
            session.setAttribute("checkoutItems", cart);
        }
        response.sendRedirect("checkout.jsp");
    }

    private void updateQuantity(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        if (cart != null) {
            String productCode = request.getParameter("productCode");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            for (Map<String, Object> item : cart) {
                if (item.get("productCode").equals(productCode)) {
                    item.put("quantity", quantity);
                    break;
                }
            }
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("checkout.jsp");
    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String productCode = request.getParameter("productCode");
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(item -> item.get("productCode").equals(productCode));
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("checkout.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}