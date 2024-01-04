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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <!-- Font Awesome -->


</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/home-servlet">Quản lý quán net</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">

        <li class="nav-item">
          <a class="nav-link" href="/dich-vu-di-kem-servlet">Quản lý dịch vụ đi kèm</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/loai-dich-vu-servlet">Quản lý loại dịch vụ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/nhan-vien-servlet">Quản lý nhân viên</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/tai-khoan-servlet">Quản lý tài khoản</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/may-tinh-servlet">Hiển thị tổng số máy</a>
        </li>
      </ul>
    </div>
    <div class="d-flex m-0 log-in">
      <c:if test="${empty sessionScope.username}">
        <a href="/login" type="button" class="btn btn-primary">Đăng nhập</a>
      </c:if>
      <c:if test="${not empty sessionScope.username}">
        <div class="dropdown text-end">
          <a href="#" name="userName" class="d-block link-dark text-decoration-none dropdown-toggle"
             data-bs-toggle="dropdown" aria-expanded="false">
              ${sessionScope.username}
          </a>
            <%--                        <ul class="dropdown-menu">--%>
            <%--                            <c:if test="${type_account == 'admin'||type_account=='employee'}">--%>
            <%--                                <li><a href="/dashboard/reader" style="color: black ">Quản lý người đọc</a></li>--%>
            <%--                            </c:if>--%>
            <%--                            <c:if test="${type_account == 'admin'||type_account=='employee'}">--%>
            <%--                                <li><a href="/book" style="color: black ">Quản lý sách</a></li>--%>
            <%--                            </c:if>--%>
            <%--                            <c:if test="${type_account == 'admin'}">--%>
            <%--                                <li><a href="/employee" style="color: black ">Quản lý nhân viên</a></li>--%>
            <%--                            </c:if>--%>
            <%--                            <c:if test="${type_account == 'admin'||type_account=='employee'}">--%>
            <%--                                <li><a href="/borrowcard" style="color: black ">Quản lý mượn</a></li>--%>
            <%--                            </c:if>--%>
            <%--                            <c:if test="${type_account == 'user'}">--%>
            <%--                                <li><a href="/dashboard/reader/myborrowcard" style="color: black ">Phiếu mượn của--%>
            <%--                                    tôi</a></li>--%>
            <%--                            </c:if>--%>
          <li><a href="/logout" style="color: #212529">Đăng xuất</a></li>
          </ul>
        </div>
      </c:if>
    </div>
  </div>
</nav>
<!-- Navbar -->
<table class="table table-light container-fluid table-hover">

  <tr>
    <td></td>
    <td><p style="font-size: 30px" class="text-center fw-bold">Lịch sử  dùng </p></td>
    <td></td><td></td>

  <tr> <td> <a  class="btn btn-primary" href="/may-tinh-servlet">Home</a></td></tr>
  </tr>
  <tr class="table-primary">
    <th>Mã máy tính</th>
    <th>Mã bảng sử dụng</th>
    <th>Thời gian bắt đầu</th>
    <th>Thời gian kết thúc</th>
    <th>Thời gian sử dụng</th>
    <th>Nhân Viên </th>
    <th>Chi Tiết dịch vụ</th>
    <th>Tổng Tiền</th>
    <th>Trạng Thái</th>
    <th>Xác Nhận Thanh Toán</th>
  </tr>

  <c:forEach items="${historyList}" var="bangsudung">
    <tr>
      <td>${bangsudung.maMayTinh.idMayTinh}</td>
      <td>${bangsudung.idBangSuDung}</td>
      <td>${bangsudung.gioBatDau}</td>
      <td >${bangsudung.gioKetThuc}</td>
      <td>${(bangsudung.daDung / 60)} phút</td>

      <td>${bangsudung.maNhanVien.idNhanVien}</td>

      <td> <a type="button" href="/history-rental-servlet?action=orderUsed&id=${bangsudung.idBangSuDung}" class="btn btn-secondary" >
        Xem dịch vụ
      </a></td>

      <td>${bangsudung.getTongTien()}</td>
      <c:if test="${bangsudung.status == true}">
        <td>
          <p class="btn btn-success">Đã Thanh Toán</p>
        </td>
      </c:if>

      <c:if test="${bangsudung.status == false}">
        <td>
          <p class="btn btn-warning">Chưa thanh toán</p>
        </td>
      </c:if>

      <c:if test="${bangsudung.status == false}">
        <td><a href="/history-rental-servlet?action=confirmationPayment&id=${bangsudung.idBangSuDung}&idMay=${idMay}" class="btn btn-primary">Đồng ý</a> </td>
      </c:if>
      <c:if test="${bangsudung.status == true}">
        <td><p >Đã thanh toán</p> </td>
      </c:if>
    </tr>
  </c:forEach>
</table>
<!-- Footer -->
<footer id="sticky-footer"
        class=" bg-body-tertiary flex-shrink-0 py-3 bg-dark text-white-50 fs-3 mt-4 fixed-bottom">
  <div class="container text-center">
    <small style="color: red; text-align: center">Copyright &copy; Net Cỏ</small>
  </div>
</footer>


<script src="../ss9/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>