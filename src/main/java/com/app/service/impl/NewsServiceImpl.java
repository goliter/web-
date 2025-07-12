package com.app.service.impl;

import com.app.entity.News;
import com.app.service.NewsService;
import com.app.util.DataSourceUtils;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class NewsServiceImpl implements NewsService {
    private static Logger logger = Logger.getLogger(NewsServiceImpl.class.getName());

    @Override
    public List<News> listNews() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news ORDER BY publish_time DESC";
        try(Connection conn = DataSourceUtils.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // 获取Timestamp并转换为java.util.Date
                java.util.Date publishTime = rs.getTimestamp("publish_time");
                java.util.Date insertTime = rs.getTimestamp("insert_time");
                News news = new News(
                    rs.getString("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    publishTime,  // 现在类型匹配
                    rs.getString("author"),
                    insertTime
                );
                newsList.add(news);
            }
        } catch (SQLException e) {
            logger.warning(e.getMessage());
        }
        return newsList;
    }

    // 同样修改listLatestNews方法
    @Override
    public List<News> listLatestNews(int limit) {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news ORDER BY publish_time DESC LIMIT ?";
        try(Connection conn = DataSourceUtils.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);) {
            st.setInt(1, limit);
            try(ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    // 直接使用Timestamp（java.util.Date的子类）
                    java.util.Date publishTime = rs.getTimestamp("publish_time");
                    java.util.Date insertTime = rs.getTimestamp("insert_time");
                     
                    News news = new News(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        publishTime,  // 直接传递，无需转换
                        rs.getString("author"),
                        insertTime     // 直接传递，无需转换
                    );
                    newsList.add(news);
                }
            }
        } catch (SQLException e) {
            logger.warning(e.getMessage());
        }
        return newsList;
    }

    @Override
    public void addNews(News news) {
        String sql = "INSERT INTO news(title, content, publish_time, author, insert_time) VALUES(?, ?, ?, ?, ?)";
        try(Connection conn = DataSourceUtils.getConnection();
            PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, news.getTitle());
            st.setString(2, news.getContent());
            // 检查日期参数设置是否正确
            st.setTimestamp(3, new Timestamp(news.getPublishTime().getTime()));
            st.setString(4, news.getAuthor());
            st.setTimestamp(5, new Timestamp(System.currentTimeMillis())); // 当前时间
            st.executeUpdate();
        } catch (SQLException e) {
            logger.warning(e.getMessage());
        }
        // 检查此处是否有多余或缺少的花括号
    }

    @Override
    public News getNews(String id) {
        News news = null;
        String sql = "SELECT * FROM news WHERE id=?";
        try(Connection conn = DataSourceUtils.getConnection();
            PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, id);
            try(ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    LocalDateTime publishTime = null;
                    Timestamp tsPublish = rs.getTimestamp("publish_time");
                    if (tsPublish != null) publishTime = tsPublish.toLocalDateTime();
                    LocalDateTime insertTime = null;
                    Timestamp tsInsert = rs.getTimestamp("insert_time");
                    if (tsInsert != null) insertTime = tsInsert.toLocalDateTime();
                    news = new News(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        // 强制类型转换（兼容所有JDK版本）
                        publishTime != null ? new java.util.Date(java.sql.Timestamp.valueOf(publishTime).getTime()) : null,
                        rs.getString("author"),
                        insertTime != null ? new java.util.Date(java.sql.Timestamp.valueOf(insertTime).getTime()) : null
                    );
                }
            }
        } catch (SQLException e) {
            logger.warning(e.getMessage());
        }
        return news;
    }

    @Override
    public void updateNews(News news) {
        String sql = "UPDATE news SET title=?, content=?, publish_time=?, author=? WHERE id=?";
        try(Connection conn = DataSourceUtils.getConnection();
            PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, news.getTitle());
            st.setString(2, news.getContent());
            // 假设错误代码为：
            // news.setPublishTime(LocalDateTime.now());
            
            // 替换为以下代码：
            // 1. 使用Timestamp转换（推荐，更简洁）
            news.setPublishTime(Timestamp.valueOf(LocalDateTime.now()));
            

            // 第111行错误代码：
            // news.setPublishTime(LocalDateTime.now());
            
            // 替换为正确的转换代码：
            news.setPublishTime(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));
            st.setString(4, news.getAuthor());
            st.setString(5, news.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            logger.warning(e.getMessage());
        }
    }
}
