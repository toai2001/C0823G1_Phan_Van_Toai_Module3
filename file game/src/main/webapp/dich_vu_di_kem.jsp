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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script>

    </script>
</head>
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
                    <a class="nav-link" href="/loai-dich-vu-servlet">Quản lý loại dịch vụ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/nhan-vien-servlet">Quản lý nhân viên</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/tai-khoan-servlet">Quản lý tài khoản</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn " data-bs-toggle="modal" data-bs-target="#exampleModal">Thêm dịch vụ đi
                        kèm</a>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel2"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel2">Thêm loại dịch vụ</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="/dich-vu-di-kem-servlet?action=add" method="post">
                                        <div class="mb-3">
                                            <label class="form-label">Nhập tên dịch vụ đi kèm</label>
                                            <input type="text" class="form-control" name="name">
                                            <label class="form-label">Nhập giá dịch vụ đi kèm</label>
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
                                        <button type="submit" class="btn btn-primary">Thêm</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
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
<h1 style="text-align: center">Danh sách dịch vụ đi kèm</h1>
<table class="table" style="width: 100%;">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Tên Dịch Vụ Đi Kèm</th>
        <th scope="col">Giá dịch vụ đi kèm</th>
        <th scope="col">Loại dịch vụ</th>
        <th scope="col">Sửa</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listdvdk}" var="dvdk" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${dvdk.tenDichVuDiKem}</td>
            <td>${dvdk.giaDichVuDiKem}</td>
            <td>${dvdk.tenLoaiDichVu}</td>
            <td>
                <a class="btn btn-primary" role="button"
                   href="/dich-vu-di-kem-servlet?action=edit&id=${dvdk.maDichVuDiKem}">Sửa</a>
            </td>
            <td>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal1"
                        onclick="send('${dvdk.maDichVuDiKem}','${dvdk.tenDichVuDiKem}')"> Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/dich-vu-di-kem-servlet?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #ffc107; color:#000; font-size: 1.2rem">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" name="id" id="id">
                <div class="modal-body">
                    Bạn có muốn xóa "<span style="color:#ffc107 " id="title"></span>" hay không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-warning">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
<footer id="sticky-footer"
        class="bg-body-tertiary flex-shrink-0 py-3 bg-dark text-white-50 fs-3 mt-4 fixed-bottom">
    <div class="container text-center">
        <small style="color: red; text-align: center">Copyright &copy; Net Cỏ</small>
    </div>
</footer>
</body>
<script>
    function send(id, title) {
        document.getElementById("id").value = id;
        document.getElementById("title").innerText = title;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">
</script>

</html>