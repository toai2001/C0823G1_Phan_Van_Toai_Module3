<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biểu đồ Thống kê</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%-- Import header --%>
<c:import url="/header.jsp"></c:import>

<div class="container-fluid">
    <h1 style="text-align: center">Biểu đồ Thống kê</h1>

    <form method="post" action="/ThongKeServlet">
        <div class="mb-3">
            <label for="selectedDate" class="form-label">Chọn ngày:</label>
            <input type="date" id="selectedDate" name="selectedDate" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Hiển thị</button>
    </form>

    <canvas id="myChart" width="400" height="200"></canvas>

    <table class="table table-light container-fluid table-hover">
        <thead class="table-primary">
        <tr>
            <th>STT</th>
            <th>Máy Tính</th>
            <th>Tổng Tiền Dịch Vụ</th>
            <th>Tổng Thời Gian Sử Dụng</th>
            <th>Ngày sử dụng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${thongKes}" var="thongke" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${thongke.mayTinh}</td>
                <td>${thongke.tongThoiGianSuDung}</td>
                <td>${thongke.tongTienDichVu}</td>
                <td>${thongke.ngaySuDung}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<footer id="sticky-footer"
        class=" bg-body-tertiary flex-shrink-0 py-3 bg-dark text-white-50 fs-3 mt-4 fixed-bottom">
    <div class="container text-center">
        <small style="color: red; text-align: center">Copyright &copy; Net Cỏ</small>
    </div>
</footer>

<script>
    var ngaySuDungLabels = [];
    var tongThoiGianData = [];
    var tongTienData = [];

    <c:forEach items="${thongKes}" var="thongke" varStatus="loop">
    ngaySuDungLabels.push('${thongke.ngaySuDung}');
    tongThoiGianData.push(${thongke.tongThoiGianSuDung});
    tongTienData.push(${thongke.tongTienDichVu});
    </c:forEach>

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar', // Loại biểu đồ cột
        data: {
            labels: ngaySuDungLabels,
            datasets: [
                {
                    label: 'Tổng Tiền Dịch Vụ',
                    data: tongThoiGianData,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Tổng Thời Gian Sử Dụng',
                    data: tongTienData,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                },
                x: {
                    stacked: false // Hiển thị các cột đè lên nhau
                }
            }
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>