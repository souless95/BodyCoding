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
<h1>트레이너 정보</h1>
<table>
	<tr>
		<td rowspan="4"><img src="static/uploads/trainer/${trainerInfo.mem_img}" style="width:100%;height:180px;"></td>
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

<h5>평점 : ${avg_grade }/10</h5>
<h5>후기</h5>
<table style="border: 1px solid black;">
<tr>
	<td>작성자</td>
	<td>내용</td>
	<td>작성일</td>
</tr>
<c:forEach items="${reviewInfo }" var="row" varStatus="loop">
<tr>
	<td>${row.mem_id}</td>
	<td>${row.review_comment}</td>
	<td>${row.review_regidate}</td>
</tr>
</c:forEach>
</table>
<form>
<table>
<tr>
	<td>이메일(아이디)</td>
	<td><input type="text" name="mem_id"  readonly /></td>
	<td>작성일</td>
	<td><input type="text" name="mem_id"  readonly /></td>
</tr>
<tr>
	<td>후기 내용</td>
	<td colspan="3"><input type="text" name="mem_id"  readonly /></td>
</tr>
</table>
<input type="submit" value="후기등록">
</form>

<button type="button" onclick="location.href='membershipPurchase.do'">pt 등록하기(결제)</button>
<button type="button" onclick="location.href='trainer'">목록으로</button>

</body>
</html>