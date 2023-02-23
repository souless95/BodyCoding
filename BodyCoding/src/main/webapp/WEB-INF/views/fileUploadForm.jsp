<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		let fileSubmit = function(frm, gubun){
			if(gubun==1){
				frm.action="fileUpload1.do"
			}
			else if(gubun==2){
				frm.action="fileUpload2.do"
			}
			frm.submit();
		}
	</script>
	<h2>파일 업로드</h2>
	<form method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="title" />
		파일 : <input type="file" name="user_file1" multiple="multiple" />
		<input type="button" value="전송(화면이동)"
			onclick="fileSubmit(this.form, 2);" />
	</form>
</body>
</html>