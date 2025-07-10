package com.e8.controller;

import com.e8.service.ServiceFactory;
import com.e8.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/e8/getuser")
public class GetUsersServlet extends HttpServlet {
    // 基于ServiceFactory工厂，获取单例的UserService组件
    private final UserService userService = ServiceFactory.getUserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取指定ID用户的详细信息
        String id = req.getParameter("uid");
        req.setAttribute("user", userService.getUser(id));
        req.getRequestDispatcher("/e8/WEB-INF/jsp/query.jsp")
                .forward(req, resp);

    }
}