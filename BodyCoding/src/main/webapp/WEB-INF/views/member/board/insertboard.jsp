<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<link rel="stylesheet" href="../bootstrap5.2.3/css/bootstrap.css">
<script src="../bootstrap5.2.3/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<%@ include file="../inc/Top.jsp"%>
<style>
    .form-group {
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    input[type="text"] {
        border: 1px solid #ccc;
        border-radius: 3px;
        padding: 8px;
        font-size: 16px;
        width: 100%;
        box-sizing: border-box;
    }
    input[type="submit"],
    button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 3px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover,
    button:hover {
        background-color: #0062cc;
    }
    button {
        margin-left: 10px;
    }
</style>
</head>
<body>
	
	<div id="container">
		<!-- side -->
		<div id="layoutSidenav_content">
		    <div id="layoutSidenav_content">
		        <div class="container">
		            <div class="card-header">
		                <h3>게시글 등록</h3>
		            </div>
		            
		            <form method="post" action="/insertboard.do">
		            <div class="container">
		                <div class="form-group">
		                    <label for="board_title">제목입력</label>
		                    <input style="width:100%;"type="text" class="form-control" id="board_title" name="board_title" placeholder="제목을 입력해 주세요" required>
		                </div>
		                
		                <div class="form-group">
			                <label for="board_contents">내용 입력</label>
			                <textarea style="width:100%; height:350px;"  class="form-control" id="board_contents" name="board_contents" placeholder="내용을 입력하세요." required></textarea>
			            </div>
					                
		                <div style="text-align:right;">
			                <input type="submit" value="등록">
			                <button type="button" onclick="location.href='Freeboard.do'">리스트</button>
		                </div>
		            </div>
		            </form>
		        </div>
		    </div>
		</div>
		<!-- bottom -->
		<%@ include file="../inc/Bottom.jsp"%>
	</div>
</body>
</html>