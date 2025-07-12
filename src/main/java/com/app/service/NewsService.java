package com.app.service;

import com.app.entity.News;
import java.util.List;

public interface NewsService {
    List<News> listNews();
    void addNews(News news);
    News getNews(String id);
    void updateNews(News news);
}
