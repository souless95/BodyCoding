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
      max-width: 680px;

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
	
	.gender{
		float:left;
	}
  </style>

</head>
<script type="text/javascript">
function commonFocusMove(thisObj, numLength, nextObj){
	var obj1 = document.getElementById(thisObj);
	var strLen2 = obj1.value.length;
	if(strLen2 == numLength){
		document.getElementById(nextObj).focus();
	}
}

</script>
<body>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
	<div style="text-align:center;">
    <h2 class="mb-1">회원가입</h2>
    </div>
    <form method="post"  action="/signup.do" class="validation-form" novalidate>
    	<input type="hidden" id="mem_status" name="mem_status" value="1">
	    
	    <div>
    	 <div class="mb-1" >
	        <label for="mem_id">아이디(이메일)</label>
	        <input type="email" class="form-control" id="mem_id" name="mem_id" placeholder="you@example.com" value="" required>
	        <div class="invalid-feedback" style="margin-bottom:20px;">
                아이디를 입력해주세요.
              </div>
        </div>
       </div>
       
       <div>
         <div class="mb-1">
	        <label for="mem_pass">비밀번호</label>
	        <input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="" value="" required>
			<div class="invalid-feedback" style="margin-bottom:20px;">
              	비밀번호를 입력해 주세요.
              </div>
		</div>
		
		<div class="mb-1">
	        <label for="mem_pass">비밀번호 확인</label>
	        <input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="" value="" required>
			<div class="invalid-feedback" style="margin-bottom:20px;">
              	비밀번호를 입력해 주세요
            </div>
		</div>
		
		</div>
		 <div class="mb-1">
	        <label for="mem_name">이름</label>
			<input type="text" class="form-control" id="mem_name" name="mem_name" required>
			<div class="invalid-feedback" style="margin-bottom:20px;">
              	이름을 입력해 주세요
              </div>
		</div>
		
		<br>
		<div>
		 <div class="mb-1" >
	        <label for="mem_gender">성별</label>
	       		<input type="radio" name="mem_gender" value="M"  required>&nbsp;남자
	        	<input type="radio" name="mem_gender" value="F"  required>&nbsp;여자<br>
	        <div id='kk' style="margin-bottom:20px; display:none;">
              	성별을 선택해 주세요
             </div>
		</div>
		</div>
		
		 <div class="mb-1">
	        <label for="mem_birth">생년월일</label>
	        <input type="date" class="form-control" id="mem_birth" name="mem_birth" required>
	        <div class="invalid-feedback" style="margin-bottom:20px;">
              	생년월일을 선택해 주세요
             </div>
		</div><br>
		
		<div>
	 	<div class="mb-1">
	        <label for="mem_phone">전화번호</label>
	        <div id="phone">
                <div style="width:30%;"><input type ="tel" class="form-control valid" placeholder="010" name ="mem_phone" id="tel1"  size="3" onkeyup="commonFocusMove('tel1', '3', 'tel2');" maxlength="3" required></div>
                <span style="margin-top:6px;">-</span>
                <div style="width:35%;"><input type ="tel" class="form-control valid" name ="mem_phone" id="tel2" size="4" onkeyup="commonFocusMove('tel2', '4', 'tel3');" maxlength="4" required></div>
                <span style="margin-top:6px;">-</span>
                <div style="width:35%;"><input type ="tel" class="form-control valid" name ="mem_phone" maxlength='4' id="tel3" onkeyup="commonFocusMove('tel3', '4', 'email1');" maxlength="4" required></div>
            </div>
			</div>
			<div class="invalid-feedback" style="margin-bottom:20px;">
              	전화번호를 입력해 주세요
            </div>
		</div>
		<br>
		
		 <div class="mb-1">
	        <label for="mem_address">주소</label>
	        <input type="text" class="form-control" id="mem_address" name="mem_address" required>
	        <div class="invalid-feedback" style="margin-bottom:20px;">
             	주소를 입력해 주세요
             </div>
		</div>
		<br>
		
		 <div class="mb-1">
	        <label for="gym_code">지점선택</label>&nbsp;
	        <select class="custom-select d-block w-100" id="gym_code" name="gym_code" required>
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
	        <input type="number" class="form-control" id="mem_height" name="mem_height" step="0.01" required>
	         <div class="invalid-feedback" style="margin-bottom:20px;">키를 입력해 주세요</div><br>
	
	        <label for="mem_weight">몸무게</label>
	        <input type="number" class="form-control" id="mem_weight" name="mem_weight" step="0.01" required>
	        <div class="invalid-feedback" style="margin-bottom:20px;">몸무게를 입력해 주세요</div><br>
	        
	        <label for="mem_disease">질병</label>
	        <div class="disease">
		        
		        <input type="checkbox" class="checkStyle" id="mem_disease" name="shoulder"  required>
		        <label for="shoulder">어깨부상</label>&nbsp;&nbsp;
		        
		        
	        	<input type="checkbox" class="checkStyle" id="mem_disease" name="knee"  required>
	        	<label for="knee">무릎부상</label>&nbsp;&nbsp;
	        
	        
	        	<input type="checkbox"  class="checkStyle" id="mem_disease" name="back"  required>	
	        	<label for="back">허리부상</label>&nbsp;&nbsp;
	        	
		        
	           	<input type="checkbox" class="checkStyle" id="mem_disease" name="hnf" required>
	        	<label for="hnf">손목 또는 발목</label>&nbsp;&nbsp;

		        
	        	<input type="checkbox" class="checkStyle" id="mem_disease" name="ect"  required>
	        	<label for="ect">그 외</label>
	         </div>
	        <div class="invalid-feedback" style="margin-bottom:20px;">질병 유무를 선택해 주세요</div><br>
			
			<div class="purpose">
		        <label for="mem_purpose">운동목적</label>&nbsp;&nbsp;
		        <div><span style="font-size:15px; color:gray;"> ex)체중감량, 대회준비, 체력관리...</span></div>
	        </div>
	        <div class=purpose_detail>
		        
		        <input type="checkbox" class="checkStyle" id="mem_purpose" name="shoulder"  required>
		        <label for="shoulder">다이어트</label>&nbsp;&nbsp;
		        
		        
	        	<input type="checkbox" class="checkStyle" id="mem_purpose" name="knee"  required>
	        	<label for="knee">대회준비</label>&nbsp;&nbsp;
	        
	        
	        	<input type="checkbox"  class="checkStyle" id="mem_purpose" name="back"  required>	
	        	<label for="back">체력관리</label>&nbsp;&nbsp;
	        	
		        
	           	<input type="checkbox" class="checkStyle" id="mem_purpose" name="hnf" required>
	        	<label for="hnf">그 외</label>&nbsp;&nbsp;
		        
	         </div>
	         <div class="invalid-feedback" style="margin-bottom:20px;">운동 목적을 체크해 주세요</div><br>
	
	        <label for="mem_interest">관심사항</label>
	        <div class="interest">
		        
		        <input type="checkbox" class="checkStyle" id="mem_interest" name="PT"  required>
		        <label for="PT">개인PT</label>&nbsp;&nbsp;
		        		        
	        	<input type="checkbox" class="checkStyle" id="mem_interest" name="pila"  required>
	        	<label for="pila">필라테스</label>&nbsp;&nbsp;
	        	        
	        	<input type="checkbox"  class="checkStyle" id="mem_interest" name="gx"  required>	
	        	<label for="gx">그룹운동(GX)</label>&nbsp;&nbsp;
	        			        
	           	<input type="checkbox" class="checkStyle" id="mem_interest" name="spin" required>
	        	<label for="spin">스피닝</label>&nbsp;&nbsp;
		        
	        	<input type="checkbox" class="checkStyle" id="mem_interest" name="yoga"  required>
	        	<label for="yoga">요가</label>
	         </div>
	         <div class="invalid-feedback" style="margin-bottom:20px;">관심사항을 선택해주세요</div><br>
	
	        <label for="mem_inflow">유입경로</label>
	        <select class="custom-select d-block w-100" id="gym_code" name="gym_code"  required>
                <option value="" disabled selected> 센터를 알게된 경로를 선택해 주세요</option>
                <option>지인추천</option>
                <option>SNS</option>
                <option>인터넷 검색</option>
                <option>전단지, 홍보물</option>
            </select>
	        <div class="invalid-feedback" style="margin-bottom:20px;">센터를 알게된 경로를 입력해주세요.</div><br>
	   	      
        </div>
        
        <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
             <div class="invalid-feedback" >개인정보 수집 및 이용에 동의해주세요.</div>
        </div>
        

        <br>
        <button  class="btn btn-primary btn-lg btn-block" type="submit" onclick="bb();">가입하기</button>
     	</form>
  	
   
    	</div>
	</div>
	<footer class="my-3 text-center text-medium">
      <p class="mb-1">&copy; 2023 BodyCoding</p>
    </footer>
</div>

 <script>
 	const forms = document.getElementsByClassName('validation-form');
    window.addEventListener('load', () => {
      /* const forms = document.getElementsByClassName('validation-form'); */

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
    
    function bb(forms){
    	const bd = document.getElementsByName("mem_gender");
    	console.log(bd[0].value);
    	if(bd[0].checked=='false' || bd[1].checked=="false"){
    		alert("수부럴");
    		document.getElementById("kk").style.display = 'block';
    	}
    }
    </script>
</body>
</html>