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
			
/* 	if(!isNaN(document.loginForm.id.value.substr(0,1))) { /* 숫자가 아닌게 아닐 경우 */ */
		
	// 첫글자가 소문자인지 확인
	var ch = form.loginForm.id.value.charAt(0);
	if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9'))
		alert("아이디는 영문 소문자로만 입력가능합니다.");
		document.loginForm.id.select();
		return false;
	} 

	form.submit();
}

</script>

<form action="Testdb.jsp" name="loginForm">
아이디 : <input type="text" name="id">
비번 : <input type="password" name="pw">
<input type="button" onclick="CheckForm()">

</form>

</body>
</html>