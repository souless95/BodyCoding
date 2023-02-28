<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>BodyCoding-Admin-Login</title>
    <link href="/static/admin/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>

    <h2>로그인 폼</h2>
	<div style="width: 600px;" class="border border-2 border-success rounded p-5">
	
	<c:if test="${empty mem_id }" var="loginResult">
		<c:if test="${errorMsg != null}">
		<p>
			Login Error! <br />
			${errorMsg}
		</p>
		</c:if>
		<form action="/adminLoginAction.do" method="post">
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" id="mem_id" placeholder="Enter ID" 
					name="mem_id">
				<label for="mem_id">아이디</label>
			</div>	
			<div class="form-floating mt-3 mb-3">
				<input type="password" class="form-control" id="mem_pass" placeholder="Enter password" 
					name="mem_pass">
				<label for="mem_pass">비밀번호</label>
			</div>	
			<div class="d-grid">
				<button type="submit" class="btn btn-primary btn-block">Submit</button>
			</div>
		</form>
	</c:if>
	<c:if test="${not loginResult }">
		 ${mem_id } 님, 좋은 아침입니다. <br />
		<a href="/">Root</a>
		<a href="main/admin">어드민페이지</a>
		<a href="/adminLogout.do">Logout</a>	
	</c:if>	
	</div>
        <!-- bottom -->
</body>
</html>
