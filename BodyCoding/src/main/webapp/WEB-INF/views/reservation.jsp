<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
  /* 예약 가능한 일정 컨테이너의 스타일 */
  .schedule-container {
    border: 1px solid #ddd;
    width: 30%;
    display: inline-block;
    margin: 3px;
    padding: 10px;
    background-color: #fff;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    text-align: center;
    transition: all 0.3s ease;
  }

  /* 예약 가능한 일정의 제목 스타일 */
  .schedule-container h3 {
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 10px;
  }

  /* 예약 가능한 일정의 카테고리 아이콘 스타일 */
  .schedule-container img {
    width: 24px;
    height: 24px;
    margin-right: 5px;
    vertical-align: middle;
  }

  /* 예약 가능한 일정의 버튼 스타일 */
  .schedule-container button {
    background-color: #fff;
    border: 2px solid #007bff;
    color: #007bff;
    font-size: 16px;
    font-weight: 700;
    padding: 10px 20px;
    border-radius: 30px;
    cursor: pointer;
    transition: all 0.3s ease;
  }

  /* 예약 가능한 일정의 버튼 호버 스타일 */
  .schedule-container button:hover {
    background-color: #007bff;
    color: #fff;
  }

  /* 예약 가능한 일정의 정원 마감 스타일 */
  .schedule-container .closed {
    opacity: 0.7;
    cursor: not-allowed;
    background-color: #f7f7f7;
    border: 1px solid #ddd;
  }

  /* 예약 가능한 일정의 정원 마감 스타일 */
  .schedule-container .closed h3 {
    color: #999;
  }
</style>
<script>
function reservating(lesson_name, lesson_idx, user_id, reservation_date){
	
	var reservating = confirm("일정 "+lesson_name+"을 예약하시겠습니까?");
	if(reservating){
		$.ajax({
			url: 'reservating.do',
			contentType: "application/json; charset=utf-8",
			data: {
				lesson_idx: lesson_idx,
				user_id: user_id,
				reservation_date: reservation_date
			},
			dataType: 'text',
			success: function(){
				location.href='reservated.do';
			},
			error: function(){}
		})
	}
}
</script>
</head>
<body>
<%@ include file ="../../../inc/Top.jsp" %>
<div class="container">
	<%@ include file ="../../../inc/mypageside.jsp" %>
	<br />
	<h3>예약 가능한 일정</h3>
	<br />
	<c:if test="${not empty Schedule}">
		<c:forEach items="${Schedule}" var="s">
			<div id="${s.lesson_idx}" class="schedule-container" style="border:1px solid gray; width:30%; display:inline-block; margin:3px;">
				<p style="font-size:24px;">
					<c:if test="${s.lesson_category eq '요가'}">
		 			<img src="../static/admin/images/0005.png" />&nbsp;&nbsp;${s.lesson_name}
		 			</c:if>
		 			<c:if test="${s.lesson_category eq 'GX'}">
		 			<img src="../static/admin/images/0007.png" />&nbsp;&nbsp;${s.lesson_name}
		 			</c:if>
		 			<c:if test="${s.lesson_category eq '필라테스'}">
		 			<img src="../static/admin/images/0010.png" />&nbsp;&nbsp;${s.lesson_name}
		 			</c:if>
		 			<c:if test="${s.lesson_category eq 'PT'}">
		 			<img src="../static/admin/images/0011.png" />&nbsp;&nbsp;${s.lesson_name}
		 			</c:if>
		 		</p>
				<p>트레이너 : ${s.trainer_name}</p>
				<p>분류 : ${s.lesson_category}</p>
				<p>일자 : ${s.lesson_day.substring(0, 10)}</p>
				<p>시간 : ${s.lesson_start_time} - ${s.lesson_end_time}</p>
				<p>정원 : ${s.rcount} / ${s.lesson_capacity}
					<c:choose>
						<c:when test="${s.rcount eq s.lesson_capacity}">
					    	<script>
								var div = document.getElementById('${s.lesson_idx}');
								div.onclick = null;
								div.style.opacity = '1';
								div.style.backgroundColor = 'gray';
								div.style.pointer = 'auto';
							</script>
							<span style="color:red;">(마감)</span>
						</c:when>
						<c:otherwise>
					    	<script>
								var div = document.getElementById('${s.lesson_idx}');
								div.onclick = function(){
									reservating('${s.lesson_name}', '${s.lesson_idx}', '${user_id}', '${s.lesson_day.substring(0, 10)}');
								}
								div.style.opacity = '1';
								div.style.backgroundColor = 'white';
								div.style.cursor = 'pointer';
							</script>
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${empty Schedule}">
		현재 이용가능한 일정이 없습니다.
	</c:if>
</div>
<%@ include file="../../../inc/Bottom.jsp" %>
</body>
</html>