package com.e8.controller;

import com.e8.service.ServiceFactory;
import com.e8.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/e8")
public class IndexServlet extends HttpServlet {
    private final UserService userService = ServiceFactory.getUserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("users", userService.listUsers());
        req.getRequestDispatcher("/e8/WEB-INF/jsp/index.jsp")
                .forward(req, resp);
    }
}