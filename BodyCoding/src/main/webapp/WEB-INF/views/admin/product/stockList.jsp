<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	//해당 버튼을 클릭하면 ajax() 함수를 선택한다.
	$('#sUpdate').click(function() {
		/*
		리스트 API를 서버로 요청할때 먼저 loading 이미지를 보임처리한다.
		show()함수는 엘리먼트의 display속성을 block으로 변경해준다.
		*/
		//서버와의 비동기 통신을 위해 ajax()함수를 호출한다.
		$.ajax({
			//전송방식
			type:'post',
			//요청할 서버의 경로(요청명)
			url: '/stockUpdate.do?product_stock=}',
			//파라미터(서버로 요청시 전송할 값. 여기서는 페이지번호)
			data: {product_stock: $('#product_stock').val()},
			contentType: " text/html;charset:utf-8",
			//콜백데이터의 타입 
			dataType:"json",
			//콜백함수 정의
			success:sucCallBack,
			error: errCallBack
			/*
			콜백함수를 ajax() 함수 내부에 정의할대는 아래와 같이 무기명함수로 
			기술한다.
			success: function(콜백데이터){실행부;}
			만약 외부함수로 정의한다면 위와 같이 함수명만 기술하면 된다. 이때 
			콜백데이터는 별도로 명시하지 않는다.
			*/
		});
	});
	//해당 JSP문서가 로딩되면 즉시 click이벤트를 trigger한다.
	$('#btnBoard').trigger('click');
});
//성공했을때의 콜백함수를 jQuery 외부에 정의함
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
		var test = new Date(data.postdate).toLocaleString();
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
</script>
</head>
<body>
<form method="get" action="search.do">
	<div>
		<input type="text" name="searchTxt" placeholder="상품명을 입력하세요."/>
	</div>
	<input type="submit" name="검색"/>
</form>

<table border="1">
		<tr>
			<th>상품유형</th>
			<th>상품분류</th>
			<th>상품명</th>
			<th>가격</th>
			<th>판매여부</th>
			<th>재고</th>
		</tr>
		<c:forEach items="${sList}" var="sItem" varStatus="loop">
		<tr>
			<td>${sItem.product_type}</td>
			<td>${sItem.product_category}</td>
			<td>${sItem.product_name}</td>
			<td>${sItem.product_price}</td>
			<td>
				<c:choose>				
				<c:when test="${sItem.product_status eq 'Y' }">
					<input type="checkbox" name="product_status" checked>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="product_status">
				</c:otherwise>
				</c:choose>
			</td>
			<td><input type="number" name="product_stock" id="product_stock" value="${sItem.product_stock}"></td>
			<td><button type="button" id="sUpdate">전송</button></td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>