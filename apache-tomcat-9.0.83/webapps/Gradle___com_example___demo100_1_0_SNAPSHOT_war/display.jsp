<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hien Thi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
</head>
<body>
<form action="/book" method="post">
    <table class="table table-light table-hover" style="width: 100%;text-align: center">
        <thear>
            <tr>
                <th>#</th>
                <th>Mã Hàng Hóa</th>
                <th>Tên Hàng Hóa</th>
                <th>Đơn Vị Tính</th>
                <th>Giá</th>
                <th>Loại Hàng Hóa</th>
                <th>Ngày Thu Hoạch</th>
                <th>Chức Năng</th>
            </tr>
        </thear>
        <tbody>
        <c:forEach items="${hangHoaList}" var="h" varStatus="look">
            <tr>
                <td>${look.count}</td>
                <td>${h.maHangHoa}</td>
                <td>${h.tenHangHoa}</td>
                <td>${h.donViHangHoa}</td>
                <td>${h.LoaiHangHoa.tenLoaiHangHoa}</td>
                <td><a class="btn btn-outline-warning" href="/book?action=update&id=${h.id}">Sửa</a></td>
                <td> <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal"
                             data-bs-target="#exampleModal"
                             onclick="send('${b.id}','${b.bookTile}')"> Xóa
                </button>
                </td>
            </tr>


        </c:forEach>
        <td><a class="btn btn-outline-success" href="/book?action=create">Thêm Mới </a></td>

        </tbody>
    </table>
</form>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/book?action=remove" method="post">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #ffc107; color:#000; font-size: 1.2rem">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" name="id" id="id">
                <div class="modal-body">
                    Bạn có muốn xóa  "<span style="color:#ffc107 " id="title"></span>" hay không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-warning">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function send(id, title) {
        document.getElementById("id").value = id;
        document.getElementById("title").innerText = title;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>