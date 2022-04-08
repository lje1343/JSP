<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String uid = request.getParameter("id");
	String res = "<h3>User ID : " + uid + "</h3>";

	out.print(res);	// System.out.println(res);
					// JSP에서는 System을 쓰지않는다. println의 ln도 사용 x
					

%>
</body>
</html>