<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:choose><c:when test="${isEdit}">编辑新闻</c:when><c:otherwise>添加新闻</c:otherwise></c:choose> - 管理后台</title>
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
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .form-header {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #ecf0f1;
        }
        .form-header h2 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: 600;
        }
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #ecf0f1;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
            font-family: inherit;
        }
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #3498db;
        }
        .form-group textarea {
            min-height: 200px;
            resize: vertical;
        }
        .form-actions {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 30px;
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
        .btn-secondary {
            background: #95a5a6;
            color: white;
        }
        .btn-secondary:hover {
            background: #7f8c8d;
        }
        .error-message {
            background: #ffebee;
            color: #c62828;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #e74c3c;
        }
        .required {
            color: #e74c3c;
        }
        .help-text {
            font-size: 12px;
            color: #7f8c8d;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="container">
            <h1>
                <c:choose>
                    <c:when test="${isEdit}">编辑新闻</c:when>
                    <c:otherwise>添加新闻</c:otherwise>
                </c:choose>
            </h1>
        </div>
    </div>

    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <h2>
                    <c:choose>
                        <c:when test="${isEdit}">编辑新闻信息</c:when>
                        <c:otherwise>发布新闻</c:otherwise>
                    </c:choose>
                </h2>
                <p style="color: #7f8c8d;">请填写新闻的详细信息，标有 <span class="required">*</span> 的字段为必填项。</p>
            </div>

            <c:if test="${not empty error}">
                <div class="error-message">
                    ${error}
                </div>
            </c:if>

            <form method="post">
                <c:if test="${isEdit}">
                    <input type="hidden" name="id" value="${news.id}">
                </c:if>

                <div class="form-group">
                    <label for="title">新闻标题 <span class="required">*</span></label>
                    <input type="text" id="title" name="title" value="${news.title}" required maxlength="200">
                    <div class="help-text">请输入简洁明了的新闻标题（最多200字符）</div>
                </div>

                <div class="form-group">
                    <label for="content">新闻内容 <span class="required">*</span></label>
                    <textarea id="content" name="content" required placeholder="请输入新闻的详细内容...">${news.content}</textarea>
                    <div class="help-text">详细描述新闻内容，支持换行</div>
                </div>

                <div class="form-group">
                    <label for="author">作者 <span class="required">*</span></label>
                    <input type="text" id="author" name="author" value="${news.author}" required maxlength="50">
                    <div class="help-text">新闻作者姓名（最多50字符）</div>
                </div>

                <div class="form-group">
                    <label for="publishTime">发布时间 <span class="required">*</span></label>
                    <input type="datetime-local" id="publishTime" name="publishTime"
                           value="<c:choose>
                                   <c:when test="${isEdit}"><fmt:formatDate value='${news.publishTime}' pattern='yyyy-MM-dd\'T\'HH:mm'/></c:when>
                                   <c:otherwise><fmt:formatDate value='<%=new java.util.Date()%>' pattern='yyyy-MM-dd\'T\'HH:mm'/></c:otherwise>
                                   </c:choose>"
                           required>
                    <div class="help-text">选择新闻的发布时间</div>
                </div>

                <div class="form-actions">
                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">取消</a>
                    <button type="submit" class="btn btn-primary">
                        <c:choose>
                            <c:when test="${isEdit}">更新新闻</c:when>
                            <c:otherwise>发布新闻</c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 表单验证
        document.querySelector('form').addEventListener('submit', function(e) {
            const title = document.getElementById('title').value.trim();
            const content = document.getElementById('content').value.trim();
            const author = document.getElementById('author').value.trim();

            if (!title || !content || !author) {
                e.preventDefault();
                alert('请填写所有必填字段！');
                return false;
            }

            if (title.length > 200) {
                e.preventDefault();
                alert('标题长度不能超过200字符！');
                return false;
            }

            if (author.length > 50) {
                e.preventDefault();
                alert('作者姓名长度不能超过50字符！');
                return false;
            }
        });

        // 自动调整textarea高度
        const textarea = document.getElementById('content');
        textarea.addEventListener('input', function() {
            this.style.height = 'auto';
            this.style.height = (this.scrollHeight) + 'px';
        });
    </script>
</body>
</html>
