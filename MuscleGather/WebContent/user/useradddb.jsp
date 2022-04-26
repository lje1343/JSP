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

 
 System.out.println("==============");
 System.out.println(user_name);
 System.out.println(user_pw);
 System.out.println(user_birth);
 System.out.println(user_zipcode);
 System.out.println(user_addr);
 System.out.println(user_addrdetail);
 System.out.println(user_gender);
 System.out.println(user_email);
 System.out.println(user_phone);

 
 UserDAO dao = new UserDAO();
 int result = dao.insert(user_name, user_pw, user_birth, user_zipcode, user_addr, user_addrdetail, 
		 user_gender, user_email, user_phone);
 
 if(result == 1) {
	out.print("<script>alert('회원가입이 완료되셨습니다.')</script>");
	 response.sendRedirect("/gym/gymlist.jsp");	// 임시로 지정해놓음
 }else{
	out.print("<script>alert('다시 시도해주세요.')</script>");
	 response.sendRedirect("/user/useradd.jsp");
 }
 %>
 