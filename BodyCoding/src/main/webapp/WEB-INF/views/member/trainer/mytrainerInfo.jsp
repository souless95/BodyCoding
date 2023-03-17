<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body{
	border: 1px;
}
</style>
</head>
<%@ include file="../../../../inc/Top.jsp" %>
<body>
 <div class="container">
 	<%@ include file ="../../../../inc/mypageside.jsp" %>
       <div id="layoutSidenav_content">
        <div class="card mb-5" style="border-bottom: none;">
        	<div class="card-header" style="height:75px; color:white; background-color:#01538D; vertical-align:middle;">
				<h2> ${UserName}님의 마이페이지 입니다.</h2>
			</div>	
				<div>
					<div id="layoutSidenav">
						<div class="container">
						<br>
							<h2>트레이너 정보</h2>
								<table class="table" style="border: 3px solid #D7D7D7; width:70%;  border-radius:7px;">
										<tr style="border: 2px solid gray;">
											<td style="border: 2px solid gray; width: 300px; height: 360px;" rowspan="4"><img src="/static/uploads/trainer/${trainerInfo.mem_img}" style="width:100%;height:100%; margin-bottom: -55px;"></td>
											<td style="vertical-align: middle; padding-left: 10px;"><strong>한마디 : </strong> ${trainerInfo.mem_comment }</td>  
										</tr>
										<tr style="border: 2px solid gray;">
											<td style="padding-left: 10px;"><strong>이름 : </strong>${trainerInfo.mem_name}</td>
											<td><strong>지점명 : </strong> ${gymInfo }</td>
										</tr>
										<tr>
										</tr>
										<tr style="border: 2px solid gray;">
											<td style="padding-left: 10px;"><strong>경력 : </strong> ${trainerInfo.mem_career }</td>
										</tr>
									</table>
							<c:if test="${not empty avg_grade }">
							 <!-- <h3>평점 &nbsp : &nbsp ${avg_grade }/5</h3>  -->
						   	<div class="star-ratings">
						       	<input type="hidden" name="ratevalue1" value="${avg_grade }" step="0.1" min="0" max="5" />
						       	<div class="rating-wrap">
						          	<div class="rating">
						            	<h3>평점 &nbsp&nbsp <div class="overlay"></div></h3>
						          	</div>
						       	</div>
						   	</div>
							
							<br />
							<h3>후기</h3>
							<table style="border: 3px solid gray;">
								<tr style="border: 2px solid gray;">
									<th width="20%"><strong>작성자</strong></th>
									<th width="60%"><strong>내용</strong></th>
									<th width="10%"><strong>평점</strong></th>
									<th width="10%"><strong>작성일</strong></th>
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
							
							<c:if test="${not empty UserName && UserName ne trainerInfo.mem_name }">
							<h3>후기작성</h3>
								<form method="post" action="trainerReview">
									<table style="border: 1px solid black;">
										<input type="hidden" name="review_subject" value="${trainerInfo.mem_id }"/>
										<input type="hidden" name="gym_code" value="${trainerInfo.gym_code }"/>
										<tr>
											<th width="20%"><strong>아이디(이메일)</strong></th>
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
											<td colspan="3" style="padding-bottom: 10px; padding-top: 10px;">
												<%-- <%@ include file="../star.jsp" %> --%>
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
												<!-- <input type="number" name="review_grade" placeholder="1~10으로 입력하시오." required/> -->
											</td>
										</tr>
										<tr>
											<th style="vertical-align: middle;"><strong>후기 내용</strong></th>
											<td colspan="3" style="text-align: right;">
												<textarea name="review_comment" cols="50" rows="5" placeholder="내용을 입력하세요." required></textarea>
												<input type="submit" value="후기등록">
												<input type="reset" value="지우기">
											</td>
										</tr>
									</table>
								</form>
							</c:if>
							
							<c:if test="${not empty UserName && UserName ne trainerInfo.mem_name }">
								<button type="button" onclick="location.href='membershipPurchase.do'">pt 등록하기(결제)</button>
							</c:if>
							<c:if test="${empty UserName && UserName ne trainerInfo.mem_name }">
								<button type="button" onclick="login();">pt 등록하기(로그인하러 가기)</button>
							</c:if>
						</div>
					</div>
				</div>
        	</div>
		</div>
	</div>
</body>
<%@ include file="../../../../inc/Bottom.jsp" %>
</html>
