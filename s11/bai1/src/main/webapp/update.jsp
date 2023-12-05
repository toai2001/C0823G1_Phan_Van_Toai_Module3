<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 10/11/2023
  Time: 00:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hien Thi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
</head>

<body>
<a href="/book">Back</a>
<h2>Update a book</h2>
<form action="/book?action=update" method="post">
    <lable for="id">Id</lable>
    <input type="text" id="id" name="id" value="${book.id}" readonly><br>
    <lable for="tile">tile</lable>
    <input type="text" id="tile" name="tile" value="${book.tile}"><br>
    <lable for="pageSize">pageSize</lable>
    <input type="text" id="pageSize" name="pageSize" value="${book.pageSize}"><br>
    <lable for="author">author</lable>
    <input type="text" id="author" name="author" value="${book.author}"><br>
    <lable for="category">category</lable>
    <input type="text" id="category" name="category" value="${book.category}"><br>
    <button type="submit">Update</button>
</form>
</body>
</html>