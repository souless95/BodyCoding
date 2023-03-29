<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div class="col-md-9 col-md-7 col-lg-5 mx-auto">
		<div class="card border-0 shadow rounded-3 my-5">
			<div class="card-body p-4 p-sm-5">
				<h2 class="card-title text-center mb-5 fw-light fs-5">추가정보 입력</h2>
				<form method="post" action="/kakaoregist.do">
					<input type="hidden"  name="mem_id" value="${UserEmail }">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="mem_name" name="mem_name" required>
						<label for="mem_name">이름</label>
					</div>
					<div class="form-floating mb-3">
					<input type="tel" class="form-control" id="mem_phone" name="mem_phone" required>
						<label for="mem_phone">전화번호</label>
					</div>
					<div class="form-floating mb-3">
					<input type="text" class="form-control" id="mem_address" name="mem_address" required>
						<label for="mem_phone">주소</label>
					</div>
					<div class="mb-1">
		                <label for="gym_code">지점선택</label>&nbsp;
		                <select name="gym_code" class="custom-select d-block w-100">
						    <option value="">지점</option>
							<c:forEach items="${gymList }" var="gym" varStatus="loop">
						    <option value="${gym.gym_code }">${gym.mem_name }</option>
							</c:forEach>
						</select>
		            </div>
		            <label for="mem_interest">관심사항</label>
		            <div class="interest">
		               <input type="checkbox" class="checkStyle" name="mem_interest" value="친절">
		               <label for="친절">친절&nbsp;&nbsp;</label>
		                             
		               <input type="checkbox" class="checkStyle" name="mem_interest" value="열정">
		               <label for="열정">열정</label>&nbsp;&nbsp;
		                       
		               <input type="checkbox"  class="checkStyle" name="mem_interest" value="재미">   
		               <label for="재미">재미</label>&nbsp;&nbsp;
		               
		               <input type="checkbox" class="checkStyle" name="mem_interest" value="정확">
		               <label for="정확">정확</label>
		               
		               <input type="checkbox" class="checkStyle" name="mem_interest" value="칭찬">
		               <label for="칭찬">칭찬</label>
		               
		               <input type="hidden" class="checkStyle" name="mem_interest" value="" checked>
		            </div>
	        		<button type="submit">완료</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>