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
   <style>
       #sidebar{
           float: left;
           width: 80%;
           height: 100%;
       }
   </style>
</head>
<body>
<c:import url="header.jsp"></c:import>
<c:import url="sidebar.jsp"></c:import>
<h1 style="text-align: center">Quản lý nhân viên</h1>
<table class="table table-light container-fluid table-hover" id="sidebar">
    <tr class="table-primary">
        <td>STT</td>
        <td>Tên</td>
        <td>SDT</td>
        <td>Tên tài khoản</td>
        <td>Sửa</td>
        <td>Xóa</td>
    </tr>
    <c:forEach items="${listEmployee}" var="employee" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${employee.tenNhanVien}</td>
            <td>${employee.soDienThoaiNhanVien}</td>
            <td>${employee.maTaiKhoan.taiKhoan}</td>
            <td> <button style="background-color: #4A5A6F;border-radius: 10px" type="button" class="btn btn-primary" data-bs-toggle="modal"
                         data-bs-target="#exampleModal_${loop.index}">
                Sửa
            </button>
                <div class="modal fade" id="exampleModal_${loop.index}" tabindex="-1"
                     aria-labelledby="exampleModalLabel1"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="/nhan-vien-servlet?action=edit" method="post">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel1">Sửa nhân viên</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="id" value="${employee.idNhanVien}">
                                    <div class="mb-3" style="width: 100%">
                                        <label class="form-label">Tên nhân viên</label>
                                        <input type="text" name="name" required
                                               class="form-control value="${employee.tenNhanVien}">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Số điện thoại nhân viên</label>
                                        <input type="number" name="phone" required
                                               class="form-control value="${employee.soDienThoaiNhanVien}" >
                                    </div>
                                    <br>
                                    <select class="form-select" aria-label="Default select example"
                                            name="tk" required>
                                        <c:forEach items="${listtk}" var="l">
                                            <option value="${l.idTaiKhoan}">${l.taiKhoan}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                                    </button>
                                    <button type="submit" class="btn btn-primary">Sửa</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <button style="background-color: #FD7E37;border-radius: 10px;color: black" type="button" class="btn" data-bs-toggle="modal"
                        data-bs-target="#exampleModal1"
                        onclick="send('${employee.idNhanVien}','${employee.tenNhanVien}')"> Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/nhan-vien-servlet?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #4A5A6F; color:#000; font-size: 1.2rem">
                    <h1 style="color: white" class="modal-title fs-5" id="exampleModalLabel">Xác nhận xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" name="id" id="id">
                <div class="modal-body">
                    Bạn có muốn xóa "<span style="color:black " id="title"></span>" hay không?
                </div>
                <div class="modal-footer">
                    <button style="background-color: #4A5A6F;color: white" type="button" class="btn " data-bs-dismiss="modal">Không</button>
                    <button style="background-color: #FD7E37;color: black" type="submit" class="btn ">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>

<c:import url="footer.jsp"></c:import>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">
</script>
<script>
    function send(id, title) {
        document.getElementById("id").value = id;
        document.getElementById("title").innerText = title;
    }
</script>
</html>
