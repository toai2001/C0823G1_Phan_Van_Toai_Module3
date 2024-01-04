<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <!-- Font Awesome -->

    <style>
        * {
            padding: 0;
            margin: 0;
            border: 0;
            box-sizing: border-box;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
        }

        .quantity-controls input {
            width: 3em;
            text-align: center;
            margin: 0 1.5em;
        }

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
<h1 style="text-align: center">Dịch vụ đã dùng</h1>
<div class="container-fluid" id="sidebar">
    <div class="row">
        <table class="table table-hover  table-striped">
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td><a href="/home-servlet" class="btn btn-primary">Trở về trang chủ</a></td>
            </tr>
            <tr class="table-primary">
                <th>#</th>
                <th>Tên dịch vụ</th>
                <th>Số Lượng</th>
                <th>Giá bán</th>
            </tr>
            <c:forEach items="${listUsed}" var="item" varStatus="loop">
                <tr>
                    <td>${loop.count}</td>
                    <td>${item.maDichVuDiKem.tenDichVuDiKem}</td>
                    <td>${item.soLuong}</td>
                    <td>${item.maDichVuDiKem.giaDichVuDiKem} Vnd</td>
                </tr>
            </c:forEach>
        </table>

    </div>


</div>
<!-- End container -->
<br><br><br>
<!-- Start Footer -->
<c:import url="../footer.jsp"></c:import>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>

</body>
</html>