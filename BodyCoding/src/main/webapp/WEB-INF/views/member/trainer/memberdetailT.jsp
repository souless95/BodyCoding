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
<script>
$(document).ready(function() {
	var aa= '${mem_id}';
	console.log(aa);
	$("#yoil").change(function() {
		$.ajax({
    	    url: '/changeYoil',
    	    contentType: "application/json; charset=utf-8",
    	    data: {
    	    	mem_id: '${mem_id}',
    	    	yoil: $('#yoil').val()
    	    },
    	    dataType: 'json',
    	    success: function(response) {
    	    	console.log("success", response);
    	    	if(response.mem_id == "error_id"){
    	    		$("#registeredRoutine").children("div").remove();
    	    	}
    	    	else {
	    	    	var listMem_Id = response.mem_id;
	    	    	var listYoil = response.yoil;
	    	    	var listActname = response.actname.split(",").map(String);
	    	    	var listAtime = response.atime.split(",").map(String);
	    	    	var listAset = response.aset.split(",").map(String);
	    	    	
	    	    	$("#registeredRoutine").children("div").remove();
	    	    	
	    	    	for (var i = 0; i < listActname.length; i++) {
	    	    	    var newDiv = document.createElement('div');
	    	    	    newDiv.setAttribute('id', 'counts' + (i+1));
	    	    	    newDiv.innerHTML = '<img src="' + listActname[i] + '" style="width:75px; height:85px;">' +
	     	    	    				   '<span style="margin-right:10px; margin-left:25px;">'+ listAtime[i] +'</span>' +
	     	    	    				   '<span style="margin-right:30px;">회</span>' +
	     	    	    				   '<span style="margin-right:30px;">X</span>' +
	    	    	                       '<span style="margin-right:10px;">' + listAset[i] + '</span>' +
	    	    	                       '<span style="margin-right:50px;">세트</span>';
	 	    	        newDiv.style.display = 'flex';
	 	    	        newDiv.style.alignItems = 'center';
	 	    	        newDiv.style.width = '80%';
	 	    	        newDiv.style.marginLeft = '82px';
	    	    	                       
	    	    	    registeredRoutine.appendChild(newDiv);
	    	    	}
    	    	}
    	    },
    	    error: function(xhr, status, error) {
    	    	console.log("error", status);
     	    }
    	});
	}).trigger('change');
});

function routine(){
	open("routine.do?mem_id=${dto.mem_id}",
            "routineRegist",
            "width=935, height=800, left=500, top=100, "
            + "location=no, toolbar=no, menubar=no, "
            + "scrollbars=yes, resize=no");
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
						<button type="button" class="btn btn-primary" onclick="location.href='main'">홈으로</button> &nbsp;&nbsp; 
						<button type="button" class="btn btn-primary" onclick="routine();">운동루틴 등록</button>
						<br /><br /><br />
						<select name="yoil" id="yoil" style="width:100px;">
								<option value="월요일">월요일
								<option value="화요일">화요일
								<option value="수요일">수요일
								<option value="목요일">목요일
								<option value="금요일">금요일
								<option value="토요일">토요일
								<option value="일요일">일요일
						</select>
						<div id="registeredRoutine"></div>
			<!-- bottom -->
			<%@ include file="../inc/Bottom.jsp" %>
	        		</div>
				</div>
			</main><br />
			
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../static/admin/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../static/admin/js/datatables-simple-demo.js"></script>   
</body>
</html>