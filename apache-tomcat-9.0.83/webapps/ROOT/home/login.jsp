<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 11/4/23
  Time: 11:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/login.css"/>
    <style>
        #logo {
            width: 100%;
        }
        .img-lg{
            width: 30%;
            height: 10%;
            margin: 1%;
            border-radius: 15px;
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
        .form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding-top: 3em;
            padding-left: 2.8em;
            padding-right: 2.8em;
            padding-bottom: 2.1em;
            border: 2px dashed #DAA06D;
            border-radius: 15px;
            background-color: #EADDCA;
            box-shadow: 0 0 0 4px #EADDCA, 2px 2px 4px 2px rgba(0, 0, 0, 0.5);
            transition: .4s ease-in-out;
            width: fit-content;
        }

        .form .heading {
            padding-left: 0.8em;
            color: #DAA06D;
            background-color: transparent;
            letter-spacing: .5em;
            text-align: center;
            padding-top: 1em;
            padding-bottom: 3em;
            text-shadow: inset -1px -1px 1px #DAA06D;
        }

        .form .input {
            outline: none;
            padding: 0.5em;
            border: 1px solid #DAA06D;
            color: #DAA06D;
            width: 14em;
            height: 3em;
            border-radius: 10px;
            background-color: #EADDCA;
            text-align: center;
        }

        .form .btn {
            align-self: center;
            margin-top: 2em;
            border-radius: 10px;
            outline: none;
            border: none;
            color: white;
            background-color: #E5AA70;
            font-weight: bold;
            letter-spacing: 0.1em;
            transition: .4s ease-in-out opacity,.1s ease-in-out active;
            padding: 1em;
            box-shadow: 0.5px 0.5px 0.5px 0.5px rgba(0, 0, 0, 0.5);
        }

        .form .btn:hover {
            opacity: 0.8;
        }

        .form .btn:active {
            transform: translateX(0.1em) translateY(0.1em);
            box-shadow: none;
        }
    </style>
</head>
<body>
<c:import url="navbar.jsp"></c:import>
<div class="row">
    <div>
        <div class="justify-content-center align-items-center d-flex pt-5">
            <img src="https://devo.vn/wp-content/uploads/2023/01/meo-cam-dao.jpg" alt="" class="img-lg">
            <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
            <form class="form justify-content-center align-items-center" method="post">
                <p class="heading">ĐĂNG NHẬP</p>
                <label for="username-lg">Tài khoản</label>
                <input placeholder="Nhập vào tài khoản" id="username-lg" class="input m-3" type="text" name="username" value="${cookie.cookieUser.value}"/>
                <label for="pass-lg">Mật khẩu</label>
                <input placeholder="Nhập vào mật khẩu" id="pass-lg" class="input m-3" type="password" name="password" value="${cookie.cookiePass.value}"/>
                <div>
                    <input type="checkbox" ${(cookie.cookieRem != null ? 'checked': '')} name="rem" value="ON"><span> Remember me</span>
                </div>
                <button class="btn">Đăng nhập</button>
                <div class="sign-up">
                    Chưa có tài khoản
                    <a href="/home?action=register">Đăng kí tại đây</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>