<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp" %>
<script type="text/javascript">
function login(){
	alert("로그인 후 이용가능합니다.")
	location.href="login.do"
}
</script>
<div class="container">
	<h1>트레이너 정보</h1>
	<table>
		<tr>
			<td rowspan="4"><img src="static/uploads/trainer/${trainerInfo.mem_img}" style="width:100%;height:100%;"></td>
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
			<td>평점</td>
			<td>작성일</td>
		</tr>
		<tr id="show_data"></tr>
		<c:forEach items="${reviewInfo }" var="row" varStatus="loop">
		<tr>
			<td>${row.mem_id}</td>
			<td>${row.review_comment}</td>
			<td>${row.review_grade}</td>
			<td>${row.review_regidate}</td>
		</tr>
		</c:forEach>
	</table>
	
	<c:if test="${not empty UserName }">
	<form method="post" action="trainerReview">
		<table>
		<input type="hidden" name="review_subject" value="${trainerInfo.mem_id }"/>
		<input type="hid-den" name="gym_code" value="${trainerInfo.gym_code }"/>
		<tr>
			<td>이메일(아이디)</td>
			<td><input type="text" name="mem_id" value="${UserEmail}" readonly/></td>
			<td>작성일</td>
			<td><input type="text" value="${nowdate}" readonly/></td>
		</tr>
		<tr>
			<td>평점(1~10으로 입력하시오.)</td>
			<td colspan="3"><input type="number" name="review_grade" required/></td>
		</tr>
		<tr>
			<td>후기 내용</td>
			<td colspan="3"><textarea  name="review_comment" cols="50" rows="5" required></textarea></td>
		</tr>
		</table>
	<input type="submit" value="후기등록">
	</form>
	</c:if>
	<c:if test="${not empty UserName }">
	<button type="button" onclick="location.href='membershipPurchase.do'">pt 등록하기(결제)</button>
	</c:if>
	<c:if test="${empty UserName }">
	<button type="button" onclick="login();">pt 등록하기(결제)</button>
	</c:if>
	<button type="button" onclick="location.href='trainer'">목록으로</button>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>