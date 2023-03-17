<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script>
function submitForm(frm){
	var comment = frm.elements["training_comment"].value;;
	console.log(comment);
	if(comment.trim() == ""){
		alert("코멘트를 작성해주세요.")
		return false;
	}
	frm.submit();
}
</script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>	
	<div id="container">
		<!-- side -->
		<%@ include file="../../../../inc/mypageside.jsp"%>
		<br />
		<c:choose>
			<c:when test="${empty lists}">
				작성할 수 있는 기록이 없습니다.
			</c:when>
			<c:otherwise>
				<c:if test="${not empty user_name}">
					<h3>${user_name} 회원 운동기록 작성</h3>
					<c:forEach items="${lists}" var="l">
						<form action="addexrecord.do?mem_id=${l.user_id}" method="POST">
							<input type="hidden" name="trainer_id" value="${l.trainer_id }" />
							<input type="hidden" name="exercise_type" value="${l.exercise_type }" />
							<input type="hidden" name="user_id" value="${l.user_id }" />
							<input type="hidden" name="training_date" value="${l.training_date.substring(0,10) } ${l.lesson_start_time }" />
							<input type="hidden" name="reservaction_idx" value="${l.reservaction_idx}" />
							<div>
								분류 : ${l.exercise_type }, &nbsp;&nbsp;일시 : ${l.training_date.substring(0,10) } ${l.lesson_start_time }<br />
								코멘트 : <input type="text" name="training_comment" value="" />
								<button type="button" onclick="submitForm(this.form)">저장</button>
								<button type="reset">취소</button>
							</div>
						</form>
					</c:forEach>
				</c:if>
				<c:if test="${empty user_name}">
					<h3>회원 운동기록 작성</h3>
					<c:forEach items="${lists}" var="l">
						<form action="addexrecord.do?mem_id=" method="POST">
							<input type="hidden" name="trainer_id" value="${l.trainer_id }" />
							<input type="hidden" name="exercise_type" value="${l.exercise_type }" />
							<input type="hidden" name="user_id" value="${l.user_id }" />
							<input type="hidden" name="training_date" value="${l.training_date.substring(0,10) } ${l.lesson_start_time }" />
							<input type="hidden" name="reservaction_idx" value="${l.reservaction_idx}" />
							<div>
								성명 : ${l.mem_name }, &nbsp;분류 : ${l.exercise_type }, &nbsp;일시 : ${l.training_date.substring(0,10)} ${l.lesson_start_time }<br />
								코멘트 : <input type="text" name="training_comment" value="" />
								<button type="button" onclick="submitForm(this.form)">저장</button>
								<button type="reset">취소</button>
							</div>
						</form>
					</c:forEach>
				</c:if>
			</c:otherwise>
		</c:choose>
		<%@ include file="../../../../inc/Bottom.jsp"%>
	</div>
</body>
</html>