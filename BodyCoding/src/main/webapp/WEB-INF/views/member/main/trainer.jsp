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
<!-- <script type="text/javascript">
$(function() {
	//해당 버튼을 클릭하면 ajax() 함수를 선택한다.
	$('#btnBoard').click(function() {
		$.ajax({
			type:'get',
			url: '../restapi/boardList.do',
			data: {nowPage: $('#nowPage').val()},
			contentType: " text/html;charset:utf-8",
			dataType:"json",
			success:sucCallBack,
			error: errCallBack
		});
	});
	//해당 JSP문서가 로딩되면 즉시 click이벤트를 trigger한다.
	$('#btnBoard').trigger('click');
}); 
function sucCallBack(resData) {
	//콜백데이터는 JSON형식으로 전달된다.(REST API로 정의했음)
	console.log(resData);
	let tableData = "";
	/*
	현재 콜백된 데이터는 JSON배열이므로 원소의 갯수만큼 반복하여 <tr>태그를
	문자열로 연결한다. $.each() 함수는 선택된 엘리먼트의 갯수만큼 반복하는 
	기능을 가지고 있어 주로 <li>,<tr>과 같은 태그나 배열에서 많이 사용된다.
	*/
	$(resData).each(function(index, data) {
		//반복시 JSON객체를 하나씩 data로 전달받아 파싱한 후 <td>태그로 추가한다.
		//날짜가 이상하게 나와서 추가함
		tableData += ""
		+"<tr>"
		+"	<td>"+data.num+"</td>"
		+"	<td>"+data.title+"</td>"
		+"	<td>"+data.id+"</td>"
		+"	<td>"+test+"</td>"
		+"	<td>"+data.visitcount+"</td>"
		+"</tr>";
	});
	//해당 엘리먼트에 새롭게 파싱된 내용으로 교체한다.
	$('#show_data').html(tableData);
	//모든 요청이 완료되면 로딩 이미지를 숨김처리한다.
	$('#loading').hide(500);
}
//에러발생시 호출되는 콜백 함수
function errCallBack(errData){
	console.log(errData.status+":"+errData.statusText);
}
</script> -->
<h2>트레이너 목록</h2>
<hr>
<h5>
<select name="gym_code" required>
    <option value="">지점</option>
<c:forEach items="${gymList }" var="gym" varStatus="loop">
    <option value="${gym.gym_code }">${gym.mem_name }</option>
</c:forEach>
</select>
<button onclick="location.href='trainer?gym_code='">지점선택</button> </h5>

<script type="text/javascript">
function trainerInfo(mem_id, gym_code){
	let f = document.frm;
	f.mem_id.value = mem_id;
	f.gym_code.value = gym_code;
	
	f.action ="trainerInfo";
	f.submit();
}
</script> 

<form name="frm" method="post" >
	<input type="hidden" id="mem_id" name="mem_id">
	<input type="hidden" id="gym_code" name="gym_code">
</form>
	
<c:forEach items="${trainerList }" var="row" varStatus="loop">
<div class="card m-2" style="width:150px" >
	<a href="#" onclick="trainerInfo('${row.mem_id }', ${row.gym_code })">
	<img class="card-img-top mt-2" src="static/member/images/kakao_login.png" style="width:100%; height:180px;">
	<div class="card-body">
	    <b>${row.mem_name }<b><br>
    	${row.mem_comment }
    	
	</div>
    </a>
</div>
</c:forEach>
</body>
</html>