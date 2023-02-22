<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function typeChk(e){
		var pdt = ["식품","의류","기구"];
		var mbs_p =  ["헬스","GX"];
		var mbs_c = ["PT","필라테스"];
		var target = document.getElementById("pCategory");
		
		if(e.value == "pdt") var option = pdt;
		else if(e.value == "mbs_p") var option = mbs_p;
		else if(e.value == "mbs_c") var option = mbs_c;
		
		target.options.length = 0;
		
		for (x in option){
			var opt = document.createElement("option");
			opt.value = option[x];
			opt.innerHTML = opthion[x];
			target.appendChild(opt);
		}
	}
</script>
</head>
<body>
	<h2>상품 등록</h2>
	<form action="pRegist.do" method="post">
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
			<select name="product_type" onchange="typeChk(this)">
				<option>유형선택</option>
				<option value="pdt">일반</option>
				<option value="mbs_p">멤버쉽(기간형)</option>
				<option value="mbs_c">멤버쉽(횟수형)</option>
			</select> 
			</td>
			<td> 
			<select name="product_category" id="pCategory">
				<option>분류선택</option>
			</select> 
			</td>
			<td><input type="number">일</td> 			
			<td><input type="number">회</td> 			
			<td><input type="text" name="product_name"></td>
			<td><input type="text" name="product_description"></td>
			<td><input type="file" name="product_img"></td>
			<td><input type="text" name="product_price"></td>			
		</tr>
	</table>
	<input type="submit" value="등록">
	<button onclick="location.href='pList'" value="목록"></button>
	</form>
</body>
</html>