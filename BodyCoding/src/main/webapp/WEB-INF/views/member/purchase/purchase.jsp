<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
   
   $('#gymSelect').change(function(){
      if($('#gymSelect').val()==""){
         $('input[name=product_category]').is(':checked')=false;
         $('input[name=product_idx]').css("display","none");
      }
   });  
   
   $('input[name=product_category]').click(function(){

      $('#pTitle').css("display","inline");
      let ctgVar = $('input[name=product_category]:checked').val();
      
      
      $.ajax({
         type:'get',
         url: '/productLoad.do',
         data: {product_category : ctgVar},
         contentType: "text/html;charset:utf-8",
         dataType:"json",
         success:sucCallBackP,
         error: errCallBackP
      });
      
   });
     
   $(document).on('click','input[name=product_idx]',function(){
      
      const gym_code = $('#gymSelect').val();
      const lesson_category = $('input[name=product_category]:checked').val();
      
      if(lesson_category!='헬스'){
	      $('#tTitle').css("display","inline");
	      
	       const trainer = {
	            gym_code : gym_code,
	            lesson_category : lesson_category
	      };
	      
	       console.log(trainer);
	       
	      $.ajax({
	         type:'get',
	         url: '/trainerLoad.do',
	          data: trainer,
	         contentType: "application/json;charset:utf-8",
	         dataType:"json",
	         success:sucCallBackT,
	         error: errCallBackT
	      });
      }
   });
   
    $('#kPayBtn').click(function(){
       
       let trainer_id = $('input:radio[name=trainer_id]:checked').val();
       let product_idx = $('input:radio[name=product_idx]:checked').val();
       let product_name = $("label[for='"+product_idx+"']").text();
       let product_price = $("label[for='"+product_name+"']").text();
       let gym_code = $('#gymSelect').val();
       
       const payInfo = {
    		 trainer_id : trainer_id,
    		 product_idx : product_idx,
    		 gym_code : gym_code,
             product_name : product_name,
             product_price : product_price,
             type : "멤버쉽"
       }
       
       $.ajax({
         url: 'kakaoPay.do',
         data : payInfo,
         dataType:"json",
         success:function(data){
 			if(data.status === 500){
				alert("카카오페이결제를 실패하였습니다.")
			} 
 			else{
 				console.log("페이 진입");
	            console.log(data);
				location.href = data.next_redirect_pc_url;
			}
         },
         error:function(error){
            alert(error);
         }
      });
   });
});
function sucCallBackP(resData) {
   let pData = "";
   $(resData).each(function(index, data){
      pData += ""
      +"<td><input type='radio' name='product_idx' value='" +data.product_idx+ "'>["
      +data.product_category+"]<label for='"+data.product_idx+"'>"+data.product_name+"</label></td>"
      +"<td><label for='"+data.product_name+"'>"+data.product_price+"</label></td>"             
   });
   
   $('#show_product').html(pData);
}
      
function errCallBackP(errData){
   console.log(errData.status+":"+errData.statusText);
}

function sucCallBackT(resData) {
   let tData = "";
   console.log(resData);
   if(resData==""){
	   tData = "<td><span>트레이너가 없습니다.</span></td>"
   }
   $(resData).each(function(index, data){
      tData += ""
      +"<td><input type='radio' name='trainer_id' value='" +data.mem_id+ "'>"
       +"<td><img src='"+ data.mem_img+"'>"+"</td>"
      +"<td>"+data.mem_name+"</td>"             
   });
   
   $('#show_trainer').html(tData);
}
      
function errCallBackT(errData){
   console.log(errData.status+":"+errData.statusText);
}
</script>
<%@ include file="../../../../inc/Top.jsp" %>
<div class="container">
<table>
   <tr>
      <th>지점 선택</th>
   </tr>
   <tr>
      <td> 
         <select name="gym_code" id="gymSelect">
            <option value="">=========</option>
            <c:forEach items="${gymList}" var="gym" varStatus="loop">
            <option value="${gym.gym_code}">${gym.mem_name}</option>
            </c:forEach>
         </select>
      </td>      
   </tr>
   <tr>
      <th>프로그램 선택</th>
   </tr>
   <tr>
      <td> 
         <input type="radio" name="product_category" value="헬스">헬스
         <input type="radio" name="product_category" value="GX">GX
         <input type="radio" name="product_category" value="요가">요가
         <input type="radio" name="product_category" value="필라테스">필라테스
         <input type="radio" name="product_category" value="PT">PT
      </td>      
   </tr>
   <tr>
      <th id="pTitle" style="display:none;">이용권 선택</th>
   </tr>
   <tr>
      <td id="show_product"></td>
   </tr>
   <tr>
      <th id="tTitle" style="display:none;">트레이너 선택</th>
   </tr>
   <tr>
      <td id="show_trainer"></td>
   </tr>
   <tr>
      <td><button id="kPayBtn" style="border: none;"><img src="static/member/images/kakao_pay.png"></button> </td>
   </tr>
</table>
</div>
<!-- bottom -->
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>