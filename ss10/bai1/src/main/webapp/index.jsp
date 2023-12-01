<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<c:choose>
    <c:when test="${studentList.size()!=0}">
        <table border="1px solid">
            <tr>
                <th>Stt</th>
                <th>Tên Học Viên</th>
                <th>GIới tính</th>
                <th>Điểm</th>
                <th>Xếp loại</th>
            </tr>
            <c:forEach items="${studentList}" var="s" varStatus="look">
                <tr>
                    <td>${look.count}</td>
                    <td>${s.name}</td>
                    <td>${s.gender}</td>
                    <td>${s.point}</td>
                    <c:choose>
                        <c:when test="${s.point>=90}">
                            <td>Giỏi</td>
                        </c:when>
                        <c:when test="${s.point>=80}">
                            <td>Khá</td>
                        </c:when>
                        <c:when test="${s.point>=60}">
                            <td>Trung Bình</td>
                        </c:when>
                        <c:otherwise>
                            <td>Yếu</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <h3>Danh sach rỗng</h3>
    </c:otherwise>

</c:choose>
</body>
</html>