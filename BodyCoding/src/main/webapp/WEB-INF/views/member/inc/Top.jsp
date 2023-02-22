<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Rage Freebie HTML5 Landing page</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="favicon.ico">

	<!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">


	<link rel="stylesheet" href="staticstatic/assets/css/slick.css">
	<link rel="stylesheet" href="static/assets/css/slick-theme.css">
	<link rel="stylesheet" href="static/assets/css/animate.css">
	<link rel="stylesheet" href="static/assets/css/fonticons.css">
	<link rel="stylesheet" href="static/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="static/assets/css/bootstrap.css">
	<link rel="stylesheet" href="static/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="static/assets/css/bootsnav.css">


	<!--For Plugins external css-->
	<!--<link rel="stylesheet" href="static/assets/css/plugins.css" />-->

	<!--Theme custom css -->
	<link rel="stylesheet" href="static/assets/css/style.css">
	<!--<link rel="stylesheet" href="static/assets/css/colors/maron.css">-->

	<!--Theme Responsive css-->
	<link rel="stylesheet" href="static/assets/css/responsive.css" />

	<script src="static/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">


	<!-- Preloader -->
	<div id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_one"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_four"></div>
			</div>
		</div>
	</div>
	<!--End off Preloader -->


	<div class="culmn">
		<!--Home page style-->

		<nav class="navbar navbar-light navbar-expand-lg  navbar-fixed white no-background bootsnav">
			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->

			<div class="container">
				<div>
				<img src="static/assets/images/logo.jpg" style="width:70px; height:40px;"   alt="">
				</div>
				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul >
						<c:if test="${not empty UserName}">
						<li style="padding-top:15px;">
			                <button class="btn btn-dark">
			                    ${UserName}님 
			                </button>
			            </li>
						<li style="padding-top:15px;">
			                <button class="btn btn-dark">
			                    <a href="#">마이페이지</a>
			                </button>
			            </li>
			            </c:if>
			            <c:if test="${empty UserName}">
						<li style="padding-top:15px;">
			                <button class="btn btn-dark">
			                    <a href="login.do">로그인</a>
			                </button>
			            </li>
			            &nbsp;&nbsp;&nbsp;
			            <li style="padding-top:15px;">
			                <button class="btn btn-dark">
			                    <a href="signup.do">회원가입</a>
			                </button>
			            </li>
			            </c:if>
			            
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-shopping-bag"></i>
                                    <span class="badge">3</span>
                                </a>
							<ul class="dropdown-menu cart-list">
								<li>
									<a href="#" class="photo"><img src="static/assets/images/thumb01.jpg" class="cart-thumb" alt="" /></a>
									<h6><a href="#">Delica omtantur </a></h6>
									<p class="m-top-10">2x - <span class="price">$99.99</span></p>
								</li>
								
								<!---- More List ---->
								<li class="total">
									<span class="pull-right"><strong>Total</strong>: $0.00</span>
									<a href="#" class="btn btn-cart">Cart</a>
								</li>
							</ul>
						</li>
						<!-- <li class="search"><a href="#"><i class="fa fa-search"></i></a></li> -->
						<li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menu">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
					
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp" style="padding-top:5px;">
						<li><a href="#hello">플젝명</a></li>
						<li><a href="#about">프로그램</a></li>
						<li><a href="#service">회원권 신청</a></li>
						<li><a href="#portfolio">마이페이지</a></li>
						<li><a href="#pricing">고객센터</a></li>
						<li><a href="#blog">플젝 홈쇼핑</a></li>
										
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
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="about_accordion wow fadeIn">
								<div id="faq_main_content" class="faq_main_content">
									<h6><i class="fa fa-angle-right"></i> UNIQUE DESIGN </h6>
									<div>
										<div class="content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, </p>

										</div>
									</div>
									<!-- End off accordion item-1 -->

									<h6 class="open"><i class="fa fa-angle-right"></i> EXPERIENCE TEAM</h6>
									<div class="open">
										<div class="content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, </p>
										</div>
									</div>
									<!-- End off accordion item-2 -->

									<h6> <i class="fa fa-angle-right"></i> GREAT SERVICE </h6>
									<div>
										<div class="content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, </p>
										</div>
									</div>
									<!-- End off accordion item-3 -->

									<h6><i class="fa fa-angle-right"></i> FREE UPDATES </h6>
									<div>
										<div class="content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, </p>
										</div>
									</div>
									<!-- End off accordion item-4 -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
			<br />
			<br />
			<br />
			<br />
			<hr />
			<br />
			<br />
			<div class="container">
				<div class="row">
					<div class="about_bottom_content">
						<div class="col-md-4">
							<div class="about_bottom_item m-top-20">
								<div class="ab_head">
									<div class="ab_head_icon">
										<i class="icofont icofont-fire-burn"></i>
									</div>
									<h6 class="m-top-20"> WE’RE CREATIVE</h6>
								</div>
								<p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing ealit, sed diaim nonummy nibsih euismod tincidiunt laorieet doloire magna diam aliquafm erat voluitpati. </p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="about_bottom_item m-top-20">
								<div class="ab_head">
									<div class="ab_head_icon">
										<i class="icofont icofont-speech-comments"></i>
									</div>
									<h6 class="m-top-20">WE'RE FRIENDLY</h6>
								</div>
								<p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing ealit, sed diaim nonummy nibsih euismod tincidiunt laorieet doloire magna diam aliquafm erat voluitpati. </p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="about_bottom_item m-top-20">
								<div class="ab_head">
									<div class="ab_head_icon">
										<i class="icofont icofont-heart"></i>
									</div>
									<h6 class="m-top-20">WE LOVE MINIMALISM</h6>
								</div>
								<p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing ealit, sed diaim nonummy nibsih euismod tincidiunt laorieet doloire magna diam aliquafm erat voluitpati. </p>
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off About section -->


		<!--Video section-->
		<section id="video" class="video">
			<div class="overlay"></div>
			<div class="main_video roomy-100 m-top-100 m-bottom-100 text-center">
				<div class="video_text text-center">
					<a href="http://www.youtube.com/watch?v=7HKoqNJtMTQ" class="video-link"><span class="fa fa-play"></span></a>
				</div>
			</div>
		</section>
		<!--End off video section -->

		<!-- 필요없는 부분이라 생각됨 
		<div class="container">
			<div class="row">
				<div class="main_featured m-top-100">
					<div class="col-sm-12">
						<div class="head_title text-center">
							<h2>FEATURED WORK</h2>
							<div class="separator_auto"></div>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
						</div>
					</div>
				</div>
			</div>
		</div>
		-->
		
		
		<div class="featured_slider">
			<div>
				<div class="featured_img">
					<img src="static/assets/images/fprojects/1.jpg" alt="" />
					<a href="static/assets/images/fprojects/1.jpg" class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="static/assets/images/fprojects/2.jpg" alt="" />
					<a href="static/assets/images/fprojects/2.jpg" class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="static/assets/images/fprojects/3.jpg" alt="" />
					<a href="static/assets/images/fprojects/3.jpg" class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="static/assets/images/fprojects/4.jpg" alt="" />
					<a href="static/assets/images/fprojects/4.jpg" class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="static/assets/images/fprojects/5.jpg" alt="" />
					<a href="static/assets/images/fprojects/5.jpg" class="popup-img"></a>
				</div>
			</div>
		</div>
		<!-- End off featured slider -->



		<!--Service Section-->
		<section id="service" class="service">
			<div class="container">
				<div class="row">
					<div class="main_service roomy-100">
						<div class="col-md-8 col-sm-10 mr-md-auto ml-md-auto mr-sm-auto ml-sm-auto">
							<div class="head_title text-center">
								<h2>OUR SERVICES</h2>
								<div class="separator_auto"></div>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
							</div>
						</div>
						<div class="row">


							<div class="col-md-4">
								<div class="service_item">
									<i class="icofont icofont-light-bulb"></i>
									<h6 class="m-top-30">BRANDING</h6>
									<div class="separator_small"></div>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="service_item">
									<i class="icofont icofont-imac"></i>
									<h6 class="m-top-30">BRANDING</h6>
									<div class="separator_small"></div>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="service_item">
									<i class="icofont icofont-video"></i>
									<h6 class="m-top-30">BRANDING</h6>
									<div class="separator_small"></div>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End off row -->
			</div>
			<!--End off container -->
		</section>
		<!--End off Featured section-->

		
		<!-- 
		<section id="impress" class="impress roomy-100">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="main_impress text-center">
						<div class="col-sm-8 mr-sm-auto ml-sm-auto">
							<h2 class="text-white text-uppercase">Impressed? Let’s work together</h2>
							<p class="m-top-40 text-white">At vero eos et accusamus et iusto odio dignissimos ducimus qui ditqs praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias</p>

							<div class="impress_btns m-top-30">
								<a href="" class="btn btn-primary m-top-20">HIRE US</a>
								<a href="" class="btn btn-default m-top-20">HIRE US</a>
							</div>
						</div>
					</div>
				</div>
				End off row 주석
			</div>
			 End off container주석
		</section>	
		 -->
	



		<!--Portfolio Section 주석
		<section id="portfolio" class="portfolio lightbg">
			<div class="container">
				<div class="row">
					<div class="main_portfolio roomy-100">
						<div class="col-md-8 mr-md-auto ml-md-auto">
							<div class="head_title text-center">
								<h2>OUR PORTOFLIO</h2>
								<div class="separator_auto"></div>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
							</div>
						</div>
						<div class="row">
							<div class="portfolio_content">
								<div class="col-md-8">
									<div class="row">
										<div class="col-md-12">
											<div class="portfolio_item">
												<img src="static/assets/images/Portfolio/2.jpg" alt="" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Title</h6>
													<p class=" text-white">Lorem ipsum dolor sit amet</p>
													<div class="portfolio_hover_icon">
														<a href="static/assets/images/Portfolio/2.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href=""><i class="fa fa-search"></i></a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6 m-top-30">
											<div class="portfolio_item portfolio_item2">
												<img src="static/assets/images/Portfolio/3.jpg" alt="" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Title</h6>
													<p class=" text-white">Lorem ipsum dolor sit amet</p>
													<div class="portfolio_hover_icon">
														<a href="static/assets/images/Portfolio/3.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href=""><i class="fa fa-search"></i></a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6 m-top-30">
											<div class="portfolio_item portfolio_item2">
												<img src="static/assets/images/Portfolio/5.jpg" alt="" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Title</h6>
													<p class=" text-white">Lorem ipsum dolor sit amet</p>
													<div class="portfolio_hover_icon">
														<a href="static/assets/images/Portfolio/5.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href=""><i class="fa fa-search"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="portfolio_item portfolio_item3 sm-m-top-30">
										<img src="static/assets/images/Portfolio/1.jpg" alt="" />
										<div class="portfolio_hover text-center">
											<h6 class="text-uppercase text-white">Title</h6>
											<p class=" text-white">Lorem ipsum dolor sit amet</p>
											<div class="portfolio_hover_icon">
												<a href="static/assets/images/Portfolio/1.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
												<a href=""><i class="fa fa-search"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 m-top-30">
									<div class="portfolio_item portfolio_item2">
										<img src="static/assets/images/Portfolio/6.jpg" alt="" />
										<div class="portfolio_hover text-center">
											<h6 class="text-uppercase text-white">Title</h6>
											<p class=" text-white">Lorem ipsum dolor sit amet</p>
											<div class="portfolio_hover_icon">
												<a href="static/assets/images/Portfolio/6.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
												<a href=""><i class="fa fa-search"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-8 m-top-30">
									<div class="portfolio_item">
										<img src="static/assets/images/Portfolio/4.jpg" alt="" />
										<div class="portfolio_hover text-center">
											<h6 class="text-uppercase text-white">Title</h6>
											<p class=" text-white">Lorem ipsum dolor sit amet</p>
											<div class="portfolio_hover_icon">
												<a href="static/assets/images/Portfolio/4.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
												<a href=""><i class="fa fa-search"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				주석 End off row 주석
			</div>
			주석 End off container 주석
		</section>
		주석 End off Portfolio section
		-->


		<!--Skill Sections-->
		<section id="skill" class="skill roomy-100">
			<div class="container">
				<div class="row">
					<div class="main_skill">
						<div class="col-md-6">
							<div class="skill_content wow fadeIn">
								<h2>Our skill</h2>
								<div class="separator_left"></div>

								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

							</div>
						</div>
						<div class="col-md-6">
							<div class="skill_bar sm-m-top-50">
								<div class="teamskillbar clearfix m-top-20" data-percent="80%">
									<h6>GRAPHIC DESIGN</h6>
									<div class="teamskillbar-bar"></div>
								</div>
								<!-- End Skill Bar -->

								<div class="teamskillbar clearfix m-top-50" data-percent="75%">
									<h6>TYPOGRAPHY</h6>
									<div class="teamskillbar-bar"></div>
								</div>
								<!-- End Skill Bar -->

								<div class="teamskillbar clearfix m-top-50" data-percent="90%">
									<h6>HTML / CSS</h6>
									<div class="teamskillbar-bar"></div>
								</div>
								<!-- End Skill Bar -->
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
			<br />
			<br />
			<br />
			<hr />
			<br />
			<br />
			<br />
			<div class="container">
				<div class="row">
					<div class="skill_bottom_content text-center">
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Projects Finished</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">4638</h2>
								<div class="separator_small"></div>
								<h5><em>Happy Clients</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Hours of work</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Cup of coffee</em></h5>
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Skill section -->



		<!--Testimonial Section 주석
		<section id="testimonial" class="testimonial fix">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">


					<div class="main_testimonial col-sm-8 ml-sm-auto mr-sm-auto">
						<div class="head_title text-center roomy-100">
							<h2 class="text-white">OUR TESTIMONIALS</h2>
						</div>
					</div>


					<div class="testimonial_slid text-center">
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
					</div>

				</div>
				-End off row 주석
			</div>
			End off container 주석
		</section>
		-End off Testimonial section 주석
		-->


		<!--client brand section-->
		<section id="cbrand" class="cbrand">
			<div class="container">
				<div class="row">
					<div class="main_cbrand text-center roomy-100">
						<div class="col-md-2 col-sm-4 col-6">
							<div class="cbrand_item m-bottom-10">
								<a href=""><img src="static/assets/images/clients/1.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-6">
							<div class="cbrand_item m-bottom-10">
								<a href=""><img src="static/assets/images/clients/2.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-6">
							<div class="cbrand_item m-bottom-10">
								<a href=""><img class="" src="static/assets/images/clients/5.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-6">
							<div class="cbrand_item m-bottom-10">
								<a href=""><img src="static/assets/images/clients/4.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-6">
							<div class="cbrand_item m-bottom-10">
								<a href=""><img src="static/assets/images/clients/3.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-6">
							<div class="cbrand_item m-bottom-10">
								<a href=""><img src="static/assets/images/clients/1.jpg" alt="" /></a>
							</div>
						</div>
					</div>
				</div>
				<!-- End off row -->
			</div>
			<!-- End off container -->
		</section>
		<!-- End off Cbrand section -->


		<!--
		Subscribe section 주석
		<section id="subscribe" class="subscribe roomy-100 fix">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="main_subscribe text-center">
						<div class="col-sm-8 mr-sm-auto ml-sm-auto">
							<h2 class="text-white">SUBSCRIBE US</h2>
							<p class="m-top-30 text-white">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
						</div>
						<div class="row justify-content-md-center">
							<div class="col-sm-10 col-10 ml-auto">
								<div class="subscribe_btns m-top-40">
									<form class="form-inline">
										<div class="form-control">
											<input type="email" class="form-control-label" id="inputEmail2" placeholder="Email Address">
										</div>
										<button type="submit" class="btn btn-primary">SUBSCRIBE</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				End off row 주석
			</div>
			End off container 주석
		</section>
		 End off Impress section주석-->
		



		<!--Blog Section
		<section id="blog" class="blog">
			<div class="container">
				<div class="row">
					<div class="main_blog text-center roomy-100">
						<div class="col-sm-8 mr-sm-auto ml-sm-auto">
							<div class="head_title text-center">
								<h2>RECENT BLOGS</h2>
								<div class="separator_auto"></div>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
							</div>
						</div>

						<div class="row">

							<div class="col-md-4">
								<div class="blog_item m-top-20">
									<div class="blog_item_img">
										<img src="static/assets/images/Blog/1.jpg" alt="" />
									</div>
									<div class="blog_text roomy-40">
										<h6>PLEASUARE WITHOUT CONSCIENCE</h6>
										<p><em><a href="">May 15, 2016</a> /<a href="">admin</a>/<a href=""> Co-working</a></em></p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="blog_item m-top-20">
									<div class="blog_item_img">
										<img src="static/assets/images/Blog/2.jpg" alt="" />
									</div>
									<div class="blog_text roomy-40">
										<h6>PLEASUARE WITHOUT CONSCIENCE</h6>
										<p><em><a href="">May 15, 2016</a> /<a href="">admin</a>/<a href=""> Co-working</a></em></p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="blog_item m-top-20">
									<div class="blog_item_img">
										<img src="static/assets/images/Blog/3.jpg" alt="" />
									</div>
									<div class="blog_text roomy-40">
										<h6>PLEASUARE WITHOUT CONSCIENCE</h6>
										<p><em><a href="">May 15, 2016</a> /<a href="">admin</a>/<a href=""> Co-working</a></em></p>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				End off row주석
			</div>
			주석 End off container주석
		</section>
		주석 End off Blog section 
		-->


		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->


		<footer id="footer" class="footer bg-black">
			<div class="container">
				<div class="row">
					<div class="main_footer text-center p-top-40 p-bottom-30">
						<p class="wow fadeInRight" data-wow-duration="1s">
							Made with
							<i class="fa fa-heart"></i> by
							<a target="_blank" href="https://bootstrapthemes.co">Bootstrap Themes</a> 2016. All Rights Reserved
						</p>
					</div>
				</div>
			</div>
		</footer>

	</div>
	<!-- JS includes -->

	<script src="static/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="static/assets/js/vendor/popper.min.js"></script>
	<script src="static/assets/js/vendor/bootstrap.min.js"></script>

	<script src="static/assets/js/jquery.magnific-popup.js"></script>
	<script src="static/assets/js/jquery.easing.1.3.js"></script>
	<script src="static/assets/js/slick.min.js"></script>
	<script src="static/assets/js/jquery.collapse.js"></script>
	<script src="static/assets/js/bootsnav.js"></script>


	<!-- paradise slider js -->


	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
	<script src="static/assets/js/gmaps.min.js"></script>

	<script>
		function showmap() {
			var mapOptions = {
				zoom: 8,
				scrollwheel: false,
				center: new google.maps.LatLng(-34.397, 150.644),
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
			$('.mapheight').css('height', '350');
			$('.maps_text h3').hide();
		}

	</script>

	<script src="static/assets/js/plugins.js"></script>
	<script src="static/assets/js/main.js"></script>

</body>
</html>