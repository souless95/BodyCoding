<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
</head>
<body>
<script>
   //채팅창을 오픈하기 위해 생성
   function openChat(){
      //채팅아이디(대화명)가 입력되었는지 확인한다.
      var id = document.getElementById("chat_id");
      //선택된 채팅방을 읽어온다.
      var roomName = id.value+"-Room";
      var adminChatURL = "WebChatA.do?chat_id=admin_sub1&chat_room="+roomName;
      /*
      window.open(오픈할페이지의URL, 창의이름, 창의속성);
         창의 이름이 동일한 경우 항상 같은 창에서 열리게 되므로 각각의 창을
         띄우기 위해 서로 다른 이름을 지정해야한다. 여기서는 대화명과 방번호를
         통해 적용하고 있다.
      */
      window.open(adminChatURL, roomName+"-admin_sub1", "width=500,height=700");
   }
</script>
<div class="container">   
   <h2>짜자잔~ 절거운 운영자와의 1대1 맞짱 서비스입니다.</h2>
   <table border=1 cellpadding="10" cellspacing="0">
      <input type="hidden" id="chat_id" value="${member }" />
      <tr>
         <td colspan="2" style="text-align:center;">
            <button type="button" onclick="openChat();" 
               class="btn btn-primary">채팅창열기</button>            
         </td>
      </tr>
   </table>
</div>
</body>
</html>