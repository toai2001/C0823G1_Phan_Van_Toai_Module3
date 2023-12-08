<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/20/2023
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sửa</title>
</head>
<body>
<form action="/book?action=update" method="post">
    <lable for="bookTile">tile</lable>
    <input type="text" id="bookTile" name="bookTile"><br>
    <lable for="bookPageSize">bookPageSize</lable>
    <input type="number" id="bookPageSize" name="bookPageSize"><br>

    <div class="mb-3">
        <label for="authorId" class="form-label">Tác Giả</label></br>
        <select class="form-label" name="authorId" id="authorId">
            <c:forEach items="${authorId}" var="authorId">
                <option  value="${authorId.authorId}">${authorId.authorName}</option>
            </c:forEach>

        </select>
    </div>
    <div class="mb-3">
        <label for="categoryId" class="form-label">THể Loại</label></br>
        <select class="form-label" name="categoryId" id="categoryId">
            <c:forEach items="${categoryId}" var="categoryId">
                <option  value="${categoryId.categoryId}">${categoryId.categoryName}</option>
            </c:forEach>

        </select>
    </div>
    <button type="submit">Sửa


    </button>
</form>
</body>
</html>