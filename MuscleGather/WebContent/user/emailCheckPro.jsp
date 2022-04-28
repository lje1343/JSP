<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>idCheckProc.jsp</title> 
</head> 

<body> 
<div style="text-align: center"></div> 
<h3>* 아이디 중복 확인 결과 *</h3> 
<% 
	String user_email = request.getParameter("user_email");

	int cnt = new UserDAO().duplecateID(user_email); 
	out.println("입력 EMAIL : <strong>" + user_email + "</strong>");
	
	if(cnt==0){
		out.println("<p>사용 가능한 이메일입니다.</p>");
	}else{ 
	out.println("<p style='color: red'>해당 이메일은 사용하실 수 없습니다.</p>"); 
	}
%> 
<hr> 
<a href="javascript:window.close()">[창닫기]</a> </body> </html>
