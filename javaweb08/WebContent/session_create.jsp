<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 생성</title>
</head>
<body>
<%
session.setAttribute("id","admin");
session.setAttribute("name","관리자");
out.print("세션 속성 설정 완료! <br>");
%>

세션 아이디:	<%=session.getAttribute("id") %><br>
세션 네임:		<%=session.getAttribute("name") %><br>

<p><a href="session_check.jsp">[세션 확인]</a>
</body>
</html>