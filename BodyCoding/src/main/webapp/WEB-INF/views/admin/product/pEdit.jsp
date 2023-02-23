<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 
onload = function(){
	var obj1 = document.getElementById('pType');
	 var type = '<c:out value="${dto.product_type}"/>';
	 
	 for(var i=0 ; i<4 ; i++){
	     if(obj1.options[i].value==type){ 
	    	 obj1.options[i].selected=true;
	     }
	 }
	 
	var obj2 = document.getElementById('pCategory');
	 var type = '<c:out value="${dto.product_category}"/>';
	 
	 for(var i=0 ; i<8 ; i++){
	     if(obj2.options[i].value==type){ 
	    	 obj2.options[i].selected=true;
	     }
	 }
 }
 
</script>
</head>
<body>
	<h2>상품 수정</h2>
	<form action="productEdit.do" method="post">
	<input type="hidden" name="product_idx" value=${ dto.product_idx} >
	<table border="1">
		<tr>
			<th>상품유형</th>
			<th>상품분류</th>
			<th style="">기간</th>
			<th style="">횟수</th>
			<th>상품명</th>
			<th>상세설명</th>
			<th>대표 이미지</th>
			<th>가격</th>
		</tr>
		<tr>
			<td> 
			<select name="product_type" id="pType">
				<option value="">유형선택</option>
				<option value="PDT">일반</option>
				<option value="MBS_P">멤버쉽(기간형)</option>
				<option value="MBS_C">멤버쉽(횟수형)</option>
			</select> 
			</td>
			<td> 
			<select name="product_category" id="pCategory">
				<option value="">분류선택</option>
				<option value="FOOD">식품</option>
				<option value="WEAR">의류</option>
				<option value="TOOL">기구</option>
				<option value="HEALTH">헬스</option>
				<option value="GX">GX</option>
				<option value="PT">PT</option>
				<option value="PILATES">필라테스</option>
			</select> 
			</td>
			<td><input type="number" name="membership_period" value="${ dto.membership_period }">일</td> 			
			<td><input type="number" name="membership_count" value="${ dto.membership_count }">회</td> 			
			<td><input type="text" name="product_name" value="${ dto.product_name }"></td>
			<td><input type="text" name="product_description" value="${ dto.product_description }"></td>
			<td><input type="text" name="product_img" value="${ dto.product_img }"></td>
			<td><input type="number" name="product_price" value="${ dto.product_price }"></td>			
		</tr>
	</table>
	<input type="submit" value="수정">
	<button type="button" onclick="location.href='productList.do'">목록</button>
	</form>
</body>
</html>