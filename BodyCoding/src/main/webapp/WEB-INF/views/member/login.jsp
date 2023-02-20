<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file = "./inc/Top.jsp" %>
<body>
	<form name="login" method="post" action="login">
		아이디 : <input type="text" id="user_id" name="id" required autofocus required><br>
		비밀번호 : <input type="password" id="user_pw" name="pw" required><br>
	<input type="submit" value="로그인">
</form>
</body>
</html>