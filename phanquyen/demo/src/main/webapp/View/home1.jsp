<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script>

    </script>
    <style>
        #post {
            width: 40%;
            float: left;
        }

        #sidebar {
            width:40%;
            float: right;
        }

    </style>
</head>
<body><c:import url="/header.jsp"></c:import>
<c:import url="/sidebar.jsp"></c:import>
<!-- Navbar -->
<div id="post">
    <div class="container-fluid" style="margin-top: 14px">
        <p style="font-size: 30px" class="text-center fw-bold">Danh sách máy trống </p>
        <table class="table table-striped table-hover ">
            <tr style="background-color: #4A5A6F;">
                <th style="color: white">Tên máy</th>
                <th style="color: white">Mở máy</th>
            </tr>
            <c:if test="${empty mayChuaThue}">
                <tr>
                    <td style="font-size: 26px" colspan="5" class=" text-danger text-center">Máy đã được sử dụng hết.
                    </td>
                </tr>
            </c:if>
            <c:forEach items="${mayChuaThue}" var="mayTinh">
                <tr>
                    <td><a style="text-decoration: none" href="/may-dang-thue-servlet?action=detail&id=${mayTinh.idMayTinh}"><i class="fa-solid fa-computer fs-2"> &nbsp</i>${mayTinh.tenMayTinh}</a>
                    </td>
                    <td><a style="background-color: #4A5A6F;color: white;border-radius: 12px" class="btn btn-hover"
                           href="/may-tinh-servlet?action=startTime&idMay=${mayTinh.idMayTinh}&idNv=${sessionScope.username}">Mở
                        Máy</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div id="sidebar" style="margin-top: 14px">
    <p style="font-size: 30px" class="text-center fw-bold">Danh sách máy đang sử dụng </p>
    <div class="container-fluid">
        <table class="table table-striped table-hover">
            <tr style="background-color: #4A5A6F">
                <th style="color: white">Tên máy</th>
                <th style="color: white">Thời gian bắt đầu</th>
                <th style="color: white">Thêm dịch vụ</th>
                <th style="color: white">Dịch vụ đã dùng</th>
                <th style="color: white">Hành động</th>
            </tr>
            <c:if test="${empty mayDangThue}">
                <tr>
                    <td style="font-size: 26px" colspan="5" class=" text-danger text-center">Chưa có máy mở.</td>
                </tr>
            </c:if>
            <c:forEach items="${mayDangThue}" var="item">

                <tr>
                    <td>
                        <a style="text-decoration: none" href="/may-tinh-servlet?action=detail&id=${item.maMayTinh.idMayTinh}"><i class="fa-solid fa-computer fs-2"> &nbsp</i> ${item.maMayTinh.tenMayTinh}</a>
                    </td>
                    <td>
                        <fmt:formatDate value="${item.gioBatDauDate}" pattern="dd-MM-yyyy HH:mm:ss" var="formattedDateTime" />
                            ${formattedDateTime}
                    </td>

                    <td>
                        <a style="background-color: #4A5A6F;color: white;border-radius: 12px" type="button" href="/may-dang-thue-servlet?action=orderFood&id=${item.maMayTinh.idMayTinh}"
                           class="btn">
                            Thêm dịch vụ
                        </a>
                    </td>
                    <td>
                        <a style="background-color: #4A5A6F;border-radius: 12px" type="button" href="/may-dang-thue-servlet?action=orderUsed&id=${item.maMayTinh.idMayTinh}"
                           class="btn btn-secondary">
                            Xem dịch vụ
                        </a>
                    </td>
                    <td>
                        <a style="border-radius: 12px;background-color: #FD7E37;color: black" class="btn"
                           href="/may-tinh-servlet?action=endTime&idMay=${item.maMayTinh.idMayTinh}">Tắt máy</a>
                    </td>

                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<br> <br> <br>
<!-- Footer -->
<c:import url="../footer.jsp"></c:import>
<script>


    function adjustQuantity(productId, adjustment) {
        const quantity = document.getElementById('quantity' + productId);
        const showQuantity = document.getElementById('show-quantity' + productId);
        if (adjustment === "GIAM") {
            if (+quantity.value > 0) {
                quantity.value--;
            }
        } else if (adjustment === "TANG") {
            quantity.value++;
        }
        showQuantity.innerText = quantity.value;
    }
</script>

<script src="../ss9/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>