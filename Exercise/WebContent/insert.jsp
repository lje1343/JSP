<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>

<%   request.setCharacterEncoding("UTF-8"); %>

<form action="insert_process.jsp" method="post">
<table>
<tr><td>
학번 : <input type="text" name="num">
</td></tr>
<tr><td>
학과 : <input type="text" name="dept">
</td></tr>
<tr><td>
이름 : <input type="text" name="name">
</td></tr>
<tr><td>
주소 : <input type="text" name="address">
</td></tr>
<tr><td>
연락처 : <input type="text" name="phone">
</td></tr>
<tr><td>
<input type="submit" value="전송">
</td></tr>
</table>
</form>


</body>
</html>