<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <!-- Font Awesome -->

    <style>
        * {
            padding: 0;
            margin: 0;
            border: 0;
            box-sizing: border-box;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
        }

        .quantity-controls input {
            width: 3em;
            text-align: center;
            margin: 0 1.5em;
        }

        #sidebar {
            float: right;
            width: 80%;
            height: 100%;
        }
    </style>
</head>
<body><c:import url="/header.jsp"></c:import>
<c:import url="/sidebar.jsp"></c:import>
<!-- Navbar -->


<div class="container-fluid" id="sidebar">
    <div style="display: flex;justify-content: center;align-items: center;">
        <h1 style="font-size: 40px;padding: 10px;font-family: 'Kanit', sans-serif;font-weight: bold;">
            Chọn dịch vụ</h1>
    </div>
    <div class="row">

        <form action="/may-dang-thue-servlet" method="get">
            <input type="hidden" name="action" value="listOrder">
            <input type="hidden" name="idMay" value="${idMay}">
            <table class="table table-hover  table-striped">
                <tr style="background-color: #4A5A6F" class="">
                    <th style="color: white">#</th>
                    <th style="color: white">Tên dịch vụ</th>
                    <th style="color: white">Số Lượng</th>
                    <th style="color: white">Giá bán</th>
                </tr>

                <c:forEach items="${dichVuList}" var="item" varStatus="loop">

                    <tr>
                        <td>${loop.count}</td>
                        <td>${item.tenDichVuDiKem}</td>
                        <td class="quantity-controls">
                            <input style="background-color: #4A5A6F;color: white;border-radius: 10px" class="btn" type="button" value="-"
                                   onclick="adjustQuantity(${item.maDichVuDiKem}, 'GIAM')">
                            <p id="show-quantity${item.maDichVuDiKem}">0</p>

                            <input style="background-color: #FD7E37;border-radius: 10px" class="btn" type="button" value="+"
                                   onclick="adjustQuantity(${item.maDichVuDiKem}, 'TANG')">
                        </td>
                        <input type="hidden" name="quantity${item.maDichVuDiKem}" id="quantity${item.maDichVuDiKem}"
                               value="0">

                        <td>${item.giaDichVuDiKem} Vnd</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="3"></td>
                    <td><input style="border-radius: 10px" type="submit" class="btn btn-primary" value="Gửi"></td>
                </tr>


            </table>
        </form>

    </div>


</div>

<!-- End row full -->


<!-- End container -->
<br><br><br>
<!-- Start Footer -->
<c:import url="../footer.jsp"></c:import>


<script>
    function adjustQuantity(productId, adjustment) {
        const quantity = document.getElementById('quantity' + productId);
        const showQuantity = document.getElementById('show-quantity' + productId);
        if (adjustment === "GIAM") {
            if (+quantity.value > 0) {
                quantity.value--;
            }
        } else if (adjustment === "TANG") {
            quantity.value++;
        }
        showQuantity.innerText = quantity.value;

        // var quantityElement = document.getElementById("quantity_" + productId);
        // var currentQuantity = parseInt(quantityElement.innerText);
        // var newQuantity = currentQuantity + adjustment;
        //
        // if (newQuantity >= 0) {
        //   quantityElement.innerText = newQuantity;
        //
        //   document.getElementById("quantity_" + productId).value = newQuantity;
        //   console.log("Product ID: " + productId + ", Quantity: " + newQuantity);
        // }
    }


</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>

</body>
</html>