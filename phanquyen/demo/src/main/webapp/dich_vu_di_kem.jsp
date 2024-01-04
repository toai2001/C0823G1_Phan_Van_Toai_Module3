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
<c:import url="header.jsp"></c:import>
<c:import url="sidebar.jsp"></c:import>
<h1 style="text-align: center;margin-top: 20px">Danh sách dịch vụ đi kèm</h1>
<table class="table" id="sidebar">
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
            <td>${dvdk.giaDichVuDiKem} VND</td>
            <td>${dvdk.tenLoaiDichVu}</td>
            <td>
                <!-- Button trigger modal -->
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
                            <form action="/dich-vu-di-kem-servlet?action=edit" method="post">
                                <div style="background-color: #4A5A6F" class="modal-header">
                                    <h1 style="color: white" class="modal-title fs-5" id="exampleModalLabel1">Sửa dịch vụ đi kèm</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="id" value="${dvdk.maDichVuDiKem}">
                                    <div class="mb-3" style="width: 100%">
                                        <label class="form-label">Tên dịch vụ đi kèm</label>
                                        <input type="text" name="name" required
                                               class="form-control" value="${dvdk.tenDichVuDiKem}" >
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Giá dịch vụ đi kèm</label>
                                        <input type="number" name="price" required
                                               class="form-control" value="${dvdk.giaDichVuDiKem}" >
                                    </div>
                                    <br>
                                    <select class="form-select" aria-label="Default select example" name="maldv"
                                            required>
                                        <option value="" selected disabled >Chọn loại dịch vụ</option>
                                        <c:forEach items="${list}" var="l">
                                            <option value="${l.maLoaiDichVu}">${l.tenLoaiDichVu}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button style="background-color: #4A5A6F" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                                    </button>
                                    <button style="background-color: #FD7E37" type="submit" class="btn btn-primary">Sửa</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <button style="background-color: #FD7E37;border-radius: 12px" type="button" class="btn btn-danger" data-bs-toggle="modal"
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
                <div class="modal-header" style="background-color: #4A5A6F; color:white; font-size: 1.2rem">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" name="id" id="id">
                <div class="modal-body">
                    Bạn có muốn xóa "<span style="color:black " id="title"></span>" hay không?
                </div>
                <div class="modal-footer">
                    <button style="background-color: #4A5A6F" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button style="background-color: #FD7E37" type="submit" class="btn ">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
    <c:import url="footer.jsp"></c:import>

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