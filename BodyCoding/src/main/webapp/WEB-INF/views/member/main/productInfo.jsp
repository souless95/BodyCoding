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
<%@ include file="../../../../inc/Top.jsp" %>
<script type="text/javascript">
function login(){
	alert("로그인 후 이용가능합니다.")
	location.href="login.do"
}
</script>
<div class="container">
	<h2>상품 정보</h2>
	<table id="datatablesSimple" >
		<tr>
			<td rowspan="3"><img src="static/uploads/product/${productInfo.product_img}" style="width:100%;height:180px;"></td>
			<td>상품명: ${productInfo.product_name}</td>
		</tr>
		<tr>
			<td>상품 상세 정보: ${productInfo.product_description }</td>
		</tr>
		<tr>
			<td>상품 가격: ${productInfo.product_price }</td>
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
		<form method="post" action="productReview">
			<table>
				<input type="hidden" name="review_subject" value="${productInfo.product_idx }" />
				<tr>
					<td>이메일(아이디)</td>
					<td><input type="text" name="mem_id" value="${UserEmail}" readonly/></td>
					<td>작성일</td>
					<td><input type="text" value="${nowdate}" readonly/></td>
				</tr>
				<tr>
					<td>평점(1~10으로 입력하시오.)</td>
					<td colspan="3"><input type="number" name="revuew_grade" required /></td>
				</tr>
				<tr>
					<td>후기 내용</td>
					<td colspan="3"><textarea name="review_comment" cols="50" rows="5" required></textarea></td>
				</tr>
			</table>
			<input type="submit" value="후기등록" />
		</form>
	</c:if>
	<button type="button" onclick="login();">구매하기(결제)</button>
	<button type="button" onclick="location.href='product'">목록으로</button>
	<!-- 장바구니로 접근하는 버튼 -->
	<button type="button" onclick="location.href='cartAddSelect.do?product_idx=${productInfo.product_idx}&mem_id=${UserEmail }'">장바구니</button>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>