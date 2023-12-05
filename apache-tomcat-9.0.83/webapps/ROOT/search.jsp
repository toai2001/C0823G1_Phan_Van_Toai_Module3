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
    <title>Search By Tile</title>
</head>
<body>
<a href="/book">Back</a>
<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>tile</th>
        <th>page size</th>
        <th>author </th>
        <th>category</th>
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
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>



