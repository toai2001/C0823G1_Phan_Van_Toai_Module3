<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/main.css">

</head>
<!--HEADER-->
<div id="header">
    <!-- Header-->

    <nav class="navbar navbar-light header"style=" background: aliceblue;">

        <div class="container">
            <a class="navbar-brand py-0" href="#">
                <img src="https://muaacc.vn/wp-content/uploads/2023/05/f439ecd3d27304b80697b3c97b6306f0.png" alt="logo" width="100px">
            </a>
            <form class="d-flex w-50">
                <input class="form-control" type="search" placeholder="Nhập tên sách, tác giả hoặc thể loại để tìm"
                       aria-label="Search">
                <button class="btn btn-outline-light ms-1" type="submit">Search</button>
            </form>
            <div class="d-flex m-0 log-in">
                <c:if test="${empty sessionScope.username}">
                    <a href="/login.jsp" type="button" class="btn btn-primary">Đăng nhập</a>
                </c:if>
                <c:if test="${not empty sessionScope.username}">
                    <div class="dropdown show">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Thế loại
                        </a>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="#">Liên quân</a>
                            <a class="dropdown-item" href="#">FreeFine</a>
                            <a class="dropdown-item" href="#">Liên Minh</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </nav>

    <!--    NAV BAR-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light p-0" style=" background: aliceblue;">
        <div class="container-fluid">
            <div class="collapse navbar-collapse d-flex justify-content-center align-items-center"
                 id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Trang chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Thể loại
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Liên Quân</a></li>
                            <li><a class="dropdown-item" href="#">Liên Minh</a></li>
                            <li><a class="dropdown-item" href="#">Pubg</a></li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Lịch sử mua hàng</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>