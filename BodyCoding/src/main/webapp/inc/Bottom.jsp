<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<style>
/*플로팅 버튼*/
.floating-button {
  display: flex;
  position: fixed;
  right: 10px;
  bottom: 15px;
  z-index: 999;
  border-bottom: none;
} 
.chat_bot :hover{cursor: pointer;}
</style>
	
<!--하단 플로팅 버튼 시작-->
<div class="floating-button">
 	<span class="chatbot">
	     <a class="chat_bot" onclick="window.open('https://console.dialogflow.com/api-client/demo/embedded/99601361-7f7a-481e-8a8c-322cb8198841','chat','width=450px, height=650px, location=no, status=no, scrollbars=yes')">
	    	<img src="static/member/images/챗봇.png" style="width: 50px; height: 50px;" >
	    </a>
	</span>
</div>
		
		
<!-- Footer -->
<div id="footer">
	<div class="container">
		<div class="row">
			여러분의 의견을 받습니다 Bottom을 무엇을 추가하면 좋을까아
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
			<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="/main">바디코딩</a></li>
		</ul>
	</div>
</div>
