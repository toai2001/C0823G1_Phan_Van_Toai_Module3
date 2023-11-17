<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .Btn-login {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        width: 45px;
        height: 45px;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        position: relative;
        overflow: hidden;
        transition-duration: .3s;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.199);
        background-color: #D9E8D8
    }

    /* plus sign */
    .sign {
        width: 100%;
        transition-duration: .3s;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .sign svg {
        width: 17px;
    }

    .sign svg path {
        fill: white;
    }

    /* text */
    .text {
        position: absolute;
        right: 0%;
        width: 0%;
        opacity: 0;
        color: white;
        font-size: 1.2em;
        font-weight: 600;
        transition-duration: .3s;
    }

    /* hover effect on button width */
    .Btn-login:hover {
        width: 125px;
        border-radius: 40px;
        transition-duration: .3s;
    }

    .Btn-login:hover .sign {
        width: 30%;
        transition-duration: .3s;
        padding-left: 20px;
    }

    /* hover effect button's text */
    .Btn-login:hover .text {
        opacity: 1;
        width: 70%;
        transition-duration: .3s;
        padding-right: 10px;
    }

    /* button click effect*/
    .Btn-login:active {
        transform: translate(2px, 2px);
    }
</style>
<div class="container">
    <!--    header-->
    <div class="header container-fluid d-flex" style="background: #efcfd4">
        <!-- Logo -->
        <div
                id="logo"
                class="flex-col logo justify-content-center align-items-center d-flex"
        >
            <!-- Header logo -->
            <a href="" title="PET CARE" rel="home">
                <img
                        width="210"
                        height="130"
                        src="https://lh3.googleusercontent.com/pw/ADCreHc8cO_KIDPAHNfuA7rboxPNAloxhl75l85KQP1OtsXqFgMzQrwZMfPswXsMrawC63pHW_Wt0vH_fHAC5DAcRcFKKCBFJABr_0R8Zr9Lgp5MdYnnD8BbMvAQghVkRAtkrPAKCApPnFSNd0xlCjdelKo=w1458-h1458-s-no-gm?authuser=0https://lh3.googleusercontent.com/pw/ADCreHc8cO_KIDPAHNfuA7rboxPNAloxhl75l85KQP1OtsXqFgMzQrwZMfPswXsMrawC63pHW_Wt0vH_fHAC5DAcRcFKKCBFJABr_0R8Zr9Lgp5MdYnnD8BbMvAQghVkRAtkrPAKCApPnFSNd0xlCjdelKo=w1458-h1458-s-no-gm?authuser=0"
                        class="header_logo header-logo"
                        alt="pet care logo"
                /></a>
        </div>
        <!-- Search -->
        <div class="col-lg-4 justify-content-center align-items-center d-flex">
            <div class="group">
                <svg class="icon" aria-hidden="true" viewBox="0 0 24 24">
                    <g>
                        <path
                                d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"
                        ></path>
                    </g>
                </svg>
                <input placeholder="Search" type="search" class="input"/>
            </div>
        </div>
        <!-- right -->
        <div class="col-lg-4 justify-content-center align-items-center d-flex">
            <div>
                <c:if test="${account == null}">
                    <button class="Btn-login">
                        <div class="sign">
                            <svg viewBox="0 0 512 512">
                                <path d="M217.9 105.9L340.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L217.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1L32 320c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM352 416l64 0c17.7 0 32-14.3 32-32l0-256c0-17.7-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32l64 0c53 0 96 43 96 96l0 256c0 53-43 96-96 96l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32z"></path>
                            </svg>
                        </div>
                        <a href="/home?action=login" class="text"><small>Đăng nhập</small></a>
                    </button>
                </c:if>
                <c:if test="${account != null}">
                    <c:if test="${account.getRoleId()==2}">
                        <nav class="navbar navbar-expand-lg">
                            <div class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="https://bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg"
                                         alt="User Avatar" width="30" height="30" class="rounded-circle">
                                        ${sessionScope.account.username}
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/employee">Quản lý nhân viên</a></li>
                                    <li><a class="dropdown-item" href="/admin">Quản lý khách hàng</a></li>
                                    <li><a class="dropdown-item" href="/service">Quản lý dịch vụ</a></li>
                                    <li><a class="dropdown-item" href="/accounts">Quản lý tài khoản</a></li>
                                    <li><a class="dropdown-item" href="/booking-management">Quản lý booking</a></li>
                                    <li><a class="dropdown-item" href="/pet">Quản lý thú cưng</a></li>
                                    <li><a class="dropdown-item" href="/home?action=logout">Đăng xuất</a></li>
                                </div>
                            </div>
                        </nav>
                    </c:if>
                    <c:if test="${account.getRoleId()==1}">
                        <nav class="navbar navbar-expand-lg">
                            <div class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <img src="https://bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg"
                                         alt="User Avatar" width="30" height="30" class="rounded-circle">
                                        ${sessionScope.account.username}
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/customer?id=${account.getAccountId()}">Thông tin</a></li>
                                    <li><a class="dropdown-item" href="/booking-management?action=createBookingOnline&idAcc=${account.getAccountId()}">Đặt lịch sử dụng dịch vụ</a></li>
                                    <li><a class="dropdown-item" href="/home?action=logout">Đăng xuất</a></li>
                                </div>
                            </div>
                        </nav>
                    </c:if>
                    <c:if test="${account.getRoleId()==3}">
                        <nav class="navbar navbar-expand-lg">
                            <div class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <img src="https://bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg"
                                         alt="User Avatar" width="30" height="30" class="rounded-circle">
                                        ${sessionScope.account.username}
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item"
                                           href="/employee?action=detail&username=${account.getUsername()}">Thông
                                        tin</a></li>
                                    <li><a class="dropdown-item" href="/admin">Quản lý khách hàng</a></li>
                                    <li><a class="dropdown-item" href="/pet">Quản lý thú cưng</a></li>
                                    <li><a class="dropdown-item" href="/booking-management">Quản lý booking</a></li>
                                    <li><a class="dropdown-item" href="/home?action=logout">Đăng xuất</a></li>
                                </div>
                            </div>
                        </nav>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
    <div>

        <ul class="nav nav-tabs bg-light justify-content-center">
            <li class="nav-item">
                <a class="nav-link " aria-current="page" href="/home"
                >Trang chủ</a
                >
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/home?action=intro">Giới thiệu</a>
            </li>
            <li class="nav-item dropdown">
                <a
                        class="nav-link dropdown-toggle"
                        data-bs-toggle="dropdown"
                        href="#"
                        role="button"
                        aria-expanded="false"
                >Dịch vụ</a
                >
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/home?action=service">Cắt tỉa & Spa</a></li>
                    <li>
                        <hr class="dropdown-divider"/>
                    </li>
                    <li><a class="dropdown-item" href="#">Daycare & Hotel</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Liên hệ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Về thú cưng</a>
            </li>
        </ul>
    </div>
</div>