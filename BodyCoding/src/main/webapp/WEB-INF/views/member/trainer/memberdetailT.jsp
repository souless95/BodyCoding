<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<script type="text/javascript">
$(function(){
	//해당 버튼을 클릭하면 ajax() 함수를 선택한다
	$('#addpoint').click(function(){
		$.ajax({
			type: 'get',
			url: '../addpoint.do',
			data: {
				mem_id: $('#mem_id').val(),
				mem_point: $('#mem_point').val()
			},
			contentType: "text/html;charset:utf-8",
			dataType: "text",
			success: sucCallBack,
			error: errCallBack
		});
	});	
	 $('#addpoint').trigger('click'); 
});
function sucCallBack(resData){
	let tableData = resData;
	$('#show_data').html(tableData);
	$('#mem_point').val(0);
}
function errCallBack(errData){
	console.log(errData.status+":"+errData.statusText);
}
</script>
<!-- top메뉴  -->
<%@ include file="../inc/Top.jsp" %>
	<div id="container">
	<!-- side -->
	<%@ include file ="../inc/mypageside.jsp" %>
       
		<div id="layoutSidenav_content">
	        <main>
	        	<div class="card mb-4" style="border-bottom: none;">
	        		<div class="card-header">
						<h2>${dto.mem_name } 회원 상세보기</h2>
	        		</div>
	        		<div class="card-body" style="width: 80%">
	        			<h4>기본정보</h4>
						<table class="table" border="2";>
							<tr>
					         	<th>이메일(아이디)</th>
					         	<td>${dto.mem_id }</td>
					       	  	<th>가입일자</th>
					       	  	<td>${dto.mem_regidate }</td>
					      	</tr>
					      	<tr>
					         	<th>이름</th>
					         	<td>${dto.mem_name }</td>
					         	<th>성별</th>
					         	<td>${dto.mem_gender }</td>
					         	<th>생년월일</th>
					         	<td>${dto.mem_birth }</td>
					      	</tr>
						</table>
					    <table class="table" border=2>
					      	<tr>
					      		<th>이용권 유형</th>
					      		<td>${dto.membership_type }</td>
					      		<th>이용권 이름</th>
					      		<td>${dto.membership_name }</td>
					       	 	<th>전화번호</th>
					       	 	<td>${dto.mem_phone }</td>
					       	 	<th>주소</th>
						        <td>${dto.mem_address }</td>
					      	</tr>
					    </table>
					    <table class="table" border=2>
					      	<tr>
					       	 	<th>키</th>
					       	 	<th>체중</th>
					       	 	<th>보유질병</th>
					       	</tr>
					       	<tr>
					       	 	<td>${dto.mem_height }</td>
					       	 	<td>${dto.mem_weight }</td>
					       	 	<td>${dto.mem_disease }</td>
					       	</tr>
					       	<tr>
					       	 	<th>운동목적</th>
					       	 	<th>관심사</th>
					       	 	<th>방문경로</th>
					       	</tr>
					       	<tr>
					       	 	<td>${dto.mem_purpose }</td>
					       	 	<td>${dto.mem_interest }</td>
					       	 	<td>${dto.mem_inflow }</td>
					       	</tr>
					    </table>
						<button type="button" class="btn btn-primary" onclick="location.href='main'">홈으로</button> 
	        		</div>
				</div>
			</main>
			<!-- bottom -->
			<%@ include file="../inc/Bottom.jsp" %>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../static/admin/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../static/admin/js/datatables-simple-demo.js"></script>   
</body>
</html>