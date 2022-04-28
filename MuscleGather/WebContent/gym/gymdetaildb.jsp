<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 request.setCharacterEncoding("UTF-8");
 
 String trainer_no = request.getParameter("trainer_no");
 String gym_no = request.getParameter("gym_no");
 
 
 JoinDAO dao = new JoinDAO();
 boolean result = dao.resumeinsert(trainer_no, gym_no);
 
 if(result) {
	 out.println("<script>alert('이력서 제출이 완료되었습니다.')</script>");	 
	 out.println("<script>history.back()</script>"); 
 } else {
	 out.println("<script>alert('이력서를 이미 제출하셨습니다.')</script>");
	 out.println("<script>history.back()</script>");
 }
 %>
 
 