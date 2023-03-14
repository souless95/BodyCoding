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
	#event-info {
		display: none;
		position: absolute;
		z-index: 9999;
		background-color: #fff;
		border: 1px solid #ccc;
		padding: 10px;
		max-width: 400px;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
    	let lastClickTime = null;
    	let tempArray = [
			<c:forEach items="${cList}" var="c">
			{
				id : "<c:out value="${c.id}" />",
				title: "<c:out value="${c.title}" />",
			  	start: "<c:out value="${c.start}" />",
			  	end: "<c:out value="${c.end}" />",
			  	lesson_category: "<c:out value="${c.category}" />",
			  	lesson_capacity: "<c:out value="${c.capacity}" />",
			  	rCount: "<c:out value="${c.rCount}" />",
			  	<c:if test="${c.names != null}">
			    	names: "<c:out value="${c.names}" />"
			    </c:if>
			},
			</c:forEach>
  		];
    	
     	var calendarEl = document.getElementById('calendar');
    	var calendar = new FullCalendar.Calendar(calendarEl, {
       		initialView: 'dayGridMonth', //초기화면 설정(디폴트 월별로 설정됨. 바꾸고 싶으면 timeGridWeek timeGridDay)
        	locale: 'ko', //언어설정
        	navLinks: true,
        	selectOverlap: false,
        	selectable: true, //날짜 클릭 가능
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
	        buttonText: { //영문명 버튼 명칭 지정
	        	today: '오늘',
	        	month: '월',
	        	week: '주',
	        	day: '일',
	        },
	        headerToolbar: { //상단에 출력되는 기본옵션.
	            right: 'dayGridMonth,timeGridWeek,timeGridDay', 
	            center: 'prev title next',
	            left: 'today',
	        },
		    events: //DB에 저장된 스케쥴 로드하여 달력에 표시 
		    	tempArray,
	      	dateClick: function(info) { //클릭시 일정등록 기능
	      		window.calendarRef = calendar;
	      		if(info.dateStr.indexOf("T") != -1){ //콘솔에러를 막기위한 if문
	      			var start = info.dateStr;
	      			localStorage.setItem('start', start);
		      		var end = new Date(info.date.getTime() + (10 * 60 * 60 * 1000)).toISOString().replace(".000Z", "+09:00");
		      		localStorage.setItem('end', end);
		      		var timeA = info.dateStr.split("T");
		      		var timeB = parseInt(timeA[1].substr(0, 2));
		      		
		            if (timeB >= 6 && timeB <= 22) {
		            	
		      			open("/addCalendar1.do",
	   		            	"calendarRegist",
	    		            "width=500, height=300, left=500, top=100, "
	     		            + "location=no, toolbar=no, menubar=no, "
	      		            + "scrollbars=yes, resize=no");
		            }
		            else {}
	      		}
	      	},
	      	eventClick: function(info) {
	      		window.calendarRef = calendar;
	      	    let clickTime = new Date().getTime();
	      	 	var eventId = info.event.id;
	      	 	console.log(eventId);
	      		localStorage.setItem('lastClickedEventId', eventId);
	      	    if (lastClickTime != null && clickTime - lastClickTime <= 500) {
	      	    	window.open("/selectCalendar.do?eventId="+eventId,
	   		            	"calendarUpdate",
	    		            "width=500, height=300, left=500, top=100, "
	     		            + "location=no, toolbar=no, menubar=no, "
	      		            + "scrollbars=yes, resize=no");
	      	    }
	      	    lastClickTime = clickTime;
	     	},
	      	eventDrop: function(info) {
	      		var event = info.event;
	      		var start = new Date(Date.parse(event.start.toISOString()) + 9 * 60 * 60 * 1000).toISOString().replace(".000Z", "+09:00");
	      		var end = new Date(Date.parse(event.end.toISOString()) + 9 * 60 * 60 * 1000).toISOString().replace(".000Z", "+09:00");
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
        	} ,
        	eventMouseEnter: function(info) {
        		var event = info.event;
        		var title = event.title;
        		var category = event.extendedProps['lesson_category'];
        		var capacity = event.extendedProps['lesson_capacity'];
        		var rCount = event.extendedProps['rCount'];
        		var names = event.extendedProps['names'];

        		var eventInfo = document.getElementById('event-info');
        		var eventTitle = document.getElementById('event-title');
        		var eventDescription = document.getElementById('event-description');

        		eventDescription.innerHTML = "일정 : " + title 
        			+ "<br>분류 : " + category + "<br>정원 : " + rCount + " / " + capacity;
        		if (parseInt(rCount) >= parseInt(capacity)) {
       			    eventDescription.innerHTML += "<span style='color:red;'>&nbsp;(마감)</span>";
       			};
       			if(names.length > 2){
	       			eventDescription.innerHTML += "<br>참여자 : " + names.substring(1, names.length-1);
       			}
        	}
      	});
      	calendar.render();
      
    	//이벤트를 클릭한 후 delete를 누르면 가장 최근 클릭한 이벤트를 삭제함
      	document.addEventListener('keydown', function(e) {
	      	if(event.key == 'Delete') {
	      		var lastClickedEventId = localStorage.getItem('lastClickedEventId');
	      		if(lastClickedEventId != null){
		      		const eventObj = calendar.getEventById(lastClickedEventId);
		      		var dConfirm = confirm("일정 "+ eventObj.title +"을 삭제하시겠습니까?");
		      		if(dConfirm){
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
		      			localStorage.removeItem('lastClickedEventId');
		      		}
		      		else{}
	      		}
      		}
    	});
    });
    
    $(document).on('mouseenter', '.fc-event', function(e) {
    	var eventInfo = $('#event-info');
    	eventInfo.css({
    		display: 'inline-block',
    	    top: e.pageY + 10,
    	    left: e.pageX + 10,
    	    textAlign: 'left',
    	    /* width: 'auto', */
    	    height: 'auto',
    	    verticalAlign: 'middle'
    	});
    });

    $(document).on('mouseleave', '.fc-event', function() {
    	$('#event-info').hide();
    });
</script>
<title>MyCalendar</title>
</head>
<body>
	<%@ include file ="../../../inc/Top.jsp" %>
	<%@ include file ="../../../inc/mypageside.jsp" %>
	<br />
    <h1>일정관리</h1>
  	<br /><br />
	<div id="event-info">
  		<h3 id="event-title"></h3>
  		<p id="event-description" style="white-space: pre-wrap;"></p>
	</div>
	<div id='calendar' style="width:800px; height:1500px;"></div>
	<%@ include file="../../../inc/Bottom.jsp" %>
</body>
</html>