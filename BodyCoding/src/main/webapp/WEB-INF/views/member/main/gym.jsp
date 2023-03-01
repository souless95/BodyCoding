<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
$(function() {
	
	$(".facility").click(function() {
		let chechboxVal = $('#gymCheck').serialize();
		
		console.log(chechboxVal);
		$.ajax({
			type:'get',
			url: '../gymCheck.do',
			data: {chechboxVal: chechboxVal},
			contentType: "text/html;charset:utf-8",
			dataType:"json",
			success:sucCallBack,
			error: errCallBack
		});
	});
	
	//해당 버튼을 클릭하면 ajax() 함수를 선택한다.
	$('#search').click(function() {
		$.ajax({
			type:'get',
			url: '../gymSearch.do',
			data: {searchWord: $('#searchWord').val()},
			contentType: " text/html;charset:utf-8",
			dataType:"json",
			success:sucCallBack,
			error: errCallBack
		});
	});
});
function sucCallBack(resData) {
	//콜백데이터는 JSON형식으로 전달된다.
	console.log(resData);
	let tableData = "";
	$(resData).each(function(index, data) {
		tableData +=
		"<li><div>" +data.mem_name+ "<button>상세보기</button></div>"
		+"<div>" +data.mem_address+ "</div>"
		+"<div>" +data.mem_phone+ "</div></li>";
	}); 
	//해당 엘리먼트에 새롭게 파싱된 내용으로 교체한다.
	$('#show_data').html(tableData);
}
//에러발생시 호출되는 콜백 함수
function errCallBack(errData){
	console.log(errData.status+":"+errData.statusText);
}
</script>
<h2>지점 정보</h2>
<hr>
<form name="gymCheck" id="gymCheck">
    <ul>
    	<li>
	        <input type="checkbox" name="facility_parking" value="Y" class="facility" id="facility_parking">
	        <label for="facility_parking"><span></span> <img src="../static/admin/images/0002.png" width="50" height="50" align="absmiddle">
	          주차       </label>
        </li>
      	<li>
	        <input type="checkbox" name="facility_health" value="Y" class="facility" id="facility_health" onclick="checkBox();">
	        <label for="facility_health"><span></span> <img src="../static/admin/images/0004.png" width="50" height="50" align="absmiddle">
	          헬스        </label>
      	</li>
      	<li>
	        <input type="checkbox" name="facility_yoga" value="Y" class="facility" id="facility_yoga" onclick="s_form.submit()">
	        <label for="facility_yoga"><span></span> <img src="../static/admin/images/0005.png" width="50" height="50" align="absmiddle">
	          요가        </label>
      	</li>
     	 <li>
	        <input type="checkbox" name="facility_gx" value="Y" class="facility" id="facility_gx" onclick="s_form.submit()">
	        <label for="facility_gx"><span></span> <img src="../static/admin/images/0007.png" width="50" height="50" align="absmiddle">
	          G.X       </label>
      	</li>
      	<li>
	        <input type="checkbox" name="facility_pilates" value="Y" class="facility" id="facility_pilates" onclick="s_form.submit()">
	        <label for="facility_pilates"><span></span> <img src="../static/admin/images/0010.png" width="50" height="50" align="absmiddle">
	          필라테스        </label>
      	</li>
     	 <li>
	        <input type="checkbox" name="facility_pt" value="Y" class="facility" id="facility_pt" onclick="s_form.submit()">
	        <label for="facility_pt"><span></span> <img src="../static/admin/images/0011.png" width="50" height="50" align="absmiddle">
	          P.T        </label>
      	</li>
     	 <li>
	        <input type="checkbox" name=facility_24hour value="Y" class="facility" id="facility_24hour" onclick="s_form.submit()">
	        <label for="facility_24hour"><span></span> <img src="../static/admin/images/0014.png" width="50" height="50" align="absmiddle">
	          24시간        </label>
     	 </li>
     	 <li>
	        <input type="checkbox" name="facility_shower" value="Y" class="facility" id="facility_shower" onclick="s_form.submit()">
	        <label for="facility_shower"><span></span> <img src="../static/admin/images/0017.png" width="50" height="50" align="absmiddle">
	          샤워시설        </label>
      	</li>
     	 <li>
	        <input type="checkbox" name="facility_wear" value="Y" class="facility" id="facility_wear" onclick="s_form.submit()">
	        <label for="facility_wear"><span></span> <img src="../static/admin/images/0018.png" width="50" height="50" align="absmiddle">
	          운동복        </label>
      	</li>
      	<li>
	        <input type="checkbox" name="facility_locker" value="Y" class="facility" id="facility_locker" onclick="s_form.submit()">
	        <label for="facility_locker"><img src="../static/admin/images/0020.png" width="50" height="50" align="absmiddle">
	          락커       </label>
      	</li>
    </ul>
</form>
<!-- /////////////////////////////////////////////////////////////// -->




<div style="width:300px;">
   <input id="searchWord" type="text"  placeholder="검색어 입력" style="width:204px;">
   <input type="button" value="전체지점" id="search">
</div>

<div id="show_data">
<ul>
<c:forEach items="${gymList }" var="row" varStatus="loop">
	<li>
		<div> ${row.mem_name} <button>상세보기</button></div>
		<div> ${row.mem_address}</div>
		<div> ${row.mem_phone}</div>
	</li>
</c:forEach>
</ul>
</div>
</body>
</html>