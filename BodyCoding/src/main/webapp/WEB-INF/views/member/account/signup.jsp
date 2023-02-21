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
	        <input type="email" class="form-control" id="mem_id" name="mem_id" placeholder="you@example.com" value="" required>
	        <div class="invalid-feedback" style="margin-bottom:20px;">
                아이디를 입력해주세요.
              </div>
        </div>
       </div>
        <div>
         <div class="mb-1">
	        <label for="mem_pass">비밀번호</label>
	        <input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="" value="" required><br>
			<div class="invalid-feedback" style="margin-bottom:20px;">
              	비밀번호를 입력해주세요.
              </div>
		</div>
		</div>
		 <div class="mb-1">
	        <label for="mem_name">이름</label>
			<input type="text" class="form-control" id="mem_name" name="mem_name" required><br>
			<div class="invalid-feedback">
              	이름을 입력해 주세요
              </div>
		</div>
		
		
		 <div class="mb-2">
	        <label for="mem_gender">성별</label>
	        <input type="radio"  id="mem_gender" name="mem_gender" value="M">&nbsp;남자
	        <input type="radio"  id="mem_gender" name="mem_gender" value="F">&nbsp;여자<br>
	        <input type="hidden"  id="mem_gender" name="mem_gender" value="">
	        <div class="invalid-feedback">
              	성별을 선택해 주세요
              </div>
		</div>
		
		 <div class="mb-1">
	        <label for="mem_birth">생년월일</label>
	        <input type="date" class="form-control" id="mem_birth" name="mem_birth"><br>
	        <div class="invalid-feedback">
              	생년월일을 선택해 주세요
             </div>
		</div>
		
		 <div class="mb-1">
	        <label for="mem_phone">전화번호</label>
	        <input type="tel" class="form-control" id="mem_phone" name="mem_phone" required><br>
	        <div class="invalid-feedback">
              	전화번호를 입력해 주세요
              </div>
		</div>
		
		 <div class="mb-1">
	        <label for="mem_address">주소</label>
	        <input type="text" class="form-control" id="mem_address" name="mem_address" required><br>
	        <div class="invalid-feedback">
             	주소를 입력해 주세요
             </div>
		</div>
		
		 <div class="mb-1">
	        <label for="gym_code">지점선택</label>&nbsp;
	        <input type="text" id="gym_code" name="gym_code" required><br>
	        <div class="invalid-feedback">
             	지점을 선택해 주세요
             </div>
		</div>
		
		
		 <div class="mb-1">
			<input type="hidden" class="form-control" id="mem_point" name="mem_point" value="0">
			<input type="hidden" class="form-control" id="mem_type" name="mem_type" value="MEMBER">
	        <br>
	        <label for="mem_height">키</label>
	        <input type="number" class="form-control" id="mem_height" name="mem_height" step="0.01" required><br>
	
	        <label for="mem_weight">몸무게</label>
	        <input type="number" class="form-control" id="mem_weight" name="mem_weight" step="0.01" required><br>
	        <label for="mem_disease">질병</label>
	        <input type="text" class="form-control" id="mem_disease" name="mem_disease"><br>
	
	        <label for="mem_purpose">운동목적</label>
	        <input type="text" class="form-control" id="mem_purpose" name="mem_purpose"><br>
	
	        <label for="mem_interest">관심사항</label>
	        <input type="text" class="form-control" id="mem_interest" name="mem_interest"><br>
	
	        <label for="mem_inflow">유입경로</label>
	        <input type="text" class="form-control" id="mem_inflow" name="mem_inflow"><br>
        </div>
        
         <div class="mb-1">
        </div>
        
         <div class="mb-1">
        </div> 
        
        <button  class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
     	</form>
  	
   
    	</div>
	</div>
</div>

 <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

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
    </script>
</body>
</html>