<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="../../../../inc/Top.jsp" %>
<div class="container">
	<div>
		<%@ include file ="../../../../inc/mypageside.jsp" %>
		<br /><br />
		<c:if test="${empty newVD}">
			${user_name} 회원님은 현재 이용 중인 횟수형 멤버쉽이 없습니다.
		</c:if>
		<c:if test="${not empty newVD}">
			${user_name} 회원님의 남은 멤버쉽은 <br />
			<c:forEach items="${newVD}" var="vd" varStatus="vdl">
				<c:if test="${!vdl.last}">
			   		&nbsp;&nbsp;&nbsp;&nbsp;${vd.tName} 트레이너의 ${vd.category} ${vd.count}회와<br>
			    </c:if>
			    <c:if test="${vdl.last}">
			    	&nbsp;&nbsp;&nbsp;&nbsp;${vd.tName} 트레이너의 ${vd.category} ${vd.count}회입니다.
		  		</c:if>
			</c:forEach>
		</c:if>
	</div>
	
	<div>
		멤버쉽
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>	
</body>
</html>