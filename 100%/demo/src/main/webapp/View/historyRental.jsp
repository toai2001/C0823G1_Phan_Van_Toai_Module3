<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 11:31 PM
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
<c:import url="/header.jsp"></c:import>
<c:import url="/sidebar.jsp"></c:import>
<h1 style="text-align: center;margin: 20px 0">Nhật kí sử dụng máy</h1>
<table class="table  container-fluid table-hover" id="sidebar">
    <tr style="background-color: #4A5A6F">
        <th style="color:white;">Mã máy tính</th>
<%--        <th style="color:white;">Mã bảng sử dụng</th>--%>
        <th style="color:white;">Thời gian bắt đầu</th>
        <th style="color:white;">Thời gian kết thúc</th>
        <th style="color:white;">Thời gian sử dụng</th>
        <th style="color:white;">Mã nhân Viên</th>
        <th style="color:white;">Chi Tiết sử dụng</th>
        <th style="color:white;">Tiền dịch vụ</th>
        <th style="color:white;">Tổng Tiền</th>
        <th style="color:white;">Trạng Thái</th>
        <th style="color:white;">Thanh Toán</th>
    </tr>

    <c:forEach items="${historyList}" var="bangsudung">
        <tr>
            <td>${bangsudung.maMayTinh.idMayTinh}</td>
<%--            <td>${bangsudung.idBangSuDung}</td>--%>

            <td>
                <fmt:formatDate value="${bangsudung.gioBatDauDate}" pattern="dd-MM-yyyy HH:mm:ss" var="formattedDateTime" />
                    ${formattedDateTime}
            </td>

            <td>
                <fmt:formatDate value="${bangsudung.gioKetThucDate}" pattern="dd-MM-yyyy HH:mm:ss" var="formattedDateTime" />
                    ${formattedDateTime}
            </td>

            <c:if test="${(bangsudung.daDung) < 1}">
                <td> 1 phút</td>
            </c:if>
            <c:if test="${(bangsudung.daDung) >= 1}">
                <td>${(bangsudung.daDung)} phút</td>
            </c:if>


            <td>${bangsudung.maNhanVien.idNhanVien}</td>

            <td><a type="button" href="/history-rental-servlet?action=orderUsed&id=${bangsudung.idBangSuDung}"
                   class="btn btn-secondary">
                Chi tiết dùng
            </a></td>
            <td>
                <fmt:formatNumber value="${bangsudung.getTienDichVu()}" type="currency" currencyCode="VND"/>

            </td>

            <c:if test="${bangsudung.getTongTien() < 1000}">
                <td>
                    <fmt:formatNumber value="1000" type="currency" currencyCode="VND"/>
                </td>
            </c:if>

            <c:if test="${bangsudung.getTongTien() > 1000}">
                <td>
                    <fmt:formatNumber value="${bangsudung.getTongTien()}" type="currency" currencyCode="VND"/>
                </td>
            </c:if>


            <c:if test="${bangsudung.status == true}">
                <td>
                    <p style="border-radius: 12px;background-color: #4A5A6F;color: white" class="btn">Đã Thanh Toán</p>
                </td>
            </c:if>

            <c:if test="${bangsudung.status == false}">
                <td>
                    <p style="border-radius: 12px" class="btn btn-warning">Chưa thanh toán</p>
                </td>
            </c:if>

            <c:if test="${bangsudung.status == false}">
                <td>
                    <a style="border-radius: 12px" href="/history-rental-servlet?action=confirmationPayment&id=${bangsudung.idBangSuDung}&idMay=${idMay}"
                       class="btn btn-primary">Đồng ý</a></td>
            </c:if>
            <c:if test="${bangsudung.status == true}">
                <td><p>Đã thanh toán</p></td>
            </c:if>
        </tr>
    </c:forEach>
</table>
<!-- Footer -->
<c:import url="../footer.jsp"></c:import>


<script src="../ss9/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>