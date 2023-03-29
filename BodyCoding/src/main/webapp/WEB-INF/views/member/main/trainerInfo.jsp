<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    height: 500px;
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
function login(){
	alert("로그인 후 이용가능합니다.")
	location.href="login.do"
}
</script>
<div class="container">
<br>
	<div class="contain" style="height: auto !important;">
	<h2>트레이너 정보</h2>
		<div class="rec_view_top">
			<div class="fl rec_view_img" > <!-- 사진위치 -->
				<img src="/static/uploads/trainer/${trainerInfo.mem_img}">
			</div>
			<div class="fr rec_view_info">
				<div class="rec_exp" style="padding: 0;">
					<h2 class="prod_title">  ${trainerInfo.mem_name}</h2>
					<p class="s_title" style="color: #383838;">
						<b>트레이너 한마디</b>&nbsp&nbsp ${trainerInfo.mem_comment }<br>
						<b>트레이너 경력</b><br> ${trainerInfo.mem_career }<br>
						<b>소속 지점명</b>&nbsp&nbsp ${gymInfo }
				</div>
				<div class="rec_mate">
					<div class="star-ratings">
				       	<input type="hidden" name="ratevalue1" value="${avg_grade }" step="0.1" min="0" max="5" />
				       	<div class="rating-wrap">
				          	<div class="rating">
				          		<b style="font-size: 28px;">평점</b>&nbsp&nbsp&nbsp&nbsp&nbsp
				            	<div class="overlay"></div>
				          	</div>
				       	</div>
				   	</div>
				</div>
				<div class="like_btn">
					<c:if test="${not empty UserName && 'ROLE_MEMBER' eq UserInfo.authority}">
						<button type="button" class="custom-btn btn-1" style="width: 180px;" onclick="location.href='membershipPurchase.do?gym_code=${trainerInfo.gym_code}'">PT 등록하기(결제)</button>
					</c:if>
					<c:if test="${empty UserName}">
						<button type="button" class="custom-btn btn-1" style="width: 180px;" onclick="login();">PT 등록하기(로그인)</button>
					</c:if>
					<button type="button" class="custom-btn btn-1" onclick="location.href='trainer'">목록으로</button>
				</div>
			</div>
		</div>
		<div class="rec_content">
			<c:if test="${empty avg_grade }">
			<h3>후기</h3>
			<table style="width:100%; border-top: 1px solid #01538D; border-bottom: 1px solid #01538D;">
				<tr style="background-color:#01538D; color: white;">
					<th width="20%"><strong>작성자</strong></th>
					<th width="48%"><strong>내용</strong></th>
					<th width="20%"><strong>평점</strong></th>
					<th width="12%"><strong>작성일</strong></th>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">아직 등록되어 있는 후기가 없습니다.</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${not empty avg_grade }">
				<!-- <h3>평점 &nbsp : &nbsp ${avg_grade }/5</h3>  -->
				<h3>후기</h3>
				<table style="width:100%; border-top: 1px solid #01538D; border-bottom: 1px solid #01538D;">
					<tr style="background-color:#01538D; color: white;">
						<th width="20%"><strong>작성자</strong></th>
						<th width="48%"><strong>내용</strong></th>
						<th width="20%"><strong>평점</strong></th>
						<th width="12%"><strong>작성일</strong></th>
					</tr>
					<tr id="show_data"></tr>
					<c:forEach items="${reviewInfo }" var="row" varStatus="loop">
					<tr>
						<td>${row.mem_id}</td>
						<td>${row.review_comment}</td>
						<td><div class="star-ratings">
					       	<input type="hidden" name="ratevalue" value="${row.review_grade}" step="0.1" min="0" max="5" />
					       	<div class="rating-wrap" style="height: 100px;">
					          	<div class="rating">
					            	<div class="overlay"></div>
					          	</div>
					       	</div>
			   			</div></td>
						<%-- <td>${row.review_grade}</td> --%>
						<td>${row.review_regidate}</td>
					</tr>
					</c:forEach>
				</table>
			</c:if>	
		</div>
		<div class="rec_content">
			<c:if test="${not empty UserName && 'ROLE_MEMBER' eq UserInfo.authority}">
				<form method="post" action="trainerReview">
					<input type="hidden" name="review_subject" value="${trainerInfo.mem_id }"/>
					<input type="hidden" name="gym_code" value="${trainerInfo.gym_code }"/>
					<div class="xans-board-commentwrite">
						<fieldset>
								<h3>후기작성</h3>
							<p>
								<span>
									이름 :
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
								<textarea name="review_comment" cols="80" rows="3" placeholder="내용을 입력하세요." required></textarea><br />
								<button type="submit" class="custom-btn btn-1">후기등록</button>
								<button type="reset" class="custom-btn btn-1">지우기</button>
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