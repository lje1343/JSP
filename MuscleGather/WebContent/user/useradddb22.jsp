<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "util.FileUtil"%>



 <%
 request.setCharacterEncoding("UTF-8");
 
/*  String flag = request.getParameter("flag"); */
/*  String flag = request.getParameter("sep_btn"); */
 
 
 String flag = null;
 String user_name = null;
 String user_pw = null;
 String user_birth = null;
 String user_zipcode = null;
 String user_addr = null;
 String user_addrdetail = null;
 String user_gender = null;
 String user_email= null;
 String user_phone= null;
 String trainer_title= null;
 String trainer_content = null;
 String trainer_addr = null;
 String trainer_images = null;
 String gym_name = null;
 String gym_content = null;
 String gym_addr = null;
 String gym_salary = null;	 
 String gym_images = null;
 
 int chk = 1;   // 사진없는경우
 byte[] user_file = null;
 byte[] trainer_file = null;
 byte[] gym_file = null;
 ArrayList<String> arr = new ArrayList<>();
 //이미지를 여러개 추가하면 이름을 여러개 저장하기 위해 ArrayList사용
 ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
 // 추출 값들을 객체 형태로 저장할 준비
 List items = sfu.parseRequest(request);
 // 입력된 값들을 추출하여 객체에 저장
 Iterator iter = items.iterator();
 // 순차적으로 접근하기 위해 객체 생성
 while(iter.hasNext()) {  // 요소가 있으면 계속 반복 없으면 종료
     FileItem item = (FileItem) iter.next();  //요소를 하나씩 추출
     String name = item.getFieldName();       //요소의 이름 추출
     
     if(item.isFormField()) { // 이름과 값으로 즉 맵 형태 쌍으로 구성이 되어 있는지 확인
         String value = item.getString("utf-8");   // 한글 처리 중요
         if (name.equals("user_name")) user_name = value;
         else if (name.equals("user_pw")) user_pw = value;
         else if (name.equals("user_birth")) user_birth = value;
         else if (name.equals("user_zipcode")) user_zipcode = value;
         else if (name.equals("user_addr")) user_addr = value;
         else if (name.equals("user_addrdetail")) user_addrdetail = value;
         else if (name.equals("user_gender")) user_gender = value;
         else if (name.equals("user_email")) user_email = value;
         else if (name.equals("user_phone")) user_phone = value;
         else if (name.equals("trainer_title")) trainer_title = value;
         else if (name.equals("trainer_content")) trainer_content = value;
         else if (name.equals("trainer_addr")) trainer_addr = value;
         else if (name.equals("gym_name")) gym_name = value;
         else if (name.equals("gym_content")) gym_content = value;
         else if (name.equals("gym_salary")) gym_salary = value;
         else if (name.equals("gym_addr")) gym_addr = value;
         else if (name.equals("sep_btn")) flag = value;
     }else {
	        
	        try{
	        
	            if (name.equals("trainer_images")) {
	               
	               trainer_images = item.getName();
	               
	               arr.add(trainer_images);
	               trainer_file = item.get();
	                //서버에 사진 저장
	               String root = application.getRealPath(java.io.File.separator);
	               FileUtil.saveImage(root, trainer_images, trainer_file);
	            }else if(name.equals("gym_images")){
					gym_images = item.getName();
	 	        	
	 	            arr.add(gym_images);
	 	        	gym_file = item.get();
	 	            //서버에 사진 저장
	 	            String root = application.getRealPath(java.io.File.separator);
	 	            FileUtil.saveImage(root, gym_images, gym_file);
	            }
	            
	        } catch (Exception e) {
	           chk= 0;
	           break;
	        }
	             
	    }
}
System.out.println(flag); 
System.out.println(gym_name); 

 
UserDAO user = new UserDAO();
int result = user.insert(user_name, user_pw, user_birth, user_zipcode, user_addr, user_addrdetail, 
	user_gender, user_email, user_phone);
 
String user_no = user.getUserNo(user_email);
//user 끝지점
 
 
if(flag.equals("1")){

	 //디비에 게시물 모든 정보 전달
	 TrainerDAO dao = new TrainerDAO();
	 int flag11 = 1;
	 if(chk == 1){ 
	    flag11 = dao.trainerInsert(user_no, trainer_title, trainer_content, trainer_addr, arr);
	 } else {
	    flag11 = dao.trainerInsert(user_no, trainer_title, trainer_content, trainer_addr);
	 }
	  
// trainer 끝점

	result = 2;

}  else if(flag.equals("0")) {
	 //디비에 게시물 모든 정보 전달
	 GymDAO dao = new GymDAO();
	 boolean b = true;

	 if(chk == 1){ 
	 	b = dao.insert(user_no, gym_name, gym_content, gym_addr, gym_salary, arr);
	 } else {
	 	b = dao.insert(user_no, gym_name, gym_content, gym_addr, gym_salary);
	 }
	 
// gym 끝

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
 