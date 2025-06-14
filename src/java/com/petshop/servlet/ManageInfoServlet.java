package com.petshop.servlet;

import com.petshop.model.RegistrationUser;
import com.petshop.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

public class ManageInfoServlet extends HttpServlet {
    private UserDAO userDAO;

    public ManageInfoServlet() {
        this.userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("username") : null;

        if (username == null) {
            response.sendRedirect("login.jsp");
        } else {
            RegistrationUser user = userDAO.getUserByUsername(username);
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("manage_info.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String currentUsername = (session != null) ? (String) session.getAttribute("username") : null;

        if (currentUsername != null) {
            RegistrationUser user = userDAO.getUserByUsername(currentUsername);

            if (user != null) {
                user.setFullName(request.getParameter("name"));
                user.setPhoneNumber(request.getParameter("phoneNumber"));
                user.setEmail(request.getParameter("email"));
                String newUsername = request.getParameter("username");
                String newPassword = request.getParameter("password");

                user.setUsername(newUsername);
                user.setPassword(newPassword);

                if (userDAO.updateUser(user) > 0) {
                    if (!currentUsername.equals(newUsername)) {
                        session.setAttribute("username", newUsername);
                    }
                }
            }
        }

        response.sendRedirect("home.jsp");
    }
}
