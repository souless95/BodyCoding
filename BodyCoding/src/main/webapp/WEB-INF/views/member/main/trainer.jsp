<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp" %>
<script type="text/javascript">
function trainerInfo(mem_id, gym_code){
	let f = document.frm;
	f.mem_id.value = mem_id;
	f.gym_code.value = gym_code;
	
	f.action ="trainerInfo";
	f.submit();
}
$(function() {
	//해당 버튼을 클릭하면 ajax() 함수를 선택한다.
	$('#gymchoice').click(function() {
		$.ajax({
			type:'get',
			url: '../trainer.do',
			data: {gym_code: $('#gym_code').val()},
			contentType: " text/html;charset:utf-8",
			dataType:"json",
			success:sucCallBack,
			error: errCallBack
		});
	});
	//해당 JSP문서가 로딩되면 즉시 click이벤트를 trigger한다.
	$('#gymchoice').trigger('click');
}); 
$(function() {
	//해당 버튼을 클릭하면 ajax() 함수를 선택한다.
	$('button[name=interest]').click(function() {
		$.ajax({
			type:'get',
			url: '../interest.do',
			data: {interest: $(this).val()},
			contentType: " text/html;charset:utf-8",
			dataType:"json",
			success:sucCallBack,
			error: errCallBack
		});
	});
	//해당 JSP문서가 로딩되면 즉시 click이벤트를 trigger한다.
	$('#gymchoice').trigger('click');
}); 
function sucCallBack(resData) {
	//콜백데이터는 JSON형식으로 전달된다.
	console.log(resData);
	let tableData = "";
	$(resData).each(function(index, data) {
		tableData += "<div style='width:200px; margin:30px; float:left;'><a href='javascript:void(0);' onclick='trainerInfo(\""+data.mem_id+"\",\""+ data.gym_code+"\");'>"
		+"<img class='card-img-top mt-2' src='static/uploads/trainer/"+data.mem_img+"' "
		+" style='width:100%; height:250px;'>"
		+"<div class='card-body'>"
		+"<b>"+data.mem_name+"</b><br>"
		+data.mem_comment + "<br>#"
		+data.mem_interest+"</div></a></div>";
	});
	//해당 엘리먼트에 새롭게 파싱된 내용으로 교체한다.
	$('#show_data').html(tableData);
}
//에러발생시 호출되는 콜백 함수
function errCallBack(errData){
	console.log(errData.status+":"+errData.statusText);
}
</script> 
<div class="container">
<br>
	 <h2>트레이너 목록</h2>
	<h5>
	<select id="gym_code" required>
	    <option value="-">지점</option>
		<c:forEach items="${gymList }" var="gym" varStatus="loop">
	    <option value="${gym.gym_code }">${gym.mem_name }</option>
		</c:forEach>
	</select>
	<input type="button" value="지점선택" id="gymchoice"> </h5>
	<h5>키워드 추천:  
		<button value="친절" name="interest"> #친절</button>
		<button value="열정" name="interest"> #열정</button>
		<button value="재미" name="interest"> #재미</button>
		<button value="정확" name="interest"> #정확</button>
		<button value="칭찬" name="interest"> #칭찬</button>
	</h5>
	
	<c:if test="${not empty UserInfo.mem_interest}">
		회원님의 키워드에 맞는 트레이너 추천
		<c:set var="randomList" value="${recomtrainerList}" />
		<c:forEach varStatus="loop" begin="1" end="3">
			<c:set var="randomIndex" value="${fn:length(randomList) > 0 ? fn:random(0, fn:length(randomList)-1) : -1}" />
		  	<c:if test="${randomIndex ne -1}">
				<div style="width:200px; margin:30px; float:left;">
				<a href="javascript:void(0);" onclick="trainerInfo(data.mem_id,data.gym_code);">
					<img class="card-img-top mt-2" src="static/uploads/trainer/'+${randomList[randomIndex].mem_img}+'" style="width:100%; height:250px;">
					<div class='card-body'>
					<b>#${randomList[randomIndex].mem_name}</b><br>
					#${randomList[randomIndex].mem_comment}<br>
					#${randomList[randomIndex].mem_interest}</div></a></div>
			<c:set var="randomList" value="${fn:remove(randomList, randomIndex)}" />
	  		</c:if>
		</c:forEach>
	</c:if>
	
	<%-- <c:set var="randomList" value="${gymList}" />
	<c:forEach varStatus="loop" begin="1" end="3">
	  <c:set var="randomIndex" value="${fn:length(randomList) > 0 ? fn:random(0, fn:length(randomList)-1) : -1}" />
	  <c:if test="${randomIndex ne -1}">
	    <li>${randomList[randomIndex].mem_name}</li>
	    <c:set var="randomList" value="${fn:remove(randomList, randomIndex)}" />
	  </c:if>
	</c:forEach>  --%>
	
	<form name="frm" method="post" >
		<input type="hidden" id="mem_id" name="mem_id">
		<input type="hidden" id="gym_code" name="gym_code">
	</form>
	
	<div id="show_data">
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>