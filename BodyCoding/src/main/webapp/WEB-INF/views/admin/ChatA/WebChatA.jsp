<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
  src="https://code.jquery.com/jquery-3.6.3.js"
  integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
  crossorigin="anonymous"></script>
</head>
<body>
<script type="text/javascript">
//채팅에서 사용할 전역변수를 선언한다.
var messageWindow;	//대화내용이 출력될 엘리먼트
var inputMessage;	//대화 입력 상자
var chat_id;		//클라이언트의 대화명(아이디)
var webSocket;		//웹소켓 객체를 저장
var logWindow;		//대화창 아래에 로그를 출력할 엘리먼트

window.onload = function() {
	//전역변수로 선얺나 엘리먼트의 DOM객체를 얻어와서 저장한다.
   messageWindow = document.getElementById("messageWindow");
   inputMessage = document.getElementById("inputMessage");
   chat_id = document.getElementById("chat_id").value;
   logWindow = document.getElementById('logWindow');
   
   //대화내용이 길어졌을때 스크롤바를 항상 아래로 내려주는 역할을 한다.
   messageWindow.scrollTop = messageWindow.scrollHeight;
   
   //webSocket = new WebSocket('ws://나의아이피주소:8585/websocket/EchoServer.do');
   webSocket = new WebSocket('ws://localhost:8585/websocket/EchoServer.do');
   //클라이언트가 접속했을때 함수를 호출. 이떄 event객체를 전달한다.
   webSocket.onopen = function(event){
      wsOpen(event);
   };
   //클라이언트가 서버로 메세지를 보냈을때 호출
   webSocket.onmessage = function(event){
      wsMessage(event);
   };
   //접속을 종료했을때 호출
   webSocket.onclose = function(event){
      wsClose(event);
   };
   //채팅중 에러가 발생했을때 호출
   webSocket.onerror = function(event){
      wsError(event);
   };
}
//클라이언트가 접속하면 로그윈도우에 메세지를 출력한다.
function wsOpen(event){
   wirteResponse("연결성공");
}
//서버로 메세지가 도착했을때 호출
function wsMessage(event){
	/* 메세지를 |(파이프) 기호로 분리하여 앞부분은 보낸사람의 아이디,
	뒷부분은 메세지로 각각의 변수에 저장한다.*/
   var message = event.data.split("|");
   var sender = message[0];
   var content = message[1];
   var msg;
   
   //로그윈도우에 출력한다.
   writeResponse(event.data);
   
   if(content == ""){
	   //전송된 내용이 없다면 처리할 것이 없다.
   }
   else{
	   //대화내용에 /가 포함되어 있다면 명령어로 판단한다.
      if(content.match("/")){
    	  /* 현재 접속한 클라이언트의 아이디를 이용해서 본인한테 온 귓속말인지
    	  판단한다. 아래 chat_id는 현재 페이지 로드시 접속한 아이디를 통해
    	  전역변수에 저장되어있는 값이다. 따라서 받는 사람이 본인인 경우에만
    	  대화내용을 디스플레이한다.*/
         if(content.match(("/"+chat_id))) {
        	 //명령어 부분을 '귓속말'로 변경한다.
            var temp = content.replace(("/"+chat_id),"[귓속말]");
        	 //메세지에 디자인을 적용하기 위해 호출하는 함수
            msg = makeBalloon(sender, temp);
        	 //대화창의 내용을 출력한다. 
            messageWindow.innerHTML += msg;
        	 //대화창의 스크롤바를 항상 아래로 내려준다.
            messageWindow.scrollTop = messageWindow.scrollHeight;
         }
      }
      else{
		//대화내용에 /가 없다면 일반메세지 이므로 모든 클라이언트에게
		//디스플레이 한다.
    	msg = makeBalloon(sender, content);
        messageWindow.innerHTML += msg;
        messageWindow.scrollTop += messageWindow.scrollHeight;
      }
   }
}
//접속이 종료되었을때 호출
function wsClose(evnet){
   wirteResponse("대화 종료");
}
//에러가 발생했을때 호출
function wsError(evnet){
   wirteResponse("에러 발생");
   wirteResponse(event.data);
}
//메세지 출력시 디자인을 적용하기 위한 함수. 메세지를 div태그로 감싸준다.
function makeBalloon(id, cont){
   var msg = '';
   msg += '<div>'+id+":"+cont+'<div>';
   return msg;
}
//클라이언트가 서버로 메세지를 전송할때 호출하는 함수
function sendMessage(){
	//웹소켓 서버로 메세지를 전송할때 파이프 기호를 통해 아이디와 내용을 조립해서
	//보낸다. 차후 이를 파싱하여 전송자와 메세지를 구분하게된다.
   webSocket.send(chat_id+"|"+inputMessage.value);
	
	/* 내가 보낸 메세지를 대화창에 디스플레이한다. 일반적으로 내가 작성한 메세지는
	우측정렬된다. 서버로 메세지를 전송하면 나를 제외한 나머지 클라이언트에게만 
	전송되도록 서버에 설정되어있다. */
   var msg = '';
   msg += '<div style="text-align:right;">'+inputMessage.value+'<div>';   
   messageWindow.innerHTML += msg;
   //대화창에 입력된 내용을 지운다. 그래야 다음 내용을 쉽게 입력할 수 있다.
   inputMessage.value="";
   //스크롤바를 아래로 내려준다. 
   messageWindow.scrollTop = messageWindow.scrollHeight;
}
//눌러진 키보드의 keyCode를 이벤트를 통해 확인한 후 엔터키이면 함수를 호출한다.
function enterkey(){
   if(window.event.keyCode==13){
      sendMessage();
   }
}
//대화창 아래 로그윈도우에 매개변수로 전달된 내용을 추가한다.
function writeResponse(text){
   logWindow.innerHTML += "<br/>"+text;
}
</script>
<div class="container">
	<!-- 채팅창을 오픈할때 파라미터로 전달된 값을 EL로 받아서 입력한다. -->
    <input type="hidden" id="chat_id" value="${param.chat_id }" />
    <input type="hidden" id="chat_room" value="${param.chat_room }" />
    <!-- 대화내용을 디스플레이 되는 부분 -->
    <div id="messageWindow" class="border border-primary" style="height:300px; overflow:auto;">
       <div style="text-align:right;">내가쓴거</div>
       <div>상대가보낸거</div>
    </div>
    <table class="table table-bordered">
       <tr>
          <td>방명:</td>
          <td>${param.chat_room }</td>
       </tr>
       <tr>
          <td>닉네임:</td>
          <td>${param.chat_id }</td>
       </tr>
       <tr>
          <td>메시지:</td>
          <td>
          <!-- 메세지를 입력한 후 "전송" 버튼을 누르거나, 엔터키를 누르면
          sendMessage()함수를 호출하여 대화내용을 웹소켓서버로 전송한다.
          특히 onekeyup 이벤트 리스너를 통해 눌러진 키보드가 Enter키인지
          판단하는 부분이 추가되어있다. -->
             <input type="text" id="inputMessage" class="form-control float-left mr-1" style="width:75%"
             onkeyup="enterkey();" />
             <input type="button" id="sendBtn" onclick="sendMessage();" value="전송" class="btn btn-info float-left" />
          </td>
       </tr>
    </table>

       
    <!-- 전송된 모든 내역이 그대로 디스플레이 되는 부분 -->
   <div id="logWindow" class="border border-danger" style="/*히든처리용 display:none; */ height:130px; overflow:auto;"></div>
</div>
</body>
</html>