<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <style>
        #sidebar{
            float: left;
            width: 80%;
            height: 100%;
        }
    </style>
</head>
<body><c:import url="/header.jsp"></c:import>
<c:import url="/sidebar.jsp"></c:import>
<!-- Navbar -->
<h1 style="text-align: center">Quản lý phòng máy</h1>
<table class="table table-light container-fluid table-hover" id="sidebar">
    <tr class="table-primary">
        <th>Tên máy</th>
        <th>Ram</th>
        <th>Chip</th>
        <th>Hãng</th>
        <th>Lịch sử</th>
    </tr>
    <c:forEach items="${mayTinhList}" var="mayTinh">

        <tr>
            <td><a style="text-decoration: none" href="/may-tinh-servlet?action=detail&id=${mayTinh.idMayTinh}"><i class="fa-solid fa-computer fs-2"> &nbsp</i>${mayTinh.tenMayTinh}</a></td>
            <td>${mayTinh.ramMayTinh}</td>
            <td>${mayTinh.chip}</td>
            <td>${mayTinh.hang}</td>
            <td>
                <a style="background-color: #4A5A6F;color: white;border-radius: 12px" class="btn " href="history-rental-servlet?action=historyRental&id=${mayTinh.idMayTinh}">Lịch
                    sử thuê </a>
            </td>

        </tr>
    </c:forEach>
</table>

<br> <br> <br>

<table class="table table-light container-fluid table-hover">

</table>

<!-- Footer -->
<c:import url="../footer.jsp"></c:import>
<script>
</script>

<script src="../ss9/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>