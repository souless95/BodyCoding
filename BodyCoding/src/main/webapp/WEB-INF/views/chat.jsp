<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Chating</title>
<style>
*{
	margin: 0;
}
.chat_ui{
	background-color: #9bbad8;
	padding: 4px 4px 0px 4px;
	overflow-y: scroll;
}
.chat_ui .clear{
	clear: both;
}
.chat_ui .chating{/* 여기 뭔가이상해 수정해봐 */
	height: calc(100% - 72px);
	font-size: 12px;
}
.chat_ui .chating .time{
	font-size: 10px;
}
.chat_ui .chating .me{
	float: right;
	width: 100%;
}
.chat_ui .chating .me .time{
	float: right;
	bottom: 0;
}
.chat_ui .chating .me .a{
	float: right;
	position: relative;
	min-height: 24px;
	max-width: calc(100% - 64px);
	left: 2px;/*이거는 일단 4가 최대*/
	background-color: yellow;
	border-radius: 3px;
	z-index: 2;
	padding: 0px 4px 0px 4px;
	word-break: break-all;
}
.chat_ui .chating .me .b{
	float: right;
}
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
.chat_ui 
</style>
</head>

<script type="text/javascript">
	
	var ws;

	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
		wsEvt();
	}
		
	function wsEvt() {
		
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				var time = nowTime();
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<div class='me' style='margin-top:10px;'>" + 
						"<div class=\"b\">\n"+
						"</div>\n"+
						"<div class=\"a\" style='padding:6px 8px 0px 5px;'>\n"+
						d.msg+"\n"+
						"</div>\n" +
						"<div class=\"time\">\n"+
						time+"\n"+ 
						"</div>\n"+
						"</div>\n");
					}else{
						$("#chating").append("<div class='others' style='margin-top:10px;'>" + 
						"<div class=\"box\">"+
						"<div class=\"profile_name\">"+d.mem_name+"\n"+
						"</div>\n"+
						"<div class=\"a\">"+
						"</div>\n"+
						"<div class=\"b\" style='padding:6px 8px 0px 5px;'>"+
						d.msg+"\n"+
						"</div>\n" +
						"<div class=\"time\">"+
						time+"\n"+ 
						"</div>\n"+
						"</div>\n"+
						"</div>\n");
					}
					$('#chating').scrollTop($('#chating')[0].scrollHeight);
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var mem_name = $("#mem_name").val();
		if(mem_name == null || mem_name.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#mem_name").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			mem_name : $("#mem_name").val(),
			msg : $("#content").val()
		}
		ws.send(JSON.stringify(option))
		$('#content').val("");
	}
	
	function nowTime(){
		var d = new Date();
		var ampm = (d.getHours()>=12? "PM" : "AM");
		var h = (d.getHours()>12 ? d.getHours()-12 : d.getHours());
		var m = d.getMinutes();
		
		return ampm+" "+h+":"+m;
	}
</script>
<body>
	<h1>${roomName}의 채팅방</h1>
	<input type="hidden" id="sessionId" value="">
	<input type="hidden" id="roomNumber" value="${roomNumber}">
		
	<div class="chat_ui" id="chat_ui" style="width: 320px; height: 480px;">
		<div id="chating" class="chating">
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input class="textarea1" type="text" name="mem_name" id="mem_name" value=""></th>
					<th><button class="button" onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<div class="inputTable">
			    <textarea class="textarea" id="content"></textarea>
			    <div class="button" id="sendBtn" onclick="send();">
			 	   <p>전송</p>
			    </div>
			    <div class="clear"></div>
			</div>
		</div>
	</div>
</body>
</html>