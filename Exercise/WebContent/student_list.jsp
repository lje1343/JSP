<%@page import="java.sql.*"%>
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
   request.setCharacterEncoding("UTF-8");

// JDBC 드라이버 로딩
   Class.forName("com.mysql.jdbc.Driver");
// DB연결
   String url = "jdbc:mysql://localhost:3306/exercisedb";
   String id = "root";
   String pw = "0000";
   
   Connection conn = null;  // 디비 연결 객체
   PreparedStatement pstmt = null; // 디비에 전달할 SQL 구문객체
   ResultSet rs = null;   // 디비에서 꺼내올 데이터들을 담을 객체
   
   conn = DriverManager.getConnection(url, id, pw);
   
// 테이블 데이터 넣는 SQL

   String sql = "SELECT * FROM student";
   pstmt = conn.prepareStatement(sql);

   rs = pstmt.executeQuery(); 
%> 
<table>
<caption>학생 목록</caption>
<tr>
<th>학번</th>
<th>전공</th>
<th>이름</th>
<th>주소</th>
<th>폰번</th>
</tr>
            <%
            while(rs.next()){
            	String num = rs.getString("num");
            	String dept = rs.getString("dept");
            	String name = rs.getString("name");
            	String address = rs.getString("address");
            	String phone = rs.getString("phone");
            %>

            <tr>
               <td><%=num%></td>
               <td><%=dept%></td>
               <td><%=name%></td>
               <td><%=address%></td>
               <td><%=phone%></td>
            </tr>
            <%
               }
            %>
</table>
         
</body>
</html>