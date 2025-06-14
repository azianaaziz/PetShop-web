package com.petshop.servlet;

import com.petshop.model.User;
import com.petshop.model.UserDAO;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class PetServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "img";
    private UserDAO userDAO;

    public PetServlet() {
        this.userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adoption.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is logged in
        if (request.getSession().getAttribute("username") == null) {
            request.setAttribute("errorMessage", "You need to log in first. <a href='login.jsp'>Login now</a>");
            RequestDispatcher dispatcher = request.getRequestDispatcher("adoption.jsp");
            dispatcher.forward(request, response);
            return;
        }

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = "";
        for (Part part : request.getParts()) {
            String contentDisposition = part.getHeader("content-disposition");
            if (contentDisposition != null && contentDisposition.contains("filename")) {
                fileName = getFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    String fullPath = uploadFilePath + File.separator + fileName;
                    part.write(fullPath);
                }
            }
        }

        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String details = request.getParameter("details");
        String image = UPLOAD_DIR + "/" + fileName;

        User newUser = new User(name, title, details, image);
        userDAO.insertUser(newUser);

        response.sendRedirect("PetServlet");
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "PetServlet handles pet adoption actions.";
    }
}
