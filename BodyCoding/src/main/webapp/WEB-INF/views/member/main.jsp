<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function logoutcheck(){
	
	var confirmed = confirm("정말로 로그아웃 하시겠습니까?");
	
	if(confirmed){
		location.href="logout.do"
	}
}
</script>
</head>
<%@ include file = "./inc/Top.jsp" %>
<body>

</body>
</html>