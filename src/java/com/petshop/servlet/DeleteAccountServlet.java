package com.petshop.servlet;

import com.petshop.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteAccountServlet extends HttpServlet {
    private UserDAO userDAO;

    public DeleteAccountServlet() {
        this.userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = request.getParameter("username");

        if (username != null) {
            if (userDAO.deleteUserByUsername(username) > 0) {
                if (session != null) {
                    session.invalidate(); // Invalidate session after deletion
                }
                response.sendRedirect("login.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete account.");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
