<%@page import="mail.MyIdPass"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table {
    margin: auto;
}
tr{
    text-align:center;
    background-color: #fffbaf;
}
input{
width:100%
}
input:last-child{
style :clear;
}
</style>
</head>
 
<body>
    <form action = "mailSend.jsp" method ="post">
        <table border="1">
            <tr>
                <td colspan="2">�ڹٸ��� ������</td>
            </tr>
            <tr>
                <td>������ ��� ����</td>
                <td><input type="text" name="sender"
                value = "<%=MyIdPass.gmailid %>@gmail.com">
                </td>
            </tr>
            <tr>
                <td>�޴� ��� ����</td>
                <td><input type="text" name="receiver"></td>
            </tr>
            <tr>
                <td>����</td>
                <td><input type="text" name="subject" /></td>
            </tr>
            <tr>
                <td>����</td>
                <td><textarea name="content" rows="5" cols = "40"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="����"></td>
            </tr>
 
        </table>
    </form>
 
</body>
</html>
