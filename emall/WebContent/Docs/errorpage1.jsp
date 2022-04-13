<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "MyError.jsp" %> <!-- 에러가 났을때 이곳으로 이동해라 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
<%
	String str = null;
	out.print(str.toString());
%>
</body>
</html>