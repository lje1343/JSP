<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인 목록</title>
</head>
<body>
	<%
		// 선언문
	String title = "구인 목록";
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

	<div class="container">
		<div class="row" align="center">
			<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">작성자 </th>
      <th scope="col">제목 </th>
      <th scope="col">등록시간 </th>
    </tr>
  </thead>
  <tbody>
  
		<div class = "col-ma-6">
		<a href="boardwrite.jsp" class="btn btn-info" style="float:right; margin-bottom:20px">글작성</a>
		</div>
		
		<%
					ArrayList<GymDTO> boards = (new GymDAO()).getList();
								
							for(GymDTO board : boards) {
				%>
		
	
	<tr>
      <th scope="row"><%=board.getBid() %></th>
      <td><%=board.getName() %></td>
      <td><a href="boarddetail.jsp?bid=<%=board.getBid() %>"><%=board.getBtitle() %></td>
      <td><%=board.getJoin_date() %></td>
    </tr>
		
		<% } %>
		
		</div>
		<hr>
	</div>



	<%@ include file="../_footer.jsp"%>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>