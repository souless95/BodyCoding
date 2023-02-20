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

<form method="get">
	<div>
		<input type="text" name="searchTxt" placeholder="상품명을 입력하세요."/>
	</div>
	<input type="submit" name="검색"/>
</form>

<table border="1">
		<tr>
			<th>일련번호</th>
			<th>타입</th>
			<th>분류</th>
			<th>상품명</th>
			<th>가격</th>
			<th>등록일</th>
		</tr>
		<!-- 컨트롤러에서 Model에 저장한 List의 갯수만큼 반복하여
		회원목록을 출력한다. varStatus는 실제 반복에 관련된 여러가지
		정보를 반환하므로 가상번호등을 출력할때 사용할 수 있다. -->
		<c:forEach items="${gymList }" var="row" varStatus="loop">
		<tr>
			<td>${row.GYM_CODE }</td>
			<td>${row.GYM_SCALE }</td>
			<td>
				<a href="pEdit.do">수정</a>
				<a href="pDelete.do">삭제</a>
			</td>
		</tr>
		</c:forEach>
	</table>
<a href="regist.do">지점등록</a>


</body>
</html>