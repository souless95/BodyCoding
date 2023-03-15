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
	<%@ include file ="../../../../inc/mypageside.jsp" %>
	<br /><br />
	${user_name}님의 남은 멤버쉽은 <br />
	<c:forEach items="${newVD}" var="vd" varStatus="vdl">
		<c:if test="${!vdl.last}">
	   		&nbsp;&nbsp;&nbsp;&nbsp;${vd.tName} 트레이너의 ${vd.category} ${vd.count}회와<br>
	    </c:if>
	    <c:if test="${vdl.last}">
	    	&nbsp;&nbsp;&nbsp;&nbsp;${vd.tName} 트레이너의 ${vd.category} ${vd.count}회입니다.
  		</c:if>
	</c:forEach>
	
	<%@ include file="../../../../inc/Bottom.jsp" %>	
</body>
</html>