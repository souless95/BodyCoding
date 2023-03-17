<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
}
.chat_ui .clear{
   clear: both;
}
.chat_ui .chating{
   height: calc(100% - 72px);
   font-size: 12px;
   overflow-y: scroll;
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
   position: relative;
   width: 8px;
   height: 22px;
   background: url(/static/uploads/img/chat_balloon_yellow.right.png) no-repeat;
   z-index: 1;
}
.chat_ui .chating .others{
   float: left;
   width: 100%;
}
.chat_ui .chating .others .box{
   float: left;
   width: calc(100% - 48px);
}
.chat_ui .chating .others .box .profile_name{
   font-size: 12px;
}
.chat_ui .chating .others .box .a{
   float: left;
   position: relative;
   width: 8px;
   height: 22px;
   background: url(/static/uploads/img/chat_balloon_white.left.png) no-repeat;
   z-index: 1;
}
.chat_ui .chating .others .box .b{
   float: left;
   position: relative;
   min-height: 24px;
   max-width: calc(100% - 64px);
   left: -2px;
   background-color: #ffffff;
   border-radius: 3px;
   z-index: 2;
   padding: 0px 4px 0px 4px;
   word-break: break-all;
}
.chat_ui .chating .others .box .time{
   float: left;
}
.textarea{
   float: left;
   width: calc(100% - 68px);
   height: 60px;
   border-radius: 8px 0px 0px 8px;
   margin: 0px 0px 0px 0px;
   padding: 2px 2px 2px 2px;
   resize: none;
}
.button{
    float: right;
   width: 62px;
   height: 66px;
   background-color: #ffec42;
   border-radius: 0px 8px 8px 0px;
   margin: 0px 0px 0px 0px;
   padding: 0px 0px 0px 0px;
   text-align: center;
   display: table;
   cursor: pointer; 
}
</style>
</head>
<body>
<script type="text/javascript">
   window.onload = function() {
      chatName();
   };
   
   var ws;

   function wsOpen(){
      //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
      ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomName").val());
      wsEvt();
   }
      
   function wsEvt() {
      
      ws.onopen = function(data){
         //소켓이 열리면 동작
      }
      
      ws.onmessage = function(data) {
         //메시지를 받으면 동작
         var msg = data.data;
         console.log(msg);
         if(msg != null && msg.trim() != ''){
            var d = JSON.parse(msg);
            var time = nowTime();
            if(d.type == "getId"){
               var si = d.sessionId != null ? d.sessionId : "";
               if(si != ''){
                  $("#sessionId").val(si); 
                  console.log("나는getId에 잇수다");
                  console.log('${memberid}');               
               }
            }else if(d.type == "message"){
               if(d.sessionId == $("#sessionId").val()){
                  console.log("나는getI1d에 잇수다");
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
                  "<div class=\"profile_name\">"+d.mem_id+"\n"+
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
   }
   
   function chatName(){
      var userName = $("#mem_id").val();
      wsOpen();
      $("#yourName").hide();
      $("#yourMsg").show();
   }

   function send() {
      var option ={
         type: "message",
         roomname: $("#roomName").val(),
         sessionId : $("#sessionId").val(),
         mem_id : $("#mem_id").val(),
         msg : $("#content").val()
      }
      ws.send(JSON.stringify(option))
      $('#content').val("");
   }
   
   function nowTime(){
      var d = new Date();
      var ampm = (d.getHours()>=12? "오후" : "오전");
      var h = (d.getHours()>12 ? d.getHours()-12 : d.getHours());
      var m = d.getMinutes();
      
      return h+":"+m+" "+ampm;
   }
   /*웹 페이지가 언로드(unload)되기 전에 발생하는 이벤트
   페이지를 닫을 때, 뒤로 가기 버튼을 눌렀을 때, 
   주소 표시줄에 URL을 입력하고 엔터 키를 눌렀을 때 등과 같은 상황에서 발생
   */
   //window.addEventListener('beforeunload', function(){
   $(function(){
      $(document).on('keypress', function(e) {
          if (e.which === 13) {
             $('#sendBtn').trigger('click');
          }
      });
      $('#sendBtn').on('click', function(){
         
         var m_id = $("#mem_id").val();
          var roomName = $("#roomName").val();
         var content= $("#content").val();
         console.log(m_id+"룸이름"+roomName+"내용"+content);
         
          $.ajax({
           url: '/saveChatLog',
           contentType: "application/json; charset=utf-8",
           data: {
            send_id: m_id,
            roomName: roomName,
            content: content,
           },
           dataType: 'text',
           async: false,
           success: function(data) {
             console.log("성공");
             send();
           },
           error: function(xhr, status, error) {
             // 저장 실패 시 에러 메시지를 출력합니다.
             console.log(error);
           }
         });
      });
   });
</script>
   <input type="hidden" id="sessionId" value="">
   <input type="hidden" id="roomidx" name="roomidx" value="${roomidx}">
   <input type="hidden" id="roomName" name="roomName" value="${roomName }" />
   <div class="chat_ui" id="chat_ui" style="width: 450px; height: 610px;">
      <div id="chating" class="chating">
      <c:forEach var="c" items="${cList }">
         <c:choose>
            <c:when test="${c.send_id eq memberid}">
               <div class="me" style="margin-top:10px;"><div class="b">
                  </div>
                  <div class="a" style="padding:6px 8px 0px 5px;">
                  ${c.content }
                  </div>
                  <div class="time">
                  ${c.regidate }
                  </div>
               </div>
            </c:when>
            <c:otherwise>
               <div class="others" style="margin-top:10px;"><div class="box"><div class="profile_name">${c.send_id}
                  </div>
                  <div class="a"></div>
                  <div class="b" style="padding:6px 8px 0px 5px;">${c.content }
                  </div>
                  <div class="time">${c.regidate }
                  </div>
                  </div>
               </div>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      </div>
      <div id="yourName">
         <table class="inputTable">
            <tr>
               <th>사용자명</th>
               <th><input class="textarea1" type="text" name="mem_id" id="mem_id" value="${memberid }"></th>
               <th><button class="button" id="reginame" onclick="chatName()">이름 등록</button></th>
            </tr>
         </table>
      </div>
      <div id="yourMsg">
         <div class="inputTable">
             <textarea class="textarea" id="content" name="content"></textarea>
             <button class="button" id="sendBtn">
                전송
             </button>
             <div class="clear"></div>
         </div>
      </div>
   </div>
</body>
</html>