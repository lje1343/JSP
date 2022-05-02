<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="form-group row">
<div style="display:flex;">
<div class="col-sm-3" style="text-align:left;">
<input type="text" id="sample5_address" name="trainer_addr" placeholder="희망근무지역을 검색해주세요." style="height:50px;width:950px;"><br>
</div>
<div>
<input type="button" id="addressbtn" onclick="sample5_execDaumPostcode()" value="주소 검색" class="form-control"><br><br>
</div>
</div>
</div>
<br><br>
<div id="map" style="width:50px;height:50px;margin:20px;display:none"></div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=312d59fcbad6db485ff22cd2fef8f678&libraries=services"></script>
<script>
    var mapContainer2 = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map2 = new daum.maps.Map(mapContainer2, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder2 = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker2 = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map2
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr2 = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr2;
                // 주소로 상세 정보를 검색
                geocoder2.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result2 = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords2 = new daum.maps.LatLng(result2.y, result2.x);
                        // 지도를 보여준다.
                        mapContainer2.style.display = "block";
                        map2.relayout();
                        // 지도 중심을 변경한다.
                        map2.setCenter(coords2);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker2.setPosition(coords2)
                        
                        // 추가
                        gym_latitude = result2.y;
                        gym_longtitude = result2.x;
                    }
                });
            }
        }).open();
    }
    
    
</script>
</body>
</html>