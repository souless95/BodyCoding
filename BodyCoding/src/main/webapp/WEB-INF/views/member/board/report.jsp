<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js">

</script>
</head>
<style>
	body {
		font-family: 'Arial', sans-serif;
		background-color: #f4f4f4;
	}
	h1 {
		color: #333;
		text-align: center;
	}
	form {
		max-width: 500px;
		margin: 0 auto;
		padding: 20px;
		background-color: #fff;
		box-shadow: 0 0 5px #999;
	}
	label {
		display: block;
		margin-bottom: 10px;
		color: #555;
		font-weight: bold;
	}
	textarea {
		width: 100%;
		height: 200px;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		resize: none;
	}
	input[type="submit"] {
		display: block;
		margin: 20px auto 0;
		padding: 10px 20px;
		background-color: #333;
		color: #fff;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
	input[type="submit"]:hover {
		background-color: #555;
	}
</style>
<body>
	<h1>신고하기</h1>
	<form method="post" action="/report.do">
	<div>
		<label for="board_idx">신고할 글 번호 : ${dto.board_idx }</label>
		<input type="hidden" name="board_idx" value=${dto.board_idx }>
	</div>
	<div>
		<label for="board_title">신고할 글 제목 : ${dto.board_title }</label>
	</div>
		<label for="report_content">신고 내용</label>
		<textarea name="report_content" id="report_content" required></textarea>
	<div>
		<label for="reporter">신고자 : ${dto.mem_id }</label>
		<input type="hidden" name="mem_id" value=${dto.mem_id }>
	</div>
		<br>
		<input type="submit" value="등록" onclick="submitForm()">
	</form>
<script>
	function submitForm() {
		
		// 폼을 제출하지 않도록 기본 이벤트를 취소합니다.
		event.preventDefault();
		// Ajax를 사용하여 폼을 제출합니다.
		$.ajax({
			url: "/report.do",
			type: "post",
			data: $("form").serialize(),
			success: function(response) {
				// 등록이 완료되었다는 메시지를 띄우고 원래 페이지로 이동시킵니다.
				alert("신고가 접수되었습니다.");
				window.close();
			},
			error: function(xhr) {
				// 등록 중 오류가 발생하면 오류 메시지를 띄웁니다.
				alert("오류가 발생했습니다: " + xhr.responseText);
			}
		});
		
	}
</script>
</body>
</html>