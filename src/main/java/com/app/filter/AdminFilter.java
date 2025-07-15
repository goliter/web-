package com.app.filter;

import com.e7.entity.User;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebFilter("/admin/*")
public class AdminFilter extends HttpFilter {
    // 不需要登录验证的路径
    private final List<String> excludes = List.of("/admin/login");

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        // 检查是否为排除路径
        for (String exclude : excludes) {
            if (exclude.equals(req.getServletPath())) {
                chain.doFilter(req, res);
                return;
            }
        }

        // 检查是否已登录
        User admin = (User) req.getSession().getAttribute("admin");
        if (admin != null) {
            chain.doFilter(req, res);
            return;
        }

        // 未登录，重定向到登录页面
        res.sendRedirect(req.getContextPath() + "/admin/login");
    }
}
