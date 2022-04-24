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

function emailAuthentication(){
	if (!emailValCheck()){
    	return false;
    }
	var url = "confirmEmail.four?email=" + document.signUpForm.email.value;
	open(url, "confirm",
			"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
}


function emailValCheck(){
const form = document.signUpForm;
	var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = form.email.value;
	if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
		return false;
	}
    return true;
}

function check(pattern, taget, message) {
	if(pattern.test(taget)) {
    	return true;
    }
    alert(message);
    taget.focus();
    return false;
}

</script>



<form name="signUpForm" action="signUpInput.four" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
이메일<input type="text" name="email" id="inputEmailForm"  maxlength="30">
<button onclick="emailAuthentication()" id="eamilAuthBtn" type="button" class="btnChk">인증 메일 보내기</button>

<input type="text" name="authCode" id="inputAuthCode"  maxlength="10" disabled="disabled">
<button onclick="authCodeCheck()" id="authCodeCheckBtn" type="button" disabled="disabled" class="btnChk">인증</button>
<input type="hidden" name="authPass" id="authPass" value="false">

</form>
</body>
</html>