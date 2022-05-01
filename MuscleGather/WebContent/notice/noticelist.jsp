<%@page import="jdbc.BoardsDAO"%>
<%@page import="jdbc.BoardsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지 사항</title>
<link type="text/css" rel="stylesheet" href="../css/default.css" />
<link type="text/css" rel="stylesheet" href="../css/noticeList.css" />


<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/default.js"></script>

<style>

/* 페이징 스타일 */
.paging{
	text-align:center;
}

body a{
	color: #f3a950;
}

.ct{
	height: 80px;
	text-align: start;
	margin-top:80px;
}

</style>

</head>



<body>

	<%
		// 선언문
	String title = "공지 사항";
	%>
	
    <div class="wrap">
        <!-- header-->
        <header id="header">
	
        </header>

        <!-- hidden nav-->
        <nav id="nav"></nav>


<% 

//필요 변수들 선언
int LINE_PER_PAGE = 5;    			 //페이지당 출력 줄수
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
   
%>	
	
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
                    <div class="mainboard bd3">

                        <div class="board titel">
                            <div>번호</div>
                            <div>제목</div>
                            <div>조회수</div>
                            <div>날짜</div>
                        </div>

                        <% for(BoardsDTO notice : notices) { %>
                        <div class="board text" onclick="location.href='noticeInfo.jsp?no=<%=notice.getBoards_no() %>'">
                            <div><%=notice.getBoards_no() %></div>
                            <div><%=notice.getBoards_title() %></div>
                            <div><%=notice.getView_cnt() %></div>
                            <div><%=notice.getBoards_regdate() %></div>
                        </div>                            
						<%}%>
                        
                    </div>
                    
<div class="paging">
                    
<%
   

 	// 페이징
	
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
   
</div>
   </div></div>
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