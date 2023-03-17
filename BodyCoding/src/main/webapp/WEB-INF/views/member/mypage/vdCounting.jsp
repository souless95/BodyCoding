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
	
	<br /><br /><br />
	
	<div>
		<table style="width:80%;">
			<thead>
				<tr>
		         	<th>트레이너</th>
		         	<th>분류</th>
		         	<th>일시</th>
		         	<th>코멘트</th>
		      	</tr>
			</thead>
			<tbody>
		     	<c:forEach items="${TlList }" var="row" varStatus="loop">
			      	<tr>
				        <td>${row.mem_name }</td>
				        <td>${row.exercise_type }</td>
				        <td>${row.training_date.substring(0, 10)} &nbsp;&nbsp; ${row.training_date.substring(11, 16)}</td>
				        <td>${row.training_comment }</td>
				    </tr>
			    </c:forEach>
			</tbody>
		</table>
	</div>
	
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>	
</body>
</html>