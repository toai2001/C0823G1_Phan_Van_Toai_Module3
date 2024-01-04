<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<br/>
<form action="/save" method="post">
    <h2>Sandwich Condiments</h2>
    <div style="display: flex;margin-right: 10px">
        <input type="checkbox" name="spice" value="lettuce" id="lettuce">
        <label for="lettuce"> Lettuce</label><br>
        <input type="checkbox" name="spice" value="tomato" id="tomato">
        <label for="tomato"> Tomato</label><br>
        <input type="checkbox" name="spice" value="mustard" id="mustard">
        <label for="mustard"> Mustard</label><br>
        <input type="checkbox" name="spice" value="sprouts" id="sprouts">
        <label for="sprouts"> Sprouts</label><br>
    </div>
    <br>
    <br>
    <input type="submit" value="Save">
</form>
</body>
</html>