<%@page import="dto.*"%>
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
	<%
		// 선언문
	String title = "헬스장 상세";
	%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">

	<%@ include file="/_header.jsp"%>

	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>
	</div>
	
	<%
		//int gym_no = Integer.parseInt(request.getParameter("gym_no"));
		int gym_no = 1;
		GymDTO gym = (new GymDAO()).getDetail(gym_no);
	
	%>
	
	<div class = "container">
	<div class = "row">

	<div class = "col-ma-6">
		<h3><%=gym.getGym_name() %></h3>
		<p><%=gym.getGym_content() %>
		<p><b>연봉 : <%=gym.getGym_salary() %></b>
		<p><b>지역 : <%=gym.getGym_area() %></b><br>
		
		
<!-- 		<a href="" class="btn btn-info">상품주문</a>
		<a href="productlist.jsp" class="btn btn-secondary">상품목록</a> -->
		
		
		
	</div>
	</div>
	</div>
	
	<!-- 지도 띄우기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=312d59fcbad6db485ff22cd2fef8f678"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(<%= gym.getGym_latitude() %>, <%= gym.getGym_longtitude() %>), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(<%= gym.getGym_latitude() %>, <%= gym.getGym_longtitude() %>); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({ 
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);    
			</script>
			
	
	<%@ include file="../_footer.jsp"%>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
</body>
</html>