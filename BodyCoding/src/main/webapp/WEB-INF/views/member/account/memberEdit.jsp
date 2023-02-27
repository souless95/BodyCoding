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
	       		<input type="radio" name="mem_gender" value="M" onchange="checkNone1();" required>&nbsp;남자
	        	<input type="radio" name="mem_gender" value="F" onchange="checkNone1();" required>&nbsp;여자<br>
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
	        <input type="text" class="form-control" id="mem_address" onkeydown="checkNoneaddress();"  name="mem_address" value="${memList.mem_address }">
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

        <br>
        
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="return totalcheck(this);">수정하기</button>
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="return totalcheck(this);">탈퇴하기</button>
        
     	</form>
  	
   
    	</div>
	</div>
	<footer class="my-3 text-center text-medium">
      <p class="mb-1">&copy; 2023 BodyCoding</p>
    </footer>
</div>
</body>
</html>