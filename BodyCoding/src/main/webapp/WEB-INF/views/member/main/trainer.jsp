<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	console.log("ㅇ왜");
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
		tableData += "<div style='width:200px; margin:36px; float:left;'><a href='javascript:void(0);' onclick='trainerInfo(\""+data.mem_id+"\",\""+ data.gym_code+"\");'>"
		+"<img class='card-img-top mt-2' src='static/uploads/trainer/"+data.mem_img+"' "
		+" style='width:100%; height:250px;'>"
		+"<div class='card-body'style='overflow: hidden; height: 100px;'>"
		+"<b>"+data.mem_name+"</b>&nbsp;<span class='input'>&nbsp;#"+data.mem_interest+"&nbsp;&nbsp;</span><br>"
		+data.mem_comment + "<br></div></a></div>";
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
<style>
.input{
	text-align:center;
	width:90px;
	padding: 2px;
	border: 1.5px solid #37C0FB;
	background: white;
	border-radius: 67px;
	color: #37C0FB;
}
h5 .input:hover{
	text-align:center;
	width:90px;
	padding: 2px;
	border: 1.5px solid white;
	background: #37C0FB;
	border-radius: 67px;
	color: white;
}
</style>
	
	<h5>
	<select id="gym_code" required>
	    <option value="-">지점</option>
		<c:forEach items="${gymList }" var="gym" varStatus="loop">
	    <option value="${gym.gym_code }">${gym.mem_name }</option>
		</c:forEach>
	</select>
	<button type="button" class="custom-btn btn-1" style="width: 150px;" id="gymchoice">지점선택</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;키워드 추천:&nbsp;&nbsp;
		<button value="친절" name="interest" class="input"> #친절</button>
		<button value="열정" name="interest" class="input"> #열정</button>
		<button value="재미" name="interest" class="input"> #재미</button>
		<button value="정확" name="interest" class="input"> #정확</button>
		<button value="칭찬" name="interest" class="input"> #칭찬</button>
	</h5>
	<style> 
	.trainer-card {
	  width: 200px;
	  margin: 20px;
	  float: left;
	  height: 350px; /* 일정한 높이 설정 */
	}
	.trainer-container {
	  display: flex;
	  flex-wrap: wrap;
	  justify-content: space-between;
	  border-top: 1px solid gray;
	  border-bottom: 1px solid gray;
	}
	</style>
	<c:if test="${not empty interest}">
	<strong>회원님의&nbsp; 키워드&nbsp;<span class="input">&nbsp;#${interest}&nbsp;</span>&nbsp;에 &nbsp;맞는&nbsp; 트레이너 &nbsp;추천</strong>
	<div class="trainer-container" style="margin-top: 5px;">
		<c:forEach items="${recomtrainerList }" var="rec" varStatus="loop">
			<div class="trainer-card">
				<a href="javascript:void(0);" onclick="trainerInfo('${rec.mem_id}','${rec.gym_code}');">
					<img class="card-img-top mt-2" src="static/uploads/trainer/${rec.mem_img}" style="width:100%; height:240px;">
					<div class='card-body' style="overflow: hidden; height: 100px;">
						<b>${rec.mem_name}</b><Br>
						${rec.mem_comment}
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	</c:if>
	
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