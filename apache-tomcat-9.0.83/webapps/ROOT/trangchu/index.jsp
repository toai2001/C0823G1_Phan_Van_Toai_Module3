<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="trangchu/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
<div class="cc-announcement" style="text-align: center;background: black">
    <a data-cc-animate-click="">
        <div class="cc-announcement__inner" style="color: white">
            MIỄN PHÍ VẬN CHUYỂN TOÀN QUỐC
        </div>
    </a>
</div>
<nav class="navbar navbar-expand-lg bg-white px-4 mt-2" style="padding:0">
    <div class="container-fluid ">
        <div>
            <a class="navbar-brand" href="#">
                <img src="https://www.shutterstock.com/image-vector/leaf-book-logo-600nw-1768607174.jpg"
                     height="130px" width="200px"/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
            </button>

        </div>
        <div style="margin: 0 auto">
            <div class="collapse navbar-collapse ">
                <nav>
                    <ul>
                        <li href="#">Trang Chủ</li>
                        <li href="#">Thể loại</li>
                        <li href="#">Tin tức</li>
                        <li href="#">Trợ giúp</li>
                    </ul>
                </nav>
            </div>
        </div>
        <div style="left: 0">
            <div class="collapse navbar-collapse ">
                <form id="search-box">
                    <input type="text" id="search-text" placeholder="Bạn muốn tìm gì ?" required>
                    <button id="search-btn"><i class="fa-solid fa-magnifying-glass"
                                               style="color: white"></i>
                    </button>
                </form>
                <ul style="margin: 0;font-weight: 500; font-size: 15px;color: rgb(119,119,119);padding:30px 15px">
                    <span-1><i class="fa-solid fa-cart-shopping" style="font-size: 20px"></i> Giỏ Hàng
                    </span-1>
                    <span-1 style="margin-right: 15px">
                     <i class="fa-solid fa-user" style="font-size: 20px"></i>   <a href="?action=login" methods="post"> Đăng Nhập</a>
                    </span-1>

                </ul>
            </div>

        </div>
    </div>
</nav>

