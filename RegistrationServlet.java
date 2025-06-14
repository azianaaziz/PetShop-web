package com.petshop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.petshop.model.RegistrationUser;
import com.petshop.model.UserDAO;

public class RegistrationServlet extends HttpServlet {
    private UserDAO userDAO;

    public RegistrationServlet() {
        this.userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        RegistrationUser user = new RegistrationUser(fullName, phoneNumber, username, password, email);

        int status = userDAO.saveUser(user);
        if (status > 0) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().write("Error saving user information.");
        }
    }
}
