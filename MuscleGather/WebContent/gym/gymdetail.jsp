<%@page import="java.util.StringTokenizer"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <script>
    // 이력서제출 팝업창
    function resume(trainer_no, gym_no){

    	
      var result = confirm("이력서를 제출하시겠습니까?");
      
      if(result == true) {
    	  alert("이력서 제출이 완료되었습니다.")
    	  location.href = "gymdetaildb.jsp?trainer_no=" + trainer_no + "&gym_no=" + gym_no;
      } else {
    	  alert("취소되었습니다.")
      } 
    	
    }
    </script>

	<%
		// 선언문
	String title = "구인 상세";
	%>
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
	
	<%

		String user_no = request.getParameter("user_no");
	
		GymDTO gym = (new GymDAO()).getGym(user_no); // 헬스장 유저의 정보를 모두 불러온다.
		TrainerDTO trainer = (new TrainerDAO()).getTrainer("9"); // 페이지를 보고있는 트레이너의 번호
		String resumecnt = new JoinDAO().resumeCount(gym.getGym_no()); 	// resume 카운트
		System.out.println();
		
		String addr = gym.getGym_addr();
		String name = gym.getGym_name();
	%>
	
	<div class = "container"> 
	<div class = "row">
	<div class = "col-ma-5">
		
	</div>
	<div class = "col-ma-6">

	<%
	
		if(gym.getGym_images() != null){
			
			StringTokenizer st = new StringTokenizer(gym.getGym_images(), "/");	// 매개변수를 2개 입력, 첫번째: 가공할 문자열 / 두번째: 구분자
			
			while(st.hasMoreTokens()){	//hasMoreTokens 다음 토큰이 존재하는지 불린타입으로 반환
			
	%>
    
    
      	 <img src = "/images/<%=st.nextToken() %>" style="width:150px; height:250px">	<!-- nextToken 하나씩 가져옴 -->
	
	
	<% 	}
			} %>
      	
      	 <p>이력서제출횟수 : <%=resumecnt%></p>
      	 <p>번호 : <%=gym.getGym_no()%></p>
      	 <p>사업자 : <%=gym.getUser_name()%></p>
      	 <p>업체명 : <%=gym.getGym_name() %></p>
      	 <p>소개 : <%=gym.getGym_content()%></p>
      	 <p>주소 : <%=gym.getGym_addr()%></p>
      	 <p>등록날짜 : <%=gym.getGym_regdate()%></p>
      	 <p>급여 : <%=gym.getGym_salary()%></p>
      	 
      	 <!-- to -> 받는사람(헬스장) from -> 보낸사람(트레이너) -->
      	 <input type='button' name="user_from_no" style='width:200px; height:50px;' value='이력서제출' onclick='resume(<%=trainer.getTrainer_no()%>,<%=gym.getGym_no()%>)'/>
		
		<a href="gymlist.jsp" class="btn btn-secondary">뒤로가기</a>
		
		
		
		
	</div>
	</div>
	</div>
	
	
<!-- 카카오지도맵 API -->
<div id="map" style="width:100%;height:400px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=312d59fcbad6db485ff22cd2fef8f678&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

var addr = "<%=addr%>";
var name = "<%=name%>";
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=name%></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>



	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
</body>
</html>