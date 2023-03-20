<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 마이페이지 탑쪽 문제발생 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

<style>
a{
    text-decoration-line: none;
}
ul{
    list-style: none;
    padding: 0;
}
.contain_left1{
   width:230px;
   float: left;
}
.right_body{
    width: 970px;
    float: right;
}
.contain_right{
    max-width: 970px;
    margin: 0 auto;
}
.left_h2{
   text-align:center;
   background: #666;
   color: #fff;
   font-size: 21px;
   padding: 25px 0;
    border-radius: 5px;
}
.left_ul1{
    width: 180px;
    border: 1px solid #CCC;
    box-sizing: border-box;
}
.accordion{
    width:180px;
   text-align:center;
   font-size: 21px;
    float: left;
}
.location_wrap {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}
.contain {
    max-width: 1800px;
    margin: 0 auto;
}
.sub_container{
	min-height: 700px;
}
</style>
<script>
$(document).ready(function() {
  // 이전에 열려있던 아코디언 저장
  var prevAccordion = localStorage.getItem('accordion');
  if (prevAccordion) {
    $(prevAccordion).collapse('show');
  } else {
    // 이전에 열려있던 아코디언이 없는 경우, 첫번째 아코디언을 열어줌
    $('#collapseOne').collapse('show');
  }

  // 아코디언이 열릴 때 이벤트 발생
  $('.collapse').on('show.bs.collapse', function() {
    localStorage.setItem('accordion', '#' + $(this).attr('id'));
  });

  // 아코디언이 닫힐 때 이벤트 발생
  $('.collapse').on('hide.bs.collapse', function() {
    localStorage.removeItem('accordion');
  });
});
</script>
</head>
<body>
	<div class="contain mt-3">
		<div class="contain_left1">
			<div class="accordion" id="accordion">
				<div class="card">
					<div class="left_h2">
						<a>마이페이지 </a>
					</div>
				</div>
				<c:choose>
					<c:when test="${Authority eq 'ROLE_MEMBER' }">
						<div class="card">
							<div class="card-header">
								<a class="btn" data-bs-toggle="collapse" href="#collapseOne">
									운동관리 </a>
							</div>
							<div id="collapseOne" class="collapse" data-bs-parent="#accordion">
								<div class="card-body">
		                            <ul>
		                                <li><a class="btn" href="reservation.do">수업예약</a></li>
		                                <li><a class="btn" href="reservated.do">예약내역</a></li>
		                                <li><a class="btn" href="vdCounting.do">운동기록</a></li>
		                                <li><a class="btn" href="routineForMem.do">운동루틴</a></li>
		                                <li><a class="btn" href="chart">체중그래프</a></li>
		                            </ul>
		                        </div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<a class="collapsed btn" data-bs-toggle="collapse"
									href="#collapseTwo"> 이용내역 </a>
							</div>
							<div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
								<div class="card-body">
		                            <ul>
		                                <li><a class="btn" href="payLog.do">결제내역</a></li>
		                            </ul>
		                        </div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<a class="btn" href="pwcheck"> 정보수정 </a> 
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card">
							<div class="card-header">
								<a class="btn" data-bs-toggle="collapse" href="#collapseOne">
									회원목록 </a>
							</div>
							<div id="collapseOne" class="collapse" data-bs-parent="#accordion">
								<div class="card-body" >
		                            <ul>
		                                <li><a class="btn" style="padding-top:10px;" href="memberlistT.do">회원목록</a></li>
		                            </ul>
		                            <ul>
		                            	<li><a class="btn" style="padding-top:10px;" href="addexrecord.do?mem_id=">운동기록작성</a></li>
		                            </ul>
		                            <ul>
		                            	<li><a class="btn" style="padding-top:10px;" href="exrecord.do">운동기록목록</a></li>
		                            </ul>
		                        </div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<a class="collapsed btn" data-bs-toggle="collapse"
									href="#collapseTwo"> 운동정보 </a>
							</div>
							<div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
								<div class="card-body">
		                            <ul>
		                            	<li><a class="btn" href="calendar.do">스케쥴</a></li>	
		                            </ul>
		                        </div>
							</div>
						</div>
												
						<div class="card">
						    <div class="card-header">
							    <a class="btn" href='javascript:void(0);' onclick='mytrainerInfo("${UserEmail}","${UserGymCode}");'>내 정보</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

<form name="frm" method="post" >
   <input type="hidden" id="mem_id" name="mem_id">
   <input type="hidden" id="gym_code" name="gym_code">
</form>
<script>

function mytrainerInfo(mem_id, gym_code){
    let f = document.createElement("form");
    f.setAttribute("method", "post");
    f.setAttribute("action", "mytrainerInfo");
    
    let memIdInput = document.createElement("input");
    memIdInput.setAttribute("type", "hidden");
    memIdInput.setAttribute("name", "mem_id");
    memIdInput.setAttribute("value", mem_id);
    
    let gymCodeInput = document.createElement("input");
    gymCodeInput.setAttribute("type", "hidden");
    gymCodeInput.setAttribute("name", "gym_code");
    gymCodeInput.setAttribute("value", gym_code);
    
    f.appendChild(memIdInput);
    f.appendChild(gymCodeInput);
    
    document.body.appendChild(f);
    f.submit();
}

</script>
</body>
</html>