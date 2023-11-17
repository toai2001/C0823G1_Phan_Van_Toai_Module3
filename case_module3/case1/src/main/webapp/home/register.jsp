
      <%@ page contentType="text/html;charset=UTF-8" language="java" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <html>
      <head>
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="../css/register.css"/>
        <style>
          #logo {
            width: 100%;
          }
          .img-rg{
            width: 50%;
            height: 20%;
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
            width: 30%;
          }

          .form .heading {
            padding-left: 0.8em;
            color: #DAA06D;
            background-color: transparent;
            letter-spacing: .5em;
            text-align: center;
            padding-top: 1em;
            padding-bottom: 3em;
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
          :focus {
            outline: 0;
            border-color: #2260ff;
            box-shadow: 0 0 0 4px #b5c9fc;
          }

          .mydict div {
            display: flex;
            flex-wrap: wrap;
            margin-top: 0.5rem;
            justify-content: center;
          }

          .mydict input[type="radio"] {
            clip: rect(0 0 0 0);
            clip-path: inset(100%);
            height: 1px;
            overflow: hidden;
            position: absolute;
            white-space: nowrap;
            width: 1px;
          }

          .mydict input[type="radio"]:checked + span {
            box-shadow: 0 0 0 0.0625em #0043ed;
            background-color: #dee7ff;
            z-index: 1;
            color: #0043ed;
          }

          label span {
            display: block;
            cursor: pointer;
            background-color: #EADDCA;
            padding: 0.375em .75em;
            position: relative;
            margin-left: .0625em;
            box-shadow: 0 0 0 0.0625em #b5bfd9;
            letter-spacing: .05em;
            color: #3e4963;
            text-align: center;
            transition: background-color .5s ease;
          }

          label:first-child span {
            border-radius: .375em 0 0 .375em;
          }

          label:last-child span {
            border-radius: 0 .375em .375em 0;
          }

        </style>
      </head>
      <body>
      <c:import url="navbar.jsp"></c:import>
      <div class="row">
        <div>
          <div class="justify-content-center align-items-center d-flex pt-5">
            <img src="https://devo.vn/wp-content/uploads/2023/01/meo-cam-dao.jpg" alt="" class="img-rg">
            <form class="form justify-content-center align-items-center" action="/register" method="post">
              <p class="heading">ĐĂNG KÍ</p>
              <label for="name">Họ tên</label>
              <input placeholder="Họ tên của bạn" class="input m-3" type="text" name="name" id="name" required/>
              <label for="phone">Số điện thoại</label>
              <input placeholder="Số điện thoại của bạn" class="input m-3" type="tel" name="phone" id="phone" required/>
              <label for="email">Email</label>
              <input placeholder="Email của bạn" class="input m-3" type="email" name="email"  id="email" required/>
              <label for="address">Địa chỉ</label>
              <input placeholder="Địa chỉ của bạn" class="input m-3" type="text" name="address" id="address" required/>
              <label for="birthday">Ngày sinh</label>
              <input placeholder="Ngày sinh của bạn" class="input m-3" type="date" name="birthday" id="birthday" required/>
              <label for="username">Tài khoản</label>
              <input placeholder="Nhập vào tài khoản" class="input m-3" type="text" name="username" id="username" required/>
              <label for="pass">Mật khẩu</label>
              <input placeholder="Nhập vào mật khẩu" class="input m-3" type="password" name="password" id="pass" required/>
              <label for="repass">Nhập lại mật khẩu</label>
              <input placeholder="Nhập lại mật khẩu" class="input m-3" type="password" name="repassword" id="repass" required/>
              <div class="mydict">
                <div>
                  <label>
                    <input type="radio" name="radio" checked="" value="0">
                    <span>Nam</span>
                  </label>
                  <label>
                    <input type="radio" name="radio" value="1">
                    <span>Nữ</span>
                  </label>
                </div>
              </div>
              <button type="submit" name="action" value="register" class="btn" >Đăng kí</button>
              <div>
                Đã có tài khoản?
                <a href="/home?action=login">Đăng nhập tại đây.</a>
              </div>
            </form>
          </div>
        </div>

      </div>
      <script>
          var password = document.getElementById("pass")
              , confirm_password = document.getElementById("repass");

          function validatePassword(){
              if(password.value != confirm_password.value) {
                  confirm_password.setCustomValidity("Mật khẩu không khớp");
              } else {
                  confirm_password.setCustomValidity('');
              }
          }

          password.onchange = validatePassword;
          confirm_password.onkeyup = validatePassword;
      </script>
      </body>
      </html>