<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <!-- Font Awesome -->
    <style>
        #sidebar {
            float: left;
            width: 80%;
            height: 100%;
        }
    </style>
</head>
<body><c:import url="/header.jsp"></c:import>
<c:import url="/sidebar.jsp"></c:import>
<!-- Navbar -->
<h1 style="text-align: center"> Thông tin chi tiết của máy tính</h1>
<table class="table  table-hover" id="sidebar">
    <tr style="background-color: #4A5A6F">
        <th style="color: white">Mã máy tính</th>
        <th style="color: white">Tên máy</th>
        <th style="color: white">Ram Máy</th>
        <th style="color: white">Chip</th>
        <th style="color: white">Hãng</th>
        <th style="color: white">Tình trạng máy</th>
    </tr>

    <tr>
        <td>${computer.idMayTinh} </td>
        <td>${computer.tenMayTinh}</td>
        <td>${computer.ramMayTinh} </td>
        <td>${computer.chip}</td>
        <td>${computer.hang}</td>
        <td>1</td>
    </tr>
</table>
<br> <br> <br>

<!-- Footer -->
<c:import url="../footer.jsp"></c:import>


<script src="../ss9/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>