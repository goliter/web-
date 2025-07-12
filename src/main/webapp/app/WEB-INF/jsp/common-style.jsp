<%@ page pageEncoding="UTF-8" %>
<style>
  /* 基础样式 */
  body {
    font-family: 'Segoe UI', Arial, sans-serif;
    margin: 0;
    padding: 0;
    line-height: 1.6;
    color: #333;
    background-color: #f5f5f5;
  }

  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
  }

  /* 导航样式 */
  nav {
    background-color: #2c3e50;
    color: white;
    padding: 1rem 0;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  nav .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
  }

  nav ul li {
    margin-right: 1.5rem;
    position: relative;
  }

  nav ul li a {
    color: white;
    text-decoration: none;
    font-weight: 500;
    padding: 0.5rem 0;
    transition: color 0.3s;
  }

  nav ul li a:hover {
    color: #3498db;
  }

  /* 子导航样式 */
  .sub-nav {
    background-color: #34495e;
    padding: 0.8rem 0;
    margin-bottom: 2rem;
  }

  .sub-nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
  }

  .sub-nav ul li {
    margin-right: 1.5rem;
  }

  .sub-nav ul li a {
    color: #ecf0f1;
    text-decoration: none;
    padding: 0.3rem 0;
    border-bottom: 2px solid transparent;
    transition: all 0.3s;
  }

  .sub-nav ul li a:hover {
    color: #3498db;
    border-bottom: 2px solid #3498db;
  }

  /* 卡片通用样式 */
  .card {
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    padding: 1.5rem;
    margin-bottom: 1.5rem;
    transition: transform 0.3s, box-shadow 0.3s;
  }

  .card:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
  }

  /* 实验室卡片样式 */
  .lab-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
    margin-top: 2rem;
  }

  .lab-card h2 {
    color: #2c3e50;
    margin-top: 0;
    border-bottom: 2px solid #3498db;
    padding-bottom: 0.5rem;
  }

  .lab-card a {
    color: #3498db;
    text-decoration: none;
  }

  .lab-card a:hover {
    text-decoration: underline;
  }

  /* 教师卡片样式 */
  .teacher-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
    margin-top: 2rem;
  }

  .teacher-card {
    text-align: center;
  }

  .teacher-card img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 1rem;
    border: 3px solid #ecf0f1;
  }

  /* 新闻列表样式 */
  .news-list {
    margin-top: 2rem;
  }

  .news-item {
    border-left: 4px solid #3498db;
    padding: 1rem 1.5rem;
    margin-bottom: 1rem;
    background: white;
    border-radius: 0 4px 4px 0;
  }

  .news-item h3 {
    margin-top: 0;
    color: #2c3e50;
  }

  .news-date {
    display: inline-block;
    color: #7f8c8d;
    font-size: 0.9rem;
    margin-top: 0.5rem;
  }

  /* 主内容区域 */
  main {
    padding: 2rem 0;
  }

  h1, h2, h3 {
    color: #2c3e50;
  }

  /* 首页样式 */
  #home {
      overflow: hidden;
  }
  
  /* 学院头部横幅 */
  .college-banner {
      height: 400px;
      background: linear-gradient(rgba(26, 86, 219, 0.8), rgba(13, 43, 102, 0.9)), url('https://example.com/college-banner.jpg') center/cover no-repeat;
      color: var(--white-color);
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      position: relative;
  }
  
  .banner-content {
      max-width: 800px;
      padding: 20px;
      z-index: 2;
  }
  
  .college-banner h1 {
      font-size: 2.8rem;
      margin-bottom: 20px;
      color: var(--white-color);
  }
  
  .college-banner p {
      font-size: 1.2rem;
      opacity: 0.9;
      margin-bottom: 0;
  }
  
  /* 学院简介 */
  .college-intro {
      background: var(--white-color);
  }
  
  .intro-content {
      display: flex;
      flex-wrap: wrap;
      gap: 30px;
      margin-top: 30px;
  }
  
  .intro-content p {
      flex: 1;
      min-width: 300px;
      font-size: 1.05rem;
      line-height: 1.8;
  }
  
  /* 专业设置 */
  .majors {
      background: var(--light-color);
  }
  
  .majors-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 30px;
      margin-top: 30px;
  }
  
  .major-card {
      padding: 30px;
      text-align: center;
  }
  
  .major-card h3 {
      color: var(--primary-color);
      margin-bottom: 15px;
  }
  
  /* 师资力量 */
  .faculty {
      background: var(--white-color);
  }
  
  .faculty-list {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
      gap: 30px;
      margin-top: 30px;
  }
  
  .faculty-item {
      display: flex;
      gap: 20px;
      align-items: center;
      padding: 20px;
  }
  
  .faculty-photo {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background: var(--light-gray);
      flex-shrink: 0;
      background-size: cover;
      background-position: center;
  }
  
  .faculty-info h3 {
      margin-bottom: 5px;
      color: var(--primary-color);
  }
  
  .faculty-info p {
      color: var(--gray-color);
      margin-bottom: 0;
  }
  
  /* 科研成果 */
  .research {
      background: var(--light-color);
  }
  
  .research-list {
      margin-top: 30px;
  }
  
  .research-item {
      background: var(--white-color);
      padding: 25px;
      margin-bottom: 20px;
      border-left: 4px solid var(--accent-color);
  }
  
  .research-item h3 {
      margin-bottom: 10px;
      color: var(--primary-color);
  }
  
  /* 新闻公告 */
  .news {
      background: var(--white-color);
  }
  
  .news-list {
      margin-top: 30px;
  }
  
  .news-item {
      padding: 15px 0;
      border-bottom: 1px dashed var(--light-gray);
      display: flex;
      justify-content: space-between;
      align-items: center;
  }
  
  .news-item:last-child {
      border-bottom: none;
  }
  
  .news-item a {
      color: var(--dark-color);
      text-decoration: none;
      transition: var(--transition);
      flex-grow: 1;
      margin: 0 15px;
  }
  
  .news-item a:hover {
      color: var(--primary-color);
  }
  
  .news-date {
      color: var(--gray-color);
      font-size: 0.9rem;
      white-space: nowrap;
  }
  
  /* 增强盒模型背景样式 */
  
  /* 为所有内容区块添加背景和内边距 */
  .college-intro, .majors, .faculty, .research, .news {
      padding: 60px 0;
      background-color: var(--white-color);
      margin-bottom: 20px;
      box-shadow: var(--shadow);
  }
  
  /* 为不同区块添加交替背景色，增强层次感 */
  .majors, .research {
      background-color: #f9fafc;
  }
  
  /* 卡片容器增强样式 */
  .major-card, .faculty-item, .research-item, .news-item {
      background-color: var(--white-color);
      border-radius: 8px;
      padding: 25px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  }
  
  /* 学院简介文本容器 */
  .intro-content {
      background-color: var(--white-color);
      padding: 30px;
      border-radius: 8px;
      box-shadow: var(--shadow);
  }
  
  /* 专业卡片增强效果 */
  .major-card {
      border-top: 4px solid var(--primary-color);
      transition: all 0.3s ease;
  }
  
  .major-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
  }
  
  /* 师资卡片样式调整 */
  .faculty-item {
      border-left: 4px solid var(--accent-color);
  }
  
  /* 科研成果卡片样式 */
  .research-item {
      border-left: 4px solid var(--primary-color);
      margin-bottom: 20px;
  }
  
  /* 新闻列表样式优化 */
  .news-list {
      background-color: var(--white-color);
      border-radius: 8px;
      padding: 20px;
      box-shadow: var(--shadow);
  }
  
  .news-item {
      border-bottom: 1px solid var(--light-gray);
      padding: 15px;
      margin: 0;
  }
  
  .news-item:last-child {
      border-bottom: none;
  }

:root {
    --primary-color: #1a56db;
    --secondary-color: #0d2b66;
    --accent-color: #3e82fc;
    --light-color: #e9ecef; /* 加深页面背景色 */
    --dark-color: #333;
    --gray-color: #666;
    --light-gray: #dee2e6; /* 加深分隔线颜色 */
    --white-color: #fff;
    --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    --transition: all 0.3s ease;
}

body {
    font-family: 'Microsoft YaHei', 'Helvetica Neue', sans-serif;
    color: var(--dark-color);
    line-height: 1.6;
    background-color: var(--light-color);
    margin: 0;
    padding: 0;
}

/* 调整交替区块背景色 */
.majors, .research {
    background-color: #f1f3f5; /* 比页面背景稍深，增强层次感 */
}
