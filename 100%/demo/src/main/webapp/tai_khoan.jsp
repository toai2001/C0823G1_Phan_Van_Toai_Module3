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

    <style>
        #sidebar {
            float: left;
            width: 80%;
            height: 100%;
        }
    </style>
</head>
<body>
<c:import url="/header.jsp"></c:import>
<c:import url="/sidebar.jsp"></c:import>
<h1 style="text-align: center;margin: 20px 0">Quản lý tài khoản</h1>
<table class="table container-fluid table-hover" id="sidebar">
    <tr style="background-color: #4A5A6F">
        <th style="color: white">STT</th>
        <th style="color: white">Tài khoản</th>
        <th style="color: white">Mật khẩu</th>
        <th style="color: white">Loại tài khoản</th>
        <th style="color:white;" colspan="2"></th>
    </tr>
    <c:forEach items="${listAccount}" var="acc" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${acc.taiKhoan}</td>
            <td>${acc.matKhau}</td>
            <td>${acc.loaiTaiKhoan}</td>
            <td></td>
            <td></td>
        </tr>
    </c:forEach>
</table>
<c:import url="/footer.jsp"></c:import>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script>

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>
