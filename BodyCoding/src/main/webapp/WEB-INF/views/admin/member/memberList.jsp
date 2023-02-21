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
	<h2>회원리스트</h2>
	<table border="1">
		<tr>
			<th>센터</th>
			<th>이메일(아이디)</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>전화번호</th>
			<th>가입일자</th>
			<th></th>
		</tr>

		<c:forEach items="${memberList }" var="row" varStatus="loop">
		<tr>
			<td>${row.gym_code }</td>
			<td>${row.mem_id }</td>
			<td>${row.mem_name }</td>
			<td>${row.mem_gender }</td>
			<td>${row.mem_birth }</td>
			<td>${row.mem_phone }</td>
			<td>${row.mem_regidate }</td>
			<td>
				<a href="detail.do?mem_id=${row.mem_id }">상세보기</a>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<button type="button" onclick="location.href='main/admin'">홈으로</button> 
	
</body>
</html>