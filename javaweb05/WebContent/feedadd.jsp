<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");	// 한글로 변환

//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
//DB연결
	String url = "jdbc:mysql://localhost:3306/visit";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;	// 디비 연결 객체
	PreparedStatement pstmt = null;	// 디비에 전달할 SQL 구문 객체
	
	conn = DriverManager.getConnection(url, id, pw);
	
//테이블 데이터 넣는 SQL

	String name = request.getParameter("name");
	String content = request.getParameter("content");

	String sql = "INSERT INTO feed VALUES(?,?,now())";
	
	pstmt = conn.prepareStatement(sql);	// 구문을 객체에 넣어준다.
		pstmt.setString(1, name);
		pstmt.setString(2, content);
		
	pstmt.executeUpdate();	// 전달
	
//DB 연결 종료
	if(pstmt != null) pstmt.close();
	if (conn != null) conn.close(); 	// 안닫아도 괜찮지만 닫아주자
	
	//out.print("DB 데이터 삽입 성공 by. 29 이지은");
	
	response.sendRedirect("main.jsp");	// 입력한곳으로 다시 보낸다.

%>