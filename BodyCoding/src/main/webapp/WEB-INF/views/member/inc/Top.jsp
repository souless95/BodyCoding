<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
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
								<li class="current"><a href="main">Home111</a></li>
								<!-- 드롭다운의 시작 li ->a태그로 감싸야 드롭다운됨  -->
								<li>
									<a href="#">BodyCoding(Dropdown)</a>
									<ul>
										<li><a href="/menu/introgym.jsp">바디코딩소개</a></li>
										<li><a href="#">소중한팀원들소개하지마이쉐끼야</a></li>
																				
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
					
					
						<c:if test="${not empty UserInfo}">
						<li>
			                    ${UserInfo.mem_id}님 환영합니다.
			            </li>
						<li><a href="mypage.do?gym_code=${UserInfo.gym_code }">마이페이지</a>
							<ul> 
								<li><a href="#">이용내역</a></li>
								<li><a href="#">활동내역</a></li>
								<li><a href="#">운동관리</a></li>
								<li><a href="#">정보수정</a></li>
							</ul>
			            </li>
						<li>
			                    <a href="#" onclick="logoutcheck()">로그아웃</a>
			            </li>
			            </c:if>
			            <c:if test="${empty UserInfo}">
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
		<!-- Scripts -->
		<script src="static/assets/js/jquery.min.js"></script>
		<script src="static/assets/js/jquery.dropotron.min.js"></script>
		<script src="static/assets/js/browser.min.js"></script>
		<script src="static/assets/js/breakpoints.min.js"></script>
		<script src="static/assets/js/util.js"></script>
		<script src="static/assets/js/main.js"></script>

	</body>
</html>