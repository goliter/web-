**注意，部署到平台上的项目点击跳转到对应实验会失败并跳转回主页，本地测试没有问题，目前原因未知**

# Java Web 应用实验项目

这是一个基于 Java Servlet 技术栈的 Web 应用项目，包含多个实验模块，用于学习和实践 Java Web 开发的各种技术。

## 🚀 技术栈

- **Java 21**: 主要编程语言
- **Jakarta Servlet API 6.0**: Web 应用框架
- **JSP & JSTL 3.0**: 视图层技术
- **MySQL 8.4**: 数据库
- **Maven 3**: 项目构建工具
- **Jakarta Annotations**: 注解支持

## 📁 项目结构

```
web-/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       ├── app/          # 主应用模块
│       │       ├── e5/           # 实验5 - 登录认证
│       │       ├── e6/           # 实验6 - 教师管理
│       │       ├── e7/           # 实验7 - 用户查询
│       │       └── e8/           # 实验8 - 用户管理与服务工厂
│       ├── resources/            # 资源文件
│       └── webapp/              # Web 资源
│           ├── app/             # 主应用页面
│           ├── e5/              # 实验5页面
│           ├── e6/              # 实验6页面
│           ├── e7/              # 实验7页面
│           ├── e8/              # 实验8页面
│           ├── experiment/       # 实验通用页面
│           └── META-INF/        # 元信息配置
├── target/                      # 编译输出目录
├── pom.xml                     # Maven 配置文件
└── .gitignore                  # Git 忽略文件配置
```

## 🔧 功能模块

### 主应用模块 (`app`)
- 新闻管理系统
- 首页展示
- 数据库连接池管理

### 实验模块

#### 实验5 (`e5`)
- 用户登录认证
- Session 管理
- 页面转发与重定向

#### 实验6 (`e6`)
- 教师信息管理
- 表单数据处理
- 多选框数据绑定

#### 实验7 (`e7`)
- 用户信息查询
- 数据库操作
- PreparedStatement 使用

#### 实验8 (`e8`)
- 服务工厂模式
- 用户管理系统
- 单例模式实现

## 🗄️ 数据库配置

项目使用 MySQL 数据库，需要配置 JNDI 数据源：

```xml
<Resource name="jdbc/MySQL"
          auth="Container"
          type="javax.sql.DataSource"
          maxTotal="100"
          maxIdle="30"
          maxWaitMillis="10000"
          username="your_username"
          password="your_password"
          driverClassName="com.mysql.cj.jdbc.Driver"
          url="jdbc:mysql://localhost:3306/your_database"/>
```

## 🛠️ 环境要求

- Java 21 或更高版本
- Maven 3.6 或更高版本
- MySQL 8.0 或更高版本
- Tomcat 10 或其他支持 Jakarta EE 的应用服务器

## 🚀 运行方式

### 1. 编译项目
```bash
mvn clean compile
```

### 2. 打包项目
```bash
mvn clean package
```

### 3. 部署到服务器
将生成的 `target/webapp-1.0-SNAPSHOT.war` 文件部署到 Tomcat 服务器的 `webapps` 目录下。

### 4. 访问应用
- 主页: `http://localhost:8080/webapp/index`
- 新闻页面: `http://localhost:8080/webapp/app/news`
- 实验5登录: `http://localhost:8080/webapp/com/filter/login`
- 实验8用户管理: `http://localhost:8080/webapp/e8`

## 📝 开发说明

### Servlet 注解
项目使用 `@WebServlet` 注解进行 URL 映射，无需额外的 web.xml 配置。

### 数据库工具类
各模块都包含数据库连接工具类：
- `com.app.util.DataSourceUtils`
- `com.e7.utils.DataSourceUtils`
- `com.e8.util.DataSourceUtils`

### 服务层设计
实验8模块实现了服务工厂模式 (`ServiceFactory`)，提供统一的服务实例管理。

## 🤝 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📄 许可证

本项目基于学习目的创建，仅供教育和研究使用。
