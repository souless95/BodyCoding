<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	border: 1px;
}
</style>
<%@ include file="../inc/Top.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="../inc/mypageside.jsp"%>
		<div id="layoutSidenav_content">
			<div class="card mb-5" style="border-bottom: none;">
				<div class="card-header">
					<h2>트레이너 경력사항</h2>
					<div class="trainer_wrap">
						<div class="trainer_box" style="display:flex;">
						
							<div class="trainer_thumb"><img alt="트레이너사진" src="../static/assets/images/tr1.jpg" style="width:200px; height:200px;"></div>
								<div style="margin-left:15px;">
									<span style="font-size : 18px;"><i class="fas fa-map-marker-alt"></i>일산점</span><br>
										<span style="font-weight:bold; font-size:25px;">정세필 </span>
										<span style="font-size:20px; color:red;">오후트레이너</span>
										<span style="font-size:18px;">Lv.3</span>
									<div class="trainer_mission">"나의 사명은 모든 회원들의 육체가 건강해져 건강한
										정신이 깃들수 있도록 하는것이다."</div>
									<div class="trainer_star mgb_20">
										<span class='score_star'><i class='fas fa-star'></i><i
											class='fas fa-star'></i><i class='fas fa-star'></i><i
											class='fas fa-star'></i><i class='fas fa-star'></i></span> 10.0 <span
											class="trainer_star_total">1건</span>
									</div>
									<br>
								<div><a class="btn-line" href="trainerInfo">
								<i class="fas fa-search-plus"></i> 트레이너 상세 보기</a></div>	
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../inc/Bottom.jsp"%>
</body>
</html>