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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/admin/news/edit")
public class AdminNewsEditServlet extends HttpServlet {
    private final NewsService newsService = ServiceFactory.getNewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        News news = newsService.getNews(id);

        if (news == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            return;
        }

        req.setAttribute("news", news);
        req.setAttribute("isEdit", true);
        req.getRequestDispatcher("/app/WEB-INF/jsp/admin/news-form.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            String author = req.getParameter("author");
            String publishTimeStr = req.getParameter("publishTime");

            // 解析发布时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date publishTime = sdf.parse(publishTimeStr);

            // 创建新闻对象
            News news = new News(id, title, content, publishTime, author, null);

            // 更新新闻
            newsService.updateNews(news);

            // 重定向到管理首页
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");

        } catch (ParseException e) {
            req.setAttribute("error", "日期格式错误");
            String id = req.getParameter("id");
            News news = newsService.getNews(id);
            req.setAttribute("news", news);
            req.setAttribute("isEdit", true);
            req.getRequestDispatcher("/app/WEB-INF/jsp/admin/news-form.jsp")
                    .forward(req, resp);
        }
    }
}
