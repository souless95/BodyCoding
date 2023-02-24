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
    <h1>지점등록</h1>
    <form method="post" action="/gymRegist.do">
       <input type="hidden" id="mem_status" name="mem_status" value="1">
       <input type="hidden" id="mem_type" name="mem_type" value="ADMIN_SUB">
       
       <br>
        <label for="gym_code">지점코드:</label>
        <input type="text" id="gym_code" name="gym_code" required><br>
        
        <label for="mem_id">지점장 아이디(이메일):</label>
        <input type="email" id="mem_id" name="mem_id" required><br>
        
        <label for="mem_pass">비밀번호:</label>
        <input type="password" id="mem_pass" name="mem_pass" required><br>

        <label for="mem_name">지점명:</label>
      <input type="text" id="mem_name" name="mem_name" required><br>

        <label for="mem_phone">대표번호:</label>
        <input type="tel" id="mem_phone" name="mem_phone" required><br>

        <label for="mem_address">지점주소:</label>
        <input type="text" id="mem_address" name="mem_address" required><br>
        
        <label for="mem_comment">지점소개:</label>
        <input type="text" id="mem_comment" name="mem_comment"><br>
        
        <label for="mem_career">지점 대표사진:</label>
        <input type="text" id="mem_img" name="mem_img"><br>
        
        <button type="submit">가입하기</button>        
   </form>
</body>
</html>