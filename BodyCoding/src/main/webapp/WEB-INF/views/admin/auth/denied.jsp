<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="sb-nav-fixed">
	<!-- top -->
	<%@ include file="../inc/top.jsp"%>

	<div id="layoutSidenav">
		<!-- side -->
		<%@ include file="../inc/side.jsp"%>

		<div id="layoutSidenav_content">
			<main>
				<div style="text-align: center;">
					<h2>권한이 없습니다.</h2>
					<img alt="권한없음" src="/static/admin/images/자물쇠_원형_아이콘-02.png">
				</div>
			</main>
			<!-- bottom -->
			<%@ include file="../inc/bottom.jsp"%>
		</div>
	</div>
</body>
</html>