<main>
    <carousel__1>
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="margin-top: 2px">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://assets.brightspot.abebooks.a2z.com/dims4/default/ff71e12/2147483647/strip/true/crop/1580x760+0+0/resize/1996x960!/format/webp/quality/90/?url=http%3A%2F%2Fabebooks-brightspot.s3.us-west-2.amazonaws.com%2Ff5%2Fb4%2Fc466423a41a097cc7fd5a896c93a%2Fcarousel-coffeetable-collection2.png"
                         class="d-block w-100" alt="...">

                </div>
                <div class="carousel-item">
                    <img src="https://assets.brightspot.abebooks.a2z.com/dims4/default/6509b1f/2147483647/strip/true/crop/1580x760+0+0/resize/1996x960!/format/webp/quality/90/?url=http%3A%2F%2Fabebooks-brightspot.s3.us-west-2.amazonaws.com%2F03%2F39%2F06bcbb9e4088b465c8ee81478af1%2Fcarousel-hugo-awards.jpg"
                         class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="https://assets.brightspot.abebooks.a2z.com/dims4/default/8a86154/2147483647/strip/true/crop/1580x760+0+0/resize/1996x960!/format/webp/quality/90/?url=http%3A%2F%2Fabebooks-brightspot.s3.us-west-2.amazonaws.com%2F51%2F44%2Fd417723645979375e8163d5cc805%2Fcrime-com-uk-carousel.png"
                         class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </carousel__1>
    <div class="container mt-lg-5">
        <div class="row justify-content-center">
            <div class="col-5"></div>
            <div class="col-2">
                <h2 class="grid__heading text-center aos-init aos-animate" style="font-size: 2rem">Special Book</h2>

            </div>
            <div class="col-5"></div>
        </div>
    </div>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-3">
                <div class="rq-main-tag-wishlist space-badge">
                    <div class="product-badge" style="background: rgb(229,229,229)">
                        <span>Sách bán chạy </span>
                    </div>
                </div>
            </div>
            <div class="col-3">

                <div class="rq-main-tag-wishlist space-badge">
                    <div class="product-badge" style="background: rgb(229,229,229)">
                        <span>Sách bán chạy </span>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="rq-main-tag-wishlist space-badge">
                    <div class="product-badge" style="background: rgb(229,229,229)">
                        <span>Sách bán chạy </span>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="rq-main-tag-wishlist space-badge">
                    <div class="product-badge" style="background: rgb(229,229,229)">
                        <span>Sách bán chạy </span>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div>
        <section class="slider_1" style="margin-top: 30px">
            <div class="card_1">
                <div class="card-content_1">
                    <img src="https://cafebiz.cafebizcdn.vn/2017/photo-2-1501495380220.jpg" class="card-img_1">
                    <h1 class="card-title_1">Harry Potter</h1>
                    <div class="card-body_1">
                        <div class="card-star">
                            <span class="rating-value" style="color: black">4.5</span>
                            <span class="star_1">&#9733;</span>
                        </div>
                        <p class="card-price__2">999.999đ</p>
                    </div>
                    <div class="card-footer_1">
                        <button class="btn__2" style="color: white;background: black">Mua ngay
                        </button>
                        <button class="btn__2" style="color: white ;background: black">Giỏ hàng
                        </button>
                    </div>
                </div>
            </div>
            <div class="card_1">
                <div class="card-content_1">
                    <img src="https://cafebiz.cafebizcdn.vn/2017/photo-2-1501495380220.jpg" class="card-img_1">
                    <h1 class="card-title_1">Harry Potter</h1>
                    <div class="card-body_1">
                        <div class="card-star">
                            <span class="rating-value" style="color: black">4.5</span>
                            <span class="star_1">&#9733;</span>
                        </div>
                        <p class="card-price__2">999.999đ</p>
                    </div>
                    <div class="card-footer_1">
                        <button class="btn__2" style="color: white;background: black">Mua ngay
                        </button>
                        <button class="btn__2" style="color: white ;background: black">Giỏ hàng
                        </button>
                    </div>
                </div>
            </div>
            <div class="card_1">
                <div class="card-content_1">
                    <img src="https://cafebiz.cafebizcdn.vn/2017/photo-2-1501495380220.jpg" class="card-img_1">
                    <h1 class="card-title_1">Harry Potter</h1>
                    <div class="card-body_1">
                        <div class="card-star">
                            <span class="rating-value" style="color: black">4.5</span>
                            <span class="star_1">&#9733;</span>
                        </div>
                        <p class="card-price__2">999.999đ</p>
                    </div>
                    <div class="card-footer_1">
                        <button class="btn__2" style="color: white;background: black">Mua ngay
                        </button>
                        <button class="btn__2" style="color: white ;background: black">Giỏ hàng
                        </button>
                    </div>
                </div>
            </div>
            <div class="card_1">
                <div class="card-content_1">
                    <img src="https://cafebiz.cafebizcdn.vn/2017/photo-2-1501495380220.jpg" class="card-img_1">
                    <h1 class="card-title_1">Harry Potter</h1>
                    <div class="card-body_1">
                        <div class="card-star">
                            <span class="rating-value" style="color: black">4.5</span>
                            <span class="star_1">&#9733;</span>
                        </div>
                        <p class="card-price__2">999.999đ</p>
                    </div>
                    <div class="card-footer_1">
                        <button class="btn__2" style="color: white;background: black">Mua ngay
                        </button>
                        <button class="btn__2" style="color: white ;background: black">Giỏ hàng
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="d-flex align-items-center position-relative mt-5">
        <img src="https://scontent.fdad1-3.fna.fbcdn.net/v/t39.30808-6/310566880_505894291550275_41994463521146018_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=783fdb&_nc_ohc=y7idWAKBHmQAX_vIzCv&_nc_oc=AQnGLJsl1PrEddyvaD9_-4igQeuuje9_Wacon0VEFxurH0_4UtXtPQuIqVGK4ogsubI&_nc_ht=scontent.fdad1-3.fna&oh=00_AfA2NyLvNuuO0HSVJ9b9pt3lq_FLr8cM1lmI3gGSBcEt1A&oe=658A4142"
             style="height: 100%;width: 100%">
        <div class="container position-absolute col-4 col-md-6 offset-1">
        </div>
        <div class="review">
            <div class="review__content">
                <blockquote class="body-size-7"><p></p><h4><em>Bộ sưu tập nghệ thuật bất khả thi (Ấn bản thứ 2)</em>
                </h4><h6>
                    <strong>"Khám phá 100 tác phẩm nghệ thuật đặc biệt mang đến cái nhìn đặc biệt về những thành tựu
                        nghệ thuật vĩ đại nhất của thế kỷ XX." </strong></h6><h4></h4><h6></h6>
                    <p></p></blockquote>
            </div>
        </div>
    </div>
