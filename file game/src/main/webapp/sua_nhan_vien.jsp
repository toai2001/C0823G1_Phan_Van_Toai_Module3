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
<body>

<c:import url="/header.jsp"></c:import>
<h1>Sửa Nhân Viên</h1>
<form action="/nhan-vien-servlet?action=edit" method="post">
    <div class="modal-body">
        <div class="mb-3">
            <input type="hidden" name="id" value="${nhanVien.idNhanVien}">
            <label class="form-label">Nhập tên nhân viên</label>
            <input type="text" class="form-control" name="name">
            <label class="form-label">Nhập số điện thoại nhân viên</label>
            <input type="number" class="form-control" name="phone">
            <select class="form-select" aria-label="Default select example"
                    name="tk">
                <c:forEach items="${list}" var="l">
                    <option value="${l.idTaiKhoan}">${l.taiKhoan}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
        </button>
        <button type="submit" class="btn btn-primary">Sửa</button>
    </div>
</form>
<footer id="sticky-footer"
        class=" bg-body-tertiary flex-shrink-0 py-3 bg-dark text-white-50 fs-3 mt-4 fixed-bottom">
    <div class="container text-center">
        <small style="color: red; text-align: center">Copyright &copy; Net Cỏ</small>
    </div>
</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>
