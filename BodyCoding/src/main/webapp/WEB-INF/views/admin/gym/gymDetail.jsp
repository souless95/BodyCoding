<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style type="text/css">
.table-bordered{font-family: Verdana, Geneva, Tahoma, sans-serif;}
</style>
</head>
<body class="sb-nav-fixed">
<script type="text/javascript">
$(function(){
	$('#imgupdate').change(function(){
		var img = $('#imgedit')[0];
		var formData = new FormData(img);
		$.ajax({
			type: 'post',
			url: 'mimgedit.do',
			data: formData,
			enctype: "multipart/form-data",
			processData: false, 
			contentType: false,
			cache: false,
			success: sucCallBack,
			error: errCallBack
		});
	});
});
function sucCallBack(resData){
	/* let tableData = resData; */
	console.log(resData);
	$('#img').attr("src","static/uploads/gym/"+resData);
}
function errCallBack(errData){
	console.log(errData.status+":"+errData.statusText);
}

window.onload = function() {
	const previewContainer = document.querySelector('#previewContainer');
	
	var imageArray = '${ dto.gym_detail_img}';
	var fileNames = imageArray.split(","); 
	
	for (let i = 0; i < fileNames.length; i++) {
	  const fileName = fileNames[i];
	  const imageUrl = '/static/uploads/gym/' + fileName;

	  createImagePreview(imageUrl, fileName);
	}

	function createImagePreview(imageUrl, fileName) {
	  const img = document.createElement('img');
	  img.src = imageUrl;
	  img.alt = fileName;
	  img.style.width = '200px';

	  const span = document.createElement('span');
	  span.classList.add('preview-item');
	  span.innerHTML = '<span class="preview-image">' + img.outerHTML + '</span>&nbsp;&nbsp;';
	  previewContainer.appendChild(span);
	}
}

function deletchack(){
	var deleteGym = confirm("정말 삭제하실건가요?");
	if(deleteGym){
		var deleteGym2 = confirm("정말 정말 삭제하실건가요?");
		if(deleteGym2)
		location.href='gymdelete.do?gym_code=${dto.gym_code }'
	}
}
</script>
<!-- top메뉴  -->
<%@ include file ="../../admin/inc/top.jsp" %>
	
	<div id="layoutSidenav">
	<!-- side -->
    <%@ include file ="../../admin/inc/side.jsp" %>
        
        <div id="layoutSidenav_content">
	        <div class="card mb-5" style="border-bottom: none;">
	        	<div class="card-header">
					<h2>${memList.mem_name } 상세보기</h2>
	        	</div>
				<div class="card-body" style="width: 80%">
					<h4>메인사진</h4>
					<div><img id="img" src="static/uploads/gym/${memList.mem_img }" style="width:200px; height:200px;"></div>
					
					<c:if test="${userIdG eq memList.mem_id }">
						<form id="imgedit" method="post" action="/mimgedit.do" enctype="multipart/form-data">
							<input type="hidden" name="o_mem_img" value="${memList.mem_img }" />
							<input type="hidden" name="mem_id" id="mem_id" value="${memList.mem_id }" />
							<input type="file" name="mem_img" id="imgupdate" />
						</form>
					</c:if>
					
					<h4>기본정보</h4>
					<table class="table" border=2>
						<input type="hidden" id="enabled" name="enabled" value="${memList.enabled }">
					    <input type="hidden" id="authority" name="authority" value="${memList.authority }">
						<tr>
							<th>지점명</th>
							<td>${memList.mem_name }</td>
							<th>지점코드</th>
							<td>${dto.gym_code }</td>
						</tr>
						<tr>
							<th>평수</th>
							<td>${dto.gym_scale }</td>
							<th>지점 전화번호</th>
							<td>${memList.mem_phone }</td>
						</tr>
						<tr>
							<th>지점 주소</th>
							<td>${memList.mem_address }</td>
						</tr>
					</table>
				
						<h4>편의시설</h4>
					<table class="table" border=2>
						<tr align="center">
							<th><img src="../static/admin/images/0001.png"/></th>
							<th><img src="../static/admin/images/0004.png"></th>
							<th><img src="../static/admin/images/0005.png"></th>
							<th><img src="../static/admin/images/0007.png"></th>
							<th><img src="../static/admin/images/0010.png"></th>
							<th><img src="../static/admin/images/0011.png"></th>
							<th><img src="../static/admin/images/0014.png"></th>
							<th><img src="../static/admin/images/0017.png"></th>
							<th><img src="../static/admin/images/0018.png"></th>
							<th><img src="../static/admin/images/0020.png"></th>
						</tr>
						<tr align="center">
							<th>주차</th>
							<th>헬스</th>
							<th>요가</th>
							<th>GX</th>
							<th>필라테스</th>
							<th>PT</th>
							<th>24시간</th>
							<th>샤워장</th>
							<th>운동복</th>
							<th>락커</th>
						</tr>
						<tr align="center">
							<td>${dto.facility_parking }</td>
							<td>${dto.facility_health }</td>
							<td>${dto.facility_yoga }</td>
							<td>${dto.facility_gx }</td>
							<td>${dto.facility_pilates }</td>
							<td>${dto.facility_pt }</td>
							<td>${dto.facility_24hour }</td>
							<td>${dto.facility_shower }</td>
							<td>${dto.facility_wear }</td>
							<td>${dto.facility_locker }</td>
						</tr>
					</table>
					
					<h4>운영시간</h4>
					<table class="table" border=2>
						<tr align="center">
							<th colspan="2">평일</th>
							<th colspan="2">토요일</th>
							<th colspan="2">일요일, 공휴일</th>
						</tr>
						<tr>
							<td width="10%" align="center">OPEN</td>
							<td width="10%" align="center">CLOSE</td>
							<td width="10%" align="center">OPEN</td>
							<td width="10%" align="center">CLOSE</td>
							<td width="10%" align="center">OPEN</td>
							<td width="10%" align="center">CLOSE</td>
						</tr>
						<tr>
							<td align="center">${dto.rtime_week_start }</td>
							<td align="center">${dto.rtime_week_end}</td>
							<td align="center">${dto.rtime_sat_start }</td>
							<td align="center">${dto.rtime_sat_end }</td>
							<td align="center">${dto.rtime_holy_start }</td>
							<td align="center">${dto.rtime_holy_end }</td>
						</tr>
					</table>
					<!-- 이건 뭐야? -->
					<h4>지점 사진</h4>
					<table class="table" border=2>
						<tr>
							<td>
								<span id="previewContainer" style="padding:10px;"></span>
							</td>
						</tr>
					</table>
					<s:authorize access="hasRole('ROLE_ADMIN_SUB')">
						<c:if test="${userIdG eq memList.mem_id }">
							<button type="button" class="custom-btn btn-1" onclick="location.href='/admin/gym/gymEdit?gym_code=${dto.gym_code }'">
								수정
							</button>
						</c:if>
					</s:authorize>
					<c:if test="${userIdG eq 'admin_super1'}">
						<button type="button" class="custom-btn btn-1" onclick="deletchack()">
									삭제
						</button>
		            </c:if>	
					<button type="button" class="custom-btn btn-1" onclick="location.href='main/admin'">
						메인으로
					</button>
					<button type="button" class="custom-btn btn-1" onclick="history.back()">
		            	뒤로가기
		            </button>
				</div>
			</div>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>		
	</div>
</body>
</html>