<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<style>
    body {
	    min-height: 100vh;
	    background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
	    background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	    background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	    background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	    background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
	    max-width: 720px;
	    margin-top: 80px;
	    padding: 32px;
	    background: #fff;
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    border-radius: 10px;
	    -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	    -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    * {	
    	font-weight:bold;
    	font-size:20px; 
    	font-family: 'Spoqa Han Sans Neo', 'sans-serif'; }
    
    #phone{
		display : flex;
	}
	
	.disease{
		display : flex;
	}
	
	.interest{
		display : flex;
	}
	
	.purpose_detail{
		display : flex;
	}
	
	.checkStyle{
		width:20px;
		height:20px;
		margin-top:5px;
		margin-right:7px;
		background: #fff;
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    border-radius: 10px;
	    -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	    -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
	}
	
	.purpose{
		display :flex;
	}
	
	select option[value=""][disabled]{
		display: none;
	}
	
	select:invalid{
		color: #c0c0c0;
	}
	
	#redStar {
		color:red;
	}
	</style>
</head>
<body>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<div style="text-align:center;">
				<h2 class="mb-1">회원가입</h2>
			</div><br />
			<form method="post" action="signup.do">
				<input type="hidden" name="enabled" value="1">
				<input type="hidden" name="authority" value="ROLE_MEMBER">
			 	<div class="mb-3" >
				    <span id="redStar">*</span>&nbsp;<label for="mem_id">아이디(이메일)</label>
				    <input type="email" class="form-control" id="mem_id" name="mem_id" placeholder="you@example.com" required>
			    </div>
     
			    <div class="mb-3">
			   		<span id="redStar">*</span>&nbsp;<label for="mem_pass">비밀번호</label>
			        <input type="password" class="form-control" id="mem_pass" name="mem_pass" value="" onkeyup="validatePassword();" required>
				</div>
				<div class="mb-3">
				    <span id="redStar">*</span>&nbsp;<label for="mem_pass1">비밀번호 확인</label>
				    <input type="password" class="form-control" id="mem_pass1" value="" onkeyup="validatePassword();" required>
				</div>

				<div class="mb-4">
				       <span id="redStar">*</span>&nbsp;<label for="mem_name">이름</label>
					<input type="text" class="form-control" id="mem_name" name="mem_name" required>
				</div>

				<div class="mb-3">
			        <label for="mem_gender">성별</label> &nbsp;&nbsp;
	      			<input type="radio" name="mem_gender" value="M">&nbsp;남자&nbsp;
		       		<input type="radio" name="mem_gender" value="F">&nbsp;여자<br>
				</div>

				<!-- 생년월일 -->
				<div class="mb-1">
				    <label for="mem_birth">생년월일</label>
				    <input type="date" class="form-control" id="mem_birth" name="mem_birth">
				</div>

				<div class="mb-1">
				    <span id="redStar">*</span>&nbsp;<label for="mem_phone">전화번호</label>
				    <div id="phone">
				        <div><input type ="hidden" name ="mem_phone" id="telFinal" value="01034443355" required></div>
				        <div style="width:30%;"><input type ="tel" class="form-control valid" placeholder="010" id="tel1"  size="3" onkeyup="commonFocusMove('tel1', '3', 'tel2');" onchange="telValue();" maxlength="3" required></div>
						<span style="margin-top:6px;">-</span>
						<div style="width:35%;"><input type ="tel" class="form-control valid" id="tel2" size="4" onkeyup="commonFocusMove('tel2', '4', 'tel3');" onchange="telValue();" maxlength="4" required></div>
						<span style="margin-top:6px;">-</span>
						<div style="width:35%;"><input type ="tel" class="form-control valid" maxlength='4' id="tel3" onchange="telValue();" maxlength="4" required></div>
				    </div>
				</div>
				<br>
				<div class="mb-1">
				    <span id="redStar">*</span>&nbsp;<label for="mem_address">주소</label>
				    <input type="text" class="form-control" id="mem_address" name="mem_address" required>
				</div>
				<br>
				<div class="mb-1">
				    <label for="gym_code">지점선택</label>&nbsp;
			        <select class="custom-select d-block w-100" name="gym_code">
			            <option value="" disabled selected>지점을 선택해 주세요</option>
			            <option value="1">종로</option>
			            <option value="일산">일산</option>
			            <option value="성북">성북</option>
			            <option value="사당">사당</option>
			            <option value="오금">오금</option>
			        </select>
				</div>

				<div class="mb-1">
			        <label for="mem_height">키</label>
			        <input type="number" class="form-control" name="mem_height" step="0.01">
				</div>
				
				<div class="mb-1">
					<label for="mem_weight">몸무게</label>
					<input type="number" class="form-control" name="mem_weight" step="0.01">
				</div>	
				
				<div class="mb-1">
					<label for="mem_disease">질병</label>
				</div>
				<div>	
					<input type="checkbox" class="checkStyle" name="mem_disease" value="shoulder">
					<label for="shoulder">어깨부상</label>&nbsp;&nbsp;
					 
					<input type="checkbox" class="checkStyle" name="mem_disease" value="knee">
					<label for="knee">무릎부상</label>&nbsp;&nbsp;
				
					<input type="checkbox"  class="checkStyle" name="mem_disease" value="back">	
					<label for="back">허리부상</label>&nbsp;&nbsp;
				 
				   	<input type="checkbox" class="checkStyle" name="mem_disease" value="hnf">
					<label for="hnf">손목 또는 발목</label>&nbsp;&nbsp;
				 
					<input type="checkbox" class="checkStyle" name="mem_disease" value="none">
					<label for="none">선택사항 없음</label>
				</div>
 				<br />

				<div class="purpose">
				    <label for="mem_purpose">운동목적</label>&nbsp;&nbsp;
				</div>
			      
		        <div class=purpose_detail>
			       
			        <input type="checkbox" class="checkStyle" name="mem_purpose" value="diet">
			        <label for="diet">다이어트</label>&nbsp;&nbsp;
			       
			      	<label><input type="checkbox" class="checkStyle" name="mem_purpose" value="competition">
			      	대회준비</label>&nbsp;&nbsp;
			      
			      	<input type="checkbox"  class="checkStyle" name="mem_purpose" value="healthcare">	
			      	<label for="healthcare">체력관리</label>&nbsp;&nbsp;
			       
		         	<input type="checkbox" class="checkStyle" name="mem_purpose" value="etc">
			      	<label for="etc">그 외</label>&nbsp;&nbsp;
	       		</div>

				<label for="mem_interest">관심사항</label>
				<div class="interest">
				
					<input type="checkbox" class="checkStyle" name="mem_interest" value="PT">
					<label for="PT">개인PT</label>&nbsp;&nbsp;
							        
					<input type="checkbox" class="checkStyle" name="mem_interest" value="pila">
					<label for="pila">필라테스</label>&nbsp;&nbsp;
					        
					<input type="checkbox"  class="checkStyle" name="mem_interest" value="gx">	
					<label for="gx">GX</label>&nbsp;&nbsp;
					
					<input type="checkbox" class="checkStyle" name="mem_interest" value="health">
					<label for="yoga">헬스</label>
				</div>

				<div class="mb-1">
				    <label for="mem_inflow">유입경로</label>
				    <select class="custom-select d-block w-100" name="mem_inflow">
			            <option value="" disabled selected> 센터를 알게된 경로를 선택해 주세요</option>
			            <option value="지인추천">지인추천</option>
			            <option value="SNS">SNS</option>
			            <option value="인터넷검색">인터넷 검색</option>
			            <option value="전단지및홍보물">전단지, 홍보물</option>
			        </select>
				</div>
   
			    <!-- <div class="custom-control custom-checkbox">
				    <input type="checkbox" class="custom-control-input" required>
				    <label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
				</div> -->
				<br> 
				<button type="submit" class="btn btn-primary btn-lg btn-block">가입하기</button>
			</form>
		</div>
	</div>
</div>
<footer class="my-3 text-center text-medium">
     <p class="mb-1">&copy; 2023 BodyCoding</p>
</footer>
	<script>
		function commonFocusMove(thisObj, numLength, nextObj){
			var obj1 = document.getElementById(thisObj);
			var strLen2 = obj1.value.length;
			if(strLen2 == numLength){
				document.getElementById(nextObj).focus();
			}
		}
			
		var password = document.getElementById("mem_pass");
		var confirm_password = document.getElementById("mem_pass1");

		function validatePassword(){
		  if(password.value != confirm_password.value) {
			  confirm_password.setCustomValidity("비밀번호와 비밀번호 확인값이 일치하지 않습니다.");
		  }
		  else {
		    confirm_password.setCustomValidity(''); 
		  }
		}
		
		function telValue(){
			var tel1 = document.getElementById("tel1");
			var tel2 = document.getElementById("tel2");
			var tel3 = document.getElementById("tel3");
			var telFinal = document.getElementById("telFinal");
			
			telFinal.value = tel1.value + "-" + tel2.value + "-" + tel3.value;
			
			/* frm.submit(); */
		}
	</script>
</body>
</html>