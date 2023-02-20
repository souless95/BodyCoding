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
	<h2>상품 등록</h2>
	<form action="pRegist.do" method="post">
	<table border="1">
		<tr>
			<th>상품유형</th>
			<td> 
			<select name="pType" onchange="typeChk">
				<option value="pdt">일반</option>
				<option value="mbs_p">멤버쉽(기간형)</option>
				<option value="mbs_c">멤버쉽(횟수형)</option>
			</select> 
			</td>
			<th>상품명</th>
			<td><input type="text" name="pName"></td>
			<th>상세설명</th>
			<td><input type="text" name="pDescirption"></td>
			<th>제품 이미지</th>
			<td><input type="file" name="pImg"></td>
		</tr>
	</table>
	<input type="submit" value="전송하기">
	</form>
</body>
</html>