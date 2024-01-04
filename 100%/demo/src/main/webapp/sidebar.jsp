<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/sidebar.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <style>
        li {
            padding-left: 12px;
            margin-top: 5px;
            margin-left: 12px;
        }

        .col {
            float: left;
            width: 20%;
            height: 100%;
        }
    </style>
</head>
<body>
<div class="flex-shrink-0 p-3 bg-white col" style="height: 100vh;overflow-y: auto;">
    <ul class=" list-unstyled ps-0">
        <li class="mb-1">
            <c:if test="${loai_tai_khoan == 'admin'}">
                <button class="btn btn-toggle align-items-center rounded collapsed " data-bs-toggle="collapse"
                        data-bs-target="#dashboard-collapse1" aria-expanded="false" style="font-size: 20px">
                    <i class="fa-solid fa-user"></i> Quản lý nhân viên
                </button>
            </c:if>
            <div class="collapse" id="dashboard-collapse1">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/nhan-vien-servlet" class="link-dark rounded"
                           style="font-size: 17px ;text-decoration: none">Hiển thị danh
                        sách nhân viên</a></li>
<%--                    <li><a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"--%>
<%--                           class="link-dark rounded" style="font-size: 17px;text-decoration: none">Thêm mới nhân--%>
<%--                        viên</a></li>--%>
                    <li><a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal_acc123"
                           class="link-dark rounded" style="font-size: 17px;text-decoration: none">Thêm mới nhân
                        viên và tài khoản</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#dashboard-collapse2" aria-expanded="false" style="font-size: 20px">
                <i class="fa-solid fa-display"></i> Quản lý máy tính
            </button>
            <div class="collapse" id="dashboard-collapse2">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/may-tinh-servlet" class="link-dark rounded"
                           style="font-size: 17px ; text-decoration: none">Hiển thị danh sách
                        máy tính</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#dashboard-collapse3" aria-expanded="false" style="font-size: 20px">
                <i class="fa-solid fa-utensils"> </i> Quản lý dịch vụ
            </button>
            <div class="collapse" id="dashboard-collapse3">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/dich-vu-di-kem-servlet" class="link-dark rounded"
                           style="font-size: 17px; text-decoration: none">Hiển thị
                        danh sách dịch vụ</a></li>
                    <li><a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal_service"
                           class="link-dark rounded" style="font-size: 17px; text-decoration: none">Thêm mới dịch vụ</a>
                    </li>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#dashboard-collapse4" aria-expanded="false" style="font-size: 20px">
                <i class="fa-brands fa-product-hunt"> </i> Quản lý loại dịch vụ
            </button>
            <div class="collapse" id="dashboard-collapse4">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/loai-dich-vu-servlet" class="link-dark rounded"
                           style="font-size: 17px; text-decoration: none">Hiển thị danh
                        sách loại dịch vụ</a>
                    </li>
                    <li><a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal_service1"
                           class="link-dark rounded" style="font-size: 17px; text-decoration: none">Thêm mới loại dịch
                        vụ</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <c:if test="${loai_tai_khoan == 'admin'}">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                        data-bs-target="#dashboard-collapse5" aria-expanded="false" style="font-size: 20px">
                    <i class="fa-solid fa-receipt"> </i> Quản lý tài khoản
                </button>
            </c:if>
            <div class="collapse" id="dashboard-collapse5">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/tai-khoan-servlet" class="link-dark rounded"
                           style="font-size: 17px; text-decoration: none">Hiển thị tài
                        khoản</a>
                    </li>
                    <li><a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal_acc123"
                           class="link-dark rounded" style="font-size: 17px;text-decoration: none">Thêm mới nhân
                        viên và tài khoản</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <c:if test="${loai_tai_khoan == 'admin'}">
                <button class="btn btn-toggle align-items-center rounded collapsed " data-bs-toggle="collapse"
                        data-bs-target="#dashboard-collapse6" aria-expanded="false" style="font-size: 20px">
                    <i class="fa-solid fa-chart-simple"> </i> Thống kê
                </button>
            </c:if>
            <div class="collapse" id="dashboard-collapse6">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/thong-ke-servlet" class="link-dark rounded"
                           style="font-size: 17px ;text-decoration: none">Hiển thị biểu đồ thống kê</a></li>
                </ul>
            </div>
        </li>
    </ul>
</div>
</body>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm mới nhân viên</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/nhan-vien-servlet?action=add" method="post">
                <div class="modal-body">
                    <label class="form-label">Nhập tên nhân viên</label>
                    <input type="text" class="form-control" name="name" required>
                    <label class="form-label">Nhập số điện thoại nhân viên</label>
                    <input type="number" class="form-control" name="phone">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--dich vu--%>

<div class="modal fade" id="exampleModal_service" tabindex="-1" aria-labelledby="exampleModalLabel_service"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel_service">Thêm mới dịch vụ</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/dich-vu-di-kem-servlet?action=add" method="post">
                <div class="modal-body">
                    <label class="form-label">Nhập tên dịch vụ</label>
                    <input type="text" class="form-control" name="name">
                    <label class="form-label">Nhập giá </label>
                    <input type="number" class="form-control" name="price">
                    <br>

                    <select class="form-select" aria-label="Default select example"
                            name="maldv">
                        <option selected>Chọn loại dịch vụ</option>
                        <c:forEach items="${list}" var="l" varStatus="loop">
                            <option value="${l.maLoaiDichVu}">${l.tenLoaiDichVu}</option>
                        </c:forEach>
                    </select>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%-- them moi loai dich vu--%>
<div class="modal fade" id="exampleModal_service1" tabindex="-1" aria-labelledby="exampleModalLabel_service1"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div style="background-color: #4A5A6F;color: white" class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel_service1">Thêm mới loại dịch vụ</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/loai-dich-vu-servlet?action=add" method="post">
                <div class="modal-body">
                    <label class="form-label">Nhập tên loại dịch vụ</label>
                    <input type="text" class="form-control" name="name" required>
                </div>
                <div class="modal-footer">
                    <button style="background-color: #4A5A6F;color: white" type="button" class="btn"
                            data-bs-dismiss="modal">Đóng
                    </button>
                    <button style="background-color: #FD7E37;color: white" type="submit" class="btn btn-primary">Thêm
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal_acc" tabindex="-1" aria-labelledby="exampleModalLabel_acc"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel_acc">Tạo account mới</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/tai-khoan-servlet?action=add" method="post">
                <div class="modal-body">
                    <label class="form-label">Tài khoản</label>
                    <input type="text" class="form-control" name="tk" required>
                    <label class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" name="password" required>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--tuan them account --%>
<div class="modal fade" id="exampleModal_acc123" tabindex="-1" aria-labelledby="exampleModalLabel_acc123"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel_acc123">Tạo nhân viên và account mới</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/home-servlet?action=addEmployee" method="post">
                <div class="modal-body">
                    <label class="form-label">Nhập tên nhân viên (*)</label>
                    <input type="text" class="form-control" name="name" required>
                    <label class="form-label">Nhập số điện thoại nhân viên (*)</label>
                    <input type="number" class="form-control" name="phone" required>
                    <label class="form-label">Tài khoản (*)</label>
                    <input type="text" class="form-control" name="tk" required>
                    <label class="form-label">Mật khẩu (*)</label>
                    <input type="password" class="form-control" name="password" required>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </div>
            </form>
        </div>
    </div>
</div>

