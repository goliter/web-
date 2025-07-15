<%@ page pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  header {
    background: #2c3e50;
    color: #fff;
    padding: 0;
  }
  nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
  }
  nav ul li {
    margin: 0;
    padding: 0;
  }
  nav ul li a {
    display: block;
    padding: 16px 24px;
    color: #fff;
    text-decoration: none;
    font-size: 16px;
    transition: background 0.2s;
  }
  nav ul li a.active {
    background: #3498db;
    border-bottom: 3px solid #2980b9;
  }
  nav ul li a:hover {
    background: #34495e;
  }
  nav ul li.right {
    margin-left: auto;
  }
</style>
<header>
  <nav>
    <ul>
      <li><a href="#/" data-page="home">首页</a></li>
      <li><a href="#/major" data-page="major">专业介绍</a></li>
      <li><a href="#/lab" data-page="lab">实验室</a></li>
      <li><a href="#/teacher" data-page="teacher">教师队伍</a></li>
      <li><a href="#/career" data-page="career">就业指南</a></li>
      <li><a href="#/news" data-page="news">新闻公告</a></li>
      <li class="right"><a href="<c:url value='/a.html'/>">实验页面</a></li>
      <li class="right"><a href="<c:url value='/admin/dashboard'/>">后台管理</a></li>
    </ul>
  </nav>
</header>
