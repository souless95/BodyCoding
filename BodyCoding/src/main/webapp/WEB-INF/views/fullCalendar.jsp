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
    	let tempArray = [
			<c:forEach var="c" items="${cList}">
			{
				id : "<c:out value="${c.id}" />",
				title: "<c:out value="${c.title}" />",
			  	start: "<c:out value="${c.start1}" />",
			  	end: "<c:out value="${c.end}" />"
			},
			</c:forEach>
  		];
    	
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth', //초기화면 설정(디폴트 월별로 설정됨. 바꾸고 싶으면 timeGridWeek timeGridDay)
        locale: 'ko', //언어설정
        navLinks: true,
        selectable: true, //날짜 클릭 가능
        selectOverlap: function(event) {
            return event.rendering === 'background';
        },
        eventAllow: function(info) {
            var start = info.start;
            var end = info.end;
            var startTime = start.getHours() * 60 + start.getMinutes();
            var endTime = end.getHours() * 60 + end.getMinutes();
            if (startTime >= 6 * 60 && endTime <= 23 * 60) {
              return true;
            }
            return false;
        },
        dragScroll: true, //날짜 드래그 가능
        editable: true,  //일정 수정 가능
        dayMaxEventRows: true, //월 달력에서 일별 표시되는 최대이벤트 기능 설정
        businessHours: true, //업무시간 기능. 아직 등록불가는 미구현.
        businessHours: {
        	  daysOfWeek: [0, 1, 2, 3, 4, 5, 6], // 0-6 일-월
        	  startTime: '06:00',
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
	    	tempArray ,
      	dateClick: function(info) {
      		const date = new Date(info.dateStr);
      		const end = new Date(date.getTime() + (10 * 60 * 60 * 1000)).toISOString().replace(".000Z", "+09:00");
      		timeA = info.dateStr.split("T");
      		var timeB = parseInt(timeA[1].substr(0, 2));
      		console.log(timeB);
      		
            if (timeB >= 6 && timeB <= 22) {
	      		var titleA = prompt("일정명을 입력하세요");
	      		if(titleA == null || titleA.trim() == ''){}
	      		else {
	      			var eventData = {	                   
	      				title: titleA,
	                    start: info.dateStr,
	                    end: end
	                };
	      			$.ajax({
	      				url: "/AddCalendar",
	      				contentType: "application/json; charset=utf-8",
	      				data: eventData,
	      				dataType: 'text',
	      				success: function(resData){	
	      					eventData.id = resData;
	      					calendar.addEvent(eventData);
	      				},
	      				error: function(){
	      					alert('일정 추가에 실패했습니다.');
	      				}
	      			});
	      		}
            }
            else {}
      	},
      	eventClick: function(info){
      		var eventId = info.event.id;
      		console.log(eventId);
      		localStorage.setItem('lastClickedEventId', eventId);
      		
      	},
      	eventDrop: function(info) {
      	  var event = info.event;
      	  var start = new Date(Date.parse(event.start.toISOString()) + 9 * 60 * 60 * 1000).toISOString().replace(".000Z", "+09:00");
      	  var end = new Date(Date.parse(event.end.toISOString()) + 9 * 60 * 60 * 1000).toISOString().replace(".000Z", "+09:00");
      	  console.log(start);
      	  var eventData = {
      	    id: event.id,
      	    start: start,
      	    end: end
      	  };
      	  $.ajax({
      	    url: "/updateCalendar",
      	    contentType: "application/json; charset=utf-8",
      	    data: eventData,
      	    dataType: 'text',
      	    success: function(){
      	      calendar.refetchEvents();
      	    },
      	    error: function(){
      	      alert('일정 업데이트에 실패했습니다.');
      	    }
      	  });
      	},
      	eventResize: function(info) {
        	  var event = info.event;
        	  var end = new Date(Date.parse(event.end.toISOString()) + 9 * 60 * 60 * 1000).toISOString().replace(".000Z", "+09:00");
        	  console.log(end);
        	  var eventData = {
        	    id: event.id,
        	    end: end
        	  };
        	  $.ajax({
        	    url: "/updateCalendar2",
        	    contentType: "application/json; charset=utf-8",
        	    data: eventData,
        	    dataType: 'text',
        	    success: function(){
        	      calendar.refetchEvents();
        	    },
        	    error: function(){
        	      alert('일정 업데이트에 실패했습니다.');
        	    }
        	  });
        	},
      });
      calendar.render();
      
      //이벤트를 클릭한 후 delete를 누르면 가장 최근 클릭한 이벤트를 삭제함
      document.addEventListener('keydown', function(e) {
      	if (event.key == 'Delete') {
      		var lastClickedEventId = localStorage.getItem('lastClickedEventId');
      		const eventObj = calendar.getEventById(lastClickedEventId);
      		var dConfirm = confirm("일정 "+ eventObj.title +"을 삭제하시겠습니까?");
      		if(!dConfirm) {}
      		else {
      			$.ajax({
	  				url: "/deleteCalendar",
	  				contentType: "application/json; charset=utf-8",
	  				data: {lastClickedEventId : localStorage.getItem('lastClickedEventId') },
	  				dataType: 'text',
	  				success: function(){
	  					eventObj.remove();
	  					localStorage.removeItem('lastClickedEventId');
	  				},
	  				error: function(){
	  					alert('일정 삭제에 실패했습니다.');
	  				}
	  			});
      		}
      	}
      });
    });
</script>
<title>MyCalendar</title>
</head>
<body>
<%-- <%@ include file = "../views/member/inc/Top.jsp" %>
<div class="container">
<%@ include file ="../views/member/inc/mypageside.jsp" %> --%>
  <h1>MyCalendar</h1>
  <div id='calendar' style="width:800px;"></div>
</div>
<%-- <%@ include file = "../views/member/inc/Bottom.jsp" %> --%>
</body>
</html>