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
			<th>상품유형</th>
			<th>상품분류</th>
			<th>상품명</th>
			<th>가격</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${pList}" var="pItem" varStatus="loop">
		<tr>
			<td>${pItem.product_type}</td>
			<td>${pItem.product_category}</td>
			<td>${pItem.product_name}</td>
			<td>${pItem.product_price}</td>
			<td>${pItem.product_regidate}</td>
			<td>
				<a href="productEdit.do?product_idx=${pItem.product_idx}">수정</a>
				<a href="productDelete.do?product_idx=${pItem.product_idx}">삭제</a>
			</td>
		</tr>
		</c:forEach>
	</table>
<a href="productRegist.do">상품등록</a>


</body>
</html>