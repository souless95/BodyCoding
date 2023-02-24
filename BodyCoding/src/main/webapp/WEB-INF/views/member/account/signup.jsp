<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
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
    
    * {	font-weight:bold; font-size:20px; 
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
	
	</style>

</head>
<body>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
	<div style="text-align:center;">
    <h2 class="mb-1">회원가입</h2>
    </div>
    <form method="post" action="/signup.do" class="validation-form" novalidate>
    	<input type="hidden" id="mem_status" name="mem_status" value="1">
	    
	    <div>
    	 <div class="mb-1" >
	        <label for="mem_id">아이디(이메일)</label>
	        <input type="email" class="form-control" id="mem_id" name="mem_id" onkeydown="checkNoneid()" placeholder="you@example.com" required>
	        <div id="idcheck" style="margin-bottom:20px; display:none;">
                <span style="color:#DC3545; font-size:16px; ">아이디를 입력해주세요.</span>
            </div>
        </div>
       </div>
       
       <div>
         <div class="mb-1">
	        <label for="mem_pass">비밀번호</label>
	        <input type="password" class="form-control" id="mem_pass" name="mem_pass" onkeydown ="checkNonepass()" required>
			<div class="invalid-feedback" id="passcheck" style="margin-bottom:20px; display:none;">
              	비밀번호를 입력해 주세요.
              </div>
		</div>
		
		<div class="mb-1">
	        <label for="mem_pass1">비밀번호 확인</label>
	        <input type="password" class="form-control" id="mem_pass1" onkeydown ="checkNonepass1()" required>
			<div class="invalid-feedback" id="passcheck1" style="margin-bottom:20px; display:none;">
              	비밀번확인을 입력해 주세요
            </div>
		</div>
		
		</div>
		 <div class="mb-1">
	        <label for="mem_name">이름</label>
			<input type="text" class="form-control" id="mem_name" name="mem_name" onkeydown ="checkNonename()"required>
			<div class="invalid-feedback" id="namecheck" style="margin-bottom:20px; display:none;" >
              	이름을 입력해 주세요
              </div>
		</div>
		
		<br>
		 <div class="mb-2">
	        <label for="mem_gender">성별</label>
	       		<input type="radio" name="mem_gender" value="M" onchange="checkNone1();" required>&nbsp;남자
	        	<input type="radio" name="mem_gender" value="F" onchange="checkNone1();" required>&nbsp;여자<br>
	    	<div style="padding-bottom:30px;">
	    		<div style="margin-bottom:-15px;"></div>
		        <div id="mnw"  style="display:none;">
	              	<span style="color:#DC3545; font-size:16px;">성별을 선택해 주세요</span>
				</div>
			</div>
		</div>
		
		<!-- 생년월일 -->
		 <div class="mb-1">
	        <label for="mem_birth">생년월일</label>
	        <input type="date" class="form-control" id="mem_birth" onchange="checkNonedate();" name="mem_birth" required>
	        <div class="invalid-feedback" id="birthcheck" style="margin-bottom:20px; display:none;">
              	생년월일을 선택해 주세요
             </div>
		</div><br>
		
		<div>
	 	<div class="mb-1">
	        <label for="mem_phone">전화번호</label>
	        <div id="phone">
	        	<div><input type ="hidden" name ="mem_phone" id="telFinal" value="" required></div>
                <div style="width:30%;"><input type ="tel" class="form-control valid" placeholder="010" id="tel1"  size="3" onkeyup="commonFocusMove('tel1', '3', 'tel2'); checkNone2();" maxlength="3" required></div>
                <span style="margin-top:6px;">-</span>
                <div style="width:35%;"><input type ="tel" class="form-control valid" id="tel2" size="4" onkeyup="commonFocusMove('tel2', '4', 'tel3'); checkNone2();" maxlength="4" required></div>
                <span style="margin-top:6px;">-</span>
                <div style="width:35%;"><input type ="tel" class="form-control valid" maxlength='4' id="tel3" onkeyup="checkNone2();" maxlength="4" required></div>
            </div>
			</div>
			<div id="phonecheck" style="margin-bottom:20px; display:none;">
              	<span style="color:#DC3545; font-size:16px;">전화번호를 입력해 주세요</span>
            </div>
		</div>
		<br>
		
		 <div class="mb-1">
	        <label for="mem_address">주소</label>
	        <input type="text" class="form-control" id="mem_address" onkeydown="checkNoneaddress();"  name="mem_address" required>
	        <div class="invalid-feedback" id="addresscheck" style="margin-bottom:20px;">
             	주소를 입력해 주세요
             </div>
		</div>
		<br>
		 <div class="mb-1">
	        <label for="gym_code">지점선택</label>&nbsp;
	        <select class="custom-select d-block w-100" name="gym_code" required>
                <option value="" disabled selected>지점을 선택해 주세요</option>
                <option>종로</option>
                <option>일산</option>
                <option>성북</option>
                <option>사당</option>
                <option>오금</option>
              </select>
	        <div class="invalid-feedback" style="margin-bottom:20px;">
             	지점을 선택해 주세요
             </div>
		</div>
		
		
		 <div class="mb-1">
			<input type="hidden" class="form-control" id="mem_point" name="mem_point" value="0">
			<input type="hidden" class="form-control" id="mem_type" name="mem_type" value="MEMBER">
	        <br>
	        <label for="mem_height">키</label>
	        <input type="number" class="form-control" id="mem_height" name="mem_height" onkeydown="checkNoneheight()" step="0.01" required>
	         <div class="invalid-feedback" id="heightcheck" style="margin-bottom:20px; display:none;">키를 입력해 주세요</div><br>
	
	        <label for="mem_weight">몸무게</label>
	        <input type="number" class="form-control" id="mem_weight" name="mem_weight" onkeydown="checkNoneweight()" step="0.01" required>
	        <div class="invalid-feedback" id="weightcheck" style="margin-bottom:20px;">몸무게를 입력해 주세요</div><br>
	        
	        <label for="mem_disease">질병</label>
	        <div class="disease">
		        
		        <input type="checkbox" class="checkStyle" name="mem_disease" value="shoulder" onchange="checkNone3()" required>
		        <label for="shoulder">어깨부상</label>&nbsp;&nbsp;
		        
		        
	        	<input type="checkbox" class="checkStyle" name="mem_disease" value="knee" onchange="checkNone3()" required>
	        	<label for="knee">무릎부상</label>&nbsp;&nbsp;
	        
	        
	        	<input type="checkbox"  class="checkStyle" name="mem_disease" value="back" onchange="checkNone3()" required>	
	        	<label for="back">허리부상</label>&nbsp;&nbsp;
	        	
		        
	           	<input type="checkbox" class="checkStyle" name="mem_disease" value="hnf" onchange="checkNone3()" required>
	        	<label for="hnf">손목 또는 발목</label>&nbsp;&nbsp;

		        
	        	<input type="checkbox" class="checkStyle" name="mem_disease" value="none" onchange="checkNone3()" required>
	        	<label for="none">선택사항 없음</label>
	         </div>
	        
	         <div id="diseasecheck" style="margin-bottom:20px; display:none;">
              	<span style="color:#DC3545; font-size:16px;">질병 유무를 선택해 주세요</span><br>
             </div>
			
			<div class="purpose">
		        <label for="mem_purpose">운동목적</label>&nbsp;&nbsp;
		        <div><span style="font-size:15px; color:gray;"> ex)체중감량, 대회준비, 체력관리...</span></div>
	        </div>
	        <div class=purpose_detail>
		        
		        <input type="checkbox" class="checkStyle" name="mem_purpose" value="diet" onchange="checkNone4();" required>
		        <label for="diet">다이어트</label>&nbsp;&nbsp;
		        
		        
	        	<input type="checkbox" class="checkStyle" name="mem_purpose" value="competition" onchange="checkNone4();" required>
	        	<label for="competition">대회준비</label>&nbsp;&nbsp;
	        
	        
	        	<input type="checkbox"  class="checkStyle" name="mem_purpose" value="healthcare" onchange="checkNone4();" required>	
	        	<label for="healthcare">체력관리</label>&nbsp;&nbsp;
	        	
		        
	           	<input type="checkbox" class="checkStyle" name="mem_purpose" value="etc" onchange="checkNone4();" required>
	        	<label for="etc">그 외</label>&nbsp;&nbsp;
	         </div>
	         <div id="purposecheck" style="margin-bottom:20px; display:none;">
              	<span style="color:#DC3545; font-size:16px;" style="margin-bottom:20px;">운동목적을 선택해 주세요</span><br>
             </div><br>
	
	        <label for="mem_interest">관심사항</label>
	        <div class="interest">
		        
		        <input type="checkbox" class="checkStyle" name="mem_interest" value="PT" onchange="checkNone5();" required>
		        <label for="PT">개인PT</label>&nbsp;&nbsp;
		        		        
	        	<input type="checkbox" class="checkStyle" name="mem_interest" value="pila" onchange="checkNone5();" required>
	        	<label for="pila">필라테스</label>&nbsp;&nbsp;
	        	        
	        	<input type="checkbox"  class="checkStyle" name="mem_interest" value="gx" onchange="checkNone5();" required>	
	        	<label for="gx">GX</label>&nbsp;&nbsp;
		        
	        	<input type="checkbox" class="checkStyle" name="mem_interest" value="health" onchange="checkNone5();" required>
	        	<label for="yoga">헬스</label>
	         </div>
	         
	         <div id="interestcheck" style="margin-bottom:20px; display:none;">
              	<span style="color:#DC3545; font-size:16px;" style="margin-bottom:20px;">관심사항을 선택해 주세요</span><br>
             </div>
	
	
		<div class="mb-1">
	        <label for="mem_inflow">유입경로</label>
	        <select class="custom-select d-block w-100" name="mem_inflow"  required>
                <option value="" disabled selected> 센터를 알게된 경로를 선택해 주세요</option>
                <option>지인추천</option>
                <option>SNS</option>
                <option>인터넷 검색</option>
                <option>전단지, 홍보물</option>
            </select>
	        <div class="invalid-feedback" style="margin-bottom:20px;">센터를 알게된 경로를 입력해주세요.</div><br>
	   	</div>      
        </div>
        
        <!-- div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" onchange="checkNoneagree()" id="agreement" required>
            <label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
             <div class="invalid-feedback" id="agreecheck" >개인정보 수집 및 이용에 동의해주세요.</div>
        </div> -->

        <br>
        
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="return totalcheck(this);">가입하기</button>
        
     	</form>
  	
   
    	</div>
	</div>
	<footer class="my-3 text-center text-medium">
      <p class="mb-1">&copy; 2023 BodyCoding</p>
    </footer>
