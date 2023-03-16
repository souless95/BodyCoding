<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script>
$(document).ready(function() {
    $('button[type="button"]').on('click', function() {
    	var lessonIdx = $(this).data('lessonidx');
    	console.log(lessonIdx);
		var name = $('#'+lessonIdx+' > p:first-child').text().trim();
		var deletetion = confirm("일정 " + name + "을 삭제하시겠습니까?");
		if(deletetion){
			$.ajax({
				url: "reservatedDeletion.do",
      	    	contentType: "application/json; charset=utf-8",
      	    	data: {
      	    		lesson_idx: lessonIdx,
      	    		user_id: '${user_id}'
      	    	},
      	    	dataType: 'text',
      	    	success: function(){
	      	    },
	      	    error: function(){
	      	      alert('예약 취소에 실패했습니다.');
	      	    }
			})
	    	$(this).closest('div').remove();
		}
  	});
});
</script>
</head>
<body>
<%@ include file ="../../../inc/Top.jsp" %>
<div class="container">
<%@ include file ="../../../inc/mypageside.jsp" %>
	<br />
	<h3>예약된 일정</h3>
	<br />
	<c:forEach items="${myR}" var="s">
		<div id="${s.lesson_idx}" style="border:1px solid gray; width:30%; display:inline-block;
		padding:10px; margin:3px;">
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
							div.style.backgroundColor = 'gray';
						</script>
						<span style="color:red;">(마감)</span>
					</c:when>
					<c:otherwise>
				    	<script>
							var div = document.getElementById('${s.lesson_idx}');
							div.style.backgroundColor = 'white';
						</script>
					</c:otherwise>
				</c:choose>
			</p>
			<p><button type="button" data-lessonidx='${s.lesson_idx}' style="border-radius:5px; border:1px solid gray;">예약 취소</button></p>
		</div>
	</c:forEach>
</div>
<%@ include file="../../../inc/Bottom.jsp" %>
</body>
</html>