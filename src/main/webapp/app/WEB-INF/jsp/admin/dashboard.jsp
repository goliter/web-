<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理后台 - 新闻管理</title>
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
        .header .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .toolbar {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            transition: all 0.3s;
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
        .news-table {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .news-table table {
            width: 100%;
            border-collapse: collapse;
        }
        .news-table th,
        .news-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ecf0f1;
        }
        .news-table th {
            background: #f8f9fa;
            font-weight: 600;
            color: #2c3e50;
        }
        .news-table tr:hover {
            background-color: #f8f9fa;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .actions .btn {
            padding: 5px 10px;
            font-size: 12px;
        }
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #7f8c8d;
        }
        .empty-state i {
            font-size: 48px;
            margin-bottom: 20px;
            display: block;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .stat-number {
            font-size: 28px;
            font-weight: bold;
            color: #3498db;
        }
        .stat-label {
            color: #7f8c8d;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="container">
            <h1>新闻管理后台</h1>
            <div class="user-info">
                <span>欢迎，管理员</span>
                <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">返回网站</a>
                <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-secondary">退出登录</a>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- 统计卡片 -->
        <div class="stats">
            <div class="stat-card">
                <div class="stat-number">${newsList.size()}</div>
                <div class="stat-label">总新闻数</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">
                    <c:set var="todayCount" value="0"/>
                    <c:forEach items="${newsList}" var="news">
                        <fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd" var="newsDate"/>
                        <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" var="today"/>
                        <c:if test="${newsDate eq today}">
                            <c:set var="todayCount" value="${todayCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${todayCount}
                </div>
                <div class="stat-label">今日发布</div>
            </div>
        </div>

        <!-- 工具栏 -->
        <div class="toolbar">
            <h2>新闻列表</h2>
            <a href="${pageContext.request.contextPath}/admin/news/add" class="btn btn-success">+ 添加新闻</a>
        </div>

        <!-- 新闻列表 -->
        <div class="news-table">
            <c:choose>
                <c:when test="${empty newsList}">
                    <div class="empty-state">
                        <div style="font-size: 48px; margin-bottom: 20px;">📰</div>
                        <h3>暂无新闻</h3>
                        <p>点击上方"添加新闻"按钮来发布第一条新闻吧！</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>标题</th>
                                <th>作者</th>
                                <th>发布时间</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${newsList}" var="news">
                                <tr>
                                    <td>${news.id}</td>
                                    <td>
                                        <div style="max-width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                            ${news.title}
                                        </div>
                                    </td>
                                    <td>${news.author}</td>
                                    <td>
                                        <fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd HH:mm"/>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${news.insertTime}" pattern="yyyy-MM-dd HH:mm"/>
                                    </td>
                                    <td>
                                        <div class="actions">
                                            <a href="${pageContext.request.contextPath}/admin/news/view?id=${news.id}" class="btn btn-primary">查看</a>
                                            <a href="${pageContext.request.contextPath}/admin/news/edit?id=${news.id}" class="btn btn-success">编辑</a>
                                            <a href="${pageContext.request.contextPath}/admin/news/delete?id=${news.id}"
                                               class="btn btn-danger"
                                               onclick="return confirm('确定要删除这条新闻吗？')">删除</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
