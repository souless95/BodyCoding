<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#gymSelect').change(function(){
		if($('#gymSelect').val()==""){
			$('input[name=product_category]').is(':checked')=false;
			$('input[name=product_idx]').css("display","none");
		}
	});  
	$('input[name=product_category]').click(function(){

		$('#pTitle').css("display","inline");
		let ctgVar = $('input[name=product_category]:checked').val();
		
		
		$.ajax({
			type:'get',
			url: '/productLoad.do',
			data: {product_category : ctgVar},
			contentType: "text/html;charset:utf-8",
			dataType:"json",
			success:sucCallBackP,
			error: errCallBackP
		});
		
	});
});
function sucCallBackP(resData) {
	let pData = "";
	$(resData).each(function(index, data){
		pData += ""
		+"<td><input type='radio' name='product_idx' value='" +data.product_idx+ "'>["
		+data.product_category+"]"+data.product_name+"</td>"
		+"<td>"+data.product_price+"</td>"             
	});
	
	$('#show_product').html(pData);
}
		
function errCallBackP(errData){
	console.log(errData.status+":"+errData.statusText);
}

$(function(){
	$(document).on('click','input[name=product_idx]',function(){
		$('#tTitle').css("display","inline");
		
		const gym_code = $('#gymSelect').val();
		const lesson_category = $('input[name=product_category]').val();
				
		
 		const trainer = {
				gym_code : gym_code,
				lesson_category : lesson_category
		};
		
 		console.log(trainer);
 		
		$.ajax({
			type:'get',
			url: '/trainerLoad.do',
 			data: trainer,
			contentType: "application/json;charset:utf-8",
			dataType:"json",
			success:sucCallBackT,
			error: errCallBackT
		});
	});
});

function sucCallBackT(resData) {
	let tData = "";
	console.log(resData);
	$(resData).each(function(index, data){
		tData += ""
 		+"<td><img src='"+ data.mem_img+"'>"+"</td>"
		+"<td>"+data.mem_name+"</td>"             
	});
	
	$('#show_trainer').html(tData);
}
		
function errCallBackT(errData){
	console.log(errData.status+":"+errData.statusText);
}
</script>
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>지점 선택</th>
	</tr>
	<tr>
		<td> 
			<select name="gym_code" id="gymSelect">
				<option value="">=========</option>
				<c:forEach items="${gymList}" var="gym" varStatus="loop">
				<option value="${gym.gym_code}">${gym.mem_name}</option>
				</c:forEach>
			</select> 
		</td>		
	</tr>
	<tr>
		<th>프로그램 선택</th>
	</tr>
	<tr>
		<td> 
			<input type="radio" name="product_category" value="헬스">헬스
			<input type="radio"name="product_category" value="GX">GX
			<input type="radio"name="product_category" value="요가">요가
			<input type="radio"name="product_category" value="필라테스">필라테스
			<input type="radio"name="product_category" value="PT">PT
		</td>		
	</tr>
	<tr>
		<th id="pTitle" style="display:none;">이용권 선택</th>
	</tr>
	<tr>
		<td id="show_product"></td>
	</tr>
	<tr>
		<th id="tTitle" style="display:none;">트레이너 선택</th>
	</tr>
	<tr>
		<td id="show_trainer"></td>
	</tr>
	
	<tr>
		<td><button onclick="location.href='purchase.do'">결제!!!</button> </td>
	</tr>
</table>
</body>
</html>