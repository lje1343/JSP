<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스장 등록</title>
</head>
<body>

<script>
// form 검증(validation)
function chkSubmit(){
	
	newProduct = document.forms['newProduct'];
	
	var gym_name = newProduct['gym_name'].value.trim();
	
	if(gym_name == ""){
		alert("헬스장 이름은 필수 입력사항입니다.");
		newProduct["gym_name"].focus();
		return false;
	}
	
	return true;	
}
</script>

	<!-- CSS only -->
   <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">


   <%@ include file="/_header.jsp"%>

   <%!String title = "헬스장 등록";%>

   <div class="alert alert-secondary text-center" role="alert">
      <div class="container">
         <h2 class="display-10">
            <%=title%>
         </h2>
      </div>
   </div>
   
   <div class="container" style="padding-top:30px;">
     <form name="newProduct" class="form-horizontal"  action="gymwritedb.jsp" method="post" onsubmit="return chkSubmit()">
       <div class="form-group  row">
          <label class="col-sm-2" for="gym_name">헬스장 이름</label>
              <div class="col-sm-4">
              <input name="gym_name" type="text" class="form-control" placeholder="Enter the Title" >
       </div>
   </div>
<!--       <div class="form-group  row" style="display:none;">
         <label class="col-sm-2">작성자</label>
            <div class="col-sm-4">
              <input name="id" type="text" class="form-control" value="test"placeholder="Enter the name" >
      </div>
   </div> -->

			<div class="form-group row">
				<label class="col-sm-2">소개란</label>
				<div class="col-sm-3">
					<textarea name="gym_content" cols="50" rows="8" class="form-control">
			</textarea>
				</div>

<!-- 				<div class="form-group  row">
					<label class="col-sm-2">첨부파일</label>
					<div class="col-sm-4">
						<input name="filename" type="file" class="form-control">
					</div>
				</div>
				<div class="col-sm-offset-5 col-sm-5">
					<input type="submit" class="btn btn-dark" value="글쓰기 "> <input
						type="reset" class="btn btn-dark" value="취소" onclick="reset()">
				</div> -->
				
<!-- 주소api -->
<input type="text" id="sample5_address" placeholder="주소">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
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
    
/*     id가 address인 input box 클릭 시 실행할 자바스크립트 코드 */
    var geocoder = new kakao.maps.services.Geocoder();

    $("#address").click(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                $("#address").val(data.address);
                $("#address").prop("readonly",true);
                $("input[name=place]").val(data.sido);
                var juso =  $("#address").val();
            	geocoder.addressSearch(juso, callback);  
            }
        }).open()
    });

    var callback = function(result, status) {
    	if (status === kakao.maps.services.Status.OK) {
    		$("input[name=lng]").val(result[0].x);
    		$("input[name=lat]").val(result[0].y);
    	}
    };
    
</script>
				
			
		<div class="col-sm-offset-5 col-sm-5">
		<input type="submit" class="btn btn-dark" value="등록 "> <input
			type="reset" class="btn btn-dark" value="취소" onclick="reset()">
	</div>	
	
		</form>
   </div>
   

<%@ include file="/_footer.jsp"%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/lang/summernote-ko-KR.min.js"></script>

   <script>
      $(document).ready(function() {
         $('#myEditor').summernote({
            lang : 'ko-KR',
            height : 250,
         });
      });
   </script>
    

   <!-- JavaScript Bundle with Popper -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>

   
		
</body>