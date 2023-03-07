<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 시큐리티 패스워드 변경하는 곳 -->
</head>
<body class="sb-nav-fixed">
	<!-- top메뉴  -->
	<%@ include file ="../../admin/inc/top.jsp" %>
	
	<div id="layoutSidenav">
	<!-- side -->
       <%@ include file ="../../admin/inc/side.jsp" %>
    
    	<div>
    		<table>
    			<tr>
    				<td>${memList.mem_id }</td>
    				<td>${memList.mem_pass }</td>
    			</tr>
    		</table>
    	</div>
    </div>
</body>
</html>