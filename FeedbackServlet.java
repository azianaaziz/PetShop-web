/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.petshop.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.*;
import com.petshop.model.Feedback;

@WebServlet("/FeedbackServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class FeedbackServlet extends HttpServlet {

    private String uploadPath;

    public void init() {
        uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        Part filePart = request.getPart("photo");

        String fileName = new File(filePart.getSubmittedFileName()).getName();
        String filePath = "uploads" + File.separator + fileName;
        filePart.write(uploadPath + File.separator + fileName);

        Feedback feedback = new Feedback(title, name, subject, filePath);

        ServletContext context = getServletContext();
        List<Feedback> feedbackList = (List<Feedback>) context.getAttribute("feedbackList");
        if (feedbackList == null) {
            feedbackList = new ArrayList<>();
        }
        feedbackList.add(feedback);
        context.setAttribute("feedbackList", feedbackList);

        response.sendRedirect("feedback.jsp");
    }
}

