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

<!-- Footer -->

<div id="footer" >
<!--하단 채팅플로팅 버튼 시작-->
	<div class="floating-button">
	 	<span class="chatbot">
	    <!--  <a class="chat_bot" href="https://bot.dialogflow.com/99601361-7f7a-481e-8a8c-322cb8198841"> -->
	     <a class="chat_bot" onclick="window.open('https://console.dialogflow.com/api-client/demo/embedded/99601361-7f7a-481e-8a8c-322cb8198841','chat','width=450px, height=650px, location=no, status=no, scrollbars=yes')">
	     	<img src="static/member/images/챗봇.png" style="width: 50px; height: 50px;" ></a>
				</span>
	</div>
<!--하단 채팅플로팅 버튼 끝-->
<!-- Copyright -->
	<div class="copyright">
		<img src="static/assets/images/logo-bottom.png" width="300px;" height="300px;" style="float: left;">
		<p>상호명 : 바디코딩 
			<span>ㅣ</span> 대표 : 정은솔, 한세영, 천희수, 김도형, 백용현, 이재필 
			<span>ㅣ</span> 사업자등록번호 : 488-28-01014 
			<br>
			주소 : 서울시 종로구 우정국로2길 21 대왕빌딩 7층 702호
			<span>ㅣ</span> E-mail : yj6807@gmail.com 
		</p>
		<p>Copyright ⓒ (주)바디코딩, All rights reserved</p>
	</div>
</div>
