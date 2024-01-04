<%--
  Created by IntelliJ IDEA.
  User: nguyentatquyen
  Date: 26/12/2023
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script
          src="https://kit.fontawesome.com/64d58efce2.js"
          crossorigin="anonymous"
  ></script>
  <link rel="stylesheet" href="login_1-1/style.css" />
  <title>Đăng Nhập & Đăng Ký</title>
</head>
<body>
<div class="container">
  <div class="forms-container">
    <div class="signin-signup">
      <form action="/login" class="sign-in-form" method="post">
        <h2 class="title">Đăng Nhập</h2>
        <div class="input-field">
          <i class="fas fa-user"></i>
          <input type="text" placeholder="Tên Đăng Nhập"   name="tai_khoan"/>
        </div>
        <div class="input-field">
          <i class="fas fa-lock"></i>
          <input type="password" placeholder="Mật Khẩu"  name="mat_khau" />
        </div>
        <input type="submit" value="Đăng Nhập" class="btn solid" />
      </form>
      <c:if test="${not empty errorUsername}">
        <p class="text-danger">
            ${errorUsername}
        </p>
      </c:if>
      <c:if test="${not empty errorPassword}">
        <p class="text-danger">
            ${errorPassword}
        </p>
      </c:if>
      <form action="/signup" class="sign-up-form" method="post">
        <h2 class="title">Tạo Tài Khoản Mới</h2>
        <div class="input-field">
          <i class="fas fa-user"></i>
          <input type="text" placeholder="Tên Tài Khoản"name="tai_khoan_dk" />
        </div>
        <div class="input-field">
          <i class="fas fa-lock"></i>
          <input type="password" placeholder="Mật Khẩu"  name="mat_khau_dk" />
        </div>
        <div class="input-field">
          <i class="fas fa-user"></i>
          <input type="text" placeholder="Họ & Tên"  name="ho_ten" />
        </div>
        <div class="input-field">
          <i class="fas fa-phone"></i>
          <input type="number" placeholder="Số Điện Thoại" name="so_dien_thoai" />
        </div>
        <div class="input-field">
          <i class="fas fa-address-book"></i>
          <input type="text" placeholder="Địa Chỉ" name="dia_chi" />
        </div>
        <div class="input-field">
          <i class="fas fa-envelope"></i>
          <input type="email" placeholder="Email" name="gmail" />
        </div>
        <input type="submit" class="btn" value="Đăng Ký" />
      </form>
    </div>
  </div>

  <div class="panels-container">
    <div class="panel left-panel">
      <div class="content">
        <h3>Bạn Chưa Có Tài Khoản ?</h3>
        <p>
          Hãy Đăng Ký Ngay Để Mua Được Sách Bạn Mong Muốn
        </p>
        <button class="btn transparent" id="sign-up-btn">
          Đăng Ký
        </button>
      </div>
      <img src="login_1-1/notebook.svg" class="image" alt="" />
    </div>
    <div class="panel right-panel">
      <div class="content">
        <h3>Bạn Đã Có Tài Khoản</h3>
        <p>
          Chúng Ta Hãy Đăng Nhập Kẻo Hết Sách Bạn Yêu Thích
        </p>
        <button class="btn transparent" id="sign-in-btn">
          Đăng Nhập
        </button>
      </div>
      <img src="login_1-1/books.svg" class="image" alt="" />
    </div>
  </div>
</div>

<script src="login_1-1/main.js"></script>
</body>
</html>
