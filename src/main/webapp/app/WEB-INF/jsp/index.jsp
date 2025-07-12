<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %> <%@ include file="common-style.jsp" %>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>软件工程专业网站</title>
    <style>
      /* 添加路由容器样式 */
      #route-container { min-height: 400px; padding: 20px; }
      .page { display: none; }
      .page.active { display: block; }
      /* 整合各页面特有样式 */
      .lab-list { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 1rem; padding: 1rem; }
      .lab-card { border: 1px solid #ddd; padding: 1rem; border-radius: 4px; }
      .teacher-list { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 1rem; padding: 1rem; }
      .teacher-card { border: 1px solid #ddd; padding: 1rem; border-radius: 4px; }
      .news-list, .notice-list { padding: 1rem; }
      .news-item, .notice-item { margin-bottom: 1rem; padding: 1rem; border: 1px solid #ddd; border-radius: 4px; }
    </style>
  </head>
  <body>
    <%@ include file="header.jsp" %>
    <main id="route-container">
      <!-- 首页内容 -->
      <div id="home" class="page active">
        <h1>欢迎来到软件工程专业网站</h1>
        <section>
          <h2>最新新闻</h2>
          <ul id="news-list">
            <!-- 新闻列表将通过JavaScript动态加载 -->
          </ul>
        </section>
      </div>

      <!-- 专业介绍页面 -->
      <div id="major" class="page">
        <div class="sub-nav">
          <ul>
            <li><a href="#intro" onclick="showSection('intro')">专业简介</a></li>
            <li><a href="#directions" onclick="showSection('directions')">方向简介</a></li>
          </ul>
        </div>
        <main>
          <section id="intro">
            <h1>专业简介</h1>
            <p>这里是软件工程专业的简介内容...</p>
          </section>
          <section id="directions" style="display:none;">
            <h1>方向简介</h1>
            <p>这里是专业方向的简介内容...</p>
          </section>
        </main>
      </div>

      <!-- 实验室页面 -->
      <div id="lab" class="page">
        <main>
          <h1>实验室</h1>
          <div class="lab-list">
            <div class="lab-card">
              <h2><a href="#">923创新实验室</a></h2>
              <p>这里是923创新实验室的简介...</p>
            </div>
            <div class="lab-card">
              <h2><a href="#">925移动开发实验室</a></h2>
              <p>这里是925移动开发实验室的简介...</p>
            </div>
          </div>
        </main>
      </div>

      <!-- 教师队伍页面 -->
      <div id="teacher" class="page">
        <div class="sub-nav">
          <ul>
            <li><a href="#professors" onclick="showSection('professors')">教授</a></li>
            <li><a href="#associate-professors" onclick="showSection('associate-professors')">副教授</a></li>
            <li><a href="#lecturers" onclick="showSection('lecturers')">讲师</a></li>
          </ul>
        </div>
        <main>
          <section id="professors">
            <h1>教授</h1>
            <div class="teacher-list">
              <div class="teacher-card">
                <h2><a href="#">张教授</a></h2>
                <p>研究方向：软件工程、人工智能</p>
              </div>
            </div>
          </section>
          <section id="associate-professors" style="display:none;">
            <h1>副教授</h1>
            <div class="teacher-list">
              <div class="teacher-card">
                <h2><a href="#">李副教授</a></h2>
                <p>研究方向：移动开发、大数据</p>
              </div>
            </div>
          </section>
          <section id="lecturers" style="display:none;">
            <h1>讲师</h1>
            <div class="teacher-list">
              <div class="teacher-card">
                <h2><a href="#">王讲师</a></h2>
                <p>研究方向：前端开发、用户体验</p>
              </div>
            </div>
          </section>
        </main>
      </div>

      <!-- 就业指南页面 -->
      <div id="career" class="page">
        <div class="sub-nav">
          <ul>
            <li><a href="#industry" onclick="showSection('industry')">行业趋势</a></li>
            <li><a href="#companies" onclick="showSection('companies')">合作企业</a></li>
            <li><a href="#alumni" onclick="showSection('alumni')">校友风采</a></li>
          </ul>
        </div>
        <main>
          <section id="industry">
            <h1>行业趋势</h1>
            <p>这里是软件工程行业趋势的内容...</p>
          </section>
          <section id="companies" style="display:none;">
            <h1>合作企业</h1>
            <p>这里是合作企业的内容...</p>
          </section>
          <section id="alumni" style="display:none;">
            <h1>校友风采</h1>
            <p>这里是校友风采的内容...</p>
          </section>
        </main>
      </div>

      <!-- 新闻公告页面 -->
      <div id="news" class="page">
        <main>
          <section class="news-list">
            <h1>新闻</h1>
            <div class="news-item">
              <h2><a href="#">软件工程专业获得国家级认证</a></h2>
              <p>2023-06-15</p>
            </div>
            <div class="news-item">
              <h2><a href="#">学生团队在国家级竞赛中获奖</a></h2>
              <p>2023-05-20</p>
            </div>
          </section>
          <section class="notice-list">
            <h1>公告</h1>
            <div class="notice-item">
              <h2><a href="#">关于暑期实习报名的通知</a></h2>
              <p>2023-06-01</p>
            </div>
          </section>
        </main>
      </div>
    </main>
    <script>
      // 路由配置
      const routes = {
        '/': 'home',
        '/major': 'major',
        '/lab': 'lab',
        '/teacher': 'teacher',
        '/career': 'career',
        '/news': 'news'
      };

      // 路由处理函数
      function handleRoute() {
        const path = window.location.hash.slice(1) || '/';
        const pageId = routes[path];

        // 隐藏所有页面
        document.querySelectorAll('.page').forEach(page => {
          page.classList.remove('active');
        });

        // 显示当前页面
        if (pageId) {
          document.getElementById(pageId).classList.add('active');
          document.title = pageId === 'home' ? '软件工程专业网站' : 
            {'major':'专业介绍','lab':'实验室','teacher':'教师队伍','career':'就业指南','news':'新闻公告'}[pageId];
        }
      }

      // 子导航切换函数
      function showSection(sectionId) {
        // 隐藏同页面所有section
        const activePage = document.querySelector('.page.active');
        activePage.querySelectorAll('section').forEach(section => {
          section.style.display = 'none';
        });
        // 显示目标section
        activePage.querySelector('#' + sectionId).style.display = 'block';
      }

      // 监听hash变化
      window.addEventListener('hashchange', handleRoute);
      // 初始加载
      document.addEventListener('DOMContentLoaded', handleRoute);
    </script>
  </body>
</html>
