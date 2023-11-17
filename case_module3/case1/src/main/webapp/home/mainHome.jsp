<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 11/4/23
  Time: 10:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>PET CARE</title>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
    <link rel="stylesheet" type="text/css" href="../css/header.css"/>
    <link rel="stylesheet" href="../css/home.css"/>
    <style>
        <jsp:include page="../css/header.css"/>
    </style>
</head>
<body>
<div class="container-fluid ">
    <c:import url="navbar.jsp"></c:import>
    <!-- Carousel -->
    <div
            id="carouselExampleAutoplaying"
            class="carousel slide"
            data-bs-ride="carousel"
    >
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://lh3.googleusercontent.com/pw/ADCreHd9GDUQzgYqv6aRXtA5pC2njv5LdCTp_YBCExeJDDl7tKDUaD0WH8PzqnirF5S9oyjr54hYp4hA7QVhMvc9tbvIAWqYbtMXX_ObzNLhuSfGVMedzourZRPaTuLewpxSSMXQuNcTMOV1QApONhqRTwM=w2770-h1458-s-no-gm?authuser=0"
                     class="d-block w-100"/>
            </div>
            <div class="carousel-item">
                <img src="https://lh3.googleusercontent.com/pw/ADCreHcaC6RNMyrwEga2_r8uV1LFcbPzYJbRM9VqOcGFkduxb5bJ_WMxmW8d-z6880LcLuz0TCODhLklpQHAnODaOj7FQmPtl0EQFEwPNtG0nf2MaLftWsLE_SzPg7eVNlwuIVoFvAaR5SkZJU-gzE2aGyw=w2536-h1458-s-no-gm?authuser=0"
                     class="d-block w-100"/>
            </div>
            <div class="carousel-item">
                <img src="https://lh3.googleusercontent.com/pw/ADCreHfOVrY8gSlWUR3TF6eCw4--prYqteaXhjpUk2kXTTWwCoy2kOW-hl4y5u5vQ7u0MtYKGKw85uMENWLX693qIxwbsqT43Z3plOGB5rMldOW3Wh3hT5XvZxK5-iISbJhxXkodn0nGVSUvQ9CoW8JcWNg=w2880-h1384-s-no-gm?authuser=0"
                     class="d-block w-100"/>
            </div>
        </div>
        <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#carouselExampleAutoplaying"
                data-bs-slide="prev"
        >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#carouselExampleAutoplaying"
                data-bs-slide="next"
        >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <!--  information  -->
    <div class="pt-5">
        <div class="text-center"><h1>Thông tin hữu ích</h1></div>
        <div class=" col-md-12 col-lg-12 d-flex align-items-center justify-content-center">
            <div style="margin: 1%;    width: 350px;" class="col-sm-4 col-md-4 col-lg-4">
                <div style="box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5)" class="card"
                     style="width: 27rem;height: 19rem;">
                    <img src="https://www.chamsocpet.com/wp-content/uploads/2019/03/cach-chua-soc-nhiet-cho-cho-tai-nha.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-body">
                        <a style="    text-decoration: none;
                              font-family: sans-serif;
                              font-size: large;"
                           href="https://www.chamsocpet.com/cach-chua-cho-soc-nhiet-thong-tin-can-biet-cho-nguoi-nuoi-cho/">Cách
                            chữa chó sốc nhiệt – Thông tin cần biết cho người nuôi chó</a>
                        <p>Nếu không biết cách chữa chó sốc nhiệt kịp thời, chó cưng của bạn có thể bị đột quỵ vì nhiệt.
                            Điều này khiến bạn không kịp trở tay và trường hợp xấu nhất có thể xảy ra. Khi quyết định nuôi
                            thú cưng, đặc biệt là chó, bạn cần
                            tìm hiểu những thông tin</p>
                    </div>
                </div>
            </div>
            <div style="margin: 1%;    width: 350px;" class="col-sm-4 col-md-4 col-lg-4 ">
                <div style="box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5)" class="card"
                     style="width: 27rem;height: 19rem;">
                    <img src="https://www.chamsocpet.com/wp-content/uploads/2020/08/cham-soc-thu-cung-mua-nong-2.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-body">
                        <a style="    text-decoration: none;
                              font-family: sans-serif;
                              font-size: large;" href="https://www.chamsocpet.com/cham-soc-thu-cung-mua-nong/">Chăm sóc
                            thú cưng mùa nắng nóng và những điều phải biết?</a>
                        <p>Thời tiết nắng nóng khiến chúng ta khổ sở và khó chịu bao nhiêu thì thú cưng cũng vậy. Nếu như
                            bạn biết bảo vệ cho bản thân bằng máy lạnh, máy quạt thì đối với thú cưng bạn cũng cần có những
                            biện pháp cách chăm sóc đúng cách.
                            Nhằm tránh việc chúng sẽ</p>
                    </div>
                </div>
            </div>
            <div style="margin: 1%;width: 350px;" class="col-sm-4 col-md-4 col-lg-4 ">
                <div style="box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5);" class="card"
                     style="width: 27rem;height: 19rem;">
                    <img src="https://www.chamsocpet.com/wp-content/uploads/2023/04/giai-dap-co-nen-triet-san-cho-thu-cung-khong.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-body">
                        <a style="    text-decoration: none;
                              font-family: sans-serif;
                              font-size: large;" href="https://www.chamsocpet.com/phau-thuat-triet-san-thien-cho-meo/">[Giải
                            đáp] Có nên triệt sản cho thú cưng không?</a>
                        <p>Chắc hẳn nhiều chủ nuôi đang phân vân không biết có nên mang thú cưng của mình đi triệt sản hay
                            không. Để có được giải đáp cho mình, hãy theo dõi bài phân tích các vấn đề liên quan đến triệt
                            sản ở chó mèo của Petcare ngay nhé.
                            Triệt sản cho thú cưng</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--  information  -->
    <!-- Reviews -->
    <div class="pt-5">
        <div class="text-center"><h1>Đánh giá của khách hàng</h1></div>
        <div class="d-flex align-items-center justify-content-center">
            <div style="margin: 1%;    width: 350px;" class="col-sm-4 col-md-4 col-lg-4 ">
                <div class=" card" style="width: 18rem;">
                    <img src="https://azpet.com.vn/wp-content/uploads/2022/05/Dung-Tran.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Đội ngũ tư vấn chăm sóc khách hàng làm mình thật sự hài lòng. Mình nhận bé Golden
                            về được 1 tuần vì háu ăn nên em ấy nhặt nhạnh linh tinh ăn và dẫn đến tiêu chảy, khi ấy mình rất rối
                            và gọi điện nhắn tin cho shop. Thật may mình gặp được 1 bạn nhân viên có kĩ năng chăm sóc cún tốt,
                            bạn ấy chỉ thuốc và liều lượng dùng cho bé rất tận tình, chỉ 2 ngày mà cún đã khỏi hẳn rồi. Cảm ơn
                            shop cảm ơn Nhung nhiều lắm nhé</p>
                    </div>
                </div>
            </div>
            <div style="margin: 1%;    width: 350px;" class="col-sm-4 col-md-4 col-lg-4">
                <div class="card" style="width: 18rem;">
                    <img src="https://azpet.com.vn/wp-content/uploads/2022/05/Bui-The-Duc.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Bạn cún đầu tiên mình chọn trong thời gian theo dõi sức khoẻ trước khi đưa đến tay
                            khách hàng bị ốm, shop đã chủ động thông báo và khuyên mình nên chọn bạn cún khác. Mình rất ấn tượng
                            và thiện cảm với hành động thể hiện trách nhiệm và uy tín này của shop. Bạn cún mình đón về rất kháu
                            khỉnh, nói chung mình thấy hài lòng với chất lượng dịch vụ của shop. Đợi bạn cún mình lớn thêm mình
                            sẽ quay lại mua thêm em để 2 bạn chơi với nhau cho đỡ buồn</p>
                    </div>
                </div>
            </div>
            <div style="margin: 1%;    width: 350px;" class="col-sm-4 col-md-4 col-lg-4">
                <div class="card" style="width: 18rem;">
                    <img src="https://azpet.com.vn/wp-content/uploads/2022/05/Lucas-Pham.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Sau khi lựa chọn khá nhiều trại mèo, đến cuối cùng thì cũng quyết định đón em ở
                            shop. Vì uy tín cũng như chất lượng dịch vụ, và quả là không làm mình thất vọng. Mình cảm thấy rất
                            hài lòng từ nhân viên tư vấn cũng như các bạn chăm sóc khách hàng, thực sự rất ưng ý . Với chất
                            lượng này thì hoàn toàn xứng đáng 5* ++ luôn nha. Hi vọng trong tương lai mình sẽ đón thêm nhiều
                            thành viên mới nữa</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Reviews -->
    <!--    footer-->
    <c:import url="footer.jsp"></c:import>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

