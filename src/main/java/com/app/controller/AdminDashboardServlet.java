package com.app.controller;

import com.app.service.ServiceFactory;
import com.app.service.NewsService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private final NewsService newsService = ServiceFactory.getNewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取所有新闻列表
        req.setAttribute("newsList", newsService.listNews());
        req.getRequestDispatcher("/app/WEB-INF/jsp/admin/dashboard.jsp")
                .forward(req, resp);
    }
}
