package com.app.entity;

import java.util.Date; // 确保导入的是java.util.Date

public class News {
    private String id;
    private String title;
    private String content;
    private Date publishTime; // java.util.Date类型
    private String author;
    private Date insertTime;

    // 构造函数
    public News(String id, String title, String content, Date publishTime, String author, Date insertTime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.publishTime = publishTime;
        this.author = author;
        this.insertTime = insertTime;
    }

    // Getter和Setter方法
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Date getPublishTime() { return publishTime; }
    public void setPublishTime(Date publishTime) { this.publishTime = publishTime; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public Date getInsertTime() { return insertTime; }
    public void setInsertTime(Date insertTime) { this.insertTime = insertTime; }
}
