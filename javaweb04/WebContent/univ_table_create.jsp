<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
// DB연결
	String url = "jdbc:mysql://localhost:3306/univ";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;	// 디비 연결 객체
	PreparedStatement pstmt = null;	// 디비에 전달할 SQL 구문 객체
	
	conn = DriverManager.getConnection(url, id, pw);
	
// 테이블 만들기 SQL

	String sql = "CREATE TABLE student("
			+ "hakbun int not null,"
			+ "name varchar(10),"
			+ "dept varchar(20),"
			+ "primary key(hakbun))";
	
	pstmt = conn.prepareStatement(sql);	// 구문을 객체에 넣어준다.
	pstmt.executeUpdate();	// 전달
	
// DB 연결 종료
	if(pstmt != null) pstmt.close();
	if (conn != null) conn.close(); 	// 안닫아도 괜찮지만 닫아주자
	
	out.print("DB 연결 문제 없음 by. 29 이지은");

%>
