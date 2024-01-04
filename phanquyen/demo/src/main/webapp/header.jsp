<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main.css">
    <style>
        .dropdown-menu li a:hover {
            background-color: aqua; /* Màu khi di chuột vào */
            color: red; /* Màu chữ khi di chuột vào */
        }
    </style>
</head>
<!--HEADER-->

<nav style="background-color: rgb(74,90,111);height: 80px" class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="https://play-lh.googleusercontent.com/TgST9HEKS3oEjSQ1uZxA9OdMEPTNxsiyJ1fIMqlQNtJxv-MmHgIGP0h0Dbt-WGHDHQ"
                 width="110" height="83" alt="">
        </a>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a style="color: white; font-size: 22px;" class="nav-link" href="/home-servlet">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a style="color: white; font-size: 22px;" class="nav-link" href="/may-tinh-servlet">Hiển thị tất cả máy</a>
                </li>
            </ul>
        </div>
        <div class="d-flex ms-auto">
            <c:if test="${empty sessionScope.username}">
                <a style="color: white; font-size: 22px;" href="/login" type="button" class="btn btn-primary">Đăng nhập</a>
            </c:if>
            <c:if test="${not empty sessionScope.username}">
                <div class="dropdown">
                    <a href="#" name="userName" class="d-block link-dark text-decoration-none dropdown-toggle"
                       id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${sessionScope.username}
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:if test="${loai_tai_khoan == 'admin' || loai_tai_khoan == 'Nhân viên'}">
                            <li><a href="/logout" style="color: black; font-size: 14px; text-decoration: none;">Đăng xuất</a></li>
                        </c:if>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
</nav>