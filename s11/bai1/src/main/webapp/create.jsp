<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/29/2023
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/book">Back</a>
<h2>Add a book</h2>
<form action="/book?action=create" method="post">
    <lable for="tile">tile</lable>
    <input type="text" id="tile" name="tile"><br>
    <lable for="pageSize">pageSize</lable>
    <input type="number" id="pageSize" name="pageSize"><br>
    <lable for="author">author</lable>
    <input type="text" id="author" name="author"><br>
    <lable for="category">category</lable>
    <input type="text" id="category" name="category"><br>
    <button type="submit">Add</button>
</form>
</body>
</html>