<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
	<link href="https://fonts.cdnfonts.com/css/myriad-pro" rel="stylesheet">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../static/assets/css/main.css" />
<style type="text/css">
/* h1 {
  position: relative;
  text-align: center;
  color: #353535;
  font-size: 50px;
  font-family: "Cormorant Garamond", serif;
}

p {
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  font-size: 18px;
  color: #676767;
}
.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
} */
button {
  margin: 20px;
  outline: none;
}
.custom-btn {
  width: 130px;
  height: 40px;
  border: 2px solid #99DAEA;
  border-radius : 10px;
  font-family: 'Lato', sans-serif;
  background-color:#99DAEA;
  color:white;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
}

/* 1 */
.btn-1 {
  transition: all 0.3s ease;
}
.btn-1:hover {
   box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
}
.container{
	min-height: 730px;
}
</style>
<script type="text/javascript">

function logoutcheck(){
   
   var confirmed = confirm("정말로 로그아웃 하시겠습니까?");
   
   if(confirmed){
      location.href="logout.do"
   }
}

/* 1대1문의 윈도우창 생성 */
function openChatRoom(event, mem_id){
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
	        win.location.href = "/moveChating?roomName=" + mem_id + "-admin_super1&mem_id=" + mem_id;
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
					<!-- Logo -->
						<h1><a href="main" id="logo"><span style="font-weight:bold; font-size:40px; font-family: 'Myriad Pro', 'sans-serif';">
						Body Coding</span></a></h1>
					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="/main">Home</a></li>
								<!-- 드롭다운의 시작 li ->a태그로 감싸야 드롭다운됨  -->
								<li>
									<a href="introgym">BodyCoding</a>
									<ul>
										<li><a href="introgym">바디코딩소개</a></li>
																				
									</ul>
								</li>
								
								<li>
							<a href="health"> 프로그램</a>
							<ul>
								<li><a href="health">헬스</a></li>
								<li><a href="pt">PT</a></li>
								<li><a href="yoga">요가</a></li>
								<li><a href="gx">GX</a></li>
								<li><a href="pila">필라테스</a></li>
							</ul>
						</li>
						
						<li>
							<a href="gym">지점정보</a>
						<!-- 	<ul>
								<li><a href="gym">지점확인</a></li>
							</ul> -->
						</li>
						
						<li>
							<a href="trainer">트레이너</a>
						<!-- 	<ul>
								<li><a href="trainer">트레이너정보</a></li>
							</ul> -->
						</li>
						
						<li>
							<a href="product">상품몰</a>
						</li>
						
						<li>
							<a href="/Freeboard.do">게시판</a>
							<ul> 
								<li><a href="/Freeboard.do">자유게시판</a></li>
								<li><a href="#" onclick="openChatRoom(event, '${UserEmail}');">1:1문의(웹소켓 채팅)</a></li>
							</ul>
						</li>
						
						
						<c:if test="${not empty UserName}">
						    <li style="color: white;">
						        [ ${UserName} ]님 환영합니다.
						    </li>
						    <c:choose>
						        <c:when test="${Authority eq 'ROLE_MEMBER' }">
						            <c:set var="mypageUrl" value="mypage.do?gym_code=${UserInfo.gym_code}" />
						            <li>
						                <a href="${mypageUrl}">마이페이지</a>
						                <ul> 
						                    <li><a href="#">이용내역</a></li>
						                    <li><a href="#">활동내역</a></li>
						                    <li><a href="#">운동관리</a></li>
						                    <li><a href="pwcheck">정보수정</a></li>
						                    <li><a href="/cartList.do">장바구니</a></li>
						                </ul>
						            </li>
						            <li>
						                <a href="#" onclick="logoutcheck()">로그아웃</a>
						            </li>
						        </c:when>
						        
						        <c:otherwise>
						            <c:set var="mypageUrl" value="trainermypage.do?gym_code=${UserInfo.gym_code}" />
						            <li>
						                <a href="${mypageUrl}">마이페이지</a>
						                <ul> 
						                    <li><a href="/memberlistT.do">회원목록</a></li>
						                    <li><a href="calendar.do">운동정보</a></li>
							   				<li><a class="btn" href='javascript:void(0);' onclick='mytrainerInfo("${UserEmail}","${UserGymCode}");'>내 정보</a></li>
						                </ul>
						            </li>
						            <li>
						                <a href="#" onclick="logoutcheck()">로그아웃</a>
						            </li>
						        </c:otherwise>
						    </c:choose>
						</c:if>
			            
			            <c:if test="${empty UserName}">
						<li>
			                    <a href="/login.do">로그인</a>
			            </li>
			           
			            <li>
			                    <a href="/signup.do">회원가입</a>
			            </li>
			            </c:if>
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