<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="teacher" scope="request" type="com.e6.entity.Teacher"/>
<jsp:useBean id="titles" scope="request" type="java.util.List<com.e6.entity.Title>"/>
<jsp:useBean id="courses" scope="request" type="java.util.List<com.e6.entity.Course>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:url var="base" value="/"/>
    <base href="${base}">
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form action="updateteacher" method="post">
    用户：<input name="name" value="${teacher.name }"> <br>
    注册时间：${teacher.insertTime}
    <br>
    职称：<select name="titleid">
    <c:forEach items="${titles }" var="t">
        <c:set var="sel" value=""/>
        <c:if test="${t.id==teacher.title.id }">
            <c:set var="sel" value="selected"/>
        </c:if>
        <option value="${t.id }" ${sel }>${t.name }</option>
    </c:forEach>
</select> <br>
    授课：
    <ul>
        <c:forEach items="${courses }" var="c">
            <c:set var="ch" value=""/>
            <c:forEach items="${teacher.courses }" var="tc">
                <c:if test="${tc.id == c.id }">
                    <c:set var="ch" value="checked"/>
                </c:if>
            </c:forEach>
            <li><label>
                <input type="checkbox" name="courseids" value="${c.id }" ${ch }>
                    ${c.name }
            </label></li>
        </c:forEach>
    </ul>
    <button type="submit">提交</button>
    <button type="reset">重置</button>
</form>
</body>
</html>