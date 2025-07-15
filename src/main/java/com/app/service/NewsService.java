package com.app.service;

import com.app.entity.News;
import java.util.List;

public interface NewsService {
    // 添加listNews()方法声明
    List<News> listNews();
    List<News> listLatestNews(int limit);
    void addNews(News news);
    News getNews(String id);
    void updateNews(News news);
    void deleteNews(String id);
}
