<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<%@ include file="../member/inc/Top.jsp" %>
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
		
		<!-- Banner -->
		<div>
		 <img alt="메인화면" src="static/assets/images/main1.jpg" style="width:100%;">
		</div>
		<!-- Posts -->
		<!-- 컨텐츠영역 -->
		<div>
			<div class="container">
				<div class="row">
					<div>
						<div class="box post">
							<a href="#" class="image left"><img src="static/assets/images/pic01.jpg" alt="" /></a>
							<div>
								<h3>The First Thing</h3>
								<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
								</div>
						</div>
					</div>
					<div class="box post">
						<div>
							<a href="#" class="image left"><img src="static/assets/images/pic02.jpg" alt="" /></a>
							<div class="inner">
								<h3>The Second Thing</h3>
								<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div>
						<div class="box post">
							<a href="#" class="image left"><img src="static/assets/images/pic03.jpg" alt="" /></a>
							<div class="inner">
								<h3>The Third Thing</h3>
								<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
							</div>
						</div>
					<div>
				</div>
						<div class="box post">
							<a href="#" class="image left"><img src="static/assets/images/pic04.jpg" alt="" /></a>
							<div class="inner">
								<h3>The Fourth Thing</h3>
								<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			
		
		<!-- Scripts -->
		<script src="static/assets/js/jquery.min.js"></script>
		<script src="static/assets/js/jquery.dropotron.min.js"></script>
		<script src="static/assets/js/browser.min.js"></script>
		<script src="static/assets/js/breakpoints.min.js"></script>
		<script src="static/assets/js/util.js"></script>
		<script src="static/assets/js/main.js"></script>
	
	<!-- Bottom -->
	<!-- CTA -->
	<section id="cta" class="wrapper style3">
		<div class="container">
			<header>
				<h2>Are you ready to continue your quest?</h2>
				<a href="#" class="button">Insert Coin</a>
			</header>
		</div>
	</section>
	<!-- Footer -->
	<div id="footer">
		<div class="container">
			<div class="row">
				바텀에 필요하면 뭐 추가 하던지, 구글지도 넣던지 
			</div>
		</div>
	
		<!-- Icons -->
		<ul class="icons">
			<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
			<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
			<li><a href="#" class="icon brands fa-google-plus-g"><span class="label">Google+</span></a></li>
		</ul>
	
	<!-- Copyright -->
		<div class="copyright">
			<ul class="menu">
				<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</div>
	
</body>
</html>
</html>