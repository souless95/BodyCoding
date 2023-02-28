<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script>
/* fSelect sSelect tSelect 퍼스트 세컨드 서드 셀렉트라는 뜻 */
$(function(){
    $('#fSelect').change(function(){
        //this.value 찍어보면 현재 고른 fSelect value값인 것을 확인가능
        //console.log(this.value);
        let cate = this.value;
        //sSelect의 기존값을 지운다.
        $("#sSelect").empty();
        if(cate != ""){
            $.ajax({
                url : '/static/ajax/data.json',
                dataType : "json",
                success : function(resData){
                    //위에서 let cate를 선언하지 않았다면 이렇게
                    //let cate = $("#fSelect").val();
                    //console.log(resData);

                    //resData.cate가 작동하지 않아서 resData.food하려면 eval사용
                    let jsonData = eval("resData." + cate);
                    //console.log(jsonData.length);

                    //sSelect.append() 로 값 채우기
                    for(var i = 0 ; i<jsonData.length;i++){
                        $("#sSelect").append(
                            "<option value="+jsonData[i].value+">"+jsonData[i].name+"</option>"
                        );
                    }
                    
                    if(cate=="멤버쉽기간형"){
                    	$('#p').css('display','inline');
                    	$('#pp').css('display','inline');
                    	$('#c').css('display','none');
                    	$('#cc').css('display','none');
                    }
                    else if(cate=="멤버쉽횟수형"){
                    	$('#c').css('display','inline');
                    	$('#cc').css('display','inline');
                    	$('#p').css('display','none');
                    	$('#pp').css('display','none');
                    }
                    else{                    	
                    	$('#c').css('display','none');
                		$('#cc').css('display','none');
                    	$('#p').css('display','none');
                    	$('#pp').css('display','none');                    	
                    }
                    //페이지에 출력되는 컬럼값을 바꾸고 싶다면 이렇게
                    //
                },
                error : function(){
                    console.log("오류 발생");
                },
            }); 
        }
        else {
            $("#sSelect").append(
                "<option value=''>=======</option>"
            );
        }
    });
});
</script>
</head>
<body class="sb-nav-fixed">
<!-- top메뉴  -->
<%@ include file ="../../admin/inc/top.jsp" %>
	<div id="layoutSidenav">
	<!-- side -->
    <%@ include file ="../../admin/inc/side.jsp" %>
    	<div id="layoutSidenav_content">
    		<main>
    		 	<div class="card mb-4" style="border-bottom: none;">
    		 		<div class="card-header">
						<h2>상품 등록</h2>
	        		</div>
	        		<div class="card-body" style="width: 60%">
						<form action="/productRegist.do" enctype="multipart/form-data" method="post">
							<div class="row mb-3">
							</div>
							<table class="table" border="1">
								<tr>
									<th>상품유형</th>
									<th>상품분류</th>
									
								</tr>
								<tr>
									<td> 
										<select name="product_type" id="fSelect">
											<option value="">유형선택</option>
											<option value="일반상품">일반상품</option>
											<option value="멤버쉽기간형">멤버쉽(기간형)</option>
											<option value="멤버쉽횟수형">멤버쉽(횟수형)</option>
										</select> 
									</td>
									<td> 
										<select name="product_category" id="sSelect">
											<option value="">=========</option>
										</select> 
									</td>
								</tr>
								<tr>
									<th style="display:none;" id="p">기간</th>
									<th style="display:none;" id="c">횟수</th>
								</tr>
								<tr>
									<td style="display:none;" id="pp"><input type="number" name="membership_period" value="0">일</td> 			
									<td style="display:none;" id="cc"><input type="number" name="membership_count" value="0">회</td> 			
								</tr>
							</table>
							<table class="table" border="1">
								<tr>
									<th>상품명</th>
									<th>상세설명</th>
									<th>대표 이미지</th>
									<th>가격</th>
								</tr>
								<tr>
									<td><input type="text" name="product_name"></td>
									<td><input type="text" name="product_description"></td>
									<td><input type="file" name="product_img"></td>
									<td><input type="number" name="product_price"></td>			
								</tr>
							
							</table>
							<input type="submit" value="등록">
							<button type="button" onclick="location.href='productList.do'">목록</button>
						</form>
					</div>					
				</div>
			</main>	
		<!-- bottom -->
		<%@ include file ="../../admin/inc/bottom.jsp" %>						
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/static/admin/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>