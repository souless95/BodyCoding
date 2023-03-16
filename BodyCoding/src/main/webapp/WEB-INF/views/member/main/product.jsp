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
$(function() {
	//해당 버튼을 클릭하면 ajax() 함수를 선택한다.
	$('#product_typechoice').click(function() {
		$.ajax({
			type:'get',
			url: '../product.do',
			data: {product_type: $('#product_type').val()},
			contentType: " text/html;charset:utf-8",
			dataType:"json",
			success:sucCallBack,
			error: errCallBack
		});
	});
	//해당 JSP문서가 로딩되면 즉시 click이벤트를 trigger한다.
	$('#product_typechoice').trigger('click');
}); 
function sucCallBack(resData) {
	//콜백데이터는 JSON형식으로 전달된다.
	console.log(resData);
	let tableData = "";
	$(resData).each(function(index, data) {
		tableData += "<div style='width:200px; margin:30px; float:left;'><a href='productInfo?product_idx="+data.product_idx+"'>"
		+"<img class='card-img-top mt-2' src='static/uploads/product/"+data.product_img+"' "
		+" style='width:100%; height:250px;'>"
		+"<div class='card-body'>"
		+"<b>"+data.product_name+"<b><br>"
		+data.product_price.toLocaleString() + "원</div></a></div>";
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
	<h2 style="margin-bottom: 0;">상품 목록</h2>
	<h5>
	<select id="product_type" required>
	    <option value="-">상품유형</option>
	    <option value="식품">식품</option>
	    <option value="의류">의류</option>
	    <option value="기구">기구</option>
	</select>
	<input type="button" value="유형선택" id="product_typechoice"> </h5>
	
	<form name="frm" method="post" >
		<input type="hidden" id="product_idx" name="product_idx">
	</form>
	
	<div id="show_data">
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>