package com.e7.controller;

import com.e7.utils.DataSourceUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/e7/update")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("uid");
        String newName = req.getParameter("name");
        String sql = "update user set name=? where id=?";
        try(Connection conn = DataSourceUtils.getConnection();
            PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, newName);
            st.setString(2, id);
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath()+ "/e7");
    }
}