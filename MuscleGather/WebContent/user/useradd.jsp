<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>

<style>
form label em {
	font-size : 15px;
	color: red;
	font-weight: 800;
	}
	
</style>

</head>
<body>

   <script>
   
   		// 비밀번호 유효성 검사
        function check_pw(){
 
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 6 || pw.length>16){ 
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('pw').value='';
            }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
   		
   		// 이메일 인증
   		// 유효성 검사 (1)
   		function emailAuthentication(){	//결과값이 true면 이메일정보를 get방식으로 전송, 아닐경우 실행x
   			console.log("1");
			if (!emailValCheck()){
		    	return false;
		    }
			var url = "confirmEmail.four?user_email=" + document.signUpForm.user_email.value;
			open(url, "confirm",
					"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
		}
   		
   		// 유효성 검사 (2)
   		function emailValCheck(){
   				console.log("2");
   		//이메일을 포함하는 form의 위치
   		const form = document.signUpForm;
   			// 이메일 정규식 패턴
   			var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   			var email = form.user_email.value;
   			if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
   				return false;
   			}
   		    return true;
   		}
   		
   		// 유효성 검사 (3)
   		function check(pattern, taget, message) {
   			console.log("3");
   			if(pattern.test(taget)) {
   		    	return true;
   		    }
   		    alert(message);
   		    /* taget.focus(); */
   		    return false;
   		}
   		
   		
   		
   		
    </script>
    
    
	<%!// 선언문
	String title = "회원 가입";%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">


	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>
	</div>

	<div class="container" align="Center">
		<form action="useradddb.jsp" method="post" name="signUpForm" enctype="multipart/form-data" accept-charset="UTF-8">
		
		<div class="form-group row">
				<label class="col-sm-2">이메일<em> * </em></label>
				<div class="col-sm-3">
					<input type="email" name="user_email" id="inputEmailForm" class="form-control">
				</div>
				<div class="col-sm-2">
					<button onclick="emailAuthentication()" id="emailAuthbtn" type="button" class="btnChk">인증 메일 전송</button>
				</div>


			<div class="form-group row">
				<label class="col-sm-2">인증번호 입력<em> * </em></label>
				<div class="col-sm-3">
					<input type="email" name="user_email" class="form-control">
				</div>
				<div class="col-sm-2">
					<button onclick="authCode()" id="authcode" disabled="disabled" type="button" class="btnChk">인증 확인</button>
				</div>
				
			</div></div>
			
			
			
				
			<div class="form-group row">
				<label class="col-sm-2">비밀번호<em> * </em></label>
				<div class="col-sm-3">
					<input type="text" id="pw" onchange="check_pw()" name="user_pw" class="form-control">
				</div>

			</div>
				
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인<em> * </em></label>
				
				<div class="col-sm-3">
					<input type="text" id="pw2" onchange="check_pw()" class="form-control">
					&nbsp;<span id="check"></span>
				</div>

			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">이름<em> * </em></label>
				<div class="col-sm-3">
					<input type="text" name="user_name" class="form-control">
				</div>

			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별<em> * </em></label>
				<div class="col-sm-3">
					<div class="form-check form-check-inline">
					  <input name="user_gender" class="form-check-input" type="radio" id="inlineCheckbox1" value="M">
					  <label class="form-check-label" for="inlineCheckbox1">남성</label>
					</div>
					<div class="form-check form-check-inline">
					  <input name="user_gender" class="form-check-input" type="radio" id="inlineCheckbox2" value="F">
					  <label class="form-check-label" for="inlineCheckbox2">여성</label>
					</div>
				</div>

			</div>
			<div class="form-group row">
				<label class="col-sm-2">생년월일<em> * </em></label>
				<div class="col-sm-3">
					<input type="text" name="user_birth" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">전화번호<em> * </em></label>
				<div class="col-sm-3">
					<input type="text" name="user_phone" class="form-control">
				</div>
			</div>
					

<div class="form-group row">
<div class="col-sm-3">
<!-- 우편번호/주소/상세주소 api -->
<input type="text" id="sample6_postcode" name="user_zipcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" name="user_addr" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" name="user_addrdetail" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목">
</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
			

			<div class="col-sm-6 mb-5">
				<input type="submit" class="btn btn-primary" value="헬스장">
				<input type="reset" class="btn btn-danger" value="트레이너">
			</div>	

			<div class="form-group row" align="center">
			<div class="col-sm-6">
				<input type="submit" class="btn btn-primary" value="등록">
				<input type="reset" class="btn btn-danger" value="취소">
			</div>	
			</div>	
			
			
		</form>
	</div>




	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>



</body>
</html>