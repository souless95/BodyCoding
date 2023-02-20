<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        views: {
          timeGrid: {
            dayMaxEventRows: 6
          }
        },
        buttonText: {
        	today: '오늘',
        	month: '월',
        	week: '주',
        	day: '일',
        },
        customButtons: {
        	cstButton: {
              text: '일정추가',
              click: function() {
            	  var titleA = prompt("일정명을 입력하세요")
                  var dateStr = prompt('Enter a date in YYYY-MM-DD format');
                  var date = new Date(dateStr + 'T00:00:00'); // will be in local time

                  if (!isNaN(date.valueOf())) { // valid?
                    calendar.addEvent({
                      title: titleA,
                      start: date,
                      allDay: true
                    });
                    alert('Great. Now, update your database...');
                  } else {
                    alert('Invalid date.');
                  }
                }
            }
        },
        headerToolbar: { //상단에 출력되는 기본옵션
            right: 'cstButton dayGridMonth,timeGridWeek,timeGridDay',
            center: 'prev title next',
            left: 'today',
        },
	    events: [
	   	    { 
	   	      title: '축제', 
	   	      start: '2023-02-21', 
	   	      //end: '2023-02-23' 
	   	    },
	   	  { 
		   	      title: '축제2', 
		   	      start: '2023-02-21', 
		   	      //end: '2023-02-23' 
		   	    },
		   	 { 
			   	      title: '축제3', 
			   	      start: '2023-02-21', 
			   	      //end: '2023-02-23' 
			   	    },
			   	 { 
				   	      title: '축제4', 
				   	      start: '2023-02-21', 
				   	      //end: '2023-02-23' 
				   	    },
				   	 { 
					   	      title: '축제5', 
					   	      start: '2023-02-21', 
					   	      //end: '2023-02-23' 
					   	    },
					   	 { 
						   	      title: '축제6', 
						   	      start: '2023-02-21', 
						   	      //end: '2023-02-23' 
						   	    },
						   	 { 
							   	      title: '축제7', 
							   	      start: '2023-02-21', 
							   	      //end: '2023-02-23' 
							   	    },
							   	 { 
								   	      title: '축제8', 
								   	      start: '2023-02-21', 
								   	      //end: '2023-02-23' 
								   	    }, 
	   	    
      	],
	      	dateClick: function() {
	      	    alert('a day has been clicked!');
	      	  }
      });
      calendar.render();
      calendar.on('dateClick', function(info) {
    	  console.log('clicked on ' + info.dateStr);
    	});
      
    });
</script>
<title>MyCalendar</title>
</head>
<body>
  <h1>MyCalendar</h1>
  <div id='calendar' style="width:800px;"></div>
</body>
</html>


<!-- click: function() {
          var dateStr = prompt('Enter a date in YYYY-MM-DD format');
          var date = new Date(dateStr + 'T00:00:00'); // will be in local time

          if (!isNaN(date.valueOf())) { // valid?
            calendar.addEvent({
              title: 'dynamic event',
              start: date,
              allDay: true
            });
            alert('Great. Now, update your database...');
          } else {
            alert('Invalid date.');
          } -->