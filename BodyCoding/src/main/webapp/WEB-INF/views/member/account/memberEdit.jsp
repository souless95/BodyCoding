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
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<style type="text/css">
.table-bordered{font-family: Verdana, Geneva, Tahoma, sans-serif;}
</style>

</head>
<body>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
	<div style="text-align:center;">
    <h2 class="mb-1">회원정보변경</h2>
    </div>
    <form method="post" action="memberEdit.do" class="validation-form" novalidate>
	    
	    <div>
    	 <div class="mb-1" >
	        <label for="mem_id">아이디(이메일)</label>
	        <input type="email" class="form-control" id="mem_id" name="mem_id" value="${memList.mem_id }" >
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
			<input type="text" class="form-control" id="mem_name" name="mem_name" onkeydown ="checkNonename()" value="${memList.mem_name }">
			<div class="invalid-feedback" id="namecheck" style="margin-bottom:20px; display:none;" >
              	이름을 입력해 주세요
              </div>
		</div>
		
		<br>
		 <div class="mb-2">
	        <label for="mem_gender">성별</label>
	       		<input type="radio" name="mem_gender" id="gen1" value="M" onchange="checkNone1();" required>&nbsp;남자
	        	<input type="radio" name="mem_gender" id="gen2" value="F" onchange="checkNone1();" required>&nbsp;여자<br>
	    	<div style="padding-bottom:30px;">
	    		<div style="margin-bottom:-15px;"></div>
		        <div id="mnw"  style="display:none;">
	              	<span style="color:#DC3545; font-size:16px;">성별을 선택해 주세요</span>
				</div>
			</div>
		</div>
		
		<div>
	 	<div class="mb-1">
	        <label for="mem_phone">전화번호</label>
	        <div id="phone">
	        	<div><input type ="hidden" name ="mem_phone" id="telFinal" value="${memList.mem_phone }" required></div>
                <div style="width:30%;"><input type ="tel" class="form-control valid" placeholder="010" id="tel1"  size="3" onkeyup="commonFocusMove('tel1', '3', 'tel2'); checkNone2();" maxlength="3" value="" required></div>
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
	        <input type="text" class="form-control" id="mem_address" onkeydown="checkNoneaddress();"  name="mem_address" value="${memList.mem_address }">
	        <div class="invalid-feedback" id="addresscheck" style="margin-bottom:20px;">
             	주소를 입력해 주세요
            </div>
		</div>
		<br>
		<div class="mb-1">
	        <label for="gym_code">지점선택</label>&nbsp;
	        <select class="custom-select d-block w-100"  name="gym_code" required>
                <option value="" disabled selected>지점을 선택해 주세요</option>
                <option id="code" value="종로">종로</option>
                <option id="code2" value="일산">일산</option>
                <option id="code3" value="성북">성북</option>
                <option id="code4" value="사당">사당</option>
                <option id="code5" value="오금">오금</option>
            </select>
	        <div class="invalid-feedback" style="margin-bottom:20px;">
             	지점을 선택해 주세요
             </div>
		</div>
		
		
		 <div class="mb-1">
			<input type="hidden" class="form-control" id="mem_point" name="mem_point" value="0">
			<input type="hidden" class="form-control" id="authority" name="authority" value="MEMBER">
	        <br>
	        <label for="mem_height">키</label>
	        <input type="number" class="form-control" id="mem_height" name="mem_height" value="${memList.mem_height }" onkeydown="checkNoneheight()" step="0.01" required>
	         <div class="invalid-feedback" id="heightcheck" style="margin-bottom:20px; display:none;">키를 입력해 주세요</div><br>
	
	        <label for="mem_weight">몸무게</label>
	        <input type="number" class="form-control" id="mem_weight" name="mem_weight" value="${memList.mem_weight }" onkeydown="checkNoneweight()" step="0.01" required>
	        <div class="invalid-feedback" id="weightcheck" style="margin-bottom:20px;">몸무게를 입력해 주세요</div><br>
	        
	        <label for="mem_disease">질병</label>
	        <div class="disease">
		        
		        <input type="checkbox" class="checkStyle" id="mem_disease1" name="mem_disease" value="shoulder" onchange="checkNone3()" required>
		        <label for="shoulder">어깨부상</label>&nbsp;&nbsp;
		        
		        
	        	<input type="checkbox" class="checkStyle" id="mem_disease2" name="mem_disease" value="knee" onchange="checkNone3()" required>
	        	<label for="knee">무릎부상</label>&nbsp;&nbsp;
	        
	        
	        	<input type="checkbox"  class="checkStyle" id="mem_disease3" name="mem_disease" value="back" onchange="checkNone3()" required>	
	        	<label for="back">허리부상</label>&nbsp;&nbsp;
	        	
		        
	           	<input type="checkbox" class="checkStyle" id="mem_disease4" name="mem_disease" value="hnf" onchange="checkNone3()" required>
	        	<label for="hnf">손목 또는 발목</label>&nbsp;&nbsp;

		        
	        	<input type="checkbox" class="checkStyle" id="mem_disease5" name="mem_disease" value="none" onchange="checkNone3()" required>
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
		        
		        <input type="checkbox" class="checkStyle" id="purpose1" name="mem_purpose" value="diet" onchange="checkNone4();" required>
		        <label for="diet">다이어트</label>&nbsp;&nbsp;
		        
		        
	        	<input type="checkbox" class="checkStyle" id="purpose2" name="mem_purpose" value="competition" onchange="checkNone4();" required>
	        	<label for="competition">대회준비</label>&nbsp;&nbsp;
	        
	        
	        	<input type="checkbox"  class="checkStyle" id="purpose3" name="mem_purpose" value="healthcare" onchange="checkNone4();" required>	
	        	<label for="healthcare">체력관리</label>&nbsp;&nbsp;
	        	
		        
	           	<input type="checkbox" class="checkStyle" id="purpose4" name="mem_purpose" value="etc" onchange="checkNone4();" required>
	        	<label for="etc">그 외</label>&nbsp;&nbsp;
	         </div>
	         <div id="purposecheck" style="margin-bottom:20px; display:none;">
              	<span style="color:#DC3545; font-size:16px;" style="margin-bottom:20px;">운동목적을 선택해 주세요</span><br>
             </div><br>
	
	        <label for="mem_interest">관심사항</label>
	        <div class="interest">
		        
		        <input type="checkbox" class="checkStyle" id="interest1" name="mem_interest" value="PT" onchange="checkNone5();" required>
		        <label for="PT">개인PT</label>&nbsp;&nbsp;
		        		        
	        	<input type="checkbox" class="checkStyle" id="interest2" name="mem_interest" value="pila" onchange="checkNone5();" required>
	        	<label for="pila">필라테스</label>&nbsp;&nbsp;
	        	        
	        	<input type="checkbox" class="checkStyle" id="interest3" name="mem_interest" value="gx" onchange="checkNone5();" required>	
	        	<label for="gx">GX</label>&nbsp;&nbsp;
		        
	        	<input type="checkbox" class="checkStyle" id="interest4" name="mem_interest" value="health" onchange="checkNone5();" required>
	        	<label for="yoga">헬스</label>
	         </div>
	         
	         <div id="interestcheck" style="margin-bottom:20px; display:none;">
              	<span style="color:#DC3545; font-size:16px;" style="margin-bottom:20px;">관심사항을 선택해 주세요</span><br>
             </div>

        <br>
        
        <!-- <button type="submit" class="btn btn-primary btn-lg btn-block">수정하기</button> -->
       <button type="button" class="btn btn-primary btn-lg btn-block" onclick="return totalcheck(this);">수정하기</button>
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="return totalcheck(this);">탈퇴하기</button>
        
     	</form>
  	
   
    	</div>
	</div>
	<footer class="my-3 text-center text-medium">
      <p class="mb-1">&copy; 2023 BodyCoding</p>
    </footer>
    <script>
    	//핸드폰번호 출력
		var phone = "${memList.mem_phone}";
		var num = phone.split('-');
		document.getElementById('tel1').value = num[0];
		document.getElementById('tel2').value = num[1];
		document.getElementById('tel3').value = num[2];
		
		//성별 체크
		var gen = "${memList.mem_gender}";
		if(gen == "M"){
			document.getElementById("gen1").checked = true;
		}		
		else if(gen == "F"){
			document.getElementById("gen2").checked = true;
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
		if(disease=="shoulder"){
			document.getElementById("mem_disease1").checked = true;
		}
		else if(disease=="knee"){
			document.getElementById("mem_disease2").checked = true;
		}
		else if(disease=="back"){
			document.getElementById("mem_disease3").checked = true;
		}
		else if(disease=="hnf"){
			document.getElementById("mem_disease4").checked = true;
		}
		else if(disease=="none"){
			document.getElementById("mem_disease5").checked = true;
		}
		
		//운동목적 선택
		var purpose = "${memList.mem_purpose}";
		if(purpose=="diet"){
			document.getElementById("purpose1").checked = true;
		}
		else if(purpose=="competition"){
			document.getElementById("purpose2").checked = true;
		}
		else if(purpose=="healthcare"){
			document.getElementById("purpose3").checked = true;
		}
		else if(purpose=="etc"){
			document.getElementById("purpose4").checked = true;
		}
		
		//관심사항 선택
		var interest = "${memList.mem_interest}";
		if(interest=="PT"){
			document.getElementById("interest1").checked = true;
		}
		else if(interest=="pila"){
			document.getElementById("interest2").checked = true;
		}
		else if(interest=="gx"){
			document.getElementById("interest3").checked = true;
		}
		else if(interest=="health"){
			document.getElementById("interest4").checked = true;
		}
		
		
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
    	
/*     	const gc = document.getElementsByName("mem_gender");
    	if(gc[0].checked==false && gc[1].checked==false){
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
    	
    	document.getElementById("telFinal").value = tel1.value + "-" + tel2.value + "-" + tel3.value; */
    	
    	forms.submit();
    }
    </script>

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
</div>
</body>
</html>