<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 request.setCharacterEncoding("UTF-8");
 
 String user_name = request.getParameter("user_name");
 String user_pw = request.getParameter("user_pw");
 String user_birth = request.getParameter("user_birth");
 String user_zipcode = request.getParameter("user_zipcode");
 String user_addr = request.getParameter("user_addr");
 String user_addrdetail = request.getParameter("user_addrdetail");
 String user_gender = request.getParameter("user_gender");
 String user_email= request.getParameter("user_email");
 String user_phone= request.getParameter("user_phone");

 
 //헬스 트레이너 구분용
 String gym_name = request.getParameter("gym_name");
 
 UserDAO user = new UserDAO();
 int result = user.insert(user_name, user_pw, user_birth, user_zipcode, user_addr, user_addrdetail, 
		 user_gender, user_email, user_phone);
 
 String user_no = user.getUserNo(user_email);

 if(gym_name == null){
	 String trainer_title = request.getParameter("trainer_title");
	 String trainer_content = request.getParameter("trainer_content");
	 String trainer_addr = request.getParameter("trainer_addr");
	 String trainer_images = request.getParameter("trainer_images");
%>
	 <%@ include file="../trainer/trainerwritedb.jsp" %>
<%

	result = 2;

 } else {
	 gym_name = request.getParameter("gym_name");
	 String gym_content = request.getParameter("gym_content");
	 String gym_addr = request.getParameter("gym_addr");
	 String gym_salary = request.getParameter("gym_salary");	 
	 String gym_images = request.getParameter("gym_images");
%>
	 <%@ include file="../gym/gymwritedb.jsp" %>
<%

	result = 3; 

 }

 
 
 if(result == 1) {
	out.print("<script>alert('회원가입이 완료되셨습니다.')</script>");
	 out.print("<script>document.location.href='../gym/gymlist.jsp'</script>"); // 임시
 }else if(result == 2) {
	out.print("<script>alert('트레이너 회원가입이 완료되셨습니다.')</script>");
	 out.print("<script>document.location.href='../gym/gymlist.jsp'</script>"); // 임시 
 }else if(result == 3) {
	out.print("<script>alert('업체 회원가입이 완료되셨습니다.')</script>");
	 out.print("<script>document.location.href='../gym/gymlist.jsp'</script>"); // 임시 	 
 }else{
	out.print("<script>alert('다시 시도해주세요.')</script>");
	 response.sendRedirect("/user/useradd66.jsp");
 }
 %>
 