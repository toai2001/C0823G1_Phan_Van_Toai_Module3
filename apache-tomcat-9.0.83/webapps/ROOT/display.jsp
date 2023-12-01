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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Hien Thi</title>
    <title>Show book list</title>
    <style>
        table tr td {
            border: solid 1px #ccc;
        }

        th {
            border: solid 1px #ccc;
        }
    </style>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Tile</th>
        <th>Page Size</th>
        <th>Author</th>
        <th>Category</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${bookList}" varStatus="STT">
        <tr>
            <td><c:out value="${STT.count}"/></td>
            <td><c:out value="${book.tile}"/></td>
            <td><c:out value="${book.pageSize}"/></td>
            <td><c:out value="${book.author}"/></td>
            <td><c:out value="${book.category}"/></td>
            <td><a href="" onclick="showMessage (${book.id})">Delete</a></td>
            <td><a href="/product?action=getproductbyid&id=${book.id}">Update</a></td>

        </tr>
    </c:forEach>
    </tbody>
    <a href="/book?action=showformcreate">Add a book</a>


</table>
</body>
<script>
    function showMessage(id){
        let option = confirm('Are you sure to delete ?')
        if(option === true){
            window.location.href ='/book?action=delete'+id;
        }
    }
</script>
</html>



