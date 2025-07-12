package com.app.controller;

import com.app.service.ServiceFactory;
import com.app.service.NewsService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/app/getnews")
public class GetNewsServlet extends HttpServlet {
    private final NewsService newsService = ServiceFactory.getNewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("nid");
        req.setAttribute("news", newsService.getNews(id));
        req.getRequestDispatcher("/app/WEB-INF/jsp/news_detail.jsp")
                .forward(req, resp);
    }
}
