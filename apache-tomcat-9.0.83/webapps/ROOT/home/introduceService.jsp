<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 11/5/23
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <style>
    #logo {
      width: 100%;
    }

    body {
      background-color: white;
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
</head>
<body>
<!-- div tong -->
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
<c:import url="navbar.jsp"/>
  <!-- div dòng thứ nhất: tên trang -->
  <div style="height: 60px;background: white;font-family: system-ui;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<%--    <button style="position: relative;left: 2%;border: none;background: white;height: 58px;width: 70px;" type="button" onclick="window.open('https://dtruyen.com/tay-du-ky/')"><i class="fa fa-angle-double-left" style="font-size: 48px;color: black;position: relative;left: 2%;"></i><br>--%>
<%--    </button>--%>



  </div>
  <!-- div cho đòng thứ 2: nội dung giới thiệu pet -->
  <div style="flex-wrap: wrap;background: white" class="col-sm-12 col-md-12 col-lg-12 d-flex">
    <div class="col-lg-6">
      <div style="margin: 46px;position: relative;
                top: 42px;">
        <img style="border-radius: 53px;box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5);
                    transform: translateY(-5px);" src="https://thuyprocare.com/upload/images/TIN%20T%E1%BB%A8C/L%C3%A0m-%C4%91%E1%BA%B9p-cho-th%C3%BA-c%C6%B0ng.jpg" alt="" class="w-100">
      </div>

    </div>
    <div class="col-lg-6 ">
      <div style="  background: #EFCFD4;  margin: 46px;border-radius: 44px;position: relative;top: 42px;border: solid 7px;box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5);transform: translateY(-5px);">
        <h4 style="text-align: center;padding: 18px;font-family: monospace;color: darkgreen; font-size: xxx-large;">📛 LƯU Ý KHI SỬ DỤNG DỊCH VỤ PET BATHING</h4>
        <hr>
        <h5 style="padding: 19px;font-family: system-ui;">Pet Care không tiếp nhận vật nuôi đang mang thai, đang điều trị bệnh, mới phẫu thuật, có tiểu sử bệnh hen, co giật hoặc các bệnh lý khác khiến thú nuôi không có khả năng tự chủ.</h5>
        <h5 style="padding: 19px;font-family: system-ui;">Để đảm bảo an toàn cho sức khỏe khi đưa đến làm dịch vụ spa thú cưng: Không để thú cưng quá đói, hoặc ăn quá no và chạy nhảy quá sức trước khi đến cửa hàng. Có kế hoạch che nắng mưa trước khi đến và sau khi về. Nếu thú cưng có những
          biểu hiện bất thường về sức khỏe xin vui lòng liên hệ Pet Care để được trợ giúp.</h5>
        <h5 style="padding: 19px;font-family: system-ui;">Vui lòng kiểm tra kỹ thú cưng khi đến đón thú cưng sau khi làm dịch vụ. Quy trình này đảm bảo nhân viên của Pet Care đã thực hiện đúng yêu cầu và bạn hài lòng với chất lượng dịch vụ.</h5>
      </div>
    </div>
  </div>
  <!-- div cho đòng thứ 3: nội dung giới thiệu pet -->
  <div style="padding: 48px;background: white;height: 2262px;" class="col-sm-12 col-md-12 col-lg-12">
    <div class="col-sm-12 col-md-12 col-lg-12">
      <div style="text-align: center;" class="col-sm-12 col-md-12 col-lg-12">
        <div style="background-color: white;border-radius: 28px;height: auto;margin: 5%;border: solid 5px;box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5);transform: translateY(-5px);">
          <h1 style="color: darkgreen;">👍 3 ĐIỀU LUÔN CAM KẾT VỚI KHÁCH HÀNG</h1>
          <hr>
          <div style="box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5);transform: translateY(-5px);" class="col-sm-12 col-md-12 col-lg-12 d-flex">
            <div style="margin: 0.5%;border-radius: 18px;background: #EFCFD4;">
              <h2>❣️ HẾT MÌNH VÌ CÔNG VIỆC</h2>
              <hr>
              <h3>Chúng tôi làm việc hết mình với chữ tâm, trách nhiệm và sự yêu nghề. Thú cưng khỏe mạnh là niềm hạnh phúc của chúng tôi.</h3>
            </div>
            <div style="margin: 0.5%;border-radius: 18px;background: #EFCFD4;">
              <h2>✅ GIÁ DỊCH VỤ RẺ NHẤT</h2>
              <hr>
              <h3>Chúng tôi cam kết đưa ra mức giá ưu đãi nhất trên thị trường để tất cả thú cưng đều có cơ hội được trải nghiệm dịch vụ của chúng tôi.</h3>
            </div>
            <div style="margin: 0.5%;border-radius: 18px;background: #EFCFD4;">
              <h2>🥇 CHẤT LƯỢNG HÀNG ĐẦU</h2>
              <hr>
              <h3>Chúng tôi không ngừng nâng cao phát triển trình độ kỹ năng của nhân sự để phục vụ thú cưng đem đến kết quả tốt nhất.</h3>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!-- div cho đòng thứ 4: nội dung giới thiệu pet -->
    <div style="flex-wrap: wrap;" class="col-sm-12 col-md-12 col-lg-12 d-flex">
      <div style="padding: 4%;" class="col-sm-6 col-md-6 col-lg-6">
        <h4 style="    font-family: inherit;font-size: xx-large;color: darkgreen;">⚠️ VÌ SAO NÊN SPA CHO CHÓ MÈO ĐỊNH KỲ VÀ THƯỜNG XUYÊN?</h4>
        <h5 style="    font-family: system-ui;font-size: x-large;">- Khi sử dụng dịch vụ spa thú cưng, mọi bụi bẩn trên lông, da, kẽ chân đều sẽ được loại bỏ hoàn toàn, tránh các trường hợp vi khuẩn bám lâu ngày trên cơ thể sẽ khiến thú cưng của bạn đổ bệnh.</h5>
        <h5 style="    font-family: system-ui;
                    font-size: x-large;">- Thú cưng sau không chỉ được làm sạch mà còn được loại bỏ các mùi hôi bám trên người, trả lại sự thơm tho, sạch sẽ. Một chú chó sau khi đi spa thú cưng về ai nhìn cũng muốn ôm, âu yếm, cưng nựng, điều này giúp cho tâm lý của chúng
          được thoải mái, hạnh phúc.</h5>
        <h5 style="    font-family: system-ui;
                    font-size: x-large;">- Dịch vụ kiểm tra sức khỏe tổng quát tại các spa thú cưng giúp chó mèo sớm phát hiện ra bệnh tật nếu có, chữa bệnh càng sớm thì tỷ lệ khỏi bệnh càng cao.</h5>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-6">
        <img style="box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5);height: 594px;" src="https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2021/05/b2da22dd-sua-tam-cho-thumb.jpeg" alt="" class="w-100">
      </div>

    </div>
    <!-- div cho đòng thứ 5: nội dung giới thiệu pet -->
    <h1 style="    text-align: center;position: relative;top: 59px;color: darkgreen;">THÔNG TIN HỮU ÍCH</h1>
    <h5 style="text-align: center;position: relative;top: 49px;color: currentcolor;">Các thông tin về sự kiện, khuyến mãi và những kiến thức về chăm sóc sức khỏe chó mèo</h5>
    <div style="position: relative;top: 81px;height: 200px;box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5)" class="col-sm-12 col-md-12 col-lg-12 ">
      <div style="height: 200px;" id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img style="height: 100%" src="https://file.vfo.vn/hinh/2015/12/meo-con-dang-yeu-lam-hinh-nen-may-tinh-3.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img style="height: 100%" src="https://file.vfo.vn/hinh/2015/12/meo-con-dang-yeu-lam-hinh-nen-may-tinh-5.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img style="height: 100%;" src="https://file.vfo.vn/hinh/2015/12/meo-con-dang-yeu-lam-hinh-nen-may-tinh-6.jpg" class="d-block w-100" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>
    <div style="position: relative;top: 219px;height: 301px;left: 85px;    flex-wrap: wrap;" class=" col-md-12 col-lg-12 d-flex">
      <div style="margin: 1%;    width: 350px;" class="col-sm-4 col-md-4 col-lg-4">
        <div style="box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5)" class="card" style="width: 27rem;height: 19rem;">
          <img src="https://www.chamsocpet.com/wp-content/uploads/2019/03/cach-chua-soc-nhiet-cho-cho-tai-nha.jpg" class="card-img-top" alt="...">
          <div class="card-body">
            <a style="    text-decoration: none;
                            font-family: sans-serif;
                            font-size: large;" href="https://www.chamsocpet.com/cach-chua-cho-soc-nhiet-thong-tin-can-biet-cho-nguoi-nuoi-cho/">Cách chữa chó sốc nhiệt – Thông tin cần biết cho người nuôi chó</a>
            <p>Nếu không biết cách chữa chó sốc nhiệt kịp thời, chó cưng của bạn có thể bị đột quỵ vì nhiệt. Điều này khiến bạn không kịp trở tay và trường hợp xấu nhất có thể xảy ra. Khi quyết định nuôi thú cưng, đặc biệt là chó, bạn cần
              tìm hiểu những thông tin</p>
          </div>
        </div>
      </div>
      <div style="margin: 1%;    width: 350px;" class="col-sm-4 col-md-4 col-lg-4 ">
        <div style="box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5)" class="card" style="width: 27rem;height: 19rem;">
          <img src="https://www.chamsocpet.com/wp-content/uploads/2020/08/cham-soc-thu-cung-mua-nong-2.jpg" class="card-img-top" alt="...">
          <div class="card-body">
            <a style="    text-decoration: none;
                            font-family: sans-serif;
                            font-size: large;" href="https://www.chamsocpet.com/cham-soc-thu-cung-mua-nong/">Chăm sóc thú cưng mùa nắng nóng và những điều phải biết?</a>
            <p>Thời tiết nắng nóng khiến chúng ta khổ sở và khó chịu bao nhiêu thì thú cưng cũng vậy. Nếu như bạn biết bảo vệ cho bản thân bằng máy lạnh, máy quạt thì đối với thú cưng bạn cũng cần có những biện pháp cách chăm sóc đúng cách.
              Nhằm tránh việc chúng sẽ</p>
          </div>
        </div>
      </div>
      <div style="margin: 1%;width: 350px;" class="col-sm-4 col-md-4 col-lg-4 ">
        <div style="box-shadow: 0px 10px 20px 5px rgba(0, 0, 0, 0.5);" class="card" style="width: 27rem;height: 19rem;">
          <img src="https://www.chamsocpet.com/wp-content/uploads/2023/04/giai-dap-co-nen-triet-san-cho-thu-cung-khong.jpg" class="card-img-top" alt="...">
          <div class="card-body">
            <a style="    text-decoration: none;
                            font-family: sans-serif;
                            font-size: large;" href="https://www.chamsocpet.com/phau-thuat-triet-san-thien-cho-meo/">[Giải đáp] Có nên triệt sản cho thú cưng không?</a>
            <p>Chắc hẳn nhiều chủ nuôi đang phân vân không biết có nên mang thú cưng của mình đi triệt sản hay không. Để có được giải đáp cho mình, hãy theo dõi bài phân tích các vấn đề liên quan đến triệt sản ở chó mèo của Petcare ngay nhé.
              Triệt sản cho thú cưng</p>
          </div>
        </div>
      </div>

    </div>

  </div>
  <!-- ket thuc div thu 3 -->

  <!-- footer-->
  <div class="d-flex">
    <div class="row">
      <hr class="m-4" />
      <div class="col-lg-5 justify-content-center ps-5" style="padding-top: 7%">
        <div>
          <h4>Liên hệ</h4>
          <div>
            <h3>PET CARE</h3>
            <p>
              <i class="fa-solid fa-house"></i> Địa chỉ: 280 Trần Hưng Đạo, phường An Hải Tây, quận Sơn Trà, Đà Nẵng
            </p>
            <p>
              <i class="fa-regular fa-envelope"></i> Email: group3C0723G1@gmail.com
            </p>
            <p><i class="fa-solid fa-phone"></i> Phone: 0988888888</p>
            <div class="d-flex justify-content-left">
              <div class="m-3">
                <a href="https://www.facebook.com/codegymdanang" class="text-decoration-none"><i class="fa-brands fa-facebook"></i
                ></a>
              </div>
              <div class="m-3">
                <a href="https://www.instagram.com/codegymdanang" class="text-decoration-none"><i class="fa-brands fa-instagram"></i
                ></a>
              </div>
              <div class="m-3">
                <a href="https://www.youtube.com/@hoclaptrinh.codegymdanang" class="text-decoration-none"><i class="fa-brands fa-youtube"></i
                ></a>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-7">
      <div>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.208468996348!2d108.22979027508877!3d16.054668284622725!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219d6d6355dfd%3A0xab74f1d886dbff0e!2zMjgwIMSQLiBUcuG6p24gSMawbmcgxJDhuqFvLCBBbiBI4bqjaSBC4bqvYywgU8ahbiBUcsOgLCDEkMOgIE7hurVuZyA1NTAwMDAsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1698335914755!5m2!1svi!2s"
                width="100%" height="450" style="border: 0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>
    </div>
  </div>
</div>
</body>
</html>
