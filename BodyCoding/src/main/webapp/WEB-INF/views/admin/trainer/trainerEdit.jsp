<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>트레이너수정</h2>
	<form action="trainerEdit.do" method="post">
		<table border="1">
			<tr>
				<th>아이디(수정불가)</th>
				<td><input type="text" name="mem_id" value="${trainer.mem_id}" readonly /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="mem_pass" value="${trainer.mem_pass}" /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mem_name" value="${trainer.mem_name}"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="text" name="mem_gender" value="${trainer.mem_gender}"/></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="mem_birth" value="${trainer.mem_birth}"/></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="mem_phone" value="${trainer.mem_phone}"/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="mem_address" value="${trainer.mem_address}"/></td>
			</tr>
			<tr>
				<th>센터</th>
				<td><input type="text" name="gym_code" value="${trainer.gym_code}"/></td>
			</tr>
			<tr>
				<th>계정상태</th>
				<td><input type="text" name="mem_status" value="${trainer.mem_status}"/></td>
			</tr>
			<tr>
				<th>경력</th>
				<td><input type="text" name="mem_career" value="${trainer.mem_career}"/></td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td><input type="text" name="mem_comment" value="${trainer.mem_comment}"/></td>
			</tr>
			<!-- 다중파일 업로드 해보기 -->
			<%-- <tr>
				<th>프로필 이미지</th>
				<td><input multiple="multiple" type="file" name="mem_img" value="${trainer.mem_img}" /></td>
			</tr> --%>
		</table>
		<input type="submit" value="전송하기" />
	</form>
</body>
</html>