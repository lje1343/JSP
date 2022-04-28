<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>업체 등록</title>
<link type="text/css" rel="stylesheet" href="../css/default.css" />

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/default.js"></script>


	<script>
	// form 검증(validation)
	function chkSubmit(){
		
		newProduct = document.forms['newProduct'];
		
		var gym_name = newProduct['gym_name'].value.trim();
		var gym_content = newProduct['gym_content'].value.trim();
		var gym_addr = newProduct['gym_addr'].value.trim();
		
		if(gym_name == ""){
			alert("업체명은 필수 입력사항입니다.");
			newProduct["gym_name"].focus();
			return false;
		}
		if(gym_content == ""){
			alert("내용은 필수 입력사항입니다.");
			newProduct["gym_content"].focus();
			return false;
		}
		if(gym_addr == ""){
			alert("주소는 필수 입력사항입니다.");
			newProduct["gym_addr"].focus();
			return false;
		}
		
		return true;	
	}
	</script>
	
<link href="gymlist.css" rel="stylesheet" type="text/css">
	
</head>


<body>

	<%
		// 선언문
	String title = "업체 등록";
	%>
		
    <div class="wrap">
        <!-- header-->
        <header id="header">
	
        </header>

        <!-- hidden nav-->
        <nav id="nav"></nav>
        
        <main>
    <div class="mainWrap">
       <section class="sec1">
            <!-- 컨탠츠 구역 -->
       <div class="mainboard bd3" style="margin: auto;width:80%;">
        
	<div class="container" align="Center">
		<form action="gymwritedb.jsp" method="post" enctype="multipart/form-data">
		
			

		<div class="ct">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>

	<hr>
			

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
					<input type="text" name="gym_salary" class="form-control" style="height:50px;">
				</div>

			</div><br>


			</div>

<!-- 			<div class="form-group row">
				<label class="col-sm-2">공개여부</label>
				<div class="col-sm-3">
					<select name="gym_secret" class="form-select form-select-sm" aria-label=".form-select-sm example">
						  <option selected>상품 분류를 선택하세요</option>
						  <option value="공개">공개</option>
						  <option value="비공개">비공개</option>
					</select>
				</div>

			</div> -->

			
			<div class="form-group row">
			  <label class="col-sm-2" for="formFileSm">업체사진</label>
			  <div class="col-sm-3" style="border:1px solid #666666;">
			  <input name = "images" class="form-control form-control-sm" id="formFileSm" type="file" multiple style="height:50px;">
			</div>
			</div>	
			<br><br>
						
<!-- 주소api  -->
<div class="form-group row">
<div class="col-sm-3">
<input type="text" id="sample5_address" name="gym_addr" placeholder="업체주소를 검색해주세요." style="height:50px;"><br>
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="form-control"><br><br>
</div></div>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
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
	</div>
	
	</div>
	
	 </section>

            </div>
        </main>
        
 <footer id="footer">

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