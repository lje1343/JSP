<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="map" style="width:500px;height:400px;"></div>
	
	<%
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
	%>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17c3ca945001762972d70d0f8f6bf1aa"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(<%=lat%>, <%=lng%>),
			level: 3
		}; 

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>