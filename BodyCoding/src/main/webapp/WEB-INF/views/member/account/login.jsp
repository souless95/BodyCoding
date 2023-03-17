<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

<meta charset="UTF-8">
<title>로그인 페이지</title>

<style>
.input-box{
  position:relative;
  margin:10px 0;
}
.input-box > input{
  background:transparent;
  border:none;
  border-bottom: solid 1px #ccc;
  padding:20px 0px 5px 0px;
  font-size:14pt;
  width:100%;
}
input::placeholder{
	color:transparent;
}
input:placeholder-shown + label{
  color:#aaa;
  font-size:14pt;
  top:15px;
}
input:focus + label, label{
  color:#8aa1a1;
  font-size:10pt;
  pointer-events: none;
  position: absolute;
  left:0px;
  top:0px;
  transition: all 0.2s ease ;
  -webkit-transition: all 0.2s ease;
  -moz-transition: all 0.2s ease;
  -o-transition: all 0.2s ease;
}
input:focus, input:not(:placeholder-shown){
  border-bottom: solid 1px #8aa1a1;
  outline:none;
}
</style>
<script type="text/javascript">
function submitForm()
{
    var f = document.frm; // 폼 이름
    	if(f.name.value == "")
     	{
      		alert('aaaa');
      	return false; // 폼 전송 안함.
     	}
    return true; // 폼 전송 함.
} 
</script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h2>로그인</h2>
						<form action="/login.do" method="POST">
				            <div class="input-box">
				                <input id="mem_id" type="text" name="mem_id" placeholder="아이디" required>
				                <label for="mem_id">아이디</label>
				            </div>
				
				            <div class="input-box">
				                <input id="mem_pass" type="password" name="mem_pass" placeholder="비밀번호" required>
				                <label for="mem_pass">비밀번호</label>
				            </div>
				            <div id="forgot">비밀번호 찾기</div>
				            <!--  -->
							<img src="static/member/images/kakao_login.png" style="width: 200px; height: 45px;" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=a7d2784fba5cd05b34f27b173250d1b7&redirect_uri=http://localhost:8586/callback&response_type=code'">
							<button type="submit" class="custom-btn btn-1" style="width: 200px; height: 45px;">로그인</button>
							<div class="find">
								<div>
									<a href="findid" type="submit" class="btn btn-outline btn-success"> 아이디찾기</a>
									<a href="findpw" type="submit" class="btn btn-outline btn-success">비밀번호찾기</a>
								</div>
							</div>
				        </form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>