// 在文件顶部添加导入声明
import java.util.Date;

public class News {
    private String id;
    private String title;
    private String content;
    private Date publishTime;  // 已简化类型声明
    private String author;
    private Date insertTime;   // 已简化类型声明

    // 构造函数 - 现在可以正确识别Date类型
    public News(String id, String title, String content, Date publishTime, String author, Date insertTime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.publishTime = publishTime;
        this.author = author;
        this.insertTime = insertTime;
    } // 构造函数结束

    // 添加缺失的类结束大括号
}