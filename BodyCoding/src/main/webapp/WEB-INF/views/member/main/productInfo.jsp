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
}
.rec_view_top{
	border-top: 1px solid #ececec;
	padding-top: 60px;
	border-bottom: 1px solid #ececec;
	padding-bottom: 60px;
	height: 620px;
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
	<h2>상품 정보</h2>
	<%-- <div class="contain" style="height: auto !important;">
		<div class="rec_view_top">
			<div class="fl rec_view_img"> <!-- 사진위치 -->
				<img src="static/uploads/product/${productInfo.product_img}">
			</div>
		</div>	
		<div class="fr rec_view_info">
			<div class="rec_exp">
				<h2 class="prod_title">${productInfo.product_name}</h2>
				<p class="s_title"><h4>상품 상세정보</h4> ${productInfo.product_description }</p>
			</div>
		</div>	
	</div> --%>
	<img src="static/uploads/product/${productInfo.product_img}" style="width: 250px; height: 300px; float: left;">
	<div class="Info">
		<table class="basic">
			<tr>
				<td ><strong>상품명: </strong>${productInfo.product_name}</td>
			</tr>
			<tr>
				<td><strong>상품 상세 정보: </strong>${productInfo.product_description }</td>
			</tr>
			<tr>
				<td><strong>상품 가격: </strong>
				<fmt:formatNumber value="${productInfo.product_price }" pattern="###,###,###" /></td>
			</tr>
		</table>
	</div>
	
	<c:if test="${not empty avg_grade }">
	<%-- <h5>평점 &nbsp : &nbsp ${avg_grade }/10</h5> --%>
	<div class="star-ratings">
       	<input type="hidden" name="ratevalue1" value="${avg_grade }" step="0.1" min="0" max="5" />
       	<div class="rating-wrap">
          	<div class="rating">
            	<h3>평점 &nbsp&nbsp <div class="overlay"></div></h3>
          	</div>
       	</div>
   	</div>
	<h3>후기</h3>
	<table style="width: 92%; border: 3px solid gray; margin: 0;">
		<tr style="border: 2px solid gray;">
			<th width="20%"><strong>작성자</strong></th>
			<th width="50%"><strong>내용</strong></th>
			<th width="15%"><strong>평점</strong></th>
			<th width="15%"><strong>작성일</strong></th>
		</tr>
	</table>
	<div style="max-height:350px; width: 92%; overflow: auto; border: 3px solid gray; border-top: none;">
		<table style="width:100%;">
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
	</div>
	</c:if>
	
	<br>
	<c:if test="${not empty UserName }">
	<h3>후기작성</h3>
		<form method="post" action="productReview">
			<table style="border: 1px solid black; width: 92%;">
				<input type="hidden" name="review_subject" value="${productInfo.product_idx }" />
				<tr>
					<th width="20%" style="height:60px; padding-top: 15px;"><strong>이메일(아이디)</strong></th>
					<td>
						<input type="text" name="mem_id" value="${UserEmail}" style="border: none; background: transparent;" readonly/>
					</td>
					<th><strong>작성일</strong></th>
					<td>
						<input type="text" value="${nowdate}" style="border: none; background: transparent;" readonly/>
					</td>
				</tr>
				<tr>
					<th><strong>평점</strong></th>
					<td colspan="3" style="height: 55px;">
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
						<!-- <input type="number" name="review_grade" placeholder="1~10으로 입력하시오." required /> -->
					</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;"><strong>후기 내용</strong></th>
					<td colspan="3" style="text-align: left;">
						<textarea name="review_comment" cols="100" rows="5" placeholder="내용을 입력하세요." required></textarea><br>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center; padding-bottom: 10px;">
						<input type="submit" value="후기등록">
						<input type="reset" value="지우기">
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	<button type="button" onclick="login('p');">구매하기(결제)</button>
	<button type="button" onclick="location.href='product'">목록으로</button>
	<!-- 장바구니로 접근하는 버튼 -->
	<button type="button" onclick="login('c');">장바구니</button>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>