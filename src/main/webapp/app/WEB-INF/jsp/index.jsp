<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ include file="common-style.jsp"
%> <%@ page import="java.util.ArrayList, com.app.entity.News" %>
<jsp:useBean
  id="newsList"
  class="java.util.ArrayList"
  type="java.util.List"
  scope="request"
/>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>软件工程专业网站</title>
    <style>
      /* 添加路由容器样式 */
      #route-container {
        min-height: 400px;
        padding: 20px;
      }
      .page {
        display: none;
      }
      .page.active {
        display: block;
      }
      /* 整合各页面特有样式 */
      .lab-list {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 1rem;
        padding: 1rem;
      }
      .lab-card {
        border: 1px solid #ddd;
        padding: 1rem;
        border-radius: 4px;
      }
      .teacher-list {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 1rem;
        padding: 1rem;
      }
      .teacher-card {
        border: 1px solid #ddd;
        padding: 1rem;
        border-radius: 4px;
      }
      .news-list,
      .notice-list {
        padding: 1rem;
      }
      .news-item,
      .notice-item {
        margin-bottom: 1rem;
        padding: 1rem;
        border: 1px solid #ddd;
        border-radius: 4px;
      }
      /* 新闻表格样式 */
      .news-list table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 1rem;
      }
      .news-list th,
      .news-list td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }
      .news-list th {
        background-color: #f2f2f2;
      }
      .news-list tr:hover {
        background-color: #f9f9f9;
      }
      .news-tag {
        display: inline-block;
        background-color: #3498db;
        color: white;
        padding: 3px 8px;
        border-radius: 12px;
        font-size: 12px;
      }
      .notice-tag {
        display: inline-block;
        background-color: #e74c3c;
        color: white;
        padding: 3px 8px;
        border-radius: 12px;
        font-size: 12px;
      }
      /* 新增导航按钮样式 */
      .sub-nav .section-btn {
        background: none;
        border: none;
        padding: 8px 16px;
        margin: 0 4px;
        cursor: pointer;
        border-radius: 4px;
        transition: all 0.3s;
      }
      .sub-nav .section-btn:hover {
        background-color: #f0f0f0;
      }
      .sub-nav .section-btn.active {
        background-color: #3498db;
        color: white;
      }
      /* 卡片操作按钮样式 */
      .card-actions {
        margin-top: 15px;
        text-align: center;
      }
      .card-actions .btn {
        padding: 8px 16px;
        background: #3498db;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-size: 14px;
        transition: background 0.3s;
        display: inline-block;
      }
      .card-actions .btn:hover {
        background: #2980b9;
      }

      /* 详情页面样式 */
      .detail-header {
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 2px solid #ecf0f1;
      }
      .detail-header h1 {
        color: #2c3e50;
        margin-bottom: 10px;
      }
      .breadcrumb {
        color: #7f8c8d;
        font-size: 14px;
      }
      .breadcrumb a {
        color: #3498db;
        text-decoration: none;
      }
      .breadcrumb a:hover {
        text-decoration: underline;
      }

      /* 实验室详情样式 */
      .detail-content {
        margin-bottom: 40px;
      }
      .lab-overview, .research-directions, .lab-team, .lab-facilities, .recent-achievements, .contact-info {
        margin-bottom: 40px;
      }
      .direction-list, .facilities-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 20px;
        margin-top: 20px;
      }
      .direction-item, .facility-item {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
        border-left: 4px solid #3498db;
      }
      .direction-item h3, .facility-item h3 {
        margin-bottom: 15px;
        color: #2c3e50;
      }
      .team-member .member-info {
        display: flex;
        align-items: flex-start;
        gap: 20px;
        margin-bottom: 30px;
      }
      .member-photo {
        flex-shrink: 0;
      }
      .member-photo img {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
      }
      .member-details h4 {
        color: #2c3e50;
        margin-bottom: 10px;
      }
      .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 20px;
        margin-top: 20px;
      }
      .stat-item {
        text-align: center;
        background: #3498db;
        color: white;
        padding: 20px;
        border-radius: 8px;
      }
      .stat-number {
        font-size: 36px;
        font-weight: bold;
        line-height: 1;
      }
      .stat-label {
        margin-top: 8px;
        font-size: 14px;
      }
      .achievements-list {
        margin-top: 20px;
      }
      .achievement-item {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 15px;
        position: relative;
      }
      .achievement-date {
        position: absolute;
        top: 20px;
        right: 20px;
        background: #3498db;
        color: white;
        padding: 4px 12px;
        border-radius: 12px;
        font-size: 12px;
      }
      .contact-details p {
        margin-bottom: 8px;
      }

      /* 教师详情样式 */
      .teacher-detail {
        margin-bottom: 40px;
      }
      .teacher-profile {
        display: flex;
        align-items: flex-start;
        gap: 30px;
        margin-bottom: 40px;
        background: #f8f9fa;
        padding: 30px;
        border-radius: 12px;
      }
      .profile-photo {
        flex-shrink: 0;
      }
      .profile-photo img {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #3498db;
      }
      .profile-info h2 {
        color: #2c3e50;
        margin-bottom: 10px;
      }
      .profile-info .title {
        color: #7f8c8d;
        font-size: 18px;
        margin-bottom: 15px;
      }
      .profile-info .research {
        color: #27ae60;
        font-weight: 500;
        margin-bottom: 20px;
      }
      .contact-methods p {
        margin-bottom: 8px;
      }
      .detail-sections {
        max-width: none;
      }
      .detail-sections section {
        margin-bottom: 40px;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      }
      .detail-sections h3 {
        color: #2c3e50;
        border-bottom: 2px solid #3498db;
        padding-bottom: 10px;
        margin-bottom: 25px;
      }
      .education-list, .experience-list, .projects-list, .papers-list, .honors-list, .achievements-list {
        margin-top: 20px;
      }
      .education-item, .experience-item, .project-item, .honor-item {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 15px;
        border-left: 4px solid #3498db;
      }
      .education-item h4, .experience-item h4, .project-item h4, .honor-item h4 {
        color: #2c3e50;
        margin-bottom: 10px;
      }
      .courses-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 20px;
        margin-top: 20px;
      }
      .course-item {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
      }
      .course-item h4 {
        color: #2c3e50;
        margin-bottom: 15px;
      }
      .course-item ul {
        margin: 0;
        padding-left: 20px;
      }
      .course-item li {
        margin-bottom: 8px;
      }
      .paper-item {
        background: #f8f9fa;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 12px;
        font-size: 14px;
        line-height: 1.6;
      }
      .supervision-stats {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 20px;
        margin-bottom: 20px;
      }
      .stat-box {
        text-align: center;
        background: #3498db;
        color: white;
        padding: 20px;
        border-radius: 8px;
      }
      .stat-box .stat-number {
        font-size: 32px;
        font-weight: bold;
        line-height: 1;
      }
      .stat-box .stat-label {
        margin-top: 8px;
        font-size: 14px;
      }
      .supervision-note {
        background: #e8f5e8;
        padding: 15px;
        border-radius: 8px;
        color: #27ae60;
        font-style: italic;
      }
      .service-list ul {
        margin: 0;
        padding-left: 20px;
      }
      .service-list li {
        margin-bottom: 8px;
      }

      /* 操作栏样式 */
      .action-bar {
        display: flex;
        gap: 15px;
        padding: 20px 0;
        border-top: 1px solid #ecf0f1;
        margin-top: 40px;
      }
      .btn-secondary {
        background: #95a5a6;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background 0.3s;
      }
      .btn-secondary:hover {
        background: #7f8c8d;
      }
      .btn-primary {
        background: #3498db;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background 0.3s;
      }
      .btn-primary:hover {
        background: #2980b9;
      }
    </style>
  </head>
  <body>
    <%@ include file="header.jsp" %>
    <main id="route-container">
      <div id="home" class="page">
        <!-- 学院头部横幅 -->
        <div class="college-banner">
          <div class="banner-content">
            <h1>东北林业大学 计算机与控制工程学院</h1>
            <p>培养信息技术领域创新型人才，推动智能科技发展</p>
          </div>
        </div>

        <!-- 学院简介 -->
        <section class="college-intro">
          <div class="container">
            <h2>学院简介</h2>
            <div class="intro-content">
              <p>东北林业大学计算机与控制工程学院成立于2001年，是学校重点建设的工科学院之一。学院设有计算机科学与技术、自动化、电气工程及其自动化、物联网工程四个本科专业，拥有计算机科学与技术一级学科硕士点和控制科学与工程一级学科硕士点。</p>
              <p>学院坚持以教学为中心，以科研为支撑，注重学生创新ABILITY培养，先后承担国家自然科学基金、省部级科研项目多项，在人工智能、智能控制、林业信息化等领域形成了鲜明特色。</p>
            </div>
          </div>
        </section>

        <!-- 专业设置 -->
        <section class="majors">
          <div class="container">
            <h2>专业设置</h2>
            <div class="majors-grid">
              <div class="major-card">
                <h3>计算机科学与技术</h3>
                <p>培养掌握计算机科学理论与技术，能从事计算机系统设计、软件开发和应用的高级专门人才。</p>
              </div>
              <div class="major-card">
                <h3>自动化</h3>
                <p>培养具备自动化领域基础知识和专业技能，能在工业控制、智能系统等领域从事设计与研发的工程技术人才。</p>
              </div>
              <div class="major-card">
                <h3>电气工程及其自动化</h3>
                <p>培养掌握电气工程理论与技术，能在电力系统、电气传动等领域从事设计、运行和管理的高级工程技术人才。</p>
              </div>
              <div class="major-card">
                <h3>物联网工程</h3>
                <p>培养掌握物联网技术架构和应用开发，能在智能交通、环境监测等领域从事系统设计与集成的专业人才。</p>
              </div>
            </div>
          </div>
        </section>

        <!-- 师资力量 -->
        <section class="faculty">
          <div class="container">
            <h2>师资力量</h2>
            <div class="faculty-list">
              <div class="faculty-item">
                <div class="faculty-photo"></div>
                <div class="faculty-info">
                  <h3>张明教授</h3>
                  <p>院长，博士生导师，研究方向：人工智能与模式识别</p>
                </div>
              </div>
              <div class="faculty-item">
                <div class="faculty-photo"></div>
                <div class="faculty-info">
                  <h3>李华教授</h3>
                  <p>副院长，硕士生导师，研究方向：智能控制与自动化</p>
                </div>
              </div>
              <div class="faculty-item">
                <div class="faculty-photo"></div>
                <div class="faculty-info">
                  <h3>王强副教授</h3>
                  <p>计算机系主任，研究方向：计算机网络与信息安全</p>
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- 科研成果 -->
        <section class="research">
          <div class="container">
            <h2>科研成果</h2>
            <div class="research-list">
              <div class="research-item">
                <h3>基于深度学习的林业病虫害识别系统</h3>
                <p>国家自然科学基金项目，实现了林业病虫害的自动识别与预警</p>
              </div>
              <div class="research-item">
                <h3>智能林业监测平台</h3>
                <p>黑龙江省科技攻关项目，集成物联网技术实现森林资源动态监测</p>
              </div>
              <div class="research-item">
                <h3>工业机器人智能控制系统</h3>
                <p>企业合作项目，开发了具有自主知识产权的工业机器人控制系统</p>
              </div>
            </div>
          </div>
        </section>

        <!-- 新闻公告 -->
        <section class="news">
          <div class="container">
            <h2>学院公告</h2>
            <div class="news-list">
              <div class="news-item">
                <span class="news-date">2023-09-15</span>
                <a href="#">我院举办人工智能前沿技术研讨会</a>
              </div>
              <div class="news-item">
                <span class="news-date">2023-09-10</span>
                <a href="#">2023级新生开学典礼顺利举行</a>
              </div>
              <div class="news-item">
                <span class="news-date">2023-09-01</span>
                <a href="#">我院学子在全国大学生数学建模竞赛中取得佳绩</a>
              </div>
            </div>
          </div>
        </section>
      </div>
      <!-- 专业内容 -->
      <div id="major" class="page">
        <div class="hero-banner" style="background: linear-gradient(rgba(44, 62, 80, 0.8), rgba(44, 62, 80, 0.9)), url('https://via.placeholder.com/1200x400'); background-size: cover; color: white; padding: 4rem 0; text-align: center;">
          <div class="container">
            <h1 style="font-size: 2.5rem; margin-bottom: 1rem;">软件工程专业</h1>
            <p style="font-size: 1.2rem; max-width: 800px; margin: 0 auto;">培养具有扎实理论基础、较强实践能力和创新精神的高级软件工程技术人才</p>
            <div style="margin-top: 2rem;">
              <a href="#/directions" class="btn" style="display: inline-block; background: #3498db; color: white; padding: 0.8rem 2rem; border-radius: 4px; text-decoration: none; font-weight: bold;">了解专业方向</a>
            </div>
          </div>
        </div>

        <main class="container">
          <section id="intro">
            <h1>专业简介</h1>
            <div class="card">
              <p>软件工程专业成立于2005年，是学校重点建设的特色专业，2020年入选国家级一流本科专业建设点。专业以培养具备软件工程理论与实践能力的高素质人才为目标，注重学生创新能力和工程实践能力的培养。</p>
              <p>本专业拥有一支结构合理、教学经验丰富的教师队伍，其中教授8人，副教授12人，学位教师占比85%。近年来，专业教师主持国家级科研项目10余项，省部级项目20余项，发表高水平学术论文100余篇。</p>
            </div>
          </section>

          <!-- 添加专业亮点区域 -->
          <section id="highlights" style="margin-top: 3rem;">
            <h2>专业亮点</h2>
            <div class="lab-list">
              <div class="card">
                <h3>国家级一流本科专业</h3>
                <p>2020年入选国家级一流本科专业建设点，教学质量和专业水平得到国家认可</p>
              </div>
              <div class="card">
                <h3>校企深度合作</h3>
                <p>与华为、阿里巴巴、腾讯等知名企业建立长期合作关系，共建实习基地15个</p>
              </div>
              <div class="card">
                <h3>创新创业教育</h3>
                <p>近三年学生获国家级创新创业竞赛奖项30余项，省级奖项50余项</p>
              </div>
            </div>
          </section>

          <!-- 添加统计数据区域 -->
          <section id="statistics" style="margin-top: 3rem;">
            <h2>专业统计</h2>
            <div class="stats-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; text-align: center;">
              <div class="card">
                <div style="font-size: 3rem; font-weight: bold; color: #3498db;">1500+</div>
                <div>毕业生人数</div>
              </div>
              <div class="card">
                <div style="font-size: 3rem; font-weight: bold; color: #3498db;">98.5%</div>
                <div>就业率</div>
              </div>
              <div class="card">
                <div style="font-size: 3rem; font-weight: bold; color: #3498db;">12K+</div>
                <div>平均起薪(元/月)</div>
              </div>
              <div class="card">
                <div style="font-size: 3rem; font-weight: bold; color: #3498db;">30+</div>
                <div>合作企业</div>
              </div>
            </div>
          </section>

          <!-- 新闻公告区域 -->
          <section id="news-announcements" style="margin-top: 3rem;">
            <h2>信息展示</h2>
            <div class="news-list">
              <!-- 新闻项1 -->
              <div class="news-item">
                <h3>2023-2024学年第二学期软件工程专业教学计划</h3>
                <p>本学期软件工程专业将开设人工智能、大数据分析等新课程，欢迎同学们积极选修。具体课程安排请查看教务处通知。</p>
                <span class="news-date">2024-02-15</span>
              </div>
              <!-- 新闻项2 -->
              <div class="news-item">
                <h3>第九届"软件杯"编程大赛校内选拔赛通知</h3>
                <p>我校将举办第九届"软件杯"编程大赛校内选拔赛，报名时间为3月1日至3月15日，比赛时间为4月10日。</p>
                <span class="news-date">2024-02-20</span>
              </div>
              <!-- 新闻项3 -->
              <div class="news-item">
                <h3>软件工程专业与华为公司签署校企合作协议</h3>
                <p>我校软件工程专业与华为技术有限公司正式签署校企合作协议，将在人才培养、实习基地建设等方面开展深度合作。</p>
                <span class="news-date">2024-03-05</span>
              </div>
            </div>
          </section>
        </main>
      </div>

      <!-- 专业方向页面 -->
      <div id="directions" class="page">
        <div class="sub-nav">
          <div class="container">
            <ul>
              <li><button class="section-btn active" onclick="showSection('ai-direction', this)">人工智能</button></li>
              <li><button class="section-btn" onclick="showSection('web-direction', this)">Web开发</button></li>
              <li><button class="section-btn" onclick="showSection('mobile-direction', this)">移动应用开发</button></li>
              <li><button class="section-btn" onclick="showSection('security-direction', this)">网络安全</button></li>
            </ul>
          </div>
        </div>
        <main class="container">
          <section id="ai-direction">
            <h1>人工智能方向</h1>
            <div class="card">
              <h2>培养目标</h2>
              <p>培养掌握人工智能基本理论、方法和技术，能从事机器学习、自然语言处理、计算机视觉等领域研究与应用开发的高级专门人才。</p>

              <h2>核心课程</h2>
              <ul>
                <li>人工智能导论</li>
                <li>机器学习</li>
                <li>深度学习</li>
                <li>自然语言处理</li>
                <li>计算机视觉</li>
                <li>数据挖掘</li>
                <li>智能系统设计</li>
              </ul>

              <h2>就业方向</h2>
              <p>毕业生可在互联网公司、科研院所、金融机构等单位从事人工智能算法工程师、机器学习工程师、数据科学家等工作。</p>

              <h2>实践项目</h2>
              <ul>
                <li>基于深度学习的图像识别系统</li>
                <li>智能问答系统设计与实现</li>
                <li>推荐系统开发</li>
                <li>自动驾驶仿真平台开发</li>
              </ul>
            </div>
          </section>

          <section id="web-direction" style="display: none">
            <h1>Web开发方向</h1>
            <div class="card">
              <h2>培养目标</h2>
              <p>培养掌握现代Web开发技术，能从事大型网站设计与开发、Web应用系统架构设计的高级专门人才。</p>

              <h2>核心课程</h2>
              <ul>
                <li>Web前端开发</li>
                <li>后端开发技术</li>
                <li>数据库系统原理</li>
                <li>Web框架应用</li>
                <li>分布式系统</li>
                <li>微服务架构</li>
                <li>DevOps实践</li>
              </ul>

              <h2>就业方向</h2>
              <p>毕业生可在各类IT企业从事Web前端工程师、后端开发工程师、全栈开发工程师、系统架构师等工作。</p>
            </div>
          </section>

          <section id="mobile-direction" style="display: none">
            <h1>移动应用开发方向</h1>
            <div class="card">
              <h2>培养目标</h2>
              <p>培养掌握移动应用开发技术，能从事iOS、Android平台应用开发和跨平台移动应用开发的高级专门人才。</p>

              <h2>核心课程</h2>
              <ul>
                <li>移动应用开发基础</li>
                <li>iOS应用开发</li>
                <li>Android应用开发</li>
                <li>跨平台应用开发</li>
                <li>移动UI设计</li>
                <li>移动应用性能优化</li>
                <li>移动后端开发</li>
              </ul>
            </div>
          </section>

          <section id="security-direction" style="display: none">
            <h1>网络安全方向</h1>
            <div class="card">
              <h2>培养目标</h2>
              <p>培养掌握网络安全基本理论和技术，能从事网络安全防护、渗透测试、信息安全管理的高级专门人才。</p>

              <h2>核心课程</h2>
              <ul>
                <li>网络安全导论</li>
                <li>密码学</li>
                <li>操作系统安全</li>
                <li>网络攻击与防御</li>
                <li>Web安全</li>
                <li>移动安全</li>
                <li>数字取证技术</li>
              </ul>
            </div>
          </section>
        </main>
      </div>

      <!-- 实验室页面 -->
      <div id="lab" class="page">
        <main>
          <h1>实验室</h1>
          <div class="lab-list">
            <div class="lab-card card">
              <h2><a href="#/lab/923">923创新实验室</a></h2>
              <p>923创新实验室成立于2015年，专注于人工智能与机器学习研究。实验室配备了高性能GPU服务器和先进的开发环境，支持深度学习模型训练与部署。</p>
              <div class="card-actions">
                <a href="#/lab/923" class="btn btn-primary">查看详情</a>
              </div>
            </div>
            <div class="lab-card card">
              <h2><a href="#/lab/925">925移动开发实验室</a></h2>
              <p>925移动开发实验室专注于移动应用开发与跨平台技术研究，拥有iOS和Android开发环境，以及各类移动设备测试平台。</p>
              <div class="card-actions">
                <a href="#/lab/925" class="btn btn-primary">查看详情</a>
              </div>
            </div>
            <div class="lab-card card">
              <h2><a href="#/lab/927">927网络安全实验室</a></h2>
              <p>927网络安全实验室致力于网络安全技术研究与攻防演练，配备专业的网络安全设备和攻防模拟平台。</p>
              <div class="card-actions">
                <a href="#/lab/927" class="btn btn-primary">查看详情</a>
              </div>
            </div>
          </div>
        </main>
      </div>

      <!-- 教师队伍页面 -->
      <div id="teacher" class="page">
        <div class="sub-nav">
          <div class="container">
            <ul>
              <li><button class="section-btn active" onclick="showSection('professors', this)">教授</button></li>
              <li><button class="section-btn" onclick="showSection('associate-professors', this)">副教授</button></li>
              <li><button class="section-btn" onclick="showSection('lecturers', this)">讲师</button></li>
            </ul>
          </div>
        </div>
        <main class="container">
          <section id="professors">
            <h1>教授</h1>
            <div class="teacher-list">
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="李教授照片">
                <h2><a href="#/teacher/li">李教授</a></h2>
                <p>博士，博士生导师，软件工程系主任</p>
                <p>研究方向：人工智能、机器学习、模式识别</p>
                <div class="card-actions">
                  <a href="#/teacher/li" class="btn btn-primary">查看详情</a>
                </div>
              </div>
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="张教授照片">
                <h2><a href="#/teacher/zhang">张教授</a></h2>
                <p>博士，博士生导师</p>
                <p>研究方向：网络安全、区块链技术</p>
                <div class="card-actions">
                  <a href="#/teacher/zhang" class="btn btn-primary">查看详情</a>
                </div>
              </div>
            </div>
          </section>
          <section id="associate-professors" style="display: none">
            <h1>副教授</h1>
            <div class="teacher-list">
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="王副教授照片">
                <h2><a href="#/teacher/wang">王副教授</a></h2>
                <p>博士，硕士生导师</p>
                <p>研究方向：移动计算、嵌入式系统</p>
                <div class="card-actions">
                  <a href="#/teacher/wang" class="btn btn-primary">查看详情</a>
                </div>
              </div>
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="陈副教授照片">
                <h2><a href="#/teacher/chen">陈副教授</a></h2>
                <p>博士，硕士生导师</p>
                <p>研究方向：数据库系统、大数据技术</p>
                <div class="card-actions">
                  <a href="#/teacher/chen" class="btn btn-primary">查看详情</a>
                </div>
              </div>
            </div>
          </section>
          <section id="lecturers" style="display: none">
            <h1>讲师</h1>
            <div class="teacher-list">
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="刘讲师照片">
                <h2><a href="#/teacher/liu">刘讲师</a></h2>
                <p>硕士</p>
                <p>研究方向：Web开发、前端技术</p>
                <div class="card-actions">
                  <a href="#/teacher/liu" class="btn btn-primary">查看详情</a>
                </div>
              </div>
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="赵讲师照片">
                <h2><a href="#/teacher/zhao">赵讲师</a></h2>
                <p>硕士</p>
                <p>研究方向：软件测试、质量保证</p>
                <div class="card-actions">
                  <a href="#/teacher/zhao" class="btn btn-primary">查看详情</a>
                </div>
              </div>
            </div>
          </section>
        </main>
      </div>

      <!-- 就业指南页面 -->
      <div id="career" class="page">
        <div class="sub-nav">
          <ul>
            <li><button class="section-btn active" onclick="showSection('industry', this)">行业趋势</button></li>
            <li><button class="section-btn" onclick="showSection('companies', this)">合作企业</button></li>
            <li><button class="section-btn" onclick="showSection('alumni', this)">校友风采</button></li>
          </ul>
        </div>
        <main>
          <section id="industry">
            <h1>行业趋势</h1>
            <div class="card">
              <h2>软件工程行业发展趋势分析</h2>
              <p>随着数字化转形的深入，软件工程行业正呈现以下发展趋势：</p>
              <ol>
                <li><strong>人工智能与机器学习融合</strong>：AI技术正逐步融入各类软件产品，智能推荐、自动化决策等功能成为标配</li>
                <li><strong>低代码/无代码开发普及</strong>：可视化编程工具降低开发门槛，加速应用交付</li>
                <li><strong>云原生架构转型</strong>：微服务、容器化、DevOps等技术广泛应用，提升系统弹性和可扩展性</li>
                <li><strong>数据安全与隐私保护加强</strong>：随着数据法规完善，安全开发成为必备能力</li>
                <li><strong>元宇宙与虚拟现实技术</strong>：在教育、医疗、娱乐等领域开辟新应用场景</li>
              </ol>
              <h3>热门技术岗位需求</h3>
              <ul>
                <li>人工智能工程师：平均薪资15-30K/月</li>
                <li>大数据开发工程师：平均薪资12-25K/月</li>
                <li>云计算架构师：平均薪资20-40K/月</li>
                <li>网络安全工程师：平均薪资15-30K/月</li>
                <li>全栈开发工程师：平均薪资12-25K/月</li>
              </ul>
            </div>
          </section>
          <section id="companies" style="display: none">
            <h1>合作企业</h1>
            <div class="lab-list">
              <div class="card">
                <h2>华为技术有限公司</h2>
                <p>合作领域：人工智能、云计算、5G技术</p>
                <p>合作形式：实习基地、联合培养、科研合作</p>
                <p>每年招聘人数：约30人</p>
                <p>典型岗位：软件开发工程师、算法工程师、云计算工程师</p>
              </div>
              <div class="card">
                <h2>阿里巴巴集团</h2>
                <p>合作领域：大数据、电子商务、移动应用开发</p>
                <p>合作形式：实习基地、技术讲座、竞赛赞助</p>
                <p>每年招聘人数：约25人</p>
                <p>典型岗位：大数据开发工程师、前端开发工程师、测试工程师</p>
              </div>
              <div class="card">
                <h2>腾讯科技有限公司</h2>
                <p>合作领域：游戏开发、社交网络、人工智能</p>
                <p>合作形式：实习基地、联合实验室、校园招聘</p>
                <p>每年招聘人数：约20人</p>
                <p>典型岗位：游戏开发工程师、后端开发工程师、AI算法工程师</p>
              </div>
            </div>
          </section>
          <section id="alumni" style="display: none">
            <h1>校友风采</h1>
            <div class="lab-list">
              <div class="card">
                <h2>张明 (2015届毕业生)</h2>
                <p>现任：字节跳动高级技术总监</p>
                <p>主要成就：带领团队开发了短视频推荐算法系统，用户规模过亿</p>
                <p>薪资水平：年薪80万+股票</p>
                <p>寄语："扎实的基础+持续学习能力是软件工程领域立足的关键"</p>
              </div>
              <div class="card">
                <h2>李娜 (2018届毕业生)</h2>
                <p>现任：微软亚洲研究院研究员</p>
                <p">主要成就：在国际顶会发表论文5篇，参与开发了多个自然语言处理模型</p>
                <p>薪资水平：年薪60万+科研奖励</p>
                <p>寄语："保持对技术的热情和好奇，勇于挑战前沿问题</p>
              </div>
            </div>
          </section>
        </main>
      </div>

      <!-- 新闻公告页面 -->
      <div id="news" class="page">
        <main>
          <h1>新闻公告</h1>
          <div class="news-list">
            <section id="news-announcements">
              <h2>新闻公告</h2>
              <div class="news-list">
                <c:forEach items="${latestNews}" var="news">
                  <div class="news-item">
                    <h3>${news.title}</h3>
                    <p>${news.content}</p>
                    <span class="news-date">${news.publishTime}</span>
                  </div>
                </c:forEach>
              </div>
            </section>
          </div>
        </main>
      </div>

      <!-- 实验室详情页面 -->
      <div id="lab-923" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>923创新实验室</h1>
            <div class="breadcrumb">
              <a href="#/lab">实验室</a> > <span>923创新实验室</span>
            </div>
          </div>

          <div class="detail-content">
            <div class="lab-image">
              <img src="https://via.placeholder.com/800x400" alt="923创新实验室" style="width: 100%; height: 400px; object-fit: cover; border-radius: 8px;">
            </div>

            <div class="lab-overview">
              <h2>实验室简介</h2>
              <p>923创新实验室成立于2015年，是计算机与控制工程学院重点建设的人工智能研究基地。实验室专注于人工智能与机器学习领域的前沿技术研究，拥有完善的硬件设施和先进的软件环境。实验室配备高性能GPU服务器集群、深度学习工作站以及各类专业开发工具，为师生提供优质的科研和学习平台。</p>

              <p>近年来，实验室成员在多项国家级人工智能竞赛中获奖，包括全国大学生数学建模竞赛、"挑战杯"全国大学生课外学术科技作品竞赛等。实验室还与华为、百度、阿里巴巴等知名企业建立了紧密的合作关系，为学生提供实习和就业机会。</p>
            </div>

            <div class="research-directions">
              <h2>主要研究方向</h2>
              <div class="direction-list">
                <div class="direction-item">
                  <h3>🤖 自然语言处理与大语言模型应用</h3>
                  <ul>
                    <li>大语言模型的微调与优化</li>
                    <li>智能问答系统开发</li>
                    <li>文本分析与情感识别</li>
                    <li>机器翻译技术研究</li>
                  </ul>
                </div>
                <div class="direction-item">
                  <h3>👁️ 计算机视觉与图像识别</h3>
                  <ul>
                    <li>深度学习图像分类</li>
                    <li>目标检测与跟踪</li>
                    <li>人脸识别技术</li>
                    <li>医学影像分析</li>
                  </ul>
                </div>
                <div class="direction-item">
                  <h3>🎯 强化学习与智能决策系统</h3>
                  <ul>
                    <li>多智能体强化学习</li>
                    <li>游戏AI开发</li>
                    <li>自动驾驶决策系统</li>
                    <li>智能推荐算法</li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="lab-team">
              <h2>实验室团队</h2>
              <div class="team-member">
                <h3>实验室负责人</h3>
                <div class="member-info">
                  <img src="https://via.placeholder.com/120" alt="李教授" class="member-photo">
                  <div class="member-details">
                    <h4>李教授</h4>
                    <p>博士生导师，软件工程系主任</p>
                    <p><strong>研究方向：</strong>人工智能、机器学习、模式识别</p>
                    <p><strong>学术成果：</strong>主持国家级科研项目3项，发表SCI论文20余篇</p>
                    <p><strong>联系方式：</strong>li@nefu.edu.cn</p>
                  </div>
                </div>
              </div>

              <div class="team-stats">
                <h3>团队规模</h3>
                <div class="stats-grid">
                  <div class="stat-item">
                    <div class="stat-number">1</div>
                    <div class="stat-label">教授</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">2</div>
                    <div class="stat-label">副教授</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">15</div>
                    <div class="stat-label">研究生</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">25</div>
                    <div class="stat-label">本科生</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="lab-facilities">
              <h2>实验室设施</h2>
              <div class="facilities-grid">
                <div class="facility-item">
                  <h3>🖥️ 硬件设施</h3>
                  <ul>
                    <li>NVIDIA RTX 4090 GPU服务器 × 8台</li>
                    <li>高性能工作站 × 20台</li>
                    <li>大容量存储系统 × 1套</li>
                    <li>高速网络交换设备 × 1套</li>
                  </ul>
                </div>
                <div class="facility-item">
                  <h3>💻 软件环境</h3>
                  <ul>
                    <li>TensorFlow、PyTorch深度学习框架</li>
                    <li>CUDA并行计算平台</li>
                    <li>Jupyter Lab开发环境</li>
                    <li>Docker容器化部署平台</li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="recent-achievements">
              <h2>近期成果</h2>
              <div class="achievements-list">
                <div class="achievement-item">
                  <h3>2023年全国大学生数学建模竞赛</h3>
                  <p>实验室学生团队获得国家一等奖2项，二等奖3项</p>
                  <span class="achievement-date">2023年10月</span>
                </div>
                <div class="achievement-item">
                  <h3>"挑战杯"全国大学生课外学术科技作品竞赛</h3>
                  <p>《基于深度学习的森林火灾预警系统》获得省级特等奖</p>
                  <span class="achievement-date">2023年8月</span>
                </div>
                <div class="achievement-item">
                  <h3>国家自然科学基金青年项目</h3>
                  <p>《面向复杂场景的多模态情感识别关键技术研究》获得立项</p>
                  <span class="achievement-date">2023年3月</span>
                </div>
              </div>
            </div>

            <div class="contact-info">
              <h2>联系方式</h2>
              <div class="contact-details">
                <p><strong>地址：</strong>东北林业大学计算机与控制工程学院 923室</p>
                <p><strong>电话：</strong>0451-82191234</p>
                <p><strong>邮箱：</strong>lab923@nefu.edu.cn</p>
                <p><strong>开放时间：</strong>周一至周五 8:00-18:00</p>
              </div>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/lab" class="btn btn-secondary">返回实验室列表</a>
            <a href="#/teacher/li" class="btn btn-primary">联系负责人</a>
          </div>
        </main>
      </div>

      <div id="lab-925" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>925移动开发实验室</h1>
            <div class="breadcrumb">
              <a href="#/lab">实验室</a> > <span>925移动开发实验室</span>
            </div>
          </div>

          <div class="detail-content">
            <div class="lab-image">
              <img src="https://via.placeholder.com/800x400" alt="925移动开发实验室" style="width: 100%; height: 400px; object-fit: cover; border-radius: 8px;">
            </div>

            <div class="lab-overview">
              <h2>实验室简介</h2>
              <p>925移动开发实验室成立于2016年，专注于移动应用开发与跨平台技术研究。实验室拥有完善的iOS和Android开发环境，配备各类主流移动设备测试平台，为移动应用开发提供全方位的技术支持。</p>

              <p>实验室与华为、小米、OPPO等知名手机厂商以及腾讯、阿里巴巴等互联网企业保持密切合作，为学生提供丰富的实习和项目开发机会。近年来，实验室开发的多款移动应用在各大应用商店获得好评。</p>
            </div>

            <div class="research-directions">
              <h2>主要研究方向</h2>
              <div class="direction-list">
                <div class="direction-item">
                  <h3>📱 跨平台应用开发</h3>
                  <ul>
                    <li>Flutter跨平台开发</li>
                    <li>React Native应用开发</li>
                    <li>Uni-app小程序开发</li>
                    <li>Ionic混合应用开发</li>
                  </ul>
                </div>
                <div class="direction-item">
                  <h3>⚡ 移动应用性能优化</h3>
                  <ul>
                    <li>应用启动速度优化</li>
                    <li>内存使用优化</li>
                    <li>网络请求优化</li>
                    <li>用户界面流畅度提升</li>
                  </ul>
                </div>
                <div class="direction-item">
                  <h3>🌐 物联网与移动设备互联</h3>
                  <ul>
                    <li>蓝牙设备连接</li>
                    <li>WiFi设备控制</li>
                    <li>NFC近场通信</li>
                    <li>智能家居控制系统</li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="lab-team">
              <h2>实验室团队</h2>
              <div class="team-member">
                <h3>实验室负责人</h3>
                <div class="member-info">
                  <img src="https://via.placeholder.com/120" alt="王副教授" class="member-photo">
                  <div class="member-details">
                    <h4>王副教授</h4>
                    <p>博士，硕士生导师</p>
                    <p><strong>研究方向：</strong>移动计算、嵌入式系统</p>
                    <p><strong>学术成果：</strong>参与省部级项目2项，发表EI论文10余篇</p>
                    <p><strong>联系方式：</strong>wang@nefu.edu.cn</p>
                  </div>
                </div>
              </div>

              <div class="team-stats">
                <h3>团队规模</h3>
                <div class="stats-grid">
                  <div class="stat-item">
                    <div class="stat-number">1</div>
                    <div class="stat-label">副教授</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">2</div>
                    <div class="stat-label">讲师</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">12</div>
                    <div class="stat-label">研究生</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">30</div>
                    <div class="stat-label">本科生</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="recent-achievements">
              <h2>近期成果</h2>
              <div class="achievements-list">
                <div class="achievement-item">
                  <h3>校园导航移动应用</h3>
                  <p>开发的校园导航APP在各大应用商店下载量突破10万次</p>
                  <span class="achievement-date">2023年9月</span>
                </div>
                <div class="achievement-item">
                  <h3>全国移动应用创新大赛</h3>
                  <p>学生作品《智慧林业管理系统》获得全国二等奖</p>
                  <span class="achievement-date">2023年7月</span>
                </div>
                <div class="achievement-item">
                  <h3>企业合作项目</h3>
                  <p>与华为技术有限公司合作开发的IoT控制应用成功上线</p>
                  <span class="achievement-date">2023年5月</span>
                </div>
              </div>
            </div>

            <div class="contact-info">
              <h2>联系方式</h2>
              <div class="contact-details">
                <p><strong>地址：</strong>东北林业大学计算机与控制工程学院 925室</p>
                <p><strong>电话：</strong>0451-82191235</p>
                <p><strong>邮箱：</strong>lab925@nefu.edu.cn</p>
                <p><strong>开放时间：</strong>周一至周五 8:00-18:00</p>
              </div>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/lab" class="btn btn-secondary">返回实验室列表</a>
            <a href="#/teacher/wang" class="btn btn-primary">联系负责人</a>
          </div>
        </main>
      </div>

      <div id="lab-927" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>927网络安全实验室</h1>
            <div class="breadcrumb">
              <a href="#/lab">实验室</a> > <span>927网络安全实验室</span>
            </div>
          </div>

          <div class="detail-content">
            <div class="lab-image">
              <img src="https://via.placeholder.com/800x400" alt="927网络安全实验室" style="width: 100%; height: 400px; object-fit: cover; border-radius: 8px;">
            </div>

            <div class="lab-overview">
              <h2>实验室简介</h2>
              <p>927网络安全实验室成立于2017年，致力于网络安全技术研究与攻防演练。实验室配备专业的网络安全设备和攻防模拟平台，为网络安全人才培养提供完善的实践环境。</p>

              <p>实验室定期组织网络安全竞赛和培训，培养学生的网络安全防护能力。与国内多家网络安全公司建立合作关系，为学生提供专业的实习和就业机会。实验室学生在各类网络安全竞赛中屡获佳绩。</p>
            </div>

            <div class="research-directions">
              <h2>主要研究方向</h2>
              <div class="direction-list">
                <div class="direction-item">
                  <h3>🛡️ Web安全与渗透测试</h3>
                  <ul>
                    <li>Web应用漏洞挖掘</li>
                    <li>渗透测试方法研究</li>
                    <li>安全代码审计</li>
                    <li>WAF绕过技术</li>
                  </ul>
                </div>
                <div class="direction-item">
                  <h3>⛓️ 区块链安全技术</h3>
                  <ul>
                    <li>智能合约安全审计</li>
                    <li>区块链共识机制安全</li>
                    <li>数字货币安全</li>
                    <li>DeFi协议安全</li>
                  </ul>
                </div>
                <div class="direction-item">
                  <h3>🔐 数据加密与隐私保护</h3>
                  <ul>
                    <li>同态加密技术</li>
                    <li>差分隐私保护</li>
                    <li>多方安全计算</li>
                    <li>零知识证明</li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="lab-team">
              <h2>实验室团队</h2>
              <div class="team-member">
                <h3>实验室负责人</h3>
                <div class="member-info">
                  <img src="https://via.placeholder.com/120" alt="张教授" class="member-photo">
                  <div class="member-details">
                    <h4>张教授</h4>
                    <p>博士，博士生导师</p>
                    <p><strong>研究方向：</strong>网络安全、区块链技术</p>
                    <p><strong>学术成果：</strong>主持国家级科研项目2项，省部级项目3项</p>
                    <p><strong>联系方式：</strong>zhang@nefu.edu.cn</p>
                  </div>
                </div>
              </div>

              <div class="team-stats">
                <h3>团队规模</h3>
                <div class="stats-grid">
                  <div class="stat-item">
                    <div class="stat-number">1</div>
                    <div class="stat-label">教授</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">1</div>
                    <div class="stat-label">副教授</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">10</div>
                    <div class="stat-label">研究生</div>
                  </div>
                  <div class="stat-item">
                    <div class="stat-number">20</div>
                    <div class="stat-label">本科生</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="recent-achievements">
              <h2>近期成果</h2>
              <div class="achievements-list">
                <div class="achievement-item">
                  <h3>全国大学生信息安全竞赛</h3>
                  <p>实验室学生团队获得全国一等奖1项，二等奖2项</p>
                  <span class="achievement-date">2023年11月</span>
                </div>
                <div class="achievement-item">
                  <h3>网络安全态势感知系统</h3>
                  <p>与企业合作开发的网络安全监控系统成功部署上线</p>
                  <span class="achievement-date">2023年8月</span>
                </div>
                <div class="achievement-item">
                  <h3>区块链安全研究论文</h3>
                  <p>在国际顶级期刊发表区块链安全相关论文2篇</p>
                  <span class="achievement-date">2023年6月</span>
                </div>
              </div>
            </div>

            <div class="contact-info">
              <h2>联系方式</h2>
              <div class="contact-details">
                <p><strong>地址：</strong>东北林业大学计算机与控制工程学院 927室</p>
                <p><strong>电话：</strong>0451-82191236</p>
                <p><strong>邮箱：</strong>lab927@nefu.edu.cn</p>
                <p><strong>开放时间：</strong>周一至周五 8:00-18:00</p>
              </div>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/lab" class="btn btn-secondary">返回实验室列表</a>
            <a href="#/teacher/zhang" class="btn btn-primary">联系负责人</a>
          </div>
        </main>
      </div>

      <!-- 教师详情页面 -->
      <div id="teacher-li" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>李教授 - 个人简介</h1>
            <div class="breadcrumb">
              <a href="#/teacher">教师队伍</a> > <span>李教授</span>
            </div>
          </div>

          <div class="teacher-detail">
            <div class="teacher-profile">
              <div class="profile-photo">
                <img src="https://via.placeholder.com/200" alt="李教授照片">
              </div>
              <div class="profile-info">
                <h2>李教授</h2>
                <p class="title">博士，博士生导师，软件工程系主任</p>
                <p class="research">主要研究方向：人工智能、机器学习、模式识别</p>
                <div class="contact-methods">
                  <p><strong>邮箱：</strong>li@nefu.edu.cn</p>
                  <p><strong>办公室：</strong>计算机学院B座503室</p>
                  <p><strong>电话：</strong>0451-82191234</p>
                  <p><strong>办公时间：</strong>周一至周五 9:00-17:00</p>
                </div>
              </div>
            </div>

            <div class="detail-sections">
              <section class="academic-background">
                <h3>教育背景</h3>
                <div class="education-list">
                  <div class="education-item">
                    <h4>博士学位</h4>
                    <p>哈尔滨工业大学 计算机科学与技术专业 (2008-2012)</p>
                    <p>研究方向：机器学习与模式识别</p>
                  </div>
                  <div class="education-item">
                    <h4>硕士学位</h4>
                    <p>东北大学 计算机应用技术专业 (2005-2008)</p>
                    <p>研究方向：数据挖掘与知识发现</p>
                  </div>
                  <div class="education-item">
                    <h4>学士学位</h4>
                    <p>大连理工大学 计算机科学与技术专业 (2001-2005)</p>
                  </div>
                </div>
              </section>

              <section class="work-experience">
                <h3>工作经历</h3>
                <div class="experience-list">
                  <div class="experience-item">
                    <h4>2018年至今</h4>
                    <p>东北林业大学 计算机与控制工程学院 教授、系主任</p>
                  </div>
                  <div class="experience-item">
                    <h4>2015-2018年</h4>
                    <p>东北林业大学 计算机与控制工程学院 副教授</p>
                  </div>
                  <div class="experience-item">
                    <h4>2012-2015年</h4>
                    <p>东北林业大学 计算机与控制工程学院 讲师</p>
                  </div>
                  <div class="experience-item">
                    <h4>2019-2020年</h4>
                    <p>斯坦福大学 访问学者（人工智能实验室）</p>
                  </div>
                </div>
              </section>

              <section class="teaching-courses">
                <h3>主讲课程</h3>
                <div class="courses-grid">
                  <div class="course-item">
                    <h4>本科生课程</h4>
                    <ul>
                      <li>人工智能导论</li>
                      <li>机器学习基础</li>
                      <li>数据结构与算法</li>
                      <li>Python程序设计</li>
                    </ul>
                  </div>
                  <div class="course-item">
                    <h4>研究生课程</h4>
                    <ul>
                      <li>深度学习理论与应用</li>
                      <li>模式识别与图像处理</li>
                      <li>高级机器学习</li>
                      <li>人工智能前沿技术</li>
                    </ul>
                  </div>
                </div>
              </section>

              <section class="research-projects">
                <h3>科研项目</h3>
                <div class="projects-list">
                  <div class="project-item">
                    <h4>国家自然科学基金面上项目</h4>
                    <p><strong>项目名称：</strong>基于深度强化学习的智能决策算法研究</p>
                    <p><strong>项目编号：</strong>62076045</p>
                    <p><strong>项目时间：</strong>2021-2024年</p>
                    <p><strong>经费：</strong>58万元</p>
                    <p><strong>角色：</strong>项目负责人</p>
                  </div>
                  <div class="project-item">
                    <h4>国家自然科学基金青年项目</h4>
                    <p><strong>项目名称：</strong>面向大规模数据的增量学习算法研究</p>
                    <p><strong>项目编号：</strong>61806042</p>
                    <p><strong>项目时间：</strong>2019-2021年</p>
                    <p><strong>经费：</strong>25万元</p>
                    <p><strong>角色：</strong>项目负责人</p>
                  </div>
                  <div class="project-item">
                    <h4>黑龙江省自然科学基金</h4>
                    <p><strong>项目名称：</strong>基于迁移学习的森林病虫害识别技术研究</p>
                    <p><strong>项目时间：</strong>2020-2023年</p>
                    <p><strong>经费：</strong>15万元</p>
                    <p><strong>角色：</strong>项目负责人</p>
                  </div>
                </div>
              </section>

              <section class="publications">
                <h3>代表性论文</h3>
                <div class="papers-list">
                  <div class="paper-item">
                    <p><strong>[1]</strong> Li X, Zhang Y, Wang Z. Deep Reinforcement Learning for Intelligent Decision Making in Complex Environments. <em>IEEE Transactions on Neural Networks and Learning Systems</em>, 2023, 34(8): 4521-4535. (SCI一区)</p>
                  </div>
                  <div class="paper-item">
                    <p><strong>[2]</strong> Li X, Chen M, Liu H. Incremental Learning Algorithm for Large-scale Data Processing. <em>Pattern Recognition</em>, 2022, 126: 108567. (SCI一区)</p>
                  </div>
                  <div class="paper-item">
                    <p><strong>[3]</strong> Wang Z, Li X, Brown J. Transfer Learning for Forest Pest Classification Using Deep Convolutional Networks. <em>Computers and Electronics in Agriculture</em>, 2021, 187: 106271. (SCI二区)</p>
                  </div>
                  <div class="paper-item">
                    <p><strong>[4]</strong> Li X, Johnson K, Smith R. Multi-modal Emotion Recognition using Deep Learning. <em>Neurocomputing</em>, 2020, 412: 245-256. (SCI二区)</p>
                  </div>
                  <div class="paper-item">
                    <p><strong>[5]</strong> Li X, Anderson P. Adaptive Learning Rate Optimization for Deep Neural Networks. <em>Neural Computing and Applications</em>, 2019, 31(9): 5121-5132. (SCI三区)</p>
                  </div>
                </div>
              </section>

              <section class="academic-honors">
                <h3>学术荣誉与获奖</h3>
                <div class="honors-list">
                  <div class="honor-item">
                    <h4>2023年</h4>
                    <p>黑龙江省科学技术奖 自然科学类二等奖（排名第一）</p>
                  </div>
                  <div class="honor-item">
                    <h4>2022年</h4>
                    <p>东北林业大学优秀教师</p>
                  </div>
                  <div class="honor-item">
                    <h4>2021年</h4>
                    <p>黑龙江省高校青年学术骨干</p>
                  </div>
                  <div class="honor-item">
                    <h4>2020年</h4>
                    <p>全国大学生数学建模竞赛优秀指导教师</p>
                  </div>
                </div>
              </section>

              <section class="students-supervision">
                <h3>研究生培养</h3>
                <div class="supervision-stats">
                  <div class="stat-box">
                    <div class="stat-number">15</div>
                    <div class="stat-label">已毕业博士生</div>
                  </div>
                  <div class="stat-box">
                    <div class="stat-number">35</div>
                    <div class="stat-label">已毕业硕士生</div>
                  </div>
                  <div class="stat-box">
                    <div class="stat-number">8</div>
                    <div class="stat-label">在读博士生</div>
                  </div>
                  <div class="stat-box">
                    <div class="stat-number">12</div>
                    <div class="stat-label">在读硕士生</div>
                  </div>
                </div>
                <p class="supervision-note">已培养的学生中，80%以上在知名高校、科研院所或知名企业工作，多人获得国家奖学金、省级优秀毕业生等荣誉。</p>
              </section>

              <section class="social-service">
                <h3>学术兼职与社会服务</h3>
                <div class="service-list">
                  <ul>
                    <li>IEEE Senior Member</li>
                    <li>中国计算机学会高级会员</li>
                    <li>中国人工智能学会会员</li>
                    <li>《Pattern Recognition》期刊审稿人</li>
                    <li>《Neurocomputing》期刊审稿人</li>
                    <li>AAAI、IJCAI等国际会议程序委员会委员</li>
                    <li>黑龙江省人工智能学会理事</li>
                    <li>东北林业大学学术委员会委员</li>
                  </ul>
                </div>
              </section>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/teacher" class="btn btn-secondary">返回教师列表</a>
            <a href="#/lab/923" class="btn btn-primary">访问实验室</a>
          </div>
        </main>
      </div>

      <div id="teacher-zhang" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>张教授 - 个人简介</h1>
            <div class="breadcrumb">
              <a href="#/teacher">教师队伍</a> > <span>张教授</span>
            </div>
          </div>

          <div class="teacher-detail">
            <div class="teacher-profile">
              <div class="profile-photo">
                <img src="https://via.placeholder.com/200" alt="张教授照片">
              </div>
              <div class="profile-info">
                <h2>张教授</h2>
                <p class="title">博士，博士生导师</p>
                <p class="research">主要研究方向：网络安全、区块链技术</p>
                <div class="contact-methods">
                  <p><strong>邮箱：</strong>zhang@nefu.edu.cn</p>
                  <p><strong>办公室：</strong>计算机学院B座505室</p>
                  <p><strong>电话：</strong>0451-82191235</p>
                  <p><strong>办公时间：</strong>周一至周五 9:00-17:00</p>
                </div>
              </div>
            </div>

            <div class="detail-sections">
              <section class="academic-background">
                <h3>教育背景</h3>
                <div class="education-list">
                  <div class="education-item">
                    <h4>博士学位</h4>
                    <p>清华大学 计算机科学与技术专业 (2010-2014)</p>
                    <p>研究方向：网络与信息安全</p>
                  </div>
                  <div class="education-item">
                    <h4>硕士学位</h4>
                    <p>北京邮电大学 信息安全专业 (2007-2010)</p>
                    <p>研究方向：密码学与网络安全</p>
                  </div>
                  <div class="education-item">
                    <h4>学士学位</h4>
                    <p>华中科技大学 信息安全专业 (2003-2007)</p>
                  </div>
                </div>
              </section>

              <section class="teaching-courses">
                <h3>主讲课程</h3>
                <div class="courses-grid">
                  <div class="course-item">
                    <h4>本科生课程</h4>
                    <ul>
                      <li>网络安全基础</li>
                      <li>密码学原理</li>
                      <li>信息安全概论</li>
                      <li>计算机网络</li>
                    </ul>
                  </div>
                  <div class="course-item">
                    <h4>研究生课程</h4>
                    <ul>
                      <li>高级网络安全</li>
                      <li>区块链技术与应用</li>
                      <li>网络攻击与防护</li>
                      <li>密码学高级理论</li>
                    </ul>
                  </div>
                </div>
              </section>

              <section class="research-projects">
                <h3>科研项目</h3>
                <div class="projects-list">
                  <div class="project-item">
                    <h4>国家重点研发计划子课题</h4>
                    <p><strong>项目名称：</strong>区块链关键技术及应用示范</p>
                    <p><strong>项目时间：</strong>2020-2023年</p>
                    <p><strong>经费：</strong>80万元</p>
                    <p><strong>角色：</strong>子课题负责人</p>
                  </div>
                  <div class="project-item">
                    <h4>国家自然科学基金面上项目</h4>
                    <p><strong>项目名称：</strong>基于零知识证明的隐私保护技术研究</p>
                    <p><strong>项目时间：</strong>2019-2022年</p>
                    <p><strong>经费：</strong>62万元</p>
                    <p><strong>角色：</strong>项目负责人</p>
                  </div>
                </div>
              </section>

              <section class="publications">
                <h3>代表性论文</h3>
                <div class="papers-list">
                  <div class="paper-item">
                    <p><strong>[1]</strong> Zhang M, Li X, Wang Y. Blockchain-based Privacy-Preserving Data Sharing in IoT Systems. <em>IEEE Transactions on Information Forensics and Security</em>, 2023, 18: 2456-2469. (SCI一区)</p>
                  </div>
                  <div class="paper-item">
                    <p><strong>[2]</strong> Zhang M, Chen L, Brown K. Zero-Knowledge Proof Protocols for Blockchain Applications. <em>IEEE Transactions on Dependable and Secure Computing</em>, 2022, 19(4): 2123-2136. (SCI一区)</p>
                  </div>
                  <div class="paper-item">
                    <p><strong>[3]</strong> Wang Y, Zhang M, Johnson R. Smart Contract Security Analysis using Formal Verification. <em>Computers & Security</em>, 2021, 108: 102354. (SCI二区)</p>
                  </div>
                </div>
              </section>

              <section class="academic-honors">
                <h3>学术荣誉与获奖</h3>
                <div class="honors-list">
                  <div class="honor-item">
                    <h4>2023年</h4>
                    <p>全国大学生信息安全竞赛优秀指导教师</p>
                  </div>
                  <div class="honor-item">
                    <h4>2022年</h4>
                    <p>黑龙江省网络安全协会优秀专家</p>
                  </div>
                  <div class="honor-item">
                    <h4>2021年</h4>
                    <p>东北林业大学优秀科研工作者</p>
                  </div>
                </div>
              </section>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/teacher" class="btn btn-secondary">返回教师列表</a>
            <a href="#/lab/927" class="btn btn-primary">访问实验室</a>
          </div>
        </main>
      </div>

      <div id="teacher-wang" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>王副教授 - 个人简介</h1>
            <div class="breadcrumb">
              <a href="#/teacher">教师队伍</a> > <span>王副教授</span>
            </div>
          </div>

          <div class="teacher-detail">
            <div class="teacher-profile">
              <div class="profile-photo">
                <img src="https://via.placeholder.com/200" alt="王副教授照片">
              </div>
              <div class="profile-info">
                <h2>王副教授</h2>
                <p class="title">博士，硕士生导师</p>
                <p class="research">主要研究方向：移动计算、嵌入式系统</p>
                <div class="contact-methods">
                  <p><strong>邮箱：</strong>wang@nefu.edu.cn</p>
                  <p><strong>办公室：</strong>计算机学院B座502室</p>
                  <p><strong>电话：</strong>0451-82191236</p>
                  <p><strong>办公时间：</strong>周二、周四 14:00-17:00</p>
                </div>
              </div>
            </div>

            <div class="detail-sections">
              <section class="teaching-courses">
                <h3>主讲课程</h3>
                <div class="courses-grid">
                  <div class="course-item">
                    <h4>本科生课程</h4>
                    <ul>
                      <li>移动应用开发</li>
                      <li>嵌入式系统设计</li>
                      <li>物联网技术</li>
                      <li>Java程序设计</li>
                    </ul>
                  </div>
                  <div class="course-item">
                    <h4>研究生课程</h4>
                    <ul>
                      <li>高级移动计算</li>
                      <li>无线传感器网络</li>
                      <li>边缘计算技术</li>
                    </ul>
                  </div>
                </div>
              </section>

              <section class="research-projects">
                <h3>科研项目</h3>
                <div class="projects-list">
                  <div class="project-item">
                    <h4>黑龙江省自然科学基金</h4>
                    <p><strong>项目名称：</strong>基于边缘计算的智能物联网系统研究</p>
                    <p><strong>项目时间：</strong>2021-2024年</p>
                    <p><strong>经费：</strong>12万元</p>
                    <p><strong>角色：</strong>项目负责人</p>
                  </div>
                  <div class="project-item">
                    <h4>企业横向项目</h4>
                    <p><strong>项目名称：</strong>智慧林业移动监测系统开发</p>
                    <p><strong>项目时间：</strong>2022-2023年</p>
                    <p><strong>经费：</strong>25万元</p>
                    <p><strong>角色：</strong>技术负责人</p>
                  </div>
                </div>
              </section>

              <section class="publications">
                <h3>代表性论文</h3>
                <div class="papers-list">
                  <div class="paper-item">
                    <p><strong>[1]</strong> Wang L, Zhang H, Li M. Edge Computing Framework for Mobile IoT Applications. <em>IEEE Internet of Things Journal</em>, 2022, 9(15): 13245-13256. (SCI一区)</p>
                  </div>
                  <div class="paper-item">
                    <p><strong>[2]</strong> Wang L, Chen X, Brown J. Energy-Efficient Task Scheduling in Mobile Edge Computing. <em>IEEE Transactions on Mobile Computing</em>, 2021, 20(8): 2845-2858. (SCI二区)</p>
                  </div>
                </div>
              </section>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/teacher" class="btn btn-secondary">返回教师列表</a>
            <a href="#/lab/925" class="btn btn-primary">访问实验室</a>
          </div>
        </main>
      </div>

      <div id="teacher-chen" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>陈副教授 - 个人简介</h1>
            <div class="breadcrumb">
              <a href="#/teacher">教师队伍</a> > <span>陈副教授</span>
            </div>
          </div>

          <div class="teacher-detail">
            <div class="teacher-profile">
              <div class="profile-photo">
                <img src="https://via.placeholder.com/200" alt="陈副教授照片">
              </div>
              <div class="profile-info">
                <h2>陈副教授</h2>
                <p class="title">博士，硕士生导师</p>
                <p class="research">主要研究方向：数据库系统、大数据技术</p>
                <div class="contact-methods">
                  <p><strong>邮箱：</strong>chen@nefu.edu.cn</p>
                  <p><strong>办公室：</strong>计算机学院B座501室</p>
                  <p><strong>电话：</strong>0451-82191237</p>
                  <p><strong>办公时间：</strong>周一、周三 14:00-17:00</p>
                </div>
              </div>
            </div>

            <div class="detail-sections">
              <section class="teaching-courses">
                <h3>主讲课程</h3>
                <div class="courses-grid">
                  <div class="course-item">
                    <h4>本科生课程</h4>
                    <ul>
                      <li>数据库原理</li>
                      <li>大数据处理技术</li>
                      <li>数据仓库与数据挖掘</li>
                      <li>SQL Server数据库</li>
                    </ul>
                  </div>
                  <div class="course-item">
                    <h4>研究生课程</h4>
                    <ul>
                      <li>高级数据库系统</li>
                      <li>分布式数据库</li>
                      <li>大数据分析与挖掘</li>
                    </ul>
                  </div>
                </div>
              </section>

              <section class="research-projects">
                <h3>科研项目</h3>
                <div class="projects-list">
                  <div class="project-item">
                    <h4>国家自然科学基金青年项目</h4>
                    <p><strong>项目名称：</strong>面向林业大数据的分布式存储与查询优化研究</p>
                    <p><strong>项目时间：</strong>2020-2023年</p>
                    <p><strong>经费：</strong>24万元</p>
                    <p><strong>角色：</strong>项目负责人</p>
                  </div>
                </div>
              </section>

              <section class="publications">
                <h3>代表性论文</h3>
                <div class="papers-list">
                  <div class="paper-item">
                    <p><strong>[1]</strong> Chen Y, Liu X, Wang M. Distributed Query Processing for Large-scale Forestry Data. <em>Information Sciences</em>, 2022, 615: 245-261. (SCI一区)</p>
                  </div>
                  <div class="paper-item">
                    <p><strong>[2]</strong> Chen Y, Zhang L, Brown K. Efficient Storage and Retrieval of Multi-dimensional Scientific Data. <em>Future Generation Computer Systems</em>, 2021, 118: 156-168. (SCI二区)</p>
                  </div>
                </div>
              </section>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/teacher" class="btn btn-secondary">返回教师列表</a>
          </div>
        </main>
      </div>

      <div id="teacher-liu" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>刘讲师 - 个人简介</h1>
            <div class="breadcrumb">
              <a href="#/teacher">教师队伍</a> > <span>刘讲师</span>
            </div>
          </div>

          <div class="teacher-detail">
            <div class="teacher-profile">
              <div class="profile-photo">
                <img src="https://via.placeholder.com/200" alt="刘讲师照片">
              </div>
              <div class="profile-info">
                <h2>刘讲师</h2>
                <p class="title">硕士</p>
                <p class="research">主要研究方向：Web开发、前端技术</p>
                <div class="contact-methods">
                  <p><strong>邮箱：</strong>liu@nefu.edu.cn</p>
                  <p><strong>办公室：</strong>计算机学院B座401室</p>
                  <p><strong>电话：</strong>0451-82191238</p>
                  <p><strong>办公时间：</strong>周三、周五 9:00-12:00</p>
                </div>
              </div>
            </div>

            <div class="detail-sections">
              <section class="teaching-courses">
                <h3>主讲课程</h3>
                <div class="courses-grid">
                  <div class="course-item">
                    <h4>本科生课程</h4>
                    <ul>
                      <li>Web前端开发</li>
                      <li>JavaScript高级程序设计</li>
                      <li>React框架应用</li>
                      <li>HTML5与CSS3</li>
                      <li>Vue.js开发实战</li>
                    </ul>
                  </div>
                </div>
              </section>

              <section class="research-projects">
                <h3>教学与实践项目</h3>
                <div class="projects-list">
                  <div class="project-item">
                    <h4>校企合作项目</h4>
                    <p><strong>项目名称：</strong>企业官网前端开发与维护</p>
                    <p><strong>项目时间：</strong>2022-至今</p>
                    <p><strong>角色：</strong>技术指导</p>
                  </div>
                  <div class="project-item">
                    <h4>教学改革项目</h4>
                    <p><strong>项目名称：</strong>基于项目驱动的前端开发课程教学改革</p>
                    <p><strong>项目时间：</strong>2021-2023年</p>
                    <p><strong>角色：</strong>项目负责人</p>
                  </div>
                </div>
              </section>

              <section class="teaching-achievements">
                <h3>教学成果</h3>
                <div class="achievements-list">
                  <div class="achievement-item">
                    <h4>2023年</h4>
                    <p>指导学生获得全国大学生计算机设计大赛二等奖</p>
                  </div>
                  <div class="achievement-item">
                    <h4>2022年</h4>
                    <p>获得东北林业大学青年教师教学竞赛一等奖</p>
                  </div>
                  <div class="achievement-item">
                    <h4>2021年</h4>
                    <p>获得黑龙江省高校微课比赛三等奖</p>
                  </div>
                </div>
              </section>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/teacher" class="btn btn-secondary">返回教师列表</a>
          </div>
        </main>
      </div>

      <div id="teacher-zhao" class="page">
        <main class="container">
          <div class="detail-header">
            <h1>赵讲师 - 个人简介</h1>
            <div class="breadcrumb">
              <a href="#/teacher">教师队伍</a> > <span>赵讲师</span>
            </div>
          </div>

          <div class="teacher-detail">
            <div class="teacher-profile">
              <div class="profile-photo">
                <img src="https://via.placeholder.com/200" alt="赵讲师照片">
              </div>
              <div class="profile-info">
                <h2>赵讲师</h2>
                <p class="title">硕士</p>
                <p class="research">主要研究方向：软件测试、质量保证</p>
                <div class="contact-methods">
                  <p><strong>邮箱：</strong>zhao@nefu.edu.cn</p>
                  <p><strong>办公室：</strong>计算机学院B座402室</p>
                  <p><strong>电话：</strong>0451-82191239</p>
                  <p><strong>办公时间：</strong>周二、周四 9:00-12:00</p>
                </div>
              </div>
            </div>

            <div class="detail-sections">
              <section class="teaching-courses">
                <h3>主讲课程</h3>
                <div class="courses-grid">
                  <div class="course-item">
                    <h4>本科生课程</h4>
                    <ul>
                      <li>软件测试技术</li>
                      <li>软件质量保证</li>
                      <li>自动化测试</li>
                      <li>软件工程</li>
                      <li>软件项目管理</li>
                    </ul>
                  </div>
                </div>
              </section>

              <section class="research-projects">
                <h3>教学与实践项目</h3>
                <div class="projects-list">
                  <div class="project-item">
                    <h4>企业合作项目</h4>
                    <p><strong>项目名称：</strong>软件质量评估与测试服务</p>
                    <p><strong>项目时间：</strong>2021-至今</p>
                    <p><strong>角色：</strong>技术负责人</p>
                  </div>
                  <div class="project-item">
                    <h4>教学改革项目</h4>
                    <p><strong>项目名称：</strong>实践导向的软件测试课程体系构建</p>
                    <p><strong>项目时间：</strong>2020-2022年</p>
                    <p><strong>角色：</strong>项目负责人</p>
                  </div>
                </div>
              </section>

              <section class="teaching-achievements">
                <h3>教学成果</h3>
                <div class="achievements-list">
                  <div class="achievement-item">
                    <h4>2023年</h4>
                    <p>获得东北林业大学教学成果奖二等奖</p>
                  </div>
                  <div class="achievement-item">
                    <h4>2022年</h4>
                    <p>指导学生获得中国软件杯大学生软件设计大赛优秀奖</p>
                  </div>
                  <div class="achievement-item">
                    <h4>2021年</h4>
                    <p>获得黑龙江省高校课程思政教学竞赛优秀奖</p>
                  </div>
                </div>
              </section>
            </div>
          </div>

          <div class="action-bar">
            <a href="#/teacher" class="btn btn-secondary">返回教师列表</a>
          </div>
        </main>
      </div>
    </main>
    <script>
      // 路由配置
      const routes = {
        '/':           { page: 'home',     title: '软件工程专业网站' },
        '/major':      { page: 'major',    title: '专业介绍' },
        '/directions': { page: 'directions', title: '专业方向' },
        '/lab':        { page: 'lab',      title: '实验室' },
        '/lab/923':    { page: 'lab-923',  title: '923创新实验室' },
        '/lab/925':    { page: 'lab-925',  title: '925移动开发实验室' },
        '/lab/927':    { page: 'lab-927',  title: '927网络安全实验室' },
        '/teacher':    { page: 'teacher',  title: '教师队伍' },
        '/teacher/li': { page: 'teacher-li', title: '李教授 - 个人简介' },
        '/teacher/zhang': { page: 'teacher-zhang', title: '张教授 - 个人简介' },
        '/teacher/wang': { page: 'teacher-wang', title: '王副教授 - 个人简介' },
        '/teacher/chen': { page: 'teacher-chen', title: '陈副教授 - 个人简介' },
        '/teacher/liu': { page: 'teacher-liu', title: '刘讲师 - 个人简介' },
        '/teacher/zhao': { page: 'teacher-zhao', title: '赵讲师 - 个人简介' },
        '/career':     { page: 'career', title: '就业指南' },
        '/news':       { page: 'news', title: '新闻公告' }
      };
      
      // 页面默认区块配置
      const pageDefaults = {
        'directions': 'ai-direction',
        'teacher': 'professors',
        'career': 'industry'
      };

      // 简化的路由处理函数
      function handleRoute() {
        try {
          // 获取当前hash，如果为空则默认为首页
          let path = window.location.hash.substring(1) || '/';
      
          // 标准化路径
          if (!path.startsWith('/')) {
            path = '/' + path;
          }
      
          // 先尝试完整路径匹配（用于详情页面）
          let config = routes[path];
          let mainPath = path;
      
          // 如果没有找到完整路径匹配，则尝试主路径匹配
          if (!config) {
            mainPath = '/' + path.split('/')[1] || '/';
            config = routes[mainPath];
          }

          // 如果还是没找到，使用默认首页
          if (!config) {
            config = routes['/'];
            mainPath = '/';
          }

          const pageId = config.page;

          console.log(`[路由] ${path} -> 显示页面: ${pageId}`);

          // 隐藏所有页面
          document.querySelectorAll('.page').forEach(page => {
            page.classList.remove('active');
          });

          // 显示目标页面
          const targetPage = document.getElementById(pageId);
          if (targetPage) {
            targetPage.classList.add('active');

            // 初始化页面的默认区块（仅对有子区块的页面）
            initPageDefaults(pageId);
          }

          // 更新导航高亮（对于详情页面，高亮其父级导航）
          const navPath = path.startsWith('/lab/') ? '/lab' :
                         path.startsWith('/teacher/') ? '/teacher' :
                         mainPath;
          updateNavigation(navPath);

          // 更新页面标题
          document.title = config.title;

        } catch (error) {
          console.error('[路由错误]', error);
          // 出错时回到首页
          window.location.hash = '#/';
        }
      }
      
      // 初始化页面默认区块
      function initPageDefaults(pageId) {
        const defaultSection = pageDefaults[pageId];
        if (defaultSection) {
          const page = document.getElementById(pageId);
          if (page) {
            // 隐藏所有section
            page.querySelectorAll('section').forEach(section => {
              section.style.display = 'none';
            });

            // 显示默认section
            const targetSection = page.querySelector(`#${defaultSection}`);
            if (targetSection) {
              targetSection.style.display = 'block';
            }

            // 更新按钮状态
            page.querySelectorAll('.section-btn').forEach(btn => {
              btn.classList.remove('active');
            });

            // 激活对应的按钮
            const activeButton = page.querySelector(`[onclick*="${defaultSection}"]`);
            if (activeButton) {
              activeButton.classList.add('active');
            }
          }
        }
      }

      // 更新导航高亮
      function updateNavigation(currentPath) {
        // 清除所有导航链接的active状态
        document.querySelectorAll('nav a').forEach(link => {
          link.classList.remove('active');
        });

        // 为当前页面的导航链接添加active状态
        const activeLink = document.querySelector(`nav a[href="#${currentPath}"]`);
        if (activeLink) {
          activeLink.classList.add('active');
        }
      }

      // 区块切换函数
      function showSection(sectionId, button) {
        const activePage = document.querySelector('.page.active');
        if (!activePage) return;

        // 隐藏当前页面所有区块
        activePage.querySelectorAll('section').forEach(section => {
          section.style.display = 'none';
        });
      
        // 显示目标区块
        const targetSection = activePage.querySelector(`#${sectionId}`);
        if (targetSection) {
          targetSection.style.display = 'block';
        }
      
        // 更新按钮状态
        activePage.querySelectorAll('.section-btn').forEach(btn => {
          btn.classList.remove('active');
        });
        if (button) {
          button.classList.add('active');
        }
      }

      // 路由初始化
      function initRouter() {
        // 移除现有的事件监听器（避免重复绑定）
        window.removeEventListener('hashchange', handleRoute);
        window.removeEventListener('load', handleRoute);

        // 添加事件监听器
        window.addEventListener('hashchange', handleRoute);
        window.addEventListener('load', handleRoute);

        console.log('[路由系统] 初始化完成');

        // 立即处理当前路由
        handleRoute();
      }

      // 页面加载完成后初始化路由系统
      if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initRouter);
      } else {
        initRouter();
      }
    </script>
  </body>
</html>
