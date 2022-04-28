<%@page import="smtp.NaverSMTP"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>.</title> 
</head> 

<body> 
    
<%
request.setCharacterEncoding("utf-8");       //한글처리

Random rnd = new Random();

int authnum = rnd.nextInt(99999) + 10000;


//넘겨받은 변수 처리

Map<String, String> emailInfo = new HashMap<String, String>();
emailInfo.put("from", "udh1343@naver.com"); //보내는 사람
emailInfo.put("to", request.getParameter("to")); //받는 사람
emailInfo.put("subject", "'근육 모아' 인증번호입니다."); //제목

//내용은 html text 형태에 따라 다르게 설정
String content = "인증번호는 " + authnum + "입니다."; //이메일 인증번호
String format = "text";   //이메일의 형태

if (format.equals("text")) {
	emailInfo.put("content", content);
	emailInfo.put("format", "text/plain;charset=UTF-8");
} else if (format.equals("html")) {
	content = content.replace("\r\n", "<br/>");  //줄바꿈 처리
	String htmlContent = "";
	try {
		String templatePath = application.getRealPath("useremailform.jsp");
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		
		String oneLine;
		while (( oneLine = br.readLine()) != null) {
			htmlContent += oneLine + "\n";
		}
		br.close();
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	// 템플릿의 내용 교체
	htmlContent = htmlContent.replace("__CONTENT__", content);
	emailInfo.put("content", htmlContent);
	emailInfo.put("format","text/html;charset=UTF-8");
}

try {
	NaverSMTP smtpServer = new NaverSMTP();
	smtpServer.emailSending(emailInfo);
	out.print("전송 성공");
} catch (Exception e) {
	out.print("전송 실패");
	e.printStackTrace();
}


%>
인증번호 
<input type="text" name="user_email" id="user_email">
<input type="button" onclick="authCheck()">

</body>
</html>