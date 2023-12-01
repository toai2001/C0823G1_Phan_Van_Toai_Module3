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
    <title>Show product list</title>
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
    <c:forEach var="product" items="${bookList}" varStatus="STT">
        <tr>
            <td><c:out value="${STT.count}"/></td>
            <td><c:out value="${book.tile}"/></td>
            <td><c:out value="${book.pageSize}"/></td>
            <td><c:out value="${book.author}"/></td>
            <td><c:out value="${book.category}"/></td>
<%--            <td><a href="" onclick="showMessage(${book.id})">Delete</a></td>--%>
<%--            <td><a href="/product?action=getproductbyid&id=${book.id}">Update</a></td>--%>
<%--            <td>--%>
<%--                <form action="/product?action=showdetail&id=${book.id}" method="post">--%>
<%--                    <button type="submit">Show detail</button>--%>
<%--                </form></td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>



