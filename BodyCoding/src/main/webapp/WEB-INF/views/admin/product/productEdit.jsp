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
<script type="text/javascript"> 

onload = function(){
	var obj1 = document.getElementById('fSelect');
	 var type = '<c:out value="${dto.product_type}"/>';
	 
	 for(var i=0 ; i<4 ; i++){
	     if(obj1.options[i].value==type){ 
	    	 obj1.options[i].selected=true;
	     }
	 }
}

$(function(){
	
	$(document).ready(function() {        
        $('#fSelect').trigger('change');
    });
	
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
<body>
	<h2>상품 수정</h2>
	<form action="productEdit.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="product_idx" value=${ dto.product_idx} >
	<input type="hidden" name="o_product_img" value=${ dto.product_img} >
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
			<td style="display:none;" id="pp"><input type="number" name="membership_period" value="${ dto.membership_period }">일</td> 			
			<td style="display:none;" id="cc"><input type="number" name="membership_count" value="${ dto.membership_count }">회</td> 			
			<td><input type="text" name="product_name" value="${ dto.product_name }"></td>
			<td><input type="text" name="product_description" value="${ dto.product_description }"></td>
			<td><input type="file" name="product_img" value="${ dto.product_img }"></td>
			<td><input type="number" name="product_price" value="${ dto.product_price }"></td>			
		</tr>
	</table>
	<input type="submit" value="수정">
	<button type="button" onclick="location.href='productList.do'">목록</button>
	</form>
</body>
</html>