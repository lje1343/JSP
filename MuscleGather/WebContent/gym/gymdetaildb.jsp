<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 request.setCharacterEncoding("UTF-8");
 
 String user_from_no = request.getParameter("trainer_no");
 String user_to_no = request.getParameter("gym_no");
 
 
 JoinDAO dao = new JoinDAO();
 boolean result = dao.resumeinsert(user_from_no, user_to_no);
 
 if(result) {
	 response.sendRedirect("/gym/gymlist.jsp");
 }
 %>
 
 