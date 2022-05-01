<%@page import="mail.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>유저 등록</title>
<link type="text/css" rel="stylesheet" href="../css/default.css" />

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/default.js"></script>


<link href="useradd.css" rel="stylesheet" type="text/css">
    <style>
        .tabmanu {
            margin: auto;
            width: 100%;
            height: 1000px;
            border: 1px solid #666666;
        }

        .tabBtnCell {
            display: flex;
            justify-content: flex-start;
        }

        label[for^='btn'] {
            width: 50%;
            padding: 10px;
            height: 45px;
            background: #666666;
            color: #ffffff;
            text-align: center;
        }

        div[id^="content"] {
            display: none;
            width: 100%;
            height: 200px;
            padding: 10px;
        }

        div[id^="content"].on {
            display: block;
        }

        .tabBtnCell>label[for^='btn']:hover {
            background: #e5e5e5;
            color: #666666;
        }

        .tabBtnCell>input[id^='btn']:checked+label {
            background: #ffffff;
            color: #666666;
        }
        
        form label em {
		font-size : 15px;
		color: red;
		font-weight: 800;
		}
	
		.ct{
			height: 80px;
			text-align: start;
			margin-top:80px;
		}
		textarea{
			width: 100%;
		    resize: none;
		}
		
		#addressbtn{
			width:100%;
			height:100%;
			margin: 0px 0px 0px 10px;
		}

    </style>
    <script>
        $(document).ready(function () {
            //tab manu 컨트롤
            $('.tabBtnCell > input').click(function () {
                var tab_id = $(this).attr('data-tab');
                $('.tabCell>div[id^="content"]').removeClass('on');
                $('#' + tab_id).addClass('on');
            })
        })

    </script>


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
   		
   		
   		// email 유효성 검사 (1)
   		function emailValCheck(user_email){

   			// 이메일 정규식 패턴
   			var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   			var email = user_email;
   			if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
   				return false;
   			}
   		    return true;
   		}
   		
   		// email 유효성 검사 (2)
   		function check(pattern, taget, message) {

   			if(pattern.test(taget)) {
   		    	return true;
   		    }
   		    alert(message);
   		    return false;
   		}
   		
   		
   		//email 중복체크 
   		function emailCheck(){ 
   			
   			const user_email = document.getElementById("user_email").value;
   			
   			
   			var chk = emailValCheck(user_email);
   			
   			if(user_email != "" && chk){
   			//새창 만들기 
   			
   			window.open("emailCheckPro.jsp?user_email=" + user_email , "emailwin", "width=400, height=350"); 
   			
   			}	
   		}
   		
   		// email 인증
   		function emailAuth(){
   			
   			const user_email = document.getElementById("user_email").value;  			
   			
   			window.open("useremailsend.jsp?user_email=" + user_email , "emailwin", "width=400, height=350");
   			
   		}
   			
    </script>
    
    
	<%!// 선언문
	String title = "회원 가입";
	%>
	
 <div class="wrap">
        <!-- header-->
        <header id="header">
	<%@include file="/html/pieceHeader.jsp" %>
        </header>

        <!-- hidden nav-->
        <nav id="nav"></nav>
        
        <main>
    <div class="mainWrap">
       <section class="sec1">
            <!-- 컨탠츠 구역 -->
       <div class="mainboard bd3" style="margin: auto;width:80%;">
        
	<div class="container" align="Center">
		
			

		<div class="ct">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>

	<hr>
	

		<form action="useradddb.jsp" method="post" name="signUpForm" enctype="multipart/form-data" accept-charset="UTF-8" class="frm">
			
			
				<div class="roww">
					<div>
						<label class="lab">이메일<em> * </em></label>
					</div>
					<div class="inputbox">
					<input type="email" name="user_email" id="user_email" placeholder="이메일을 입력해주세요.">
					</div>
					<div> 
					<input type="button" value="Email 중복확인" onclick="emailCheck()">
					</div>
					<div>
					<input type="button" value="Email 메일인증" onclick="emailAuth()"> <!-- disabled id="dischk" -->
					</div>
				</div>


				<div class="roww">
					<div>
						<label class="lab">비밀번호<em> * </em></label>
					</div>
					<div class="inputbox">
						<input type="text" id="pw" onchange="check_pw()" name="user_pw"placeholder="비밀번호를 입력해주세요.">
					</div>
				</div>


				<div class="roww">
					<div>
						<label class="lab">비밀번호 확인<em> * </em></label>
					</div>
					<div class="inputbox">
						<input type="text" id="pw2" onchange="check_pw()"placeholder="비밀번호를 확인해주세요.">
					&nbsp;<span id="check"></span>
					</div>
				</div>

			
				<div class="roww">
					<div>
						<label class="lab">이름<em> * </em></label>
					</div>
					<div class="inputbox">
						<input type="text" name="user_name" class="form-control"placeholder="이름을 입력해주세요.">
					</div>
				</div>

				

			<div class="roww">
				<div>
				<label class="lab">성별<em> * </em></label>
				</div>
				<div class="inputbox">
				<div class="col-sm-3">
					<div class="form-check form-check-inline">
					  <input name="user_gender" class="form-check-input" type="radio" id="inlineCheckbox1" value="M">
					  <label class="form-check-label" for="inlineCheckbox1" style="margin-right:100px">남성</label>
					  <input name="user_gender" class="form-check-input" type="radio" id="inlineCheckbox2" value="F">
					  <label class="form-check-label" for="inlineCheckbox2">여성</label>
					</div>
				</div>
				</div>
			</div>


			<div class="roww">
				<div>
					<label class="lab">생년월일<em> * </em></label>
				</div>
				<div class="inputbox">
					<input type="text" name="user_birth" class="form-control" placeholder="생년월일을 입력해주세요.">
				</div>
			</div>
			
							<div class="roww">
				<div>
					<label class="lab">전화번호<em> * </em></label>
				</div>
				<div class="inputbox">
					<input type="text" name="user_phone" class="form-control" placeholder="전화번호를 입력해주세요.">
				</div>
			</div>
				
			

