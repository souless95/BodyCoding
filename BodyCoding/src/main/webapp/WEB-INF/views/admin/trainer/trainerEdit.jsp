<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
onload = function(){
	   var obj1 = document.getElementById('mem_interest');
	    var type = '<c:out value="${trainer.mem_interest}"/>';
	    
	    for(var i=0 ; i<6 ; i++){
	        if(obj1.options[i].value==type){ 
	           obj1.options[i].selected=true;
	        }
	    }
	}
</script>
<body class="sb-nav-fixed">
	<!-- top메뉴  -->
	<%@ include file ="../../admin/inc/top.jsp" %>
	
		<div id="layoutSidenav">
		<!-- side -->
        <%@ include file ="../../admin/inc/side.jsp" %>
			<div id="layoutSidenav_content">
		        <main>
		        <form action="/trainerEdit.do" method="post" enctype="multipart/form-data">
		        	<div class="card mb-4" style="border-bottom: none;">
		        		<div class="card-header">
							<h2>${trainer.mem_name} 트레이너정보 수정하기</h2>
		        		</div>
		        		<div class="card-body" style="width: 80%">
		        			<h4>프로필 사진</h4>
		        			<img src="/static/uploads/trainer/${trainer.mem_img}" style="width:200px; height:200px;">
		        			<input type="hidden" name="mem_img" value="${trainer.mem_img }">
		        			<input class="form-control" id="mem_img" name="mem_img" type="file" style="display:inline;" />
		        			<table class="table" border="2">
								<tr>
						         	<th>센터코드</th>
							        <td><input type="text" name="gym_code" value="${trainer.gym_code}"/></td>
						         	<th colspan="2">이메일(아이디)</th>
							        <td><input type="text" name="mem_id" value="${trainer.mem_id}" readonly /></td>
						         	<th>비밀번호</th>
									<td><input type="password" name="mem_pass" value="${trainer.mem_pass}" /></td>
						         	<th>이름</th>
							        <td><input type="text" name="mem_name" value="${trainer.mem_name}"/></td>
						        </tr>
		        			</table>
							<table class="table" border="2">
						        <tr>
						         	<th>성별</th>
							        <td><input type="text" name="mem_gender" value="${trainer.mem_gender}"/></td>
						         	<th colspan="2">생년월일</th>
							        <td><input type="text" name="mem_birth" value="${trainer.mem_birth}"/></td>
						        </tr>
						       	<tr>
						       	 	<th>전화번호</th>
							        <td><input type="text" name="mem_phone" value="${trainer.mem_phone}"/></td>
						       	 	<th colspan="2">주소</th>
							        <td><input type="text" name="mem_address" value="${trainer.mem_address}"/></td>
						      	</tr>
							    <tr>
						       	 	<th>계정상태</th>
							        <td><input type="text" name="enabled" value="${trainer.enabled}"/></td>
							    </tr>
							</table>
							<table class="table" border="2">	
								<tr>
						       	 	<th>경력</th>
							        <td><input type="text" name="mem_career" value="${trainer.mem_career}"/></td>
						       	 	<th>키워드</th>
							        <td>
								        <select class="form-control" id="mem_interest" name="mem_interest" style="padding-top: 10px; padding-top: 10px;" required>
	                                         <option value="" selected> 대표단어를 선택해 주세요</option>
						                     <option value="친절">친절</option>
						                     <option value="열정">열정</option>
						                     <option value="재미">재미</option>
						                     <option value="정확">정확</option>
						                     <option value="칭찬">칭찬</option>
						                </select>
						            </td>
						      	</tr>
						      	<tr>
						       	 	<th>자기소개</th>
							        <td><input type="text" name="mem_comment" value="${trainer.mem_comment}"/></td>
						      	</tr>
							</table>
								<button type="submit" class="custom-btn btn-7" value="전송하기">전송하기</button>
								<button type="button" class="custom-btn btn-7" onclick="location.href='/main/admin'">홈으로</button> 
								<button type="button" class="custom-btn btn-7" onclick="history.back()">뒤로가기</button>
		        		</div>
					</div>
				</form>
				</main>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
			</div>
		</div>
</body>
</html>