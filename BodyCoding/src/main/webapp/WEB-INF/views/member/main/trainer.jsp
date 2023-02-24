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
function sucCallBack(resData) {
	//콜백데이터는 JSON형식으로 전달된다.
	console.log(resData);
	let tableData = "";
	$(resData).each(function(index, data) {
		tableData += "<a href='javascript:void(0);' onclick='trainerInfo(\""+data.mem_id+"\",\""+ data.gym_code+"\");'>"
		+"<img class='card-img-top mt-2' src='static/member/images/kakao_login.png' "
		+" style='width:100%; height:180px;'>"
		+"<div class='card-body'>"
		+"<b>"+data.mem_name+"<b><br>"
		+data.mem_comm + "</div></a>";
	});
	//해당 엘리먼트에 새롭게 파싱된 내용으로 교체한다.
	$('#show_data').html(tableData);
}
//에러발생시 호출되는 콜백 함수
function errCallBack(errData){
	console.log(errData.status+":"+errData.statusText);
}
</script> 
 <h2>트레이너 목록</h2>
<hr>
<h5>
<select id="gym_code" required>
    <option value="-">지점</option>
	<c:forEach items="${gymList }" var="gym" varStatus="loop">
    <option value="${gym.gym_code }">${gym.mem_name }</option>
	</c:forEach>
</select>
<input type="button" value="지점선택" id="gymchoice"> </h5>


<form name="frm" method="post" >
	<input type="hidden" id="mem_id" name="mem_id">
	<input type="hidden" id="gym_code" name="gym_code">
</form>
	
<div id="show_data" class="card m-2" style="width:150px" >

</div>
</body>
</html>