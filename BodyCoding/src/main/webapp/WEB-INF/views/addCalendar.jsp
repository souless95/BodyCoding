<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<h3>레슨명</h3>
	<input type="text" name="lesson_name" id="lesson_name" />
	
<h3>카테고리</h3>
	<select name="lesson_category" id="lesson_category">
		<option value="PT">PT</option>	
		<option value="GX">GX</option>	
		<option value="필라테스">필라테스</option>	
		<option value="요가">요가</option>	
	</select>
	
<h3>수용인원</h3>
	<input type="text" name="lesson_capacity" id="lesson_capacity" />

<button type="button" onclick="validate();">확인</button>

<script>
function validate() {
	
	var lesson_name = document.getElementById("lesson_name").value;
	var lesson_category = document.getElementById("lesson_category").value;
	var lesson_capacity = document.getElementById("lesson_capacity").value;
	
	if(lesson_name == null || lesson_name.trim() == ''){
		alert("레슨명을 작성해주세요.")
		return false;
	}
	
	if(isNaN(lesson_capacity)){
		alert("수용인원란에는 숫자를 기입해주세요.")
		return false;
	}
	
	var start = localStorage.getItem("start", start);
	var end = localStorage.getItem("end", end);
	
	var data = {
				title: lesson_name,
				start: start,
				end: end,
				lesson_category: lesson_category,
				lesson_capacity: lesson_capacity
	};
	$.ajax({
		url: "/addCalendar2.do",
		contentType: "application/json; charset=utf-8",
		data: data,
		dataType: 'text',
		success: function(resData){	
			data.id = resData;
			window.opener.calendarRef.addEvent(data);
		    window.close();
		},
		error: function(){
			alert('일정 추가에 실패했습니다.');
		}
	});
}
</script>
</body>
</html>