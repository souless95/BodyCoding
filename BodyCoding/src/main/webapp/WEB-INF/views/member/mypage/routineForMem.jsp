<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() {
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
	    	    	    newDiv.innerHTML = '<img src="' + listActname[i] + '" style="width:150px; height:169px;">' +
	     	    	    				   '<span style="margin-right:10px; margin-left:25px; font-size:24px;">'+ listAtime[i] +'</span>' +
	     	    	    				   '<span style="margin-right:30px; font-size:24px;">회</span>' +
	     	    	    				   '<span style="margin-right:30px; font-size:24px;">X</span>' +
	    	    	                       '<span style="margin-right:10px; font-size:24px;">' + listAset[i] + '</span>' +
	    	    	                       '<span style="margin-right:50px; font-size:24px;">세트</span>';
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
</script>
</head>
<body>
<%@ include file ="../../../../inc/Top.jsp" %>
<div class="container">
	<div class="sub_container">
		<%@ include file ="../../../../inc/mypageside.jsp" %>
		<br />
		<h3>금주의 루틴</h3>
		<br />
		<select name="yoil" id="yoil" style="width:100px;">
			<option value="월요일">월요일
			<option value="화요일">화요일
			<option value="수요일">수요일
			<option value="목요일">목요일
			<option value="금요일">금요일
			<option value="토요일">토요일
			<option value="일요일">일요일
		</select>
		<br /><br />
		<div id="registeredRoutine"></div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>	
</body>
</html>