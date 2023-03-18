<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/assets/css/Info.css" />
<style type="text/css">
element.style {
    height: auto !important;
}
.contain {
    width: 1080px;
    margin: 0 auto;
    font-size: 20px;
}
.rec_view_top{
	border-top: 1px solid #ececec;
	padding-top: 60px;
	border-bottom: 1px solid #ececec;
	padding-bottom: 60px;
	height: 650px;
}
.rec_view_top .rec_view_img{
    padding-bottom: 60px;
    width: 490px;
}
.rec_view_top .rec_view_img > img {
    width: 100%;
}
.fl{
	float: left;
}
.fr{
	float: right;
}
.rec_view_top .rec_view_info{
	width: 555px;
}
.rec_view_info .rec_exp{
	padding: 35px 0;
	border-bottom:  1px solid #f6f6f6;
}
.rec_exp .prod_title{
    font-size: 30px;
    color: #383838;
    font-weight: 500;
    margin-top: -8px;
}
.rec_exp .s_title {
    font-size: 16px;
    color: #888;
    margin-top: 9px;
}
.rec_exp .text_box {
    font-size: 16px;
    color: #888;
    line-height: 20px;
    margin-top: 50px;
}
.rec_info .rec_mate {
    padding-top: 37px;
}
.rec_view_top .rec_view_img .like_btn {
    margin-top: 20px;
}
.rec_content {
    padding-top: 70px;
    padding-bottom: 60px;
    border-bottom: 1px solid #ececec;
}
.xans-board-commentwrite {
    margin: 30px 0 0;
    padding: 5px 20px 20px;
    border: 1px solid #e9e9e9;
    background-color: #fbfafa;
    color: #353535;
}
</style>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp" %>
<%@ include file="../star.jsp" %>
<script type="text/javascript">
function login(t){
	
 	if('${UserEmail }'==""){
		alert("로그인 후 이용가능합니다.")
		location.href="login.do"
	}

	else{
		if(t=="c"){
			location.href="cartAddSelect.do?product_idx=${productInfo.product_idx}&mem_id=${UserEmail }"
		}
		else{
			location.href="puchaseExpectInfo.do?product_idx=${productInfo.product_idx}&mem_id=${UserEmail }"
		}
	}
}
</script>
<div class="container">
<br>
	<div class="contain" style="height: auto !important;">
	<h2>상품 정보</h2>
		<div class="rec_view_top">
			<div class="fl rec_view_img"> <!-- 사진위치 -->
				<img src="static/uploads/product/${productInfo.product_img}">
			</div>
			<div class="fr rec_view_info">
				<div class="rec_exp">
					<h2 class="prod_title">${productInfo.product_name}</h2>
					<p class="s_title"><h4>상품 상세정보</h4> ${productInfo.product_description }</p>
					<div class="text_box" style="font-size: 30px;">
						<strong>판매가</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<fmt:formatNumber value="${productInfo.product_price }" pattern="###,###,###"/>원
					</div>
				</div>
				<div class="rec_mate">
					<div class="star-ratings">
						<input type="hidden" name="ratevalue1" value="${avg_grade }" step="0.1" min="0" max="5" />
						<div class="rating-wrap">
				          	<div class="rating">
				          		<b style="font-size: 23px;">평점</b>&nbsp&nbsp&nbsp&nbsp&nbsp
				            	<div class="overlay"></div>
				          	</div>
	      		 		</div>
					</div>
				</div>
				<div class="like_btn">
					<button type="button" class="custom-btn btn-1" style="width: 150px; background-color: #F9BF52; border-color: #F9BF52;" onclick="login('p');">구매하기(결제)</button>
					<button type="button" class="custom-btn btn-1" style="width: 120px; background-color: #F9BF52; border-color: #F9BF52;" onclick="location.href='product'">목록으로</button>
					<!-- 장바구니로 접근하는 버튼 -->
					<button type="button" class="custom-btn btn-1" style="width: 120px; background-color: #F9BF52; border-color: #F9BF52;" onclick="login('c');">장바구니</button>
				</div>
			</div>	
		</div>	
	
		<div class="rec_content">
			<c:if test="${not empty avg_grade }">
			<h3>후기</h3>
				<table style="width:100%; border-top: 1px solid #F9BF52; border-bottom: 1px solid #F9BF52;">
					<tr style="background-color:#F9BF52; color: white;">
						<th width="20%"><strong>작성자</strong></th>
						<th width="50%"><strong>내용</strong></th>
						<th width="15%"><strong>평점</strong></th>
						<th width="15%"><strong>작성일</strong></th>
					</tr>
					<tr id="show_data"></tr>
					<c:forEach items="${reviewInfo }" var="row" varStatus="loop">
					<tr>
						<td width="20%" style="text-align: center;">${row.mem_id}</td>
						<td width="50%" style="text-align: center;">${row.review_comment}</td>
						<td width="15%" style="text-align: center;"><div class="star-ratings">
					       	<input type="hidden" name="ratevalue" value="${row.review_grade}" step="0.1" min="0" max="5" />
					       	<div class="rating-wrap" style="height: 100px;">
					          	<div class="rating">
					            	<div class="overlay"></div>
					          	</div>
					       	</div>
			   			</div></td>
						<%-- <td>${row.review_grade}</td> --%>
						<td width="15%" style="text-align: center;">${row.review_regidate}</td>
					</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
		<div class="rec_content">
			<c:if test="${not empty UserName }">
				<h3>후기작성</h3>
				<form method="post" action="productReview">
					<input type="hidden" name="review_subject" value="${productInfo.product_idx }" />
					<div class="xans-board-commentwrite">
					<fieldset>
						<p>
							<span>
								<input type="text" name="mem_id" value="${UserEmail}" style="border: none; background: transparent;" readonly/>
							</span>
								작성일
								<input type="text" value="${nowdate}" style="border: none; background: transparent;" readonly/>
						</p>
						<p class="grade">
							<div class="mb-3" name="star_rate" id="star_rates"  style="width: 400px; height: 35px;"> 
								<fieldset>
							      	<input type="radio" value="5.0" id="star_rate5" name="review_grade">
							         	<label for="star_rate5">★</label> 
							      	<input type="radio" value="4.0" id="star_rate4" name="review_grade">
							         	<label for="star_rate4">★</label>
							      	<input type="radio" value="3.0" id="star_rate3" name="review_grade">
							         	<label for="star_rate3">★</label> 
							      	<input type="radio" value="2.0" id="star_rate2" name="review_grade">
							         	<label for="star_rate2">★</label> 
							      	<input type="radio" value="1.0" id="star_rate1" name="review_grade">
							         	<label for="star_rate1">★</label>
							   	</fieldset>
							</div>
						</p>
							<textarea name="review_comment" cols="80" rows="3" placeholder="내용을 입력하세요." required></textarea><br>
							<button type="submit" class="custom-btn btn-1" style="width: 120px; background-color: #F9BF52; border-color: #F9BF52;">후기등록</button>
							<button type="reset" class="custom-btn btn-1" style="width: 120px; background-color: #F9BF52; border-color: #F9BF52;">지우기</button>
					</fieldset>
					</div>
				</form>
			</c:if>
		</div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>