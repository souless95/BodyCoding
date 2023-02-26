<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function logoutcheck(){
	
	var confirmed = confirm("정말로 로그아웃 하시겠습니까?");
	
	if(confirmed){
		location.href="logout.do"
	}
}
</script>

</head>
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="static/assets/css/main.css" />
	<style type="text/css">
	  * { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; }
	
	</style>
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<div id="header">

				<!-- Logo -->
				<h1><a href="main" id="logo"><span style="font-weight:bold; font-size:40px; font-family: 'Spoqa Han Sans Neo', 'sans-serif';">
				Body Coding</span></a></h1>
				
				
		
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="/main">Home</a></li>
						<!-- 드롭다운의 시작 li ->a태그로 감싸야 드롭다운됨  -->
						<li>
							<a href="#">BodyCoding</a>
							<ul>
								<li><a href="/menu/introgym.jsp">바디코딩소개</a></li>
							</ul>
						</li>
						
						<li>
							<a href="#"> 프로그램</a>
							<ul>
								<li><a href="/menu/health.jsp">헬스</a></li>
								<li><a href="/menu/pt.jsp">PT</a></li>
								<li><a href="#">요가</a></li>
								<li><a href="#">GX</a></li>
								<li><a href="#">필라테스</a></li>
							</ul>
						</li>
						
						<li>
							<a href="#">지점정보</a>
							<ul>
								<li><a href="#">지점확인</a></li>
							</ul>
						</li>
						
						<li>
							<a href="#">트레이너</a>
							<ul>
								<li><a href="#">트레이너정보</a></li>
							</ul>
						</li>
						
						
						<li>
							<a href="#">상품몰</a>
						</li>
						
						<li>
							<a href="#">게시판</a>
							<ul> 
									<li><a href="#">자유게시판</a></li>
								<li><a href="#">Q&A</a></li>
								<li><a href="#">1:1문의(웹소켓 채팅)</a></li>
							</ul>
						</li>
						
						<li>
							<a href="/menu/myinfo.jsp">마이페이지</a>
							<ul> 
								<li><a href="#">이용내역</a></li>
								<li><a href="#">활동내역</a></li>
								<li><a href="#">운동관리</a></li>
								<li><a href="#">정보수정</a></li>
							</ul>
						</li>
		
				
				
					<c:if test="${not empty UserName}">
					<li>
		                    ${UserName}님 환영합니다.
		            </li>
					<li><a href="#">마이페이지</a>
		            </li>
					<li>
		                    <a href="#" onclick="logoutcheck()">로그아웃</a>
		            </li>
		            </c:if>
		            <c:if test="${empty UserName}">
					<li>
		                    <a href="login.do">로그인</a>
		            </li>
		           
		            <li>
		                    <a href="signup.do">회원가입</a>
		            </li>
		            </c:if>
				</ul>
			</nav>
		</div>
		<div>
		 <img alt="메인화면" src="static/assets/images/main1.jpg" style="width:100%;">
		</div>
	</div>
	
		<section class="wrapper style1">
			<div class="container">
				<div class="row">
					<section class="col-6 col-12-narrower">
						<div class="box post">
							<a href="#" class="image left"><img src="static/assets/images/pic01.jpg" alt="" /></a>
							<div class="inner">
								<h3>몸 좋은 사람의 사진?</h3>
								<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
							</div>
						</div>
					</section>
					<section class="col-6 col-12-narrower">
						<div class="box post">
							<a href="#" class="image left"><img src="static/assets/images/pic02.jpg" alt="" /></a>
							<div class="inner">
								<h3>뭘 넣으면 좋을까??</h3>
								<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
							</div>
						</div>
					</section>
				</div>
				<div class="row">
					<section class="col-6 col-12-narrower">
						<div class="box post">
							<a href="#" class="image left"><img src="static/assets/images/pic03.jpg" alt="" /></a>
							<div class="inner">
								<h3>The Third Thing</h3>
								<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
							</div>
						</div>
					</section>
					<section class="col-6 col-12-narrower">
						<div class="box post">
							<a href="#" class="image left"><img src="static/assets/images/pic04.jpg" alt="" /></a>
							<div class="inner">
								<h3>메인화면에 무엇을 넣을까요?</h3>
								<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
							</div>
						</div>
					</section>
				</div>
			</div>
		</section>
			
		
		<!-- Scripts -->
		<script src="static/assets/js/jquery.min.js"></script>
		<script src="static/assets/js/jquery.dropotron.min.js"></script>
		<script src="static/assets/js/browser.min.js"></script>
		<script src="static/assets/js/breakpoints.min.js"></script>
		<script src="static/assets/js/util.js"></script>
		<script src="static/assets/js/main.js"></script>
	
	<!-- Bottom -->
	
	<%@ include file="../member/inc/Bottom.jsp" %>
</body>
</html>