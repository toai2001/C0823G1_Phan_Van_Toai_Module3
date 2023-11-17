<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/main.css">
</head>
<!--MAIN-CONTENT-->
<body>
<div class="container mt-4 signup">
    <div class="card">
        <div class="card-header bg-primary text-light text-center">
            <h1>Đăng nhập</h1>
        </div>
        <div class="card-body">
            <form method="post">
                <div class="form-group mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-lock"></i>
                  </span>
                        </div>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username" required/>
                    </div>
                </div>
                <div class="form-group mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-lock"></i>
                  </span>
                        </div>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Log In</button>
                <a href="/sign-up.jsp" type="submit" style="accent-color: cadetblue">Bạn chưa có tài khoản</a>

            </form>
            <c:if test="${not empty errorUsername}">
                <p class="text-danger">
                        ${errorUsername}
                </p>
            </c:if>
            <c:if test="${not empty errorPassword}">
                <p class="text-danger">
                        ${errorPassword}
                </p>
            </c:if>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>