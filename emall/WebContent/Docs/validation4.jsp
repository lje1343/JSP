<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function CheckForm() {
			
	
	var regExp = /Java/i;	// var regExp = new RegExp('java', 'i'); 와 같은 의미
	var str = document.loginForm.title.value;
	var result = regEXP.exec(str);	// regExp을 str에서 찾아라
	alert(result[0]);
	
	}


</script>

<form name="loginForm">
제목 : <input type="text" name="title">

<input type="submit" onclick="CheckForm()">

</form>

</body>
</html>