</div>
<<<<<<< HEAD
<<<<<<< HEAD

 <script>
 	const forms = document.getElementsByClassName('validation-form');
    window.addEventListener('load', () => {
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
    function totalcheck(forms){
    	
    	const gc = document.getElementsByName("mem_gender");
    	if(gc[0].checked==false || gc[1].checked==false){
    		document.getElementById("mnw").style.display = "inline-block";
    	}
    	
    	const tell1 = document.getElementById("tel1"); 
    	const tell2 = document.getElementById("tel2");
    	const tell3 = document.getElementById("tel3");
    	if(tell1.value=="" || tell2.value=="" || tell3.value==""){
    		document.getElementById("phonecheck").style.display = 'inline-block';
    	}
    	
    	const disease = document.getElementsByName("mem_disease");
    	if(disease[0].checked == false && disease[1].checked == false && disease[2].checked == false &&
    			disease[3].checked == false && disease[4].checked == false){
    		document.getElementById("diseasecheck").style.display = 'inline-block';
    	}
    	
    	const purpose = document.getElementsByName("mem_purpose");
    	if(purpose[0].checked == false && purpose[1].checked == false && purpose[2].checked == false &&
    			purpose[3].checked == false){
    		document.getElementById("purposecheck").style.display = 'inline-block';
    	}
    	
    	const mem_interest = document.getElementsByName("mem_interest");
    	if(mem_interest[0].checked == false && mem_interest[1].checked == false && mem_interest[2].checked == false &&
    			mem_interest[3].checked == false){
    		document.getElementById("interestcheck").style.display = 'inline-block';
    	}
    	
    	document.getElementById("telFinal").value = tel1.value + "-" + tel2.value + "-" + tel3.value;
    }
    
    function checkNone(){
    	const tel1 = document.getElementById("tel1");
    	const tel2 = document.getElementById("tel2");
    	const tel3 = document.getElementById("tel3");
    	if(tel1.value!="" && tel2.value!="" && tel3.value!=""){
    		document.getElementById("phonecheck").style.display = 'none';
    	}
<<<<<<< HEAD
    	if(tell1.value=="" || tell2.value=="" || tell3.value==""){
    		document.getElementById("phonecheck").style.display = 'inline-block';
=======
    	if(tel1.value=="" || tel2.value=="" || tel3.value==""){
    		document.getElementById("phonecheck").style.display = 'inline';
>>>>>>> branch 'main' of https://github.com/souless95/BodyCoding.git
    	}
    	
    	const gc = document.getElementsByName("mem_gender");
    	if(gc[0].checked==true || gc[1].checked==true){
    		document.getElementById("mnw").style.display = "none";
    	}
    	
    	const disease = document.getElementsByName("mem_disease");
    	if(disease[0].checked == true || disease[1].checked == true || disease[2].checked == true ||
    			disease[3].checked == true || disease[4].checked == true){
    		document.getElementById("diseasecheck").style.display = 'none';
    	}
    	if(disease[0].checked == false && disease[1].checked == false && disease[2].checked == false &&
    			disease[3].checked == false && disease[4].checked == false){
    		document.getElementById("diseasecheck").style.display = 'inline-block';
    	}
    	
    	const purpose = document.getElementsByName("mem_purpose");
    	if(purpose[0].checked == true || purpose[1].checked == true || purpose[2].checked == true ||
    			purpose[3].checked == true){
    		document.getElementById("purposecheck").style.display = 'none';
    	}
    	if(purpose[0].checked == false && purpose[1].checked == false && purpose[2].checked == false &&
    			purpose[3].checked == false){
    		document.getElementById("purposecheck").style.display = 'inline-block';
    	}
    	
    	const mem_interest = document.getElementsByName("mem_interest");
    	if(mem_interest[0].checked == true || mem_interest[1].checked == true || mem_interest[2].checked == true ||
    			mem_interest[3].checked == true){
    		document.getElementById("interestcheck").style.display = 'none';
    	}
    	if(mem_interest[0].checked == false && mem_interest[1].checked == false && mem_interest[2].checked == false &&
    			mem_interest[3].checked == false){
    		document.getElementById("interestcheck").style.display = 'inline-block';
    	}
    }
        
    </script>
=======
>>>>>>> branch 'main' of https://github.com/souless95/BodyCoding.git
=======

<script type="text/javascript">
	function commonFocusMove(thisObj, numLength, nextObj){
		var obj1 = document.getElementById(thisObj);
		var strLen2 = obj1.value.length;
		if(strLen2 == numLength){
			document.getElementById(nextObj).focus();
		}
	}
	
	 /* const frms = document.getElementsByClassName('validation-form');
	    window.addEventListener('load', () => {      
	      Array.prototype.filter.call(frms, (form) => {
	        form.addEventListener('submit', function (event) {
	          if (form.checkValidity() == false) {
	            event.preventDefault();
	            event.stopPropagation();
	          }

	          form.classList.add('was-validated');
	        }, false);
	      });
	    }, false); */
	    
	    //"was-validated"
	 
    function totalcheck(frms){
    	//idc = idcheck
    	var idc = document.getElementById("mem_id");
    	if(idc.value=="" || idc.value==null){
    		document.getElementById("idcheck").style.display = "inline";
    		return false;
    	}
    	//passc = passcheck
    	var passc = document.getElementById("mem_pass")
    	if(passc.value==""){
    		document.getElementById("passcheck").style.display = "inline";
    		return false;
    	}
    	
    	var passc1 = document.getElementById("mem_pass1")
    	if(passc1.value==""){
    		document.getElementById("passcheck1").style.display = "inline";
    		return false;
    	}
    	
    	//nc=namecheck
    	var nc = document.getElementById("mem_name")
    	if(nc.value==""){
    		document.getElementById("namecheck").style.display = "inline";
    		return false;
    	}
    	
    	//gc = gendercheck
    	const gc = document.getElementsByName("mem_gender");
    	if(gc[0].checked==false && gc[1].checked==false){
    		document.getElementById("mnw").style.display = "inline";
    		return false;
    	}
    	
    	//bc = birth check
    	var bc = document.getElementById("mem_birth");
    	if(bc.value==""){
    		document.getElementById("birthcheck").style.display = 'inline';
    		return false;
    	}
    	
    	const tel1 = document.getElementById("tel1"); 
    	const tel2 = document.getElementById("tel2");
    	const tel3 = document.getElementById("tel3");
    	if(tel1.value=="" || tel2.value=="" || tel3.value==""){
    		document.getElementById("phonecheck").style.display = 'inline';
    		return false;
    	}
    	
    	// ac = address check
    	var ac = document.getElementById("mem_address")
    	if(ac.value==""){
    		document.getElementById("addresscheck").style.display = 'inline';
    		return false;
    	}
    	
    	// hc == height check
    	var hc = document.getElementById("mem_height")
    	if(hc.value==""){
    		document.getElementById("heightcheck").style.display = 'inline';
    		return false;
    	}
    	
    	//wc == weight check
    	var wc = document.getElementById("mem_weight")
    	if(wc.value==""){
    		document.getElementById("weightcheck").style.display = 'inline';
    		return false;
    	}
    	    	
    	const disease = document.getElementsByName("mem_disease");
    	if(disease[0].checked == false && disease[1].checked == false && disease[2].checked == false &&
    			disease[3].checked == false && disease[4].checked == false){
    		document.getElementById("diseasecheck").style.display = 'inline';
    		return false;
    	}
    	
    	const purpose = document.getElementsByName("mem_purpose");
    	if(purpose[0].checked == false && purpose[1].checked == false && purpose[2].checked == false &&
    			purpose[3].checked == false){
    		document.getElementById("purposecheck").style.display = 'inline';
    		return false;
    	}
    	
    	const mem_interest = document.getElementsByName("mem_interest");
    	if(mem_interest[0].checked == false && mem_interest[1].checked == false && mem_interest[2].checked == false &&
    			mem_interest[3].checked == false){
    		document.getElementById("interestcheck").style.display = 'inline';
    		return false;
    	}
    	
    	document.getElementById("telFinal").value = tel1.value + "-" + tel2.value + "-" + tel3.value; 
    	
    	//personal_information (=pi)
    	const pi = document.getElementsByName("agreement")
    	if(pi.checked==false){
    		document.getElementById("agree").style.display = 'inline';
    		return false;
    	}
    	
    	
    	frms.submit(); 
    }
    
 
   function checkNoneid(){
      	var idc = document.getElementById("mem_id").value;
    	if(idc!=""){
    		document.getElementById("idcheck").style.display ='none';
    	}
    	else if(idc==""){
    		document.getElementById("idcheck").style.display= 'inline';
    	}
    }
   
   function checkNonepass(){
	   var passc = document.getElementById("mem_pass").value;
	   
	   if(passc!=""){
		   document.getElementById("passcheck").style.display = 'none';
	   }
	   else if(passc==""){
		   document.getElementById("passcheck").style.display ='inline';
	   }
   }
   
   function checkNonepass1(){
	   var passc1 = document.getElementById("mem_pass1").value;
	   
	   if(passc1!=""){
		   document.getElementById("passcheck1").style.display = 'none';
	   }
	   else if(passc1==""){
		   document.getElementById("passcheck1").style.display ='inline';
	   }
   }
   
   function checkNonename(){
	   var name = document.getElementById("mem_name").value;
	   
	   if(name!=""){
		   document.getElementById("namecheck").style.display = 'none';
	   }
	   else if (name==""){
		   document.getElementById("namecheck").style.display = 'inline';
	   }
   }
   
   function checkNonedate(){
	   var bc = document.getElementById("mem_birth").value;
	   if(bc!=""){
		   document.getElementById("birthcheck").style.display ='none';
	   }
	   
   }
   
   function checkNoneaddress(){
	   var ac = document.getElementById("mem_address").value;
	   if(ac!=""){
		   document.getElementById("addresscheck").style.display ='none';
	   }
	   else if (ac==""){
		   document.getElementById("addresscheck").style.display = 'inline';
	   }
   }
   
       
   function checkNoneheight(){
	   var hc = document.getElementById("mem_height").value;
	   if(hc!=""){
		   document.getElementById("heightcheck").style.display ='none';
	   }
	   else if (hc==""){
		   document.getElementById("heightcheck").style.display = 'inline';
	   }
   }
    
    function checkNoneweight(){
 	   var wc = document.getElementById("mem_weight").value;
 	   if(wc!=""){
 		   document.getElementById("weightcheck").style.display ='none';
 	   }
 	   else if (wc==""){
 		   document.getElementById("weightcheck").style.display = 'inline';
 	   }
    }
   
   
    function checkNone1(){
    	const gc = document.getElementsByName("mem_gender");
    	if(gc[0].checked==true || gc[1].checked==true){
    		document.getElementById("mnw").style.display = "none";
    	}
    }

    function checkNone2(){
	    const tel1 = document.getElementById("tel1");
	    const tel2 = document.getElementById("tel2");
	    const tel3 = document.getElementById("tel3");
	    if(tel1.value!="" && tel2.value!="" && tel3.value!=""){
		    document.getElementById("phonecheck").style.display = 'none';
		    }
	    if(tel1.value=="" || tel2.value=="" || tel3.value==""){
		    document.getElementById("phonecheck").style.display = 'inline';
		    }
	    }

    function checkNone3(){
	    const disease = document.getElementsByName("mem_disease");
	    if(disease[0].checked == true || disease[1].checked == true || disease[2].checked == true ||
	    	disease[3].checked == true || disease[4].checked == true){
		    	document.getElementById("diseasecheck").style.display = 'none';
		}
	    if(disease[0].checked == false && disease[1].checked == false && disease[2].checked == false &&
	   		disease[3].checked == false && disease[4].checked == false){
		    	document.getElementById("diseasecheck").style.display = 'inline';
		    }
	    }

    function checkNone4(){
    const purpose = document.getElementsByName("mem_purpose");
	    if(purpose[0].checked == true || purpose[1].checked == true || purpose[2].checked == true ||
		    purpose[3].checked == true){
			    document.getElementById("purposecheck").style.display = 'none';
	    }
    if(purpose[0].checked == false && purpose[1].checked == false && purpose[2].checked == false &&
    	purpose[3].checked == false){
    		document.getElementById("purposecheck").style.display = 'inline';
   		}
    }

    function checkNone5(){
    const mem_interest = document.getElementsByName("mem_interest");
   		if(mem_interest[0].checked == true || mem_interest[1].checked == true || mem_interest[2].checked == true ||
    		mem_interest[3].checked == true){
   				document.getElementById("interestcheck").style.display = 'none';
    }
    if(mem_interest[0].checked == false && mem_interest[1].checked == false && mem_interest[2].checked == false &&
    		mem_interest[3].checked == false){
    			document.getElementById("interestcheck").style.display = 'inline';
   		 }
    }
    
    
    function checkNoneagree(){
    	const agree = document.getElementsByName("agreement");
    	if(agree.checked == true){
    		document.getElementById("agreecheck").style.display = 'none';
    	}
    	if(agree.checked == false){
    		document.getElementById("agreecheck").style.display = 'inline';
      	}
      }
</script>
>>>>>>> branch 'main' of https://github.com/souless95/BodyCoding.git
</body>
</html>