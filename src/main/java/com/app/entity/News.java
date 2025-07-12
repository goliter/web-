package com.app.entity;

import java.time.LocalDateTime;

public class News {
    private String id;
    private String title;
    private String content;
    private LocalDateTime publishTime;
    private String author;
    private LocalDateTime insertTime;
    private LocalDateTime updateTime;

    public News(String id, String title, String content, LocalDateTime publishTime, String author, LocalDateTime insertTime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.publishTime = publishTime;
        this.author = author;
        this.insertTime = insertTime;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public LocalDateTime getPublishTime() { return publishTime; }
    public void setPublishTime(LocalDateTime publishTime) { this.publishTime = publishTime; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public LocalDateTime getInsertTime() { return insertTime; }
    public void setInsertTime(LocalDateTime insertTime) { this.insertTime = insertTime; }
    public LocalDateTime getUpdateTime() { return updateTime; }
    public void setUpdateTime(LocalDateTime updateTime) { this.updateTime = updateTime; }
}