<!-- 우편번호/주소/상세주소 api -->

<div class="roww">
	<div>
		<label class="lab">우편번호<em> * </em></label>
	</div>
	<div class="inputbox">
	<input type="text" id="zipbox" name="user_zipcode" placeholder="우편번호를 입력해주세요.">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 검색">
	</div>
</div>				


<div class="roww">
	<div>
		<label class="lab">주소<em> * </em></label>
	</div>
	<div class="inputbox">
	<input type="text" id="sample6_address" name="user_addr" placeholder="주소를 입력해주세요.">
	</div>
</div>


<div class="roww">
	<div>
		<label class="lab">상세주소<em> * </em></label>
	</div>
	<div class="inputbox">
	<input type="text" id="sample6_detailAddress" name="user_addrdetail" placeholder="상세주소를 입력해주세요.">
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
			

                        <!-- 하단 입력-->
                        <div class="tabmanu">
                            <div class="tabCell">
                                <div class="tabBtnCell">
                                    <input type="radio" id="btn1" name="mb_type" class="hidden" data-tab="content1"
                                        checked>
                                    <label for="btn1">트레이너</label>
                                    <input type="radio" id="btn2" name="mb_type" class="hidden" data-tab="content2">
                                    <label for="btn2">헬스장</label>
                                </div>

								
                                <div class="on" id="content1">
								<!-- trainerwrite.jsp -->
			<form action="gymwritedb.jsp" method="post" enctype="multipart/form-data">

			<div class="form-group row">
				<label class="col-sm-2">제목<em> * </em></label>
				<div class="col-sm-3">
					<input type="text" name="trainer_title" class="form-control" style="height:50px;" placeholder="업체명을 작성해주세요.">
				</div><br>

			<div class="form-group row">
				<label class="col-sm-2">소개란<em> * </em></label>
				<div class="col-sm-3">
				<textarea name="trainer_content" class="form-control" style="height:350px;" placeholder="업체 소개를 작성해주세요."></textarea>
				</div><br>
				
			</div>

			</div>


			
			<div class="form-group row">
			  <label class="col-sm-2" for="formFileSm">트레이너사진</label>
			  <div class="col-sm-3" style="border:1px solid #666666;">
			  <input name = "images" class="form-control form-control-sm" id="formFileSm" type="file" multiple style="height:50px;">
			</div>
			</div>	
			<br><br>
						
