<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link href="../static/admin/css/styles.css" rel="stylesheet" />

<!-- Bootstrap core JavaScript -->
<script src="../static/assets/jquery/jquery-3.6.1.js"></script>
<meta charset="UTF-8">
<title>Find ID</title>
<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}

body {
	background-color: white;
}

.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.card-signin .card-title {
	margin-bottom: 2rem;
	font-weight: 300;
	font-size: 1.5rem;
}

.card-signin .card-body {
	padding: 2rem;
}

.form-signin {
	width: 100%;
}

.form-signin .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}

.form-label-group {
	position: relative;
	margin-bottom: 1rem;
}

.form-label-group input {
	height: auto;
	border-radius: 2rem;
}

.form-label-group>input, .form-label-group>label {
	padding: var(- -input-padding-y) var(- -input-padding-x);
}

.form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: inline_block;
	width: 100%;
	margin-bottom: 0;
	/* Override default `<label>` margin */
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
	transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
	color: transparent;
}

.form-label-group input:-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-moz-placeholder {
	color: transparent;
}

.form-label-group input::placeholder {
	color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
	padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
	padding-bottom: calc(var(- -input-padding-y)/3);
}

.form-label-group input:not(:placeholder-shown) ~label {
	padding-top: calc(var(- -input-padding-y)/3);
	padding-bottom: calc(var(- -input-padding-y)/3);
	font-size: 12px;
	color: #777;
}
</style>

</head>
<body>
<form method="post" class="form-signin" action="gofindpass" name="findform">
		<div class="form-label-group">
			<input type="text" id="mem_id" name="mem_id" class="form-control"/>
			<label for="name">id</label>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="mem_name" name="mem_name" class="form-control"/>
			<label for="name">name</label>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="mem_birth" name="mem_birth" class="form-control"/>
			<label for="phone">birth</label>
		</div>

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
		</div>

		<!-- 이름과 전화번호가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.mem_id.value = "";
				opener.document.findform.mem_name.value = "";
				opener.document.findform.mem_birth.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
		<c:if test="${check == 0 }">
		<label>찾으시는 비밀번호는' ${mem_pass}' 입니다.</label>
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="로그인" onClick="location.href='/login.do'">
			</div>
		</c:if>

	</form>
	
	
</body>
</html>