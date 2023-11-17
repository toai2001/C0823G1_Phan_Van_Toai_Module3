<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 11/2/23
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <style>
        #logo {
            width: 100%;
        }

        body {
            background-color: #efcfd4;
        }

        .group {
            display: flex;
            line-height: 28px;
            align-items: center;
            position: relative;
            width: 100%;
        }

        .input {
            height: 40px;
            line-height: 28px;
            padding: 0 1rem;
            width: 100%;
            padding-left: 2.5rem;
            border: 2px solid transparent;
            border-radius: 8px;
            outline: none;
            background-color: #D9E8D8;
            color: #0d0c22;
            box-shadow: 0 0 5px #C1D9BF, 0 0 0 10px #f5f5f5eb;
            transition: .3s ease;
        }

        .input::placeholder {
            color: #777;
        }

        .icon {
            position: absolute;
            left: 1rem;
            fill: #777;
            width: 1rem;
            height: 1rem;
        }

        a {
            text-decoration: none;
        }
    </style>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <link rel="stylesheet" href="../css/aos.css">
    <script src="../js/aos.js"></script>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    />
</head>
<body>
<c:import url="navbar.jsp"></c:import>
<div class="row d-flex">
    <div style="padding-left: 20%; padding-right: 20%">
        <h1 style="text-align: center; margin: 10%">GIỚI THIỆU VỀ CHÚNG TÔI</h1>
        <p>Chúng tôi là ngôi nhà của những người yêu thú cưng và đồng thời cũng là điểm đến ý tưởng cho những
            người
            chủ
            thú cưng tại <strong>280 Trần Hưng Đạo, phường An Hải Tây, quận Sơn Trà, tp Đà Nẵng</strong>. Tại
            Pet
            Care,
            chúng tôi cam kết cung cấp cho thú cưng của bạn những dịch vụ và sản phẩm chăm sóc hàng đầu, để đảm
            bảo
            thú
            cưng của bạn luôn khỏe mạnh, hạnh phúc và tràn đầy năng lượng.</p>
    </div>

</div>
<div class="row d-flex">
    <div class="col-lg-6 col-sm-12 p-4 ">
        <div class="m-4 " data-aos="fade-down">
            <img src="https://lh3.googleusercontent.com/pw/ADCreHfA5jJTVTGNHJfkvFni-4bhsp8N_12nM08V-C96iLpWIr2K3r0lofBXjwP9MArXTGKYDrh7bzI-Mj3QmB5gnhG3RAliCXlVe4iZA1rkr5mSduXXSgmkrcxCG7PPduYyc9fCXTez6xI0lZlvm2B8CzE=w1772-h1458-s-no-gm?authuser=0" class=" w-100 shadow" style="border-radius: 5%" alt=""/></div>
    </div>

    <div class="col-lg-6 col-sm-12 p-4 shadow " data-aos="fade-down"
         style="background: #efcfd4;border-radius: 5%">
        <div style="margin-top: 20%; height: 50% ;padding: 10% ">
            <h2 style="text-align: center"><i class="fa-solid fa-scissors"></i> Grooming Chuyên Nghiệp </h2>
            <p>Thú cưng của bạn xứng đáng được chăm sóc tốt nhất. Đội ngũ chuyên gia tại Pet Care không chỉ giúp
                thú
                cưng của bạn trở nên sạch sẽ và thơm mát, mà còn tạo ra một trải nghiệm thoải mái và dễ chịu cho
                chúng.</p>
        </div>
    </div>
</div>
<div class="row d-flex">
    <div class="col-lg-6 col-sm-12 p-4 shadow"
         data-aos="fade-right"
         data-aos-offset="300"
         data-aos-easing="ease-in-sine"
         style=" background: #efcfd4;border-radius: 5%">
        <h2 class="text-center"><i class="fa-solid fa-house"></i> Dịch Vụ Lưu Trú Tại Pet Care</h2>
        <h3>Sự Quan Tâm Tận Tâm</h3>
        <p>Tại Pet Care, chúng tôi coi thú cưng của bạn như gia đình. Chúng tôi cam kết cung cấp sự quan tâm tận
            tâm
            và yêu thương trong suốt thời gian thú cưng ở lại với chúng tôi. Đội ngũ chăm sóc của chúng tôi là
            những
            người đam mê về thú cưng và có kinh nghiệm chăm sóc từng loài.</p>
        <h3>Tiện Nghi An Toàn</h3>
        <p>Khu vực lưu trú của Pet Care được thiết kế đặc biệt để đảm bảo an toàn và thoải mái cho thú cưng của
            bạn.
            Chúng tôi có hệ thống an ninh hiện đại và không gian rộng rãi để thú cưng có đủ không gian để vận
            động
            và chơi đùa.</p>
        <h3>Chế Độ Ăn Uống Đặc Biệt</h3>
        <p>Chúng tôi hiểu rằng mỗi thú cưng có chế độ ăn uống riêng. Tại Pet Care, chúng tôi tuân theo chế độ ăn
            uống đặc biệt của từng thú cưng và đảm bảo họ nhận được bữa ăn thích hợp và chất lượng.</p>
    </div>
    <div class="col-lg-6 col-sm-12 p-4">
        <div data-aos="flip-left"
             data-aos-easing="ease-out-cubic"
             data-aos-duration="1000">
            <img src="https://lh3.googleusercontent.com/pw/ADCreHdu9zMgWtVHwL-Tk7CjQAqvA_zdScZfynitFR6whX0tigoVDcRYph7vIgUJRfgZXv2qTws_PIYGPHaz9T-VarGBRX6_mlIfnMR9rzZFRv1k1xJzUfopOxcvd0c8JyoIetKqHYDQ2B-_JLV4UWaULLo=w620-h437-s-no-gm?authuser=0" class="w-100 shadow" style="border-radius: 5%"/></div>
    </div>

</div>
<div class="row d-flex">
    <div class="col-lg-6 col-sm-12 p-4 rounded-3 ">
        <div data-aos="fade-up">
            <img src="https://lh3.googleusercontent.com/pw/ADCreHe2h2QjqKArbLfTL8houxQzPZnJ4Q_l6kTqmosg46u86XeMs0p5aV8hYI-i0VrDvaTkHyFJmqxNsD3UIbPm4RWIaINg_ZYB92GfgLWbvS9FoiqyTSQrMgG-BHLvAUgPHaR5Tc94O1F15U_TGnHbMhI=w600-h400-s-no-gm" class=" w-100 shadow" style="border-radius: 8%"/>
        </div>
    </div>
    <div class="col-lg-6 col-sm-12 p-4 shadow" style="background: #efcfd4; border-radius: 5%"
         data-aos="fade-up">
        <div style="padding: 10%">
            <h2 style="text-align: center"><i class="fa-solid fa-user"></i> Đội Ngũ Chăm Sóc</h2>
            <p>Tại Pet Care, chúng tôi có một đội ngũ chăm sóc thú cưng tận tụy và đầy kinh nghiệm. Đội ngũ của
                chúng
                tôi không chỉ là những chuyên gia về y học thú y mà còn là những người yêu thú cưng và hiểu rõ
                về
                tâm
                trạng và nhu cầu của chúng.</p>
        </div>
    </div>
</div>
<c:import url="footer.jsp"></c:import>
</body>
<script>
    AOS.init();
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
