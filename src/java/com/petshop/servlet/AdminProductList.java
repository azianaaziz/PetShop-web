package com.petshop.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import com.petshop.model.Product;

@MultipartConfig(maxFileSize = 16177215) // Upload file size up to 16MB
@WebServlet(name = "AdminProductList", urlPatterns = {"/admin"})
public class AdminProductList extends HttpServlet {

    private String jdbcURL = "jdbc:mysql://localhost:3306/petshop"; 
    private String jdbcUsername = "root"; 
    private String jdbcPassword = "admin"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/admin?action=list");
            return;
        }
        try {
            switch (action) {
                case "insert":
                    insertProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/admin?action=list");
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error handling post request: " + e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/admin?action=list");
            return;
        }
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "list":
                    listProducts(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/admin?action=list");
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error handling get request: " + e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT product_code, name, description, price, image FROM products ORDER BY product_code ASC")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                productList.add(extractProduct(rs));
            }
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Error accessing database: " + e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
            return;
        }
        request.setAttribute("products", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminListProducts.jsp");
        dispatcher.forward(request, response);
    }

    private Product extractProduct(ResultSet rs) throws SQLException {
        String code = rs.getString("product_code");
        String name = rs.getString("name");
        String description = rs.getString("description");
        double price = rs.getDouble("price");
        Blob blob = rs.getBlob("image");
        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
        return new Product(code, name, description, price, imageBytes); // 'imageBytes', not 'image'
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminAddProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String code = request.getParameter("product_code");
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));
    InputStream inputStream = null;
    Part filePart = request.getPart("image");
    if (filePart != null) {
        inputStream = filePart.getInputStream();
    }

    Connection connection = null;  // Declare connection outside the try block
    try {
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        connection.setAutoCommit(false); // Ensure auto-commit is off

        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO products (product_code, name, description, price, image) VALUES (?, ?, ?, ?, ?)");
        preparedStatement.setString(1, code);
        preparedStatement.setString(2, name);
        preparedStatement.setString(3, description);
        preparedStatement.setDouble(4, price);

        if (inputStream != null) {
            preparedStatement.setBlob(5, inputStream);
        }

        int row = preparedStatement.executeUpdate();
        if (row > 0) {
            connection.commit(); // Commit the transaction explicitly
            HttpSession session = request.getSession();
            session.setAttribute("message", "Product successfully added.");
        }
        preparedStatement.close();
    } catch (SQLException e) {
        if (connection != null) {
            try {
                connection.rollback(); // Rollback on error
            } catch (SQLException ex) {
                ex.printStackTrace();
                throw new ServletException("Error during transaction rollback", ex);
            }
        }
        e.printStackTrace();
        throw new ServletException("Database insertion error", e);
    } finally {
        if (connection != null) {
            try {
                connection.close(); // Close the connection to release resources
            } catch (SQLException ex) {
                ex.printStackTrace();
                throw new ServletException("Error closing the database connection", ex);
            }
        }
    }
    response.sendRedirect(request.getContextPath() + "/admin?action=list");
}


    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("product_code");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            inputStream = filePart.getInputStream();
        }

        String updateSQL = "UPDATE products SET name = ?, description = ?, price = ?" + 
                           (inputStream != null ? ", image = ?" : "") + 
                           " WHERE product_code = ?";
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setDouble(3, price);
            if (inputStream != null) {
                preparedStatement.setBlob(4, inputStream);
                preparedStatement.setString(5, code);
            } else {
                preparedStatement.setString(4, code);
            }
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Product successfully updated.");
            }
            response.sendRedirect(request.getContextPath() + "/admin?action=list");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database update error", e);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("product_code");
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM products WHERE product_code = ?")) {
            preparedStatement.setString(1, code);
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Product successfully deleted.");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Product not found or could not be deleted.");
            }
            response.sendRedirect(request.getContextPath() + "/admin?action=list");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database deletion error", e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("product_code");
        Product product = null;
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT product_code, name, description, price, image FROM products WHERE product_code = ?")) {
            preparedStatement.setString(1, code);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                product = extractProduct(rs);
            }
            request.setAttribute("product", product);
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminUpdateProduct.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error displaying product data", e);
        }
    }
}
