<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
	Arcana by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
		<title>Arcana by HTML5 UP</title>
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
						<h1><a href="main.jsp" id="logo"><span style="font-weight:bold; font-size:40px; 
    font-family: 'Spoqa Han Sans Neo', 'sans-serif';">
						Body Coding</span></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.html">Home</a></li>
								<li>
									<a href="#">Dropdown</a>
									<ul>
										<li><a href="#">Lorem dolor</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam sed tempus</a></li>
										<li>
											<a href="#">Submenu</a>
											<ul>
												<li><a href="#">Lorem dolor</a></li>
												<li><a href="#">Phasellus magna</a></li>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam nisl</a></li>
												<li><a href="#">Veroeros feugiat</a></li>
											</ul>
										</li>
										<li><a href="#">Veroeros feugiat</a></li>
									</ul>
								</li>
								<li><a href="left-sidebar.html">Left Sidebar</a></li>
								<li><a href="right-sidebar.html">Right Sidebar</a></li>
								<li><a href="two-sidebar.html">Two Sidebar</a></li>
								<li><a href="no-sidebar.html">No Sidebar</a></li>
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

			<!-- Banner -->
				<section id="banner">
				<img alt="메인화면" src="static/assets/images/main1.jpg" style="width:100%;">
					<header>
					
						<h2>Arcana: <em>A responsive site template freebie by <a href="http://html5up.net">HTML5 UP</a></em></h2>
						<a href="#" class="button">Learn More</a>
						
					</header>
				</section>

<<<<<<< HEAD
			<!-- Highlights -->
				<section class="wrapper style1">
					<div class="container">
						<div class="row gtr-200">
							<section class="col-4 col-12-narrower">
								<div class="box highlight">
									<i class="icon solid major fa-paper-plane"></i>
									<h3>This Is Important</h3>
									<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
=======
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp" style="padding-top:5px;">
						<li><a href="#hello">바디코딩</a></li>
						<li><a href="#about">프로그램</a></li>
						<li><a href="#service">지점</a></li>
						<li><a href="trainer">트레이너</a></li>
						<li><a href="#pricing">상품몰</a></li>
						<li><a href="#blog">게시판</a></li>
										
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>


			<!-- Start Side Menu -->
			<div class="side">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<div class="widget">
					<h6 class="title">Custom Pages</h6>
					<ul class="link">
						<li><a href="#">About</a></li>
						<li><a href="#">Services</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Portfolio</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="widget">
					<h6 class="title">Additional Links</h6>
					<ul class="link">
						<li><a href="#">Retina Homepage</a></li>
						<li><a href="#">New Page Examples</a></li>
						<li><a href="#">Parallax Sections</a></li>
						<li><a href="#">Shortcode Central</a></li>
						<li><a href="#">Ultimate Font Collection</a></li>
					</ul>
				</div>
			</div>
			<!-- End Side Menu -->

		</nav>
	
		<!--Home Sections-->
		
		<section id="hello" class="home bg-mega">
		
			<div class="overlay">
			<img alt="메인화면" src="static/assets/images/main1.jpeg" style="width:100%;">		
			</div>
			<div class="container">
				<div class="row">
					<div class="main_home">
						<div class="home_text">
							<h2 class="text-white">우리는 낙자쌤의 도움이 <br/> 필요합니다 !</h1>
						</div>

						<div class="home_btns m-top-40">
							<a href="https://bootstrapthemes.co" target="_blank" class="btn btn-primary m-top-20" style="padding:auto;">
							누르면 어딘가로 이동</a>
							
							<a href="https://bootstrapthemes.co" target="_blank" class="btn btn-default m-top-20" style="margin-bottom:14px; padding:auto;">
							지도 API여기에넣을까</a>
						</div>

					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Home Sections-->


		<!--About Sections-->
		<section id="about" class="about roomy-100">
			<div class="container">
				<div class="row">
					<div class="main_about">
						<div class="col-md-6">
							<div class="about_content">
								<h2>ABOUT US</h2>
								<div class="separator_left"></div>

								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="about_btns m-top-40">
									<a href="" class="btn btn-primary">DOWNLOAD NOW</a>
>>>>>>> branch 'main' of https://github.com/souless95/BodyCoding.git
								</div>
							</section>
							<section class="col-4 col-12-narrower">
								<div class="box highlight">
									<i class="icon solid major fa-pencil-alt"></i>
									<h3>Also Important</h3>
									<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
								</div>
							</section>
							<section class="col-4 col-12-narrower">
								<div class="box highlight">
									<i class="icon solid major fa-wrench"></i>
									<h3>Probably Important</h3>
									<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
								</div>
							</section>
						</div>
					</div>
				</section>

			<!-- Gigantic Heading -->
				<section class="wrapper style2">
					<div class="container">
						<header class="major">
							<h2>A gigantic heading you can use for whatever</h2>
							<p>With a much smaller subtitle hanging out just below it</p>
						</header>
					</div>
				</section>

			<!-- Posts -->
				<section class="wrapper style1">
					<div class="container">
						<div class="row">
							<section class="col-6 col-12-narrower">
								<div class="box post">
									<a href="#" class="image left"><img src="static/assets/images/pic01.jpg" alt="" /></a>
									<div class="inner">
										<h3>The First Thing</h3>
										<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
									</div>
								</div>
							</section>
							<section class="col-6 col-12-narrower">
								<div class="box post">
									<a href="#" class="image left"><img src="static/assets/images/pic02.jpg" alt="" /></a>
									<div class="inner">
										<h3>The Second Thing</h3>
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
										<h3>The Fourth Thing</h3>
										<p>Duis neque nisi, dapibus sed mattis et quis, nibh. Sed et dapibus nisl amet mattis, sed a rutrum accumsan sed. Suspendisse eu.</p>
									</div>
								</div>
							</section>
						</div>
					</div>
				</section>

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
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Links to Stuff</h3>
								<ul class="links">
									<li><a href="#">Mattis et quis rutrum</a></li>
									<li><a href="#">Suspendisse amet varius</a></li>
									<li><a href="#">Sed et dapibus quis</a></li>
									<li><a href="#">Rutrum accumsan dolor</a></li>
									<li><a href="#">Mattis rutrum accumsan</a></li>
									<li><a href="#">Suspendisse varius nibh</a></li>
									<li><a href="#">Sed et dapibus mattis</a></li>
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>More Links to Stuff</h3>
								<ul class="links">
									<li><a href="#">Duis neque nisi dapibus</a></li>
									<li><a href="#">Sed et dapibus quis</a></li>
									<li><a href="#">Rutrum accumsan sed</a></li>
									<li><a href="#">Mattis et sed accumsan</a></li>
									<li><a href="#">Duis neque nisi sed</a></li>
									<li><a href="#">Sed et dapibus quis</a></li>
									<li><a href="#">Rutrum amet varius</a></li>
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Get In Touch</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Send Message" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
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

		</div>

		<!-- Scripts -->
			<script src="static/assets/js/jquery.min.js"></script>
			<script src="static/assets/js/jquery.dropotron.min.js"></script>
			<script src="static/assets/js/browser.min.js"></script>
			<script src="static/assets/js/breakpoints.min.js"></script>
			<script src="static/assets/js/util.js"></script>
			<script src="static/assets/js/main.js"></script>

	</body>
</html>