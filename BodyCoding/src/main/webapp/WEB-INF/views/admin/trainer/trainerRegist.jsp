<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>트레이너 등록</h1>
    <form method="post" action="/trainerRegist.do">
    	<input type="hidden" id="mem_status" name="mem_status" value="1">
    	<input type="hidden" id="mem_type" name="mem_type" value="TRAINER">
    	
    	<br>
        <label for="mem_id">아이디(이메일):</label>
        <input type="email" id="mem_id" name="mem_id" required><br>
        
        <label for="mem_pass">비밀번호:</label>
        <input type="password" id="mem_pass" name="mem_pass" required><br>

        <label for="mem_name">이름:</label>
		<input type="text" id="mem_name" name="mem_name" required><br>

        <label for="mem_gender">성별:</label>
        <input type="radio" id="mem_gender" name="mem_gender" value="M" required>남자
        <input type="radio" id="mem_gender" name="mem_gender" value="F" required>여자<br>

        <label for="mem_birth">생년월일:</label>
        <input type="date" id="mem_birth" name="mem_birth"><br>

        <label for="mem_phone">전화번호:</label>
        <input type="tel" id="mem_phone" name="mem_phone" required><br>

        <label for="mem_address">주소:</label>
        <input type="text" id="mem_address" name="mem_address" required><br>

        <label for="gym_code">지점선택:</label>
        <input type="text" id="gym_code" name="gym_code" required><br>
        
        <label for="mem_career">경력:</label>
        <input type="text" id="mem_career" name="mem_career"><br>
        
        <label for="mem_comment">자기소개:</label>
        <input type="text" id="mem_comment" name="mem_comment"><br>
        
        <label for="mem_career">프로필 사진:</label>
        <input type="text" id="mem_img" name="mem_img"><br>
	        
        
        <button type="submit">가입하기</button>        
        <button type="reset">reset</button>        
        <button type="button" onclick="location.href='/trainerList.do'">트레이너 리스트 목록</button>        
	</form>
</body>
</html>