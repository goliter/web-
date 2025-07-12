package com.app.controller;

import com.app.service.ServiceFactory;
import com.app.service.NewsService;
import com.app.entity.News;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/app/news")
public class NewsServlet extends HttpServlet {
    private final NewsService newsService = ServiceFactory.getNewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<News> newsList = newsService.listNews();
        req.setAttribute("newsList", newsList != null ? newsList : new ArrayList<>());
        // 转发到包含完整路由的index.jsp
        req.getRequestDispatcher("/app/WEB-INF/jsp/index.jsp").forward(req, resp);
    }
}
