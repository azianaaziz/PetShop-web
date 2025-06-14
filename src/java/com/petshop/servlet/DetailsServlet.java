package com.petshop.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "DetailsServlet", urlPatterns = {"/DetailsServlet"})
public class DetailsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postcode = request.getParameter("postcode");

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop", "root", "admin");
            String sql = "INSERT INTO user_details (name, phone, address, city, postcode) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, address);
            stmt.setString(4, city);
            stmt.setString(5, postcode);
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            request.setAttribute("orderId", orderId);
            RequestDispatcher dispatcher = request.getRequestDispatcher("orderConfirmation.jsp");
            dispatcher.forward(request, response);

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
