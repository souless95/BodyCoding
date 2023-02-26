<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.fc-toolbar-chunk {
	    display: flex;
	    align-items: center;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script> <!-- 달력cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth', //초기화면 설정(디폴트 월별로 설정됨. 바꾸고 싶으면 timeGridWeek timeGridDay)
        locale: 'ko', //언어설정
        navLinks: true,
        selectable: true, //날짜 클릭 가능
        dragScroll: true, //날짜 드래그 가능
        editable: true,  //일정 수정 가능
        dayMaxEventRows: true, //월 달력에서 일별 표시되는 최대이벤트 기능 설정
        businessHours: true, //업무시간 기능. 아직 등록불가는 미구현.
        businessHours: {
        	  //daysOfWeek: [ 1, 2, 3, 4 ], // 0-6 일-월
        	  startTime: '09:00',
        	  endTime: '23:00',
        },
        buttonText: {
        	today: '오늘',
        	month: '월',
        	week: '주',
        	day: '일',
        },
        headerToolbar: { //상단에 출력되는 기본옵션
            right: 'dayGridMonth,timeGridWeek,timeGridDay', //cstButton
            center: 'prev title next',
            left: 'today',
        },
	    events: //DB에 저장된 스케쥴 로드하여 달력에 표시 
	    [
			<c:forEach var="c" items="${cList}">
				{
					id : "<c:out value="${c.id}" />",
					title: "<c:out value="${c.title}" />",
				  	start: "<c:out value="${c.start1}" />",
				},
			</c:forEach>
      	],
      	dateClick: function(info) {
      		var titleA = prompt("일정명을 입력하세요");
      		if(titleA != null || titleA == ''){
      			var eventData = {
                    title: titleA,
                    start: info.dateStr,
                    
                  };
      			$.ajax({
      				url: "/AddCalendar",
      				contentType: "application/json; charset=utf-8",
      				data: eventData,
      				dataType: 'text',
      				success: function(){
      					calendar.addEvent(eventData);
      				},
      				error: function(){
      					alert('일정 추가에 실패했습니다.');
      				}
      			});
      		}
      		else {}
      	},
      	eventClick: function(info){
      		var ii = calendar.getEventSourceById(info.event.id);
      		console.log(ii);
      		
      	}
      });
      calendar.render();
    });
</script>
<title>MyCalendar</title>
</head>
<body>
<%@ include file = "../views/member/inc/Top.jsp" %>
<div class="container">
<%@ include file ="../views/member/inc/mypageside.jsp" %>
  <h1>MyCalendar</h1>
  <div id='calendar' style="width:800px;"></div>
</div>
<%@ include file = "../views/member/inc/Bottom.jsp" %>
</body>
</html>