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
<link href="../static/admin/css/styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<style type="text/css">
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
       font-family: 'Spoqa Han Sans Neo', 'sans-serif'; 
    }
    
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
				<div style="text-align: center;">
					<h2 class="mb-1">회원정보변경</h2>
				</div>
				<form method="post" action="memberEdit.do">
					<input type="hidden" name="enabled" value="1">
					<input type="hidden" name="authority" value="ROLE_MEMBER">
					<div class="mb-1">
						<label for="mem_id">아이디(이메일)</label> 
						<input type="text" class="form-control" id="mem_id" name="mem_id" value="${memList.mem_id }">
					</div>
					
					<div class="mb-3">
		                 <span id="redStar">*</span>&nbsp;<label for="mem_pass">비밀번호</label>
		                 <input type="password" class="form-control" id="mem_pass" name="mem_pass" value="" onkeyup="validatePassword();" required>
		            </div>
		            <div class="mb-3">
		                <span id="redStar">*</span>&nbsp;<label for="mem_pass1">비밀번호 확인</label>
		                <input type="password" class="form-control" id="mem_pass1" value="" onkeyup="validatePassword();" required>
		            </div>
					<div class="mb-1">
						<span id="redStar">*</span>&nbsp;<label for="mem_name">이름</label> 
						<input type="text" class="form-control" id="mem_name" name="mem_name" value="${memList.mem_name }" required>
					</div>

					<div class="mb-3">
		                 <label for="mem_gender">성별</label> &nbsp;&nbsp;
		                 <input type="radio" id="gen1" name="mem_gender" value="M">&nbsp;남자&nbsp;
		                 <input type="radio" id="gen2" name="mem_gender" value="F">&nbsp;여자<br>
		                 <input type="hidden" name="mem_gender" value="">
		            </div>

					 <div class="mb-1">
		                <span id="redStar">*</span>&nbsp;<label for="mem_phone">전화번호</label>
		                <div id="phone">
		                    <div><input type="hidden" name="mem_phone" id="telFinal" value="${memList.mem_phone }" required></div>
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
						<input type="text" class="form-control" id="mem_address" name="mem_address" value="${memList.mem_address }" required>
					</div>
					<br>
					<div class="mb-1">
						<label for="gym_code">지점선택</label>&nbsp; 
						<select class="custom-select d-block w-100" name="gym_code" onchange="chk();">
		                     <option value="1" selected>지점을 선택해 주세요</option>
		                     <option id="code" name="gym_code" value="종로">종로</option>
		                     <option id="code2" name="gym_code" value="일산">일산</option>
		                     <option id="code3" name="gym_code" value="성북">성북</option>
		                     <option id="code4" name="gym_code" value="사당">사당</option>
		                     <option id="code5" name="gym_code" value="오금">오금</option>
		                </select>
					</div>

					<div class="mb-1">
		                <label for="mem_height">키</label>
		                <input type="number" class="form-control" id="mem_height" name="mem_height" value="${memList.mem_height }" step="0.01">
		            </div>
					
					<div class="mb-1">
		                <label for="mem_weight">몸무게</label>
		                <input type="number" class="form-control" id="mem_weight" name="mem_weight" value="${memList.mem_weight }" step="0.01">
		            </div>
					
					<div class="mb-1">
		            	<label for="mem_disease">질병</label>
		            </div>
					<div class="disease_detail">
						<input type="checkbox" class="checkStyle" id="mem_disease1" name="mem_disease" value="shoulder">
						<label for="shoulder">어깨부상</label>&nbsp;&nbsp;
						
						<input type="checkbox" class="checkStyle" id="mem_disease2" name="mem_disease" value="knee">
						<label for="knee">무릎부상</label>&nbsp;&nbsp; 
						
						<input type="checkbox" class="checkStyle" id="mem_disease3" name="mem_disease" value="back"> 
						<label for="back">허리부상</label>&nbsp;&nbsp; 
						
						<input type="checkbox" class="checkStyle" id="mem_disease4" name="mem_disease" value="hnf"> 
						<label for="hnf">손목 또는 발목</label>&nbsp;&nbsp; 
						
						<input type="checkbox" class="checkStyle" id="mem_disease5" name="mem_disease" value="none"> 
						<label for="none">선택사항 없음</label>
						
						 <input type="hidden" class="checkStyle" name="mem_disease" value="">
					</div>


					<div class="purpose">
		                <label for="mem_purpose">운동목적</label>&nbsp;&nbsp;
		            </div>
		            
					<div class=purpose_detail>
						<input type="checkbox" class="checkStyle" id="purpose1" name="mem_purpose" value="diet"> 
						<label for="diet">다이어트</label>&nbsp;&nbsp;
						
						<input type="checkbox" class="checkStyle" id="purpose2" name="mem_purpose" value="competition"> 
						<label for="competition">대회준비</label>&nbsp;&nbsp;
						
						<input type="checkbox" class="checkStyle" id="purpose3" name="mem_purpose" value="healthcare"> 
						<label for="healthcare">체력관리</label>&nbsp;&nbsp;

						<input type="checkbox" class="checkStyle" id="purpose4" name="mem_purpose" value="etc">
						<label for="etc">그 외</label>&nbsp;&nbsp;
						
						<input type="hidden" class="checkStyle" name="mem_purpose" value="">
					</div>
					
					<label for="mem_interest">관심사항</label>
					<div class="interest">

						<input type="checkbox" class="checkStyle" id="purpose4" name="mem_purpose" value="etc">
						<label for="etc">그 외</label>&nbsp;&nbsp;
						
						<input type="hidden" class="checkStyle" name="mem_purpose" value="">
					</div>
					
					<label for="mem_interest">관심사항</label>
					<div class="interest">

						<input type="checkbox" class="checkStyle" id="interest1" name="mem_interest" value="PT">
						<label for="PT">개인PT</label>&nbsp;&nbsp; 
						
						<input type="checkbox" class="checkStyle" id="interest2" name="mem_interest" value="pila"> 
						<label for="pila">필라테스</label>&nbsp;&nbsp; 
						
						<input type="checkbox" class="checkStyle" id="interest3" name="mem_interest" value="gx"> 
						<label for="gx">GX</label>&nbsp;&nbsp;

						<input type="checkbox" class="checkStyle" id="interest4" name="mem_interest" value="health"> 
						<label for="yoga">헬스</label>
						
						<input type="hidden" class="checkStyle" name="mem_interest" value="">
					</div>

					<button type="submit" class="btn btn-primary btn-lg btn-block">수정하기</button>
					<button type="button" class="btn btn-primary btn-lg btn-block">탈퇴하기</button>
				</form>
			</div>
		</div>
	</div>
	<footer class="my-3 text-center text-medium">
		<p class="mb-1">&copy; 2023 BodyCoding</p>
	</footer>
	<script>
    	//핸드폰번호 출력
    	
    	function chk(){
    		console.log($("select[name=gym_code]").val());
    	}
    	
		var phone = "${memList.mem_phone}";
		var num = phone.split('-');
		document.getElementById('tel1').value = num[0];
		document.getElementById('tel2').value = num[1];
		document.getElementById('tel3').value = num[2];
		
		//성별 체크
		var gen = "${memList.mem_gender}";
		var gen1 = document.getElementById("gen1");
		var gen2 = document.getElementById("gen2");
		if (gen == "M") {
		  gen1.checked = true;
		} else if (gen == "F") {
		  gen2.checked = true;
		}
		
		//지점선택
		var code = "${memList.gym_code}";
		if(code == "종로"){
			document.getElementById("code").selected = true;
		}
		else if(code == "일산"){
			document.getElementById("code2").selected = true;
		}
		else if(code == "성북"){
			document.getElementById("code3").selected = true;
		}
		else if(code == "사당"){
			document.getElementById("code4").selected = true;
		}
		else if(code == "오금"){
			document.getElementById("code5").selected = true;
		}
		
		//질병선택
		var disease = "${memList.mem_disease}"
		if(disease.includes("shoulder")){
			document.getElementById("mem_disease1").checked = true;
		}
		if(disease.includes("knee")){
			document.getElementById("mem_disease2").checked = true;
		}
		if(disease.includes("back")){
			document.getElementById("mem_disease3").checked = true;
		}
		if(disease.includes("hnf")){
			document.getElementById("mem_disease4").checked = true;
		}
		if(disease.includes("none")){
			document.getElementById("mem_disease5").checked = true;
		}
		
		//운동목적 선택
		var purpose = "${memList.mem_purpose}";
		if(purpose.includes("diet")){
			document.getElementById("purpose1").checked = true;
		}
		if(purpose.includes("competition")){
			document.getElementById("purpose2").checked = true;
		}
		if(purpose.includes("healthcare")){
			document.getElementById("purpose3").checked = true;
		}
		if(purpose.includes("etc")){
			document.getElementById("purpose4").checked = true;
		}
		
		//관심사항 선택
		var interest = "${memList.mem_interest}";
		if(interest.includes("PT")){
			document.getElementById("interest1").checked = true;
		}
		if(interest.includes("pila")){
			document.getElementById("interest2").checked = true;
		}
		if(interest.includes("gx")){
			document.getElementById("interest3").checked = true;
		}
		if(interest.includes("health")){
			document.getElementById("interest4").checked = true;
		}
		
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
			
		}
			
	 	$(document).submit(function(){
	 		if($('#mem_weight').val()=="" || $('#mem_weight').val()==null){
				$('#mem_weight').val(0);
			}
	 		if($('#mem_height').val()=="" || $('#mem_height').val()==null){
				$('#mem_height').val(0);
			}
	 		if($('input:checkbox[name=mem_disease]:checked').length==0){
	 			$('input:checkbox[name=mem_disease]').val("");
	 		}
	 		if($('input:checkbox[name=mem_purpose]:checked').length==0){
	 			$('input:checkbox[name=mem_purpose]').val("");
	 		}
	 		if($('input:checkbox[name=mem_interest]:checked').length==0){
	 			$('input:checkbox[name=mem_interest]').val("");
	 		}
	 		if($('input:radio[name=mem_gender]:checked').val()==null || $('input:radio[name=mem_gender]:checked').val()=="" ){
	 			$('input:radio[name=mem_gender]:checked').val("");
	 		}
		});
    </script>
</body>
</html>