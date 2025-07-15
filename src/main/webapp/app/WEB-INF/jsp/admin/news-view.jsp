<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看新闻 - 管理后台</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Microsoft YaHei', sans-serif;
            background-color: #f5f5f5;
            line-height: 1.6;
        }
        .header {
            background: #2c3e50;
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .header .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            font-size: 24px;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .news-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .news-header {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #ecf0f1;
        }
        .news-title {
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 15px;
            line-height: 1.3;
        }
        .news-meta {
            display: flex;
            gap: 20px;
            color: #7f8c8d;
            font-size: 14px;
        }
        .news-meta span {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .news-content {
            color: #2c3e50;
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 30px;
            white-space: pre-wrap;
        }
        .news-actions {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            padding-top: 20px;
            border-top: 2px solid #ecf0f1;
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-block;
        }
        .btn-primary {
            background: #3498db;
            color: white;
        }
        .btn-primary:hover {
            background: #2980b9;
        }
        .btn-success {
            background: #27ae60;
            color: white;
        }
        .btn-success:hover {
            background: #229954;
        }
        .btn-danger {
            background: #e74c3c;
            color: white;
        }
        .btn-danger:hover {
            background: #c0392b;
        }
        .btn-secondary {
            background: #95a5a6;
            color: white;
        }
        .btn-secondary:hover {
            background: #7f8c8d;
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 30px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
        }
        .info-item {
            text-align: center;
        }
        .info-label {
            color: #7f8c8d;
            font-size: 12px;
            margin-bottom: 5px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .info-value {
            color: #2c3e50;
            font-size: 16px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="container">
            <h1>查看新闻</h1>
        </div>
    </div>

    <div class="container">
        <div class="news-container">
            <div class="news-header">
                <h1 class="news-title">${news.title}</h1>
                <div class="news-meta">
                    <span>
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
                            <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                        </svg>
                        作者：${news.author}
                    </span>
                    <span>
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
                            <path d="M9 11H7v6h2v-6zm4 0h-2v6h2v-6zm4 0h-2v6h2v-6zm2-7h-3V2h-2v2H8V2H6v2H3v18h18V4zm-2 16H5V8h14v12z"/>
                        </svg>
                        发布时间：<fmt:formatDate value="${news.publishTime}" pattern="yyyy年MM月dd日 HH:mm"/>
                    </span>
                </div>
            </div>

            <div class="info-grid">
                <div class="info-item">
                    <div class="info-label">新闻ID</div>
                    <div class="info-value">${news.id}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">创建时间</div>
                    <div class="info-value">
                        <fmt:formatDate value="${news.insertTime}" pattern="yyyy-MM-dd HH:mm"/>
                    </div>
                </div>
                <div class="info-item">
                    <div class="info-label">字符数</div>
                    <div class="info-value">${news.content.length()} 字</div>
                </div>
            </div>

            <div class="news-content">
                ${news.content}
            </div>

            <div class="news-actions">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">返回列表</a>
                <a href="${pageContext.request.contextPath}/admin/news/edit?id=${news.id}" class="btn btn-success">编辑</a>
                <a href="${pageContext.request.contextPath}/admin/news/delete?id=${news.id}"
                   class="btn btn-danger"
                   onclick="return confirm('确定要删除这条新闻吗？删除后无法恢复！')">删除</a>
            </div>
        </div>
    </div>
</body>
</html>
