<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
}
.container {
	height: 100%;
	width: 100%;
	background-color: #f4f4f4;
}

select {
  border: 2px solid #ccc;
  border-radius: 7px;
  height: 30px;
  padding: 5px;
  font-size: 16px;
  color: #656565;
  background-color: #fff;
}
</style>
</head>
<body>
<div class="container">
	<div style="background-color: #f4f4f4;">
		<div style="margin: 0 auto; padding: 30px; background-color:#f4f4f4; ">
			<div style=" width:300px; height:205px; padding:15px;  border:1px solid #ccc;
					background-color:white; margin: 0 auto; border-radius:7px;">
				<div style="magin-left:30px; margin-bottom:10px;"><span style="font-weight:bold; font-size:20px;">스케쥴등록</span></div>
					<div><span style="font-size:18px; color:#656565;">레슨명</span></div>
						<input type="text" name="lesson_name" id="lesson_name" style="border:2px solid #ccc; border-radius:7px; height:20px;" placeholder="레슨명을 입력하세요"/>
						
					<div style="margin-top:7px;"><span style="font-size:18px; color:#656565;">카테고리</span></div>
						<select name="lesson_category" id="lesson_category" style="border-radus:7px;">
							<option value="PT">PT</option>	
							<option value="GX">GX</option>	
							<option value="필라테스">필라테스</option>	
							<option value="요가">요가</option>	
						</select>
						
					<div style="margin-top:7px;"><span style="font-size:18px; color:#656565;">수용인원</span></div>
						<div style="display:flex;">
							<input type="text" name="lesson_capacity" id="lesson_capacity" style="border:2px solid #ccc; border-radius:7px; height:20px;" placeholder="인원수를 입력하세요" />
							<div style="margin-left:3px; margin-top:1px;'"><button type="button" onclick="validate();" style="border-radius:5px; background-color:#f4f4f4; font-weight:bold;">등록</button></div>
						</div>
			</div>	
		</div>
	</div>
</div>
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
				rCount: '0',
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
			window.opener.calendarRef.refetchEvents();
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