</main>
<footer>
    <div class="container" style="margin-top: 70px">
        <div class="row justify-content-center">
            <div class="col-2"></div>
            <div class="col-6">
                <div class="review">
                    <div class="review__content">
                        <blockquote class="body-size-7"><p></p><h4><em>Một chương mới trong nền văn hóa xa hoa</em></h4>

                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
        <div style="text-align: center; ">
            <font>
                <strong>"Tầm nhìn, ngay từ ngày đầu tiên, đã là tạo ra những cuốn sách có thể hoàn thiện một thư viện
                    được
                    quản lý tốt. Ngày nay, những ngôi nhà được trang bị đầy đủ tiện nghi cho những người luôn
                    ăn mặc chỉnh tề, có thể sẽ có một bộ sưu tập sách Assouline phong phú trong nhà hoặc văn phòng của
                    họ." </strong></h6><h4></h4><h6><strong>– FORBES</strong></h6>
                <p></p>
            </font>
        </div>
    </div>
    <div class="d-flex align-items-center position-relative " style="margin-top: 70px;padding: 50px 0px">
        <div class="row justify-content-center">
            <div class="col-4">
                <img src=https://luxuo.vn/wp-content/uploads/2022/09/image008.jpg"
                     style="width: 420px;height:294px">
                <div class="d-flex justify-content-center mt-4 ">
                    <h4> THỦ CÔNG</h4>
                </div>
                <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Sự tôn trọng sản phẩm
                    và quá trình sáng tạo được thể hiện rõ ở mọi khía cạnh – kỹ thuật đóng bìa thủ công truyền thống,
                    hình ảnh đưa người đọc đến một địa điểm và thời gian khác, độ dày sang trọng của mỗi
                    trang.</font></font></p>
            </div>
            <div class="col-4">
                <img src="https://media.licdn.com/dms/image/C4D22AQGQQ2WBmX-PZA/feedshare-shrink_800/0/1579989939325?e=1706140800&v=beta&t=JqXIi_LFp63YbBAkIlbGtE0h5nABlat-OQkGcd0F1V0"
                     style="width: 420px;height:294px">
                <div class="d-flex justify-content-center mt-4 ">
                    <h4>TRÁCH NHIỆM VỚI MÔI TRƯỜNG</h4>
                </div>
                <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">LEAF BOOK tự hào thông
                    báo sự hợp tác với One Tree Planted trong sáng kiến Giúp tạo ra một thế giới bền vững
                    hơn. </font><font
                        style="vertical-align: inherit;">Trong nỗ lực trở thành một công ty có ý thức về môi trường,
                    LEAF BOOK sẽ trồng một cây cho mỗi cuốn sách được bán ra.</font></font></p>
            </div>
            <div class="col-4">
                <img src="https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-6/343741057_637273994883286_9002298109760383365_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=3635dc&_nc_ohc=rQYz22Fh_8oAX85Oh1u&_nc_ht=scontent.fsgn2-7.fna&oh=00_AfAyhYE1n6owJ9Vxn1gDEqixhkaFIyAKXXMWuVo7Ie1JEw&oe=658DA4F1"
                     style="width: 420px;height:294px">
                <div class="d-flex justify-content-center mt-4 ">
                    <h4 style="text-align: center">THAM QUAN CỬA HÀNG CỦA CHÚNG TÔI</h4>
                </div>
                <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Trải nghiệm thế giới
                    LEAF BOOK thông qua các cửa hàng, góc có thương hiệu và quán bar của chúng tôi trên toàn cầu.</font></font>
                </p>
            </div>
        </div>
    </div>
    <div style="background: rgb(247,247,248)" >
        <div class="container px-5 py-5">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="d-flex justify-content-center">

                        <img src="https://eu.assouline.com/cdn/shop/files/ENVELOPE_6d9a3edd-a121-476a-96fa-f693ce389cb0.png?v=1681829924&width=720"
                             height="113px" width="113px"/>
                    </div>
                    <div class="dsgn-pck__justify-center"><h3 class="dsgn-pck__small-heading dsgn-pck__item-heading">
                        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> MIỄN PHÍ VẬN
                            CHUYỂN KINH TẾ </font></font></h3>
                        <div class="dsgn-pck__text dsgn-pck__rte text_logo"><p><font
                                style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">Trên tất cả các đơn đặt hàng tại AS và Việt Nam
                            trên 4.999.999đ.</font></font></p></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="d-flex justify-content-center">

                        <img src="https://eu.assouline.com/cdn/shop/files/PACKAGED_ff59c28f-d3e3-4138-9d6f-c92234419214.png?v=1681829922&width=720"
                             height="113px" width="113px"/>
                    </div>
                    <div class="dsgn-pck__justify-center"><h3 class="dsgn-pck__small-heading dsgn-pck__item-heading">
                        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> GÓI QUÀ CHỮ
                            KÝ </font></font></h3>
                        <div class="dsgn-pck__text dsgn-pck__rte text_logo"><p><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">Tặng món quà hoàn hảo bằng giấy gói và dấu sáp có chữ
                            ký của LEAF BOOK.</font></font></p></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="d-flex justify-content-center">

                        <img src="https://eu.assouline.com/cdn/shop/files/STACKED_BOOKS_cff5f745-0a41-4e61-8cfb-5e5fc2daf4bb.png?v=1681829920&width=720"
                             height="113px" width="113px"/>
                    </div>
                    <div class="dsgn-pck__justify-center"><h3 class="dsgn-pck__small-heading dsgn-pck__item-heading">
                        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> TRUY CẬP ĐẦU
                            TIÊN </font></font></h3>
                        <div class="dsgn-pck__text dsgn-pck__rte text_logo"><p><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">Hãy mua những sản phẩm mới xuất hiện của chúng tôi và
                            những bản in lại được săn đón nhiều trước những người khác.</font></font></p></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="d-flex justify-content-center">

                        <img src="https://eu.assouline.com/cdn/shop/files/CARDS_c4600fcd-5fc5-4b7a-aaf4-b384b13acff7.png?v=1681829919&width=720"
                             height="113px" width="113px"/>
                    </div>
                    <div class="dsgn-pck__justify-center"><h3 class="dsgn-pck__small-heading dsgn-pck__item-heading">
                        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> NHIỀU CÁCH THANH
                            TOÁN NHIỀU HƠN </font></font></h3>
                        <div class="dsgn-pck__text dsgn-pck__rte text_logo"><p><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">Thanh toán bằng phương thức thanh toán ưa thích của
                            bạn, bao gồm Paypal.</font></font></p></div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</footer>
<body_2>
    <footer style="background: black">
        <div class="waves">
            <div class="wave" id="wave1"></div>
            <div class="wave" id="wave2"></div>
            <div class="wave" id="wave3"></div>
            <div class="wave" id="wave4"></div>
        </div>
        <ul class="social_icon">
            <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-twitter"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-instagram"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="mail-outline"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-youtube"></ion-icon></a></li>
        </ul>
        <ul class="menu">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="#">Tin tức </a></li>
            <li><a href="#">Dịch vụ</a></li>
            <li><a href="#">Đội ngũ</a></li>
            <li><a href="#">Hỗ trợ</a></li>
        </ul>
        <p style="color: white">©Leaf Book || Được xây dựng năm 2020</p>
    </footer>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>


</body_2>
</body>
</html>