<%@page import="jdbc.BoardsDAO"%>
<%@page import="jdbc.BoardsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
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
   String title = "공지 사항";%>


<% 

//필요 변수들 선언
int LINE_PER_PAGE = 2;    			 //페이지당 출력 줄수
int PAGE_PER_BLOCK = 4;   			 //블럭당 페이지 수

int nbr_of_row = 0;       			 //게시물의 총수/ 사람의 총수/ 테이블 하나 전체의 갯수
int nbr_of_page = 0;      			 //총 페이지 수

int start_pointer = 0;    			 // DB 검색 시작 위치
int cur_page_no = 0;      			 // 현재 페이지 번호
int block_nbr = 0;        			 // 블럭 번호
int block_start_page_no = 0; 		 // 블럭 시작 페이지 번호
int block_endpage_no = 0; 			 // 블럭 끝 페이지 번호
int previous_block_start_pageno = 0; //이전 블럭 시작 페이지 번호
int next_block_start_pageno = 0;     //다음 블럭 시작 페이지 번호

%>

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
      
      nbr_of_row = new BoardsDAO().getNoticeCount();
      
      nbr_of_page = (int)Math.ceil((float)nbr_of_row / LINE_PER_PAGE);
		
		// 검색 페이지 확인
		if  (request.getParameter("pageno") == null) {
			//맨처음 검색
			cur_page_no = 1;
		} else if (nbr_of_page < Integer.parseInt(request.getParameter("pageno"))) {
			// DB검색 시작 위치 계산
			cur_page_no = nbr_of_page;
		} else {
			//특정 페이지 검색 
			cur_page_no = Integer.parseInt(request.getParameter("pageno"));
		}
		
		
		// DB 검색 시작 위치와 갯수
		start_pointer = (cur_page_no - 1) * LINE_PER_PAGE;
		
         ArrayList<BoardsDTO> notices = (new BoardsDAO()).ngetList(start_pointer, LINE_PER_PAGE);
         
         for (BoardsDTO notice : notices) {
      %>
      
         <div class="col-md-4">
        	 <p>번호 : <%=notice.getBoards_no()%></p>
        	 <p>제목 : <a href="noticedetail.jsp?boards_no=<%=notice.getBoards_no() %>"><%=notice.getBoards_title() %></a>
        	 <p>날짜 : <%=notice.getBoards_regdate()%></p>
        	 
        	 
  	</div>

      <% } 

      %>
      </div>
      <hr>
   </div>
   <%
   
 //********************************************페이지 제어
	
	//블럭 번호
	block_nbr = ((cur_page_no - 1) / PAGE_PER_BLOCK) + 1;
	//블럭 시작 페이지 번호
	block_start_page_no = ((block_nbr - 1) * PAGE_PER_BLOCK) + 1;
	//블럭 끝 페이지 번호
	block_endpage_no = (block_start_page_no + PAGE_PER_BLOCK) - 1;

	
	if (block_nbr > 1) {
		out.print ("&nbsp[<a href='noticelist.jsp?pageno=1'>" + "맨처음</a>]&nbsp");
	
		//이전 블록 시작 페이지
		previous_block_start_pageno = block_start_page_no - PAGE_PER_BLOCK;
		out.print ("&nbsp[<a href='noticelist.jsp?pageno=" + previous_block_start_pageno + "'>이전</a>]&nbsp");
	}
	
	for (int pgn = block_start_page_no; pgn <= block_endpage_no; pgn++) {
		if (pgn > nbr_of_page) {
			break;
		}
		
		if (pgn == cur_page_no) {
			out.print("&nbsp" + pgn + "&nbsp");
		}else {
			out.print("&nbsp[" + "<a href='noticelist.jsp?" + "pageno=" + pgn + "'>" + pgn + "</a>]&nbsp");
		}
	}
	
	if (block_endpage_no < nbr_of_page) {
		// 다음 블럭 시작 페이지
		next_block_start_pageno = block_endpage_no + 1;
		
		out.print ("&nbsp[<a href='noticelist.jsp?pageno=" + next_block_start_pageno + "'>다음</a>]&nbsp");
		
		out.print ("&nbsp[<a href='noticelist.jsp?pageno=" + nbr_of_page + "'>맨끝</a>]&nbsp");
	}
	
   
   %>


	

   <!-- JavaScript Bundle with Popper -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
</body>
</html>