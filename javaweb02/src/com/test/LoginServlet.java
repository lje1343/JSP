package com.test;	// 패키지 선언

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 클래스 구현에 필요한 다른 클래스들 임포트

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")	// url 에 들어갈 이름으로, 웹서블렛 에너테이션(주석)으로 설정
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {	// 생성자
        super();			// 부모의 생성자 호출
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String uid = request.getParameter("id");
		String upw = request.getParameter("ps");
		
		String res = "<html>"
				+ "<h3>User ID : " + uid + "</h3>"
				+ "<h3>User PW : " + upw + "</h3>"
				+ "</html>";
		
		response.getWriter().print(res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
