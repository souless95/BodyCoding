<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.3.js"
  integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
  crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
                url : 'static/ajax/data.json',
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
                    
                    if(cate=="MBSP"){
                    	$('#p').css('display','inline');
                    	$('#pp').css('display','inline');
                    	$('#c').css('display','none');
                    	$('#cc').css('display','none');
                    }
                    else if(cate=="MBSC"){
                    	$('#c').css('display','inline');
                    	$('#cc').css('display','inline');
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
<body>
	<h2>상품 등록</h2>
	<form action="productRegist.do" method="post">
	<table border="1">
		<tr>
			<th>상품유형</th>
			<th>상품분류</th>
			<th style="display:none;" id="p">기간</th>
			<th style="display:none;" id="c">횟수</th>
			<th>상품명</th>
			<th>상세설명</th>
			<th>대표 이미지</th>
			<th>가격</th>
		</tr>
		<tr>
			<td> 
			<select name="product_type" id="fSelect">
				<option value="">유형선택</option>
				<option value="PDT">일반</option>
				<option value="MBSP">멤버쉽(기간형)</option>
				<option value="MBSC">멤버쉽(횟수형)</option>
			</select> 
			</td>
			<td> 
			<!-- <select name="product_category" id="sSelect">
				<option value="FOOD">식품</option>
				<option value="WEAR">의류</option>
				<option value="TOOL">기구</option>
				<option value="HEALTH">헬스</option>
				<option value="GX">GX</option>
				<option value="PT">PT</option>
				<option value="PILATES">필라테스</option>
			</select>  -->
			<select name="product_category" id="sSelect">
				<option value="">=========</option>
			</select> 
			</td>
			<td style="display:none;" id="pp"><input type="number" name="membership_period" value="0">일</td> 			
			<td style="display:none;" id="cc"><input type="number" name="membership_count" value="0">회</td> 			
			<td><input type="text" name="product_name"></td>
			<td><input type="text" name="product_description"></td>
			<td><input type="text" name="product_img"></td>
			<td><input type="number" name="product_price"></td>			
		</tr>
	</table>
	<input type="submit" value="등록">
	<button type="button" onclick="location.href='productList.do'">목록</button>
	</form>
</body>
</html>