<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h2>회원 가입</h2>
	<hr>
	<form action="joinOk.jsp" method="post">
		아이디 : <input type="text" name="userId"><br><br>
		비밀번호 : <input type="password" name="userPw"><br><br>
		이메일 : <input type="email" name="userEmail"><br><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>