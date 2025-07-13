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
    </style>
  </head>
  <body>
    <%@ include file="header.jsp" %>
    <main id="route-container">
      <div id="home" class="page ">
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
              <h2><a href="#">923创新实验室</a></h2>
              <p>923创新实验室成立于2015年，专注于人工智能与机器学习研究。实验室配备了高性能GPU服务器和先进的开发环境，支持深度学习模型训练与部署。近年来，实验室成员在多项国家级人工智能竞赛中获奖。</p>
              <h3>主要研究方向：</h3>
              <ul>
                <li>自然语言处理与大语言模型应用</li>
                <li>计算机视觉与图像识别</li>
                <li>强化学习与智能决策系统</li>
              </ul>
              <h3>实验室负责人：</h3>
              <p>李教授，博士生导师，研究方向为人工智能与模式识别</p>
            </div>
            <div class="lab-card card">
              <h2><a href="#">925移动开发实验室</a></h2>
              <p>925移动开发实验室专注于移动应用开发与跨平台技术研究，拥有iOS和Android开发环境，以及各类移动设备测试平台。实验室与多家知名互联网企业保持密切合作，为学生提供实习和项目开发机会。</p>
              <h3>主要研究方向：</h3>
              <ul>
                <li>跨平台应用开发(Flutter/React Native)</li>
                <li>移动应用性能优化</li>
                <li>物联网与移动设备互联技术</li>
              </ul>
              <h3>实验室负责人：</h3>
              <p>王副教授，研究方向为移动计算与嵌入式系统</p>
            </div>
            <div class="lab-card card">
              <h2><a href="#">927网络安全实验室</a></h2>
              <p>927网络安全实验室致力于网络安全技术研究与攻防演练，配备专业的网络安全设备和攻防模拟平台。实验室定期组织网络安全竞赛和培训，培养学生的网络安全防护能力。</p>
              <h3>主要研究方向：</h3>
              <ul>
                <li>Web安全与渗透测试</li>
                <li>区块链安全技术</li>
                <li>数据加密与隐私保护</li>
              </ul>
              <h3>实验室负责人：</h3>
              <p>张教授，研究方向为网络与信息安全</p>
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
                <h2>李教授</h2>
                <p>博士，博士生导师，软件工程系主任</p>
                <p>研究方向：人工智能、机器学习、模式识别</p>
                <p>主讲课程：人工智能导论、机器学习、数据挖掘</p>
                <p>学术成果：主持国家级科研项目3项，发表SCI论文20余篇</p>
              </div>
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="张教授照片">
                <h2>张教授</h2>
                <p>博士，博士生导师</p>
                <p>研究方向：网络安全、区块链技术</p>
                <p>主讲课程：网络安全、密码学、区块链技术</p>
                <p>学术成果：主持国家级科研项目2项，省部级项目3项</p>
              </div>
            </div>
          </section>
          <section id="associate-professors" style="display: none">
            <h1>副教授</h1>
            <div class="teacher-list">
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="王副教授照片">
                <h2>王副教授</h2>
                <p>博士，硕士生导师</p>
                <p>研究方向：移动计算、嵌入式系统</p>
                <p>主讲课程：移动应用开发、嵌入式系统、物联网技术</p>
                <p>学术成果：参与省部级项目2项，发表EI论文10余篇</p>
              </div>
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="陈副教授照片">
                <h2>陈副教授</h2>
                <p>博士，硕士生导师</p>
                <p>研究方向：数据库系统、大数据技术</p>
                <p>主讲课程：数据库原理、大数据处理、数据仓库</p>
                <p>学术成果：参与国家级项目2项，发表核心期刊论文10余篇</p>
              </div>
            </div>
          </section>
          <section id="lecturers" style="display: none">
            <h1>讲师</h1>
            <div class="teacher-list">
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="刘讲师照片">
                <h2>刘讲师</h2>
                <p>硕士</p>
                <p>研究方向：Web开发、前端技术</p>
                <p>主讲课程：Web前端开发、JavaScript高级程序设计、React框架应用</p>
                <p>学术成果：参与横向项目多项，发表教学研究论文3篇</p>
              </div>
              <div class="teacher-card card">
                <img src="https://via.placeholder.com/150" alt="赵讲师照片">
                <h2>赵讲师</h2>
                <p>硕士</p>
                <p>研究方向：软件测试、质量保证</p>
                <p>主讲课程：软件测试技术、软件质量保证、自动化测试</p>
                <p>学术成果：参与横向项目多项，获得教学成果奖1项</p>
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
    </main>
    <script>
      // 移除原有的路由配置中sections相关部分
      const routes = {
        '/':           { page: 'home',     title: '软件工程专业网站' },
        '/major':      { page: 'major',    title: '专业介绍' },
        '/directions': { page: 'directions', title: '专业方向' },
        '/lab':        { page: 'lab',      title: '实验室' },
        '/teacher':    { page: 'teacher', title: '教师队伍' },
        '/career':     { page: 'career', title: '就业指南' },
        '/news':       { page: 'news', title: '新闻公告' }
      };
      
      // 修改路由处理函数，移除二级路由逻辑
      function handleRoute() {
        if (window.routeHandling) return;
        window.routeHandling = true;
        try {
          // → 1. 把 hash 拿好、trim、补 /
          let raw = window.location.hash.substring(1) || '/';
          raw = raw.trim();
          if (!raw.startsWith('/')) raw = '/' + raw;
          console.log('[路由调试] 规范后 raw =', raw);
      
          // → 2. 获取一级路由
          const level1 = raw.split('/')[1] ? '/' + raw.split('/')[1] : '/';
          console.log('[路由调试] 一级 =', level1);
      
          // → 3. 拿 config
          let cfg = routes[level1];
          if (!cfg) { cfg = routes['/']; console.warn('找不到一级', level1); }
          const pageId = cfg.page.trim();
          console.log('[路由调试] 显示页面 →', pageId);
      
          // → 4. 切页面
          document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
          document.getElementById(pageId).classList.add('active');
        } catch (e) {
          console.error('路由异常', e);
        } finally {
          window.routeHandling = false;
        }
      }
      
      // 新增区块切换函数
      function showSection(sectionId, button) {
        // 隐藏当前页面所有区块
        const activePage = document.querySelector('.page.active');
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
        button.classList.add('active');
      }

      // 恢复路由初始化函数
      function initRouter() {
        window.removeEventListener('hashchange', handleRoute);
        window.removeEventListener('load', handleRoute);
        window.addEventListener('hashchange', handleRoute);
        window.addEventListener('load', handleRoute);
        console.log('[路由系统] 初始化完成');
        handleRoute();  // 页面加载时执行一次
      }
      initRouter();
    </script>
  </body>
</html>
