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
					<h2>등록된 지점</h2>
					<div class="trainer_wrap">
						<!--  <h3>trainer 소개</h3> -->
						<div class="trainer_box">
						
							<div class="trainer_thumb"><img alt="트레이너사진" src="../static/assets/images/tr1.jpg" style="width:200px; height:200px;"></div>
							<span class="trainer_bran"><i
								class="fas fa-map-marker-alt"></i> 미금점</span> <span
								class="trainer_name">한준호 </span><span class="trainer_part">오후트레이너</span>
							<div class="trainer_mission">"나의 사명은 모든 회원들의 육체가 건강해져 건강한
								정신이 깃들수 있도록 하는것이다."</div>
							<div class="trainer_star mgb_20">
								<span class='score_star'><i class='fas fa-star'></i><i
									class='fas fa-star'></i><i class='fas fa-star'></i><i
									class='fas fa-star'></i><i class='fas fa-star'></i></span> 10.0 <span
									class="trainer_star_total">1건</span>
							</div>
							<a class="btn-line" href="trainer_detail.html?base_seq=MTc3"><i
								class="fas fa-search-plus"></i> 트레이너 상세 보기</a>
						</div>
						<div class="trainer_box">
							<div class="trainer_thumb"
								style="background-image: url(https://www.spoany.co.kr/ActiveFile/spoany.smms/step_pr_img/P20191111211504basic_2344.jpg)"></div>
							<span class="trainer_bran"><i
								class="fas fa-map-marker-alt"></i> 하남신장점</span> <span
								class="trainer_name">이유희 </span><span class="trainer_part">총괄팀장</span>
							<span> Lv.3</span>
							<div class="trainer_mission">"나의 사명은 내가족의 건강을 걱정하고 생각하듯 모든
								회원들의 안녕과 건강을 위해 생각하는것이다."</div>
							<div class="trainer_star mgb_20">
								<span class='score_star'><i class='fas fa-star'></i><i
									class='fas fa-star'></i><i class='fas fa-star'></i><i
									class='fas fa-star'></i><i class='fas fa-star'></i></span> 10.0 <span
									class="trainer_star_total">2건</span>
							</div>
							<a class="btn-line" href="trainer_detail.html?base_seq=MjM0NA=="><i
								class="fas fa-search-plus"></i> 트레이너 상세 보기</a>
						</div>
						<div class="trainer_box">
							<div class="trainer_thumb"
								style="background-image: url(https://www.spoany.co.kr/ActiveFile/spoany.smms/step_pr_img/P20190515172530basic_3314.jpg)"></div>
							<span class="trainer_bran"><i
								class="fas fa-map-marker-alt"></i> 신설동역점</span> <span
								class="trainer_name">김성훈 </span><span class="trainer_part">오후트레이너</span>
							<span> Lv.1</span>
							<div class="trainer_mission">" 나의 사명은 신설동역점 회원님들의 마지막 트레이너가
								되는 것이다. "</div>
							<div class="trainer_star mgb_20">
								<span class='score_star'><i class='fas fa-star'></i><i
									class='fas fa-star'></i><i class='fas fa-star'></i><i
									class='fas fa-star'></i><i class='fas fa-star'></i></span> 10.0 <span
									class="trainer_star_total">1건</span>
							</div>
							<a class="btn-line" href="trainer_detail.html?base_seq=MzMxNA=="><i
								class="fas fa-search-plus"></i> 트레이너 상세 보기</a>
						</div>
						<div class="trainer_box">
							<div class="trainer_thumb"
								style="background-image: url(https://www.spoany.co.kr/ActiveFile/spoany.smms/step_pr_img/P20230224194733basic_4109.jpg)"></div>
							<span class="trainer_bran"><i
								class="fas fa-map-marker-alt"></i> 불광역점P</span> <span
								class="trainer_name">한정연 </span><span class="trainer_part">오후트레이너</span>
							<span> Lv.1</span>
							<div class="trainer_mission">" 나의 사명은 회원님들의 입장에서 생각하고 친절하게
								설명하여 회원님들의 신뢰를 얻고 센터 이용에 도움을 드릴 수 있도록 최선을 다하는 것입니다."</div>
							<div class="trainer_star mgb_20">
								<span class='score_star'><i class='fas fa-star'></i><i
									class='fas fa-star'></i><i class='fas fa-star'></i><i
									class='fas fa-star'></i><i class='fas fa-star'></i></span> 10.0 <span
									class="trainer_star_total">2건</span>
							</div>
							<a class="btn-line" href="trainer_detail.html?base_seq=NDEwOQ=="><i
								class="fas fa-search-plus"></i> 트레이너 상세 보기</a>
						</div>

						<!-- 페이징
						<div class="btns">
							<ul class="pagination">
								<li class='active'><a href='#9'>1</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=2#9'>2</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=3#9'>3</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=4#9'>4</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=5#9'>5</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=6#9'>6</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=7#9'>7</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=8#9'>8</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=9#9'>9</a></li>
								<li><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=10#9'>10</a></li>
								<li class='arrow'><a
									href='my_trainer.html?s_branch_code=X&s_gender=&s_trainer_level=&search_YN=&s_bul=&sort_type=A&page=11#9'><i
										class='material-icons md-24'>≫</i></a></li>
							</ul>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../inc/Bottom.jsp"%>
</body>
</html>