<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/convert">
    <label for="eng"> Nhập từ tiếng anh cần tra cứu</label> <br>
    <input type="text" name="eng" id="eng"> <br><br>
    <input type="submit" value="Tra cứu">
    <c:if test="${ not empty vi}">
        <p>Kết quả của từ <b>${eng}</b> là <b>${vi}</b></p>
    </c:if>
</form>
</body>
</html>