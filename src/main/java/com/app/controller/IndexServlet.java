package com.app.controller;

import com.app.service.ServiceFactory;
import com.app.service.NewsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class IndexServlet extends HttpServlet {
    private final NewsService newsService = ServiceFactory.getNewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取最新3条新闻
        req.setAttribute("latestNews", newsService.listLatestNews(3));
        req.getRequestDispatcher("/app/WEB-INF/jsp/index.jsp")
                .forward(req, resp);
    }
}