<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Bạn đã chọn Sanwich với các gia vị:</h2>
<c:forEach items="${spice}" var="spice" varStatus="loop">
    <p>${spice}</p>
</c:forEach>
</body>
</html>