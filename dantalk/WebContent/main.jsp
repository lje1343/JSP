<%@ page import="jdbc.*" %>
<%@ page import="jdbc.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단톡방</title>
<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
    
<style>
body{
border : solid yellow 10px;
margin : 100px;
padding: 100px;
}

td{
color: blue;
font-weight: bold;
}

.form-signin{
width:1000px;
margin:auto;
font-size:20px;
font-weight: bold;
}

</style>
</head>
<body>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<main class="form-signin">
<form action = "feedAddTest.jsp" method = "post" enctype="multipart/form-data">
    <h1 class="h3 mb-3 fw-normal" style="text-align:center; font-size:30px">단톡 입력
    <svg xmlns="http://www.w3.org/2000/svg" width="55" height="30" fill="currentColor" style="margin-bottom:10px" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
</svg>
    </h1>

    <div class="form-floating">
      <input type="text" name="uid" class="form-control" id="floatingInput" placeholder="글작성자 아이디" required>
      <label for="floatingInput">회원 아이디</label>
    </div><br>
    <div class="form-floating">
      <input type="text" name="ucon" class="form-control" id="floatingPassword" style="height:200px;">
      <label for="floatingPassword">글작성</label>
    </div><br>
    <div class="form-floating">
      <input type="file" name="uimage" class="form-control" id="floatingPassword" style="height:80px;">
    </div><br>

    <button class="w-100 btn btn-lg btn-primary" type="submit">등록</button>
    
</main>
</form>



<!-- <table align=center>
<tr><td colspan=2 align=center height=40><b>톡작성</b></td></tr>
<tr><td align=right>아이디</td>
<td><input type="text" name="uid" placeholder="글작성자 아이디" required></td></tr>
<tr><td align=right>글작성</td>
<td><textarea name = "ucon" rows=3 cols=20></textarea></td></tr>
<tr><td align=right>이미지</td>
<td><input type="file" name="uimage"></td></tr>
<tr><td colspan=2 align=center height=40><input type="submit" value="등록"></td></tr>
</table>
</form> -->
<br>
<table align=center>
<tr><td colspan=2 style="text-align:center">톡방 내용</td></tr>
<%
ArrayList<FeedDTO> feeds = (new FeedDAO()).getList();	// 객체들을 list 형식으로 받아서 뿌려준다.
for(FeedDTO feed : feeds) {
	String img = feed.getImages();
	String imgstr="";
	if(img != null) {
		imgstr = "<img src='images/" + img + "' width = 240>";
	}
	
//한 덩어리에서 분해해서 뿌려줘야 하므로 잘라준다.
%> 
<tr><td colspan=2><hr></td></tr>
<tr><td><%=feed.getId() %></td><td><%=feed.getTs() %></td></tr>
<tr><td colspan=2><%=imgstr %></td></tr>
<tr><td colspan=2><%=feed.getContent() %></td></tr>
<%
}
%>
</table>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>