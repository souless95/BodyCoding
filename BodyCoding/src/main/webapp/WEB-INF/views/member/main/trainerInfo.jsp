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
<h2>트레이너 정보</h2>
<table id="datatablesSimple" >
	<tr>
		<td rowspan="4">센터사진 넣을거임!!!</td>
		<td>이름: ${trainerInfo.mem_name}</td>
	</tr>
	<tr>
		<td>지점명: ${gymInfo }</td>
	</tr>
	<tr>
		<td>경력: ${trainerInfo.mem_career }</td>
	</tr>
	<tr>
		<td>한마디: ${trainerInfo.mem_comment }</td>  
	</tr>
</table>
<button type="button">pt 등록하기(결제)</button>

</body>
</html>