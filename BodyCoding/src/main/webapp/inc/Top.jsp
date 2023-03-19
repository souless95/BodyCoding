<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.cdnfonts.com/css/myriad-pro" rel="stylesheet">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../static/assets/css/main.css" />
<link rel="stylesheet" href="https://use.typekit.net/efc4fdx.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<script type="text/javascript">
	function logoutcheck() {

		var confirmed = confirm("정말로 로그아웃 하시겠습니까?");

		if (confirmed) {
			location.href = "logout.do"
		}
	}

	/* 1대1문의 윈도우창 생성 */
	function openChatRoom(event, mem_id, mem_name){
	    event.preventDefault(); // 기본 동작(링크 이동) 방지
	    if(mem_id==null||mem_id==""){
	       alert("로그인 후 이용해 주세요.");
	        window.location.href = "/login.do";
	    }
	    else{
	    	var url = "../chatting/room?mem_id=" + mem_id;
	    	var win = window.open(url, "chatRoom", "width=450,height=600, left=600, top=200");
	    	if (win) {
	    	    win.focus();
	    	    win.location.href = "/moveChating?roomName=" + mem_id + "-admin_super1&mem_id=" + mem_id + "&mem_name=" + mem_name;
	    	} else {
	    	    alert('팝업이 차단되었습니다. 팝업 차단을 해제해주세요.');
	    	}
	    }
	}
</script>
</head>
<body class="is-preload">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header">
			<div class="myPage_top" style="float:right; font-size:20px; margin-top: -90px; padding-right: 10px;">
				<c:if test="${not empty UserName}">
					WelCome! <span class="spoka">&nbsp&nbsp ${UserName}<i class="bi bi-hearts"></i> </span>&nbsp&nbsp&nbsp&nbsp

					<c:choose>
						<c:when test="${Authority eq 'ROLE_MEMBER' }">
							<c:set var="mypageUrl" value="mypage.do?gym_code=${UserInfo.gym_code}&mem_id=${UserEmail}" />
							<span class="spoka"><i class="bi bi-c-circle"></i>보유포인트 : ${UserPoint }&nbsp&nbsp</span>
							<a href="${mypageUrl}"><i class="bi bi-person-fill"></i> MyPage</a>&nbsp&nbsp
							<a href="/cartList.do"><i class="bi bi-cart"></i> 장바구니</a>&nbsp&nbsp
							<a href="#" onclick="logoutcheck()"><i class="bi bi-box-arrow-right"></i> LogOut</a>&nbsp&nbsp
						</c:when>
						<c:otherwise>
							<c:set var="mypageUrl" value="calendar.do" />
							<a href="${mypageUrl}"><i class="bi bi-person"></i> MyPage</a>&nbsp&nbsp
							<a href="#" onclick="logoutcheck()"><i class="bi bi-box-arrow-right"></i> LogOut</a>&nbsp&nbsp
						</c:otherwise>
					</c:choose>
				</c:if>
	
				<c:if test="${empty UserName}">
					<a href="/login.do"><i class="bi bi-box-arrow-in-right"></i> Sign-In</a>&nbsp&nbsp
					<a href="/signup.do"><i class="bi bi-plus-circle"></i> Sign-Up</a>&nbsp&nbsp
				</c:if>
			</div>
			
			<!-- Logo -->
			<div class="logo">
				<h1>
					<a href="main">
						<img src="static/assets/images/bodycoding_logo.png">
					</a>
				</h1>
			</div>
			
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="current"><a href="/main">Home</a></li>
					<!-- 드롭다운의 시작 li ->a태그로 감싸야 드롭다운됨  -->
					<li><a href="introgym">BodyCoding</a>
						<ul>
							<li><a href="introgym">About</a></li>

						</ul></li>

					<li><a href="health">Program</a>
						<ul>
							<li><a href="health">헬스</a></li>
							<li><a href="pt">PT</a></li>
							<li><a href="yoga">요가</a></li>
							<li><a href="gx">GX</a></li>
							<li><a href="pila">필라테스</a></li>
						</ul></li>

					<li><a href="gym">Location</a></li>

					<li><a href="trainer">Trainer</a></li>

					<li><a href="product">Shop</a></li>

					<li>
                     <a href="/Freeboard.do">Board</a>
                     <ul> 
                        <li><a href="/Freeboard.do">Board</a></li>
                        <li><a href="#" onclick="openChatRoom(event, '${UserEmail}', '${UserName }');">1:1문의(웹소켓 채팅)</a></li>
                     </ul>
                  </li>
				</ul>
			</nav>
		</div>
	</div>

	<!-- Scripts -->
	<script src="../static/assets/js/jquery.min.js"></script>
	<script src="../static/assets/js/jquery.dropotron.min.js"></script>
	<script src="../static/assets/js/browser.min.js"></script>
	<script src="../static/assets/js/breakpoints.min.js"></script>
	<script src="../static/assets/js/util.js"></script>
	<script src="../static/assets/js/main.js"></script>

</body>
</html>