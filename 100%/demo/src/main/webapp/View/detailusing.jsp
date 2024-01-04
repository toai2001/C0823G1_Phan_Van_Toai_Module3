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
        #sidebar{
            float: left;
            width: 80%;
            height: 100%;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<c:import url="/header.jsp"></c:import>

<!-- Navbar -->
<h1 style="text-align: center">Bảng sử dụng chi tiết</h1>
<table class="table table-light table-hover" id="sidebar">
    <tr class="table-primary">
        <th>Mã máy tính</th>
        <th>Tên máy</th>
        <th>Thời gian bắt đầu</th>
        <th>Tiền dịch vụ</th>
        <th>Chi Tiết dịch vụ</th>
    </tr>

    <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td><a href="/may-tinh-servlet" class="btn btn-primary">Back</a></td>
        <td><a href="/View/orderFood.jsp">
            <button>Xem</button>
        </a></td>
    </tr>
</table>
<br> <br> <br>

<!-- Footer -->
<c:import url="../footer.jsp"></c:import>


<script src="../ss9/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>