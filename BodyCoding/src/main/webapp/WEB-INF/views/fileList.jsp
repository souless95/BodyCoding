<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일목록 보기</h2>
	<table border="1">
		<tr>
			<th>이미지</th>
			<th>파일명</th>
			<th>파일크기</th>
			<th></th>
		</tr>
	<c:forEach items="${fileMap }" var="file" varStatus="vs">
		<tr>
			<td><img src="uploads/${file.key }" width="200" 
					height="150" /></td>
			<td>${file.key }</td>
			<td>${file.value }Kb</td>
		</tr>
	</c:forEach>
	</table> 	
</body>
</html>

