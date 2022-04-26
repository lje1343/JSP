<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>EmailCheckForm.jsp</title> 
</head> 

<body> 
<div style="text-align: center"> 
<h3>* 이메일 중복확인 *</h3> 
<form method="post" action="emailCheckPro.jsp" onsubmit="return blankCheck(this)"> 
이메일 : <input type="text" name="user_email" autofocus> 
<input type="submit" value="중복확인"> 
</form> 
</div> 

<script> 
	function blankCheck(f){ 
		var id=f.id.value; id=id.trim(); 
		
		if(id.length<5){ 
			alert("아이디는 5자 이상 입력해주십시오."); 
			return false; 
		}
		
		return true; 
	}
	
	// 정규식 해결?
	
</script> 

</body> 
</html>
