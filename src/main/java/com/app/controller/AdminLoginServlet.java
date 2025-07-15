package com.app.controller;

import com.e7.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/app/WEB-INF/jsp/admin/login.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String url;

        // 硬编码的管理员账号：admin/admin
        if ("admin".equals(userName) && "admin".equals(password)) {
            // 创建管理员用户对象并存储到session
            User admin = new User("admin", "管理员");
            req.getSession().setAttribute("admin", admin);
            url = "/admin/dashboard";
        } else {
            url = "/admin/login?error=true";
        }
        resp.sendRedirect(req.getContextPath() + url);
    }
}
