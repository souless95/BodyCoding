<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Left Sidebar - Arcana by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../static/assets/css/main.css" />
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
								<li><a href="#">PT</a></li>
								<li><a href="#">요가</a></li>
								<li><a href="#">GX</a></li>
								<li><a href="#">필라테스</a></li>
							</ul>
						</li>
						
						<li>
							<a href="#">지점정보</a>
						</li>
						
						<li>
							<a href="#">트레이너</a>
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
							<a href="#" onclick="location.href='account/myinfo.jsp';">마이페이지</a>
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
	</div>

<!-- Main -->
<section class="wrapper style1">
	<div class="container">
		<div class="row gtr-200">
			<div class="col-4 col-12-narrower">
				<div id="sidebar">

					<!-- Sidebar -->

						<section>
							<h3>Just a Subheading</h3>
							<p>Phasellus quam turpis, feugiat sit amet ornare in, hendrerit in lectus.
							Praesent semper mod quis eget mi. Etiam eu ante risus. Aliquam erat volutpat.
							Aliquam luctus et mattis lectus sit amet pulvinar. Nam turpis et nisi etiam.</p>
							<footer>
								<a href="#" class="button">Continue Reading</a>
							</footer>
						</section>

						<section>
							<h3>Another Subheading</h3>
							<ul class="links">
								<li><a href="#">Amet turpis, feugiat et sit amet</a></li>
								<li><a href="#">Ornare in hendrerit in lectus</a></li>
								<li><a href="#">Semper mod quis eget mi dolore</a></li>
								<li><a href="#">Consequat etiam lorem phasellus</a></li>
								<li><a href="#">Amet turpis, feugiat et sit amet</a></li>
								<li><a href="#">Semper mod quisturpis nisi</a></li>
							</ul>
							<footer>
								<a href="#" class="button">More Random Links</a>
							</footer>
						</section>

				</div>
			</div>
			<div class="col-8  col-12-narrower imp-narrower">
				<div id="content">

					<!-- Content -->

						<article>
							<header>
								<h2>Left Sidebar</h2>
								<p>Sidebar on the left, content on the right.</p>
							</header>

							<span class="image featured"><img src="images/banner.jpg" alt="" /></span>

							<p>Phasellus quam turpis, feugiat sit amet ornare in, hendrerit in lectus.
							Praesent semper mod quis eget mi. Etiam eu ante risus. Aliquam erat volutpat.
							Aliquam luctus et mattis lectus sit amet pulvinar. Nam turpis nisi
							consequat etiam lorem ipsum dolor sit amet nullam.</p>

							<h3>And Yet Another Subheading</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac quam risus, at tempus
							justo. Sed dictum rutrum massa eu volutpat. Quisque vitae hendrerit sem. Pellentesque lorem felis,
							ultricies a bibendum id, bibendum sit amet nisl. Mauris et lorem quam. Maecenas rutrum imperdiet
							vulputate. Nulla quis nibh ipsum, sed egestas justo. Morbi ut ante mattis orci convallis tempor.
							Etiam a lacus a lacus pharetra porttitor quis accumsan odio. Sed vel euismod nisi. Etiam convallis
							rhoncus dui quis euismod. Maecenas lorem tellus, congue et condimentum ac, ullamcorper non sapien.
							Donec sagittis massa et leo semper a scelerisque metus faucibus. Morbi congue mattis mi.
							Phasellus sed nisl vitae risus tristique volutpat. Cras rutrum commodo luctus.</p>

							<p>Phasellus odio risus, faucibus et viverra vitae, eleifend ac purus. Praesent mattis, enim
							quis hendrerit porttitor, sapien tortor viverra magna, sit amet rhoncus nisl lacus nec arcu.
							Suspendisse laoreet metus ut metus imperdiet interdum aliquam justo tincidunt. Mauris dolor urna,
							fringilla vel malesuada ac, dignissim eu mi. Praesent mollis massa ac nulla pretium pretium.
							Maecenas tortor mauris, consectetur pellentesque dapibus eget, tincidunt vitae arcu.
							Vestibulum purus augue, tincidunt sit amet iaculis id, porta eu purus.</p>
						</article>

				</div>
			</div>
		</div>
	</div>
</section>

	<!-- Scripts -->
	<script src="../static/assets/js/jquery.min.js"></script>
	<script src="../static/assets/js/jquery.dropotron.min.js"></script>
	<script src="../static/assets/js/browser.min.js"></script>
	<script src="../static/assets/js/breakpoints.min.js"></script>
	<script src="../static/assets/js/util.js"></script>
	<script src="../static/assets/js/main.js"></script>
	
	
	
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