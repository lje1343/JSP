<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 자바 영역
String uid = request.getParameter("id");
String ups = request.getParameter("ps");

%>
<!-- html 주석  -->
<%-- jsp  주석 --%>
<h3>User ID:<%=uid %></h3>
<h3>User PS:<%=ups %></h3>
<h5>by 29이지은</h5>
</body>
</html>