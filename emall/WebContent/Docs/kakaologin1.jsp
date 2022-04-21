<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- 카카오 로그인api -->
<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"
  />
</a>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
kakao.init("17c3ca945001762972d70d0f8f6bf1aa");

function kakaoLogin() {
	
	window.kakao.Auth.login ({
	scope: 'profile_nickname,account_email,gender,birthday',
	success: function(authObj) {	// 성공
		console.log(authObj);
		windows.Kakao.API.request({
			url:'/v2/user/me',
			success: res => {
				const kakaoAccount = res.kakao_account;	// 넘겨받은 덩어리
				console.log(kakaoAccount);
			}
		});
	}
	})
}
</script>
</body>
</html>