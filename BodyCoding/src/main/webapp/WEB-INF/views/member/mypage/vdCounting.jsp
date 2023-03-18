<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div class="sub_container">
	<%@ include file="../../../../inc/mypageside.jsp"%>
	<br />
	<h2>이용권 차감 내역</h2>
	<hr style="border: 1px solid #01538D;">
		<c:if test="${empty newVD}">
			<strong style="font-size: 1.1em;">${user_name} 회원님</strong>은 현재 이용 중인 횟수형 멤버쉽이 없습니다.
		</c:if>
		<c:if test="${not empty newVD}">
			<strong style="font-size: 1.1em;">${user_name} 회원님</strong>의 남은 멤버쉽은
			<c:forEach items="${newVD}" var="vd" varStatus="vdl">
				<c:if test="${!vdl.last}">
			   		<strong style="font-size: 1.1em;">${vd.tName} 트레이너</strong>의 <strong>&nbsp;${vd.category} ${vd.count}회</strong>와<br>
			    </c:if>
			    <c:if test="${vdl.last}">
			    	<strong style="font-size: 1.1em;">${vd.tName} 트레이너</strong>의 <strong style="color: #F9BF52; font-size: 1.5em;">&nbsp;${vd.category} ${vd.count}회</strong>입니다.
		  		</c:if>
			</c:forEach>
		</c:if>
	</div>
	<br />
	
	<div>
		<table style="width:80%; border-top: 1px solid #01538D; border-bottom: 1px solid #01538D;">
			<thead>
				<tr style="color:white; background-color: #01538D;">
		         	<th width="20%" style="text-align: center;"><strong>트레이너</strong></th>
		         	<th width="10%" style="text-align: center;"><strong>분류</strong></th>
		         	<th width="25%" style="text-align: center;"><strong>일시</strong></th>
		         	<th width="45%" style="text-align: center;"><strong>코멘트</strong></th>
		      	</tr>
			</thead>
			<tbody>
		     	<c:forEach items="${TlList }" var="row" varStatus="loop">
			      	<tr>
				        <td style="text-align: center;">${row.mem_name }</td>
				        <td style="text-align: center;">${row.exercise_type }</td>
				        <td style="text-align: center;">${row.training_date.substring(0, 10)} &nbsp;&nbsp; ${row.training_date.substring(11, 16)}</td>
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