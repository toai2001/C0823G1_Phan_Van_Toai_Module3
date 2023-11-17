<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 10/11/2023
  Time: 00:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hien Thi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            overflow: hidden;
        }

        .header {
            display: grid;
            height: 70px;
            background-color: #2b287f;
            width: 100%;
            justify-items: center;
            align-items: center;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<%--HEADER--%>
<div class="header">
    <img src="https://cdn.codegym.vn/wp-content/uploads/2021/08/CodeGym-Logo.webp" alt="">
</div>
<%--BODY--%>
<div class="container mt-3 mb-3">
    <table class="table table-hover" id="mytable">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên công việc</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Trạng thái</th>
            <th>Mô tả</th>
            <th>Chức năng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="" var="ds" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${ds.tenCongViec}</td>
                <td>${ds.ngayBatDau}</td>
                <td>${ds.ngayKetThuc}</td>
                <td>${ds.tenTrangThai}</td>
                <td>${ds.moTa}</td>
                <td>
                    <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onclick="guiThongTin('${ds.maCongViec}','${ds.tenCongViec}')"> Xóa
                    </button>

                </td>
            </tr>

        </c:forEach>


        </tbody>
    </table>
</div>
<div class="container mt-3 mb-3">
    <button type="button" class="btn btn-outline-primary">
        <a href="/cong-viec/them">Thêm mới sản phẩm</a></button>
</div>


<%--Modal--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/cong-viec?action=xoa" method="post">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #ffc107; color:#000; font-size: 1.2rem">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" name="maCongViec" id="ma">
                <div class="modal-body">
                    Bạn có muốn xóa công việc "<span style="color:#ffc107 " id="ten"></span>" hay không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-warning">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>


<%--JS--%>

<script>
    $(document).ready(function () {
        $('#mytable').DataTable({
            language: {
                "decimal": ",",
                "thousands": ".",
                "sEmptyTable": "Không có dữ liệu",
                "sInfo": "Đang hiển thị _START_ đến _END_ của tổng số _TOTAL_ mục",
                "sInfoEmpty": "Đang hiển thị 0 đến 0 của tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ tổng số _MAX_ mục)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Hiển thị _MENU_ mục",
                "sLoadingRecords": "Đang tải...",
                "sProcessing": "Đang xử lý...",
                "sSearch": "Tìm kiếm:",
                "Show:": "",
                "entries": "",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sLast": "Cuối",
                    "sNext": "Tiếp",
                    "sPrevious": "Trước"
                },

            },
            color: {
                "oPaginate": {
                    "sFirst": "blue",
                    "sLast": "green",
                    "sNext": "green",
                    "sPrevious": "blue"
                },
            }
        });
    });
</script>
<script>
    function guiThongTin(maCongViec, tenCongViec) {
        document.getElementById("ma").value = maCongViec;
        document.getElementById("ten").innerText = tenCongViec;
    }
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

</body>
</html>







<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Them Moi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            overflow: hidden;
        }

        .header {
            display: grid;
            height: 70px;
            background-color: #2b287f;
            width: 100%;
            justify-items: center;
            align-items: center;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="header">
    <img src="https://cdn.codegym.vn/wp-content/uploads/2021/08/CodeGym-Logo.webp" alt="">
</div>
<div class="container mt-3">
    <form action="/cong-viec/them" method="post">
        <div class="mb-3">
            <label for="tenCongViec" class="form-label">Tên công việc</label>
            <input type="text" class="form-control" id="tenCongViec" name="tenCongViec" required>
        </div>
        <div class="mb-3">
            <label for="ngayBatDau" class="form-label">Ngày bắt đầu</label>
            <input type="date" class="form-control" id="ngayBatDau" name="ngayBatDau" required>
        </div>
        <div class="mb-3">
            <label for="ngayKetThuc" class="form-label">Ngày kết thúc</label>
            <input type="date" class="form-control" id="ngayKetThuc" name="ngayKetThuc" required>
        </div>

        <div class="mb-3">
            <label for="maTH" class="form-label">Trạng Thái</label></br>
            <select class="form-label" name="maTH" id="maTH">
                <c:forEach items="" var="dsTrangThai" varStatus="loop">
                    <option value="${dsTrangThai.tenTrangThai}">"${dsTrangThai.tenTrangThai}"</option>
                </c:forEach>


            </select>
        </div>
        <div class="mb-3">
            <label for="tenCongViec" class="form-label">Mô tả </label>
            <input type="text" class="form-control" id="moTa" name="moTa" required>
        </div>
        <button type="submit" class="btn btn-primary">Xác nhận</button>
    </form>
</div>

</body>
</html>



