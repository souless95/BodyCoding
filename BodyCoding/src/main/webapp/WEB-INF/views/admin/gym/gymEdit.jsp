<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<style type="text/css">
.table-bordered {
	font-family: Verdana, Geneva, Tahoma, sans-serif;;
}

.preview-item {
    display: inline-flex;
    align-items: center;
    margin-bottom: 10px;
}

.preview-number {
    font-weight: bold;
    margin-right: 10px;
    min-width: 20px; /* 수정 */
    text-align: center; /* 수정 */
}

.preview-image {
    width: 200px;
    height: 200px;
    border: 1px solid #ddd;
    margin-right: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.preview-image img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
}
</style>
</head>
<body class="sb-nav-fixed">
<!-- top메뉴  -->
<%@ include file ="../../admin/inc/top.jsp" %>
	
	<div id="layoutSidenav">
	<!-- side -->
    <%@ include file ="../../admin/inc/side.jsp" %>
        
        <div id="layoutSidenav_content">
	        <div class="card mb-5" style="border-bottom: none;">
	        <form action="/gymedit.do" method="post" enctype="multipart/form-data">
	        	<div class="card-header">
					<h2>${memList.mem_name } 수정 페이지</h2>
	        	</div>
				<div class="card-body" style="width: 80%">
					<h4>메인사진</h4>
					<%-- <div><img src="static/uploads/trainer/${memList.mem_img }" style="width:200px; height:200px;">
		        			<input type="hidden" name="mem_img" value="${memList.mem_img }">
		        			<input class="form-control" id="mem_img" name="mem_img" type="file" style="display:inline;" />
		        	</div> --%>
					<%-- <c:forEach items="${fileMap }" var="file" varStatus="vs">
						<tr>
							<td><img src="uploads/${file.key }" width="200" 
									height="150" /></td>
							<td>${file.key }</td>
							<td>${file.value }Kb</td>
						</tr>
					</c:forEach> --%>
					<%-- <div>${dto.gym_dtail_img }</div> --%>	
					<h4>기본정보</h4>
					<table class="table" border=2>
						<tr>
							<th>지점명</th>
							<td><input type="text" name="mem_name" value="${memList.mem_name}" style="width: 100px;"/></td>
							<th>지점코드</th>
							<td><input type="text" name="gym_code" value="${dto.gym_code}" readonly style="width: 100px; border: none;"/></td>
						</tr>
						<tr>
							<th>평수</th>
							<td><input type="text" name="gym_scale" value="${dto.gym_scale}" style="width: 100px;"/></td>
							<th>지점 전화번호</th>
							<td><input type="text" name="mem_phone" value="${memList.mem_phone}" style="width: 100px;"/></td>
						</tr>
						<tr>
							<th>지점 주소</th>
							<td><input type="text" name="mem_address" value="${memList.mem_address}" style="width: 100px;"/></td>
						</tr>
					</table>
				
						<h4>편의시설</h4>
					<table class="table" border=2>
						<tr align="center">
							<th><img src="/static/admin/images/0001.png"/></th>
							<th><img src="/static/admin/images/0004.png"></th>
							<th><img src="/static/admin/images/0005.png"></th>
							<th><img src="/static/admin/images/0007.png"></th>
							<th><img src="/static/admin/images/0010.png"></th>
							<th><img src="/static/admin/images/0011.png"></th>
							<th><img src="/static/admin/images/0014.png"></th>
							<th><img src="/static/admin/images/0017.png"></th>
							<th><img src="/static/admin/images/0018.png"></th>
							<th><img src="/static/admin/images/0020.png"></th>
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
							<td><input type="text" name="facility_parking" value="${dto.facility_parking}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_health" value="${dto.facility_health}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_yoga" value="${dto.facility_yoga}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_gx" value="${dto.facility_gx}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_pilates" value="${dto.facility_pilates}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_pt" value="${dto.facility_pt}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_24hour" value="${dto.facility_24hour}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_shower" value="${dto.facility_shower}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_wear" value="${dto.facility_wear}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_locker" value="${dto.facility_locker}" style="width: 100px;" placeholder="Y or N" /></td>
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
						<tr align="center">
							<td><input type="text" name="rtime_week_start" value="${dto.rtime_week_start}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_week_end" value="${dto.rtime_week_end}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_sat_start" value="${dto.rtime_sat_start}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_sat_end" value="${dto.rtime_sat_end}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_holy_start" value="${dto.rtime_holy_start}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_holy_end" value="${dto.rtime_holy_end}" style="width: 100px;"/></td>
						</tr>
					</table>
					
						<h4>사진 추가</h4>
					<table class="table" border=2>
						<tr>
							<td><input type="file" id="fileInput" name="uploadfiles" value="" style="width:500px; border:1px solid gray;" multiple /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</table>
					<div id="previewContainer"></div>
					<script>
					$(document).ready(function() {
						  function modifyFile() {
						    var filename = '11.jpg';

						    $.ajax({
						      url: '/files?filename=' + filename +'&filepath=/static/uploads/gym' ,
						      type: 'GET',
						      dataType: 'json',
						      success: function(data) {
						        var formData = new FormData();
						        formData.append('file', data.file);

						        var input = document.getElementById('fileInput');
						        input.files = formData;
						      },
						      error: function(xhr, status, error) {
						      }
						    });
						  }

						  modifyFile();
						});
					
					const fileInput = document.querySelector('#fileInput');
					const previewContainer = document.querySelector('#previewContainer');

				    function previewImages() {
					    const files = fileInput.files;
					    previewContainer.innerHTML = '';
	
					    for (let i = 0; i < files.length; i++) {
					      const file = files[i];
					      const reader = new FileReader();
	
					      reader.onload = function(event) {
					        const imageUrl = event.target.result;
					        createImagePreview(imageUrl, file.name);
						};
					      reader.readAsDataURL(file);
					    }
					}

					function createImagePreview(imageUrl, fileName) {
					    const img = document.createElement('img');
					    img.src = imageUrl;
					    img.alt = fileName;
					    img.style.width = '200px';
					    
					    const div = document.createElement('div');
					    div.classList.add('preview-item');
					    div.innerHTML = '<span class="preview-number">' + (previewContainer.childElementCount + 1) + '.</span>' +
		                '<div class="preview-image">' + img.outerHTML + '</div>';
					    previewContainer.appendChild(div);
					}
					
				    fileInput.addEventListener('change', previewImages);
					</script>
					<input type="submit" value="전송하기"/>
				</div>
			</form>
			</div>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>		
	</div>
</body>
</html>