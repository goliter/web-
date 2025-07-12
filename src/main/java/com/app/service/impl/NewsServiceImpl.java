package com.app.service.impl;

import com.app.entity.News;
import com.app.service.NewsService;
import com.app.util.DataSourceUtils;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class NewsServiceImpl implements NewsService {
    private static Logger logger = Logger.getLogger(NewsServiceImpl.class.getName());

    @Override
    public List<News> listNews() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news";
        try(Connection conn = DataSourceUtils.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                LocalDateTime publishTime = null;
                Timestamp tsPublish = rs.getTimestamp("publish_time");
                if (tsPublish != null) publishTime = tsPublish.toLocalDateTime();
                LocalDateTime insertTime = null;
                Timestamp tsInsert = rs.getTimestamp("insert_time");
                if (tsInsert != null) insertTime = tsInsert.toLocalDateTime();
                News news = new News(
                    rs.getString("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    publishTime,
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

    @Override
    public void addNews(News news) {
        String sql = "INSERT INTO news(title, content, publish_time, author) VALUES(?,?,?,?)";
        try(Connection conn = DataSourceUtils.getConnection();
            PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, news.getTitle());
            st.setString(2, news.getContent());
            st.setTimestamp(3, news.getPublishTime() == null ? null : Timestamp.valueOf(news.getPublishTime()));
            st.setString(4, news.getAuthor());
            st.executeUpdate();
        } catch (SQLException e) {
            logger.warning(e.getMessage());
        }
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
                        publishTime,
                        rs.getString("author"),
                        insertTime
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
            st.setTimestamp(3, news.getPublishTime() == null ? null : Timestamp.valueOf(news.getPublishTime()));
            st.setString(4, news.getAuthor());
            st.setString(5, news.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            logger.warning(e.getMessage());
        }
    }
}
