<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MuscleGather</title>
</head>
<body>

<%
 request.setCharacterEncoding("UTF-8");
 
 String user_name = request.getParameter("user_name");
%>

<body align="center">
<h2>근육모아에서 보내드리는 메일입니다.</h2>
<table border=1 width="100%">
	<tr>
	<td width="50">근육모아</td>
	<td><%=user_name %>님 환영합니다!</td>
	</tr>
	<tr>
	<td colspan=2>
	<img src="jennie3.jpg" width=300>
	</td>
	</tr>
</table>


</body>
</html>