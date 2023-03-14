<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
a{
    text-decoration-line: none;
}
ul{
    list-style: none;
    padding: 0;
}
div{
    display: block;
}
.contain_left{
	width:230px;
	float: left;
}
.right_body{
    width: 970px;
    float: right;
}
.contain_right{
    max-width: 970px;
    margin: 0 auto;
}
.left_h2{
	text-align:center;
	background: #666;
	color: #fff;
	font-size: 21px;
	padding: 25px 0;
    border-radius: 5px;
}
.left_ul1{
    width: 180px;
    border: 1px solid #CCC;
    box-sizing: border-box;
}
.accordion{
    width:180px;
	text-align:center;
	font-size: 21px;
    float: left;
}
.location_wrap {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}
.contain {
    max-width: 1800px;
    margin: 0 auto;
}

</style>
</head>
<body>
	<div class="location_wrap" style="width:">
		<div class="contain">
		
		</div>
	</div>
	<div class="contain mt-3">
		<div class="contain_left">
			<div class="accordion" id="accordion">
				<div class="card">
					<div class="left_h2">
						<a>마이페이지 </a>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<a class="btn" data-bs-toggle="collapse" href="#collapseOne">
							회원목록 </a>
					</div>
					<div id="collapseOne" class="collapse show"
						data-bs-parent="#accordion">
						<div class="card-body" >
                            <ul>
                                <li><a class="btn" style="padding-top:10px;" href="memberlistT.do">회원목록 보기</a></li>
                            </ul>
                        </div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<a class="collapsed btn" data-bs-toggle="collapse"
							href="#collapseTwo"> 운동정보 </a>
					</div>
					<div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
						<div class="card-body">
                            <ul>
                                <li><a class="btn" href="exroutine.do">운동루틴</a></li>
                                <li><a class="btn" href="exrecord.do">운동기록</a></li>
                            </ul>
                        </div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<a class="collapsed btn" data-bs-toggle="collapse"
							href="#collapseThree"> 내 정보관리 </a>
					</div>
					<div id="collapseThree" class="collapse"
						data-bs-parent="#accordion">
						<div class="card-body">
                            <ul>
                                <li><a class="btn" href="calendar.do">스케쥴 관리</a></li>
                                <li><a class="btn" href="career.do">트레이너경력</a></li>
                            </ul>
                        </div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>