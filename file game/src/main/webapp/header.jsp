<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main.css">
</head>
<!--HEADER-->


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
<!-- NAV BAR-->
