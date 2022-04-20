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
	request.setCharacterEncoding("utf-8");
	
	String[] item1 = request.getParameterValues("hobby");
	// 여러개 받을때
	//String item1 = request.getParameter("hobby");
	// 1개 받을때
	%>
	<%
		if (item1 != null) {
		for (String con : item1)
			out.print(con + "<br>");
		}
	%>
</body>
</html>