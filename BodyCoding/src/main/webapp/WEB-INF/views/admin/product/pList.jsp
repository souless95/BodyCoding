<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="get" action="search.do">
	<div>
		<input type="text" name="searchTxt" placeholder="상품명을 입력하세요."/>
	</div>
	<input type="submit" name="검색"/>
</form>

<table border="1">
		<tr>
			<th>번호</th>
			<th>상품유형</th>
			<th>상품분류</th>
			<th>상품명</th>
			<th>가격</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${}" var="row" varStatus="loop">
		<tr>
			<td>${}</td>
			<td>${}</td>
			<td>${}</td>
			<td>${}</td>
			<td>${}</td>
			<td>${}</td>
			<td>
				<a href="pEdit.do">수정</a>
				<a href="pDelete.do">삭제</a>
			</td>
		</tr>
		</c:forEach>
	</table>
<a href="pRegist.do">상품등록</a>


</body>
</html>