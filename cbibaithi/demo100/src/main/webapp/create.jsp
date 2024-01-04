<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="margin:20px 10px 50px">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/HangHoa">Trang chủ</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Tìm</button>
            </form>
        </div>
    </div>
</nav>
<!--FORM-->
<div class="container">
    <div class="row mb-5"><h1 style="text-align: center">THÊM MỚI PRODUCT</h1></div>
    <div class="row">
        <form action="/HangHoa?action=create" method="post">
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Mã hàng hóa</label>
                <input required name="maHangHoa" type="text" class="form-control" id="formGroupExampleInput"
                       placeholder="Nhập mã hàng hóa (MHH-XXXX)">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">Tên hàng hóa</label>
                <input required name="tenHangHoa" type="text" class="form-control" id="formGroupExampleInput2"
                       placeholder="Nhập tên hàng hóa">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput7" class="form-label">ĐƠn vị tính</label>
                <input required name="donViHangHoa" type="text" class="form-control" id="formGroupExampleInput7"
                       placeholder="Nhập đơn vị tính">
            </div>
<%--            <div class="mb-3">--%>
<%--                <label for="formGroupExampleInput3" class="form-label">Giá</label>--%>
<%--                <input required name="price" type="text" class="form-control" id="formGroupExampleInput3"--%>
<%--                       placeholder="Nhập giá hàng hóa">--%>
<%--            </div>--%>
            <div class="mb-3">
                <label for="formGroupExampleInput4" class="form-label">Loại hàng hóa</label>
                <select class="form-label" name="idLoaiHangHoa" id="idLoaiHangHoa">
                    <c:forEach items="${loaiHangHoaId}" var="loaiHangHoaId">
                        <option  value="${loaiHangHoaId.idLoaiHangHoa}">${loaiHangHoaId.tenLoaiHangHoa}</option>
                    </c:forEach>

                </select>
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput4" class="form-label">Ngày thu hoạch</label>
                <input required name="ngayThuHoach" type="text" class="form-control" id="formGroupExampleInput4"
                       placeholder="Nhập ngày thu hoạch">
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>