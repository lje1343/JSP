<%@page import="java.util.StringTokenizer"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>업체 상세</title>
<link type="text/css" rel="stylesheet" href="../css/default.css" />

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/default.js"></script>

    <script>
    // 이력서제출 팝업창
    function resume(trainer_no, gym_no){

    	
      var result = confirm("이력서를 제출하시겠습니까?");
      
      if(result == true) {
    	  location.href = "gymdetaildb.jsp?trainer_no=" + trainer_no + "&gym_no=" + gym_no;
      } else {
    	  alert("취소되었습니다.")
      } 
    	
    }
    </script>
    
    
    <style>
    textarea{
	width: 100%;
    resize: none;
}
    </style>
    
<body>

	<%
		// 선언문
	String title = "구인 상세";
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


		<div class="ct">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>

	<hr>
	
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

      	
      	 <p>이력서제출횟수 : <%=resumecnt%></p>
      	 <p>번호 : <%=gym.getGym_no()%></p>
      	 <p>사업자 : <%=gym.getUser_name()%></p>
      	 <p>업체명 : <%=gym.getGym_name() %></p>
      	 <p>소개 : <%=gym.getGym_content()%></p>
      	 <p>주소 : <%=gym.getGym_addr()%></p>
      	 <p>등록날짜 : <%=gym.getGym_regdate()%></p>
      	 <p>급여 : <%=gym.getGym_salary()%></p>
      	 
      	 <div class="form-group row">
				<div class="col-sm-3">
					<input type="text" name="gym_name" class="form-control" style="height:50px;" value=<%=gym.getGym_name() %>>
				</div><br>

			<div class="form-group row">
				<label class="col-sm-2">지급 연봉</label>
				<div class="col-sm-3">
					<input type="text" name="gym_salary" class="form-control" style="height:50px;" value=<%=gym.getGym_salary()%>>
				</div>

			</div><br>
			
			<div class="form-group row">
				<label class="col-sm-2">업체 소개<em> * </em></label>
				<div class="col-sm-3">
				<textarea name="gym_content" class="form-control" style="height:350px;"><%=gym.getGym_content()%></textarea>
				</div><br>
				
			</div>


	<%
	
		if(gym.getGym_images() != null){
			
			StringTokenizer st = new StringTokenizer(gym.getGym_images(), "/");	// 매개변수를 2개 입력, 첫번째: 가공할 문자열 / 두번째: 구분자
			
			while(st.hasMoreTokens()){	//hasMoreTokens 다음 토큰이 존재하는지 불린타입으로 반환
			
	%>
    
    
      	 <img src = "/images/<%=st.nextToken() %>" style="width:150px; height:250px">	<!-- nextToken 하나씩 가져옴 -->
	
	
	<% 	}
			} %>
			
			</div>
				
      	 
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