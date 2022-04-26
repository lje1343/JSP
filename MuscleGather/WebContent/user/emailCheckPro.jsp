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

/* <script> 
	var chk = emailValCheck(user_email);
	trace(chk);
</script>  */


	int cnt = new UserDAO().duplecateID(user_email); 
	out.println("입력 EMAIL : <strong>" + user_email + "</strong>");
	
	if(cnt==0){
		out.println("<p>사용 가능한 이메일입니다.</p>");
%> 


<script> 
	
		// email 유효성 검사 (1)
		function emailValCheck(user_email){

			// 이메일 정규식 패턴
			var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var email = user_email;
			if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
				return false;
			}
		    return true;
		}
		
		// email 유효성 검사 (2)
		function check(pattern, taget, message) {

			if(pattern.test(taget)) {
		    	return true;
		    }
		    alert(message);
		    return false;
		}
		
</script> 

<% }else{ 
	out.println("<p style='color: red'>해당 이메일은 사용하실 수 없습니다.</p>"); 
	}
%> 
<hr> 
<a href="javascript:window.close()">[창닫기]</a> </body> </html>
