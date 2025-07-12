package com.app.service;

import com.app.service.impl.NewsServiceImpl;
import com.app.service.NewsService;

public class ServiceFactory {
    private static final NewsService newsService = create();

    private static NewsService create() {
        return new NewsServiceImpl();
    }

    public static NewsService getNewsService() {
        return newsService;
    }
}