package com.e5.controller;

import com.e7.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/com/filter/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/e5/WEB-INF/jsp/login.html")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("pwd");
        String url;
        if ("BO".equals(userName) && "123456".equals(password)) {
            User u = new User("1","王小明");
            req.getSession().setAttribute("user", u);
            url = "/com/filter/welcome";
        } else {
            url = "/com/filter/login";
        }
        resp.sendRedirect(req.getContextPath() + url);
    }
}