<!-- 주소api  -->
<div class="form-group row">
<div style="display:flex;">
<div class="col-sm-3" style="text-align:left;">
<input type="text" id="sample5_address" name="trainer_addr" placeholder="주소를 검색해주세요." style="height:50px;width:950px;"><br>
</div>
&nbsp;&nbsp;&nbsp;<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="form-control"><br><br>
</div>
</div>
<br><br>
<div id="map" style="width:950px;height:500px;margin:20px;display:none"></div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=312d59fcbad6db485ff22cd2fef8f678&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        
                        // 추가
                        gym_latitude = result.y;
                        gym_longtitude = result.x;
                    }
                });
            }
        }).open();
    }
    
    
</script>

 

			<div class="form-group row" style="width:100%; display:flex; justify-content:flex-end;" align="center">
					<div style="width:125px;">
					<input type="submit" class="btn btn-primary" value="등록">
					</div>
					<div style="width:125px; margin-left:20px;">
					<input type="reset" class="btn btn-primary" value="초기화">
					</div>
			</div>	
			
		</form>
                                <div class="" id="content2">
              	<!-- gymwrite.jsp -->
                <form action="gymwritedb.jsp" method="post" enctype="multipart/form-data">
                <div class="form-group row">
				<label class="col-sm-2">업체명<em> * </em></label>
				<div class="col-sm-3">
					<input type="text" name="gym_name" class="form-control" style="height:50px;" placeholder="업체명을 작성해주세요.">
				</div><br>

			<div class="form-group row">
				<label class="col-sm-2">업체 소개<em> * </em></label>
				<div class="col-sm-3">
				<textarea name="gym_content" class="form-control" style="height:350px;" placeholder="업체 소개를 작성해주세요."></textarea>
				</div><br>
				
			</div>
			<div class="form-group row">
				<label class="col-sm-2">지급 연봉</label>
				<div class="col-sm-3">
					<input type="text" name="gym_salary" class="form-control" style="height:50px;" placeholder="지급 연봉을 작성해주세요.">
				</div>

			</div><br>


			</div>


			
			<div class="form-group row">
			  <label class="col-sm-2" for="formFileSm">업체사진</label>
			  <div class="col-sm-3" style="border:1px solid #666666;">
			  <input name = "images" class="form-control form-control-sm" id="formFileSm" type="file" multiple style="height:50px;">
			</div>
			</div>	
			<br><br>
						
<!-- 주소api  -->
<div class="form-group row">
<div style="display:flex;">
<div class="col-sm-3" style="text-align:left;">
<input type="text" id="sample5_address" name="gym_addr" placeholder="업체주소를 검색해주세요." style="height:50px;width:950px;"><br>
</div>
<div>
<input type="button" id="addressbtn" onclick="sample5_execDaumPostcode()" value="주소 검색" class="form-control"><br><br>
</div>
</div>
</div>
<br><br>
<div id="map" style="width:950px;height:500px;margin:20px;display:none"></div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=312d59fcbad6db485ff22cd2fef8f678&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        
                        // 추가
                        gym_latitude = result.y;
                        gym_longtitude = result.x;
                    }
                });
            }
        }).open();
    }
    
    
</script>

 

			<div class="form-group row" style="width:100%; display:flex; justify-content:flex-end;" align="center">
					<div style="width:125px;">
					<input type="submit" class="btn btn-primary" value="등록">
					</div>
					<div style="width:125px; margin-left:20px;">
					<input type="reset" class="btn btn-primary" value="초기화">
					</div>
			</div>	
			</form>
                                </div> <!-- content2 끝 -->
                                </div>

                            </div>

                        </div>


			<div>
				<div class="subbtn">
					<input type="submit" class="btn btn-primary" value="등록" disabled id="dischk">
					</div>
			</div>	
			
			
			
			
			
			
			
			
			
			
		</form>
					</div></div>
				</section>
			</div>
		</main>	
		

 <footer id="footer">
<%@include file="/html/pieceFooter.jsp" %>
        </footer>

        <!-- side butten -->
        <article id="sideBtn">
            <div class="sideLinkWrap">
                <label id="" for="">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
            </div>
        </article>
	</div>

</body>
</html>