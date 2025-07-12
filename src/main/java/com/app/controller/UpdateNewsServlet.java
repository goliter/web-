package com.app.controller;

import com.app.entity.News;
import com.app.service.ServiceFactory;
import com.app.service.NewsService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@WebServlet("/app/updatenews")
public class UpdateNewsServlet extends HttpServlet {
    private final NewsService newsService = ServiceFactory.getNewsService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String author = req.getParameter("author");
        LocalDateTime publishTime = LocalDateTime.parse(req.getParameter("publishTime"));
        // 将LocalDateTime转换为java.util.Date
        Date publishDate = Date.from(publishTime.atZone(ZoneId.systemDefault()).toInstant());
        News news = new News(id, title, content, publishDate, author, null);
        newsService.updateNews(news);
        resp.sendRedirect(req.getContextPath() + "/app/news");
    }
}
