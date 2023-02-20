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
	<h2>지점리스트</h2>
	<div>
		<form method="get">
			<select name="searchField">
				<option value="GYM_CODE">지점코드</option>
				<option value="GYM_SCALE">평수</option>
			</select>
			<input type="text" name="searchTxt" />
			<input type="submit" value="검색" />
		</form>
	</div>
	<table border="1">
		<tr>
			<th>지점코드</th>
			<th>평수</th>
			<th></th>
		</tr>
		<!-- 컨트롤러에서 Model에 저장한 List의 갯수만큼 반복하여
		회원목록을 출력한다. varStatus는 실제 반복에 관련된 여러가지
		정보를 반환하므로 가상번호등을 출력할때 사용할 수 있다. -->
		<c:forEach items="${gymList }" var="row" varStatus="loop">
		<tr>
			<td>${row.GYM_CODE }</td>
			<td>${row.GYM_SCALE }</td>
			<td>
				<a href="edit.do?GYM_CODE=${row.GYM_CODE }">수정</a>
				<a href="delete.do?GYM_CODE=${row.GYM_CODE }">삭제</a>
			</td>
		</tr>
		</c:forEach>
	</table>
	<a href="regist.do">지점등록</a>
</body>
</html>