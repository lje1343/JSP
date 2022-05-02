
<%@page import="jdbc.GymDTO"%>
<%@page import="jdbc.GymDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<!-- <link href="/css/default.css" rel="stylesheet" type="text/css"> -->
</head>
<body>
<%-- <header id="header">
<%@ include file="/html/pieceHeader.html" %>

</header> --%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">


   <%!// 선언문
   String title = "구인 목록";%>


   <div class="alert alert-secondary" role="alert">
      <div class="container">
         <h1 class="display-3">
            <%=title%>
         </h1>
      </div>
   </div>

   <div class="container">
      <div class="row" align="center">
      
      <%
         ArrayList<GymDTO> gyms = (new GymDAO()).getList();
         
         for (GymDTO gym : gyms) {
      %>
      

         <div class="col-md-4">
        	 <p>번호 : <%=gym.getGym_no()%></p>
        	 <p><a href="gymdetail.jsp?user_no=<%=gym.getUser_no() %>"><%=gym.getGym_name() %></a>
        	 <p>이름 : <%=gym.getGym_name()%></p>
        	 <p>소개 : <%=gym.getGym_content()%></p>
        	 <p>주소 : <%=gym.getGym_addr()%></p>
        	 <p>급여 : <%=gym.getGym_salary()%></p>
        	 
  	</div>

      <% } %>
        	 <a href="../user/useradd55.jsp" class="btn btn-secondary">업체등록</a>

      </div>
      <hr>
   </div>




   <!-- JavaScript Bundle with Popper -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
</body>
</html>