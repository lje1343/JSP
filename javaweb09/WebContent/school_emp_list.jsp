<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 목록 출력</title>
</head>
<body>

<%

request.setCharacterEncoding("UTF-8");
//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
//DB연결
	String url = "jdbc:mysql://localhost:3306/school";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;	// 디비 연결 객체
	PreparedStatement pstmt = null;	// 디비에 전달할 SQL 구문 객체
	ResultSet rset = null;	// 디비에서 꺼내올 데이터들을 담을 객체
	
	conn = DriverManager.getConnection(url, id, pw);
	
//테이블 데이터 넣는 SQL


	String sql = "SELECT * FROM emp";
	
	pstmt = conn.prepareStatement(sql);	// 구문을 객체에 넣어준다.
	rset = pstmt.executeQuery();	// 전달
	
%>

<form>
<table>
<caption>emp 목록</caption>
<tr>
<th>사번</th>
<th>이름</th>
<th>부서</th>
</tr>
<%
	while(rset.next()) {	// next() 데이터가 존재하는동안 계속 반복 
		String prono = rset.getString("prono");
		String name = rset.getString("name");
		String dept = rset.getString("dept");
%>
<tr>
	<td><%=prono %></td>
	<td><%=name %></td>
	<td><%=dept %></td>
</tr>
<%
	}
%>

</table>
</form>

<%
//DB 연결 종료
	if(pstmt != null) pstmt.close();
	if (conn != null) conn.close(); 	// 안닫아도 괜찮지만 닫아주자
	
	out.print("emp 데이터 삽입 성공 by. 29 이지은");

%>
</body>
</html>