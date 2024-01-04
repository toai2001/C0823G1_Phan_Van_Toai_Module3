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
        #sidebar {
            float: left;
            width: 80%;
            height: 100%;
        }
    </style>
</head>
<body>
<c:import url="header.jsp"></c:import>
<c:import url="sidebar.jsp"></c:import>
<h1 style="text-align: center;margin: 20px 0">Danh sách loại dịch vụ</h1>

<c:if test="${not empty requestScope.successMessage}">
    <div style="color: green;">
            ${requestScope.successMessage}

    </div>
</c:if>




<table class="table" id="sidebar">
    <thead style="background-color: #4A5A6F">
    <tr>
        <th style="color:white;" scope="col">STT</th>
        <th style="color: white" scope="col">Tên Dịch Vụ</th>
        <th style="color: white" scope="col">Sửa</th>
        <th style="color:white;" scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="loai" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${loai.tenLoaiDichVu}</td>
            <td>
                <button style="background-color: #4A5A6F;border-radius: 12px" type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal_${loop.index}">
                    Sửa
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal_${loop.index}" tabindex="-1"
                     aria-labelledby="exampleModalLabel1"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="/loai-dich-vu-servlet?action=edit" method="post">
                                <div style="background-color: #4A5A6F" class="modal-header">
                                    <h1 style="color: white" class="modal-title fs-5" id="exampleModalLabel1">Sửa loại dịch vụ</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <input type="hidden" name="id" value="${loai.maLoaiDichVu}">
                                            <label class="form-label">Tên dịch vụ</label>
                                            <input type="text" class="form-control" name="name" required
                                                   value="${loai.tenLoaiDichVu}">
                                        </div>
                                    </div>
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
                <button style="background-color: #FD7E37;border-radius: 12px" type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal1"
                        onclick="send('${loai.maLoaiDichVu}','${loai.tenLoaiDichVu}')"> Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/loai-dich-vu-servlet?action=delete" method="post">
            <div class="modal-content">
                <div  class="modal-header" style="background-color: #4A5A6F; color:white; font-size: 1.2rem">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" name="id" id="id">
                <div class="modal-body">
                    Bạn có muốn xóa "<span style="color:black " id="title"></span>" hay không?
                </div>
                <div class="modal-footer">
                    <button style="background-color: #4A5A6F ;color: white" type="button" class="btn " data-bs-dismiss="modal">Không</button>
                    <button style="background-color: #FD7E37 ; color: white" type="submit" class="btn ">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="successMessage" class="alert alert-success alert-dismissible fade" role="alert" style="display: none;">
    Xóa thành công!
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<c:import url="footer.jsp"></c:import>
<script>
    function send(id, title) {
        document.getElementById("id").value = id;
        document.getElementById("title").innerText = title;
    }
    function showSuccessMessage() {
        var successMessage = document.getElementById("successMessage");
        successMessage.style.display = "block";
        setTimeout(function() {
            successMessage.style.display = "none";
        }, 3000);
    }

    document.addEventListener('DOMContentLoaded', function () {




            Swal.fire({
                title: "Đã xoá!",
                text: "Xoá thành công",
                icon: "success"
            });

    })
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.10.1/sweetalert2.min.js"></script>
</html>