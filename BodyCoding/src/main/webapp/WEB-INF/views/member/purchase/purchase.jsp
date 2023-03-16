<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript">
var product_idx="";
var trainer_id="";

function tLoad(){
    const gym_code = $('#gymSelect').val();
    const lesson_category = $('input[name=product_category]:checked').val();
    
    if(lesson_category!='헬스'){
       $('#tTitle').css("display","block");
       
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
}

function sel_product(idx,f){
	product_idx = idx;
	$('.product').each(function() {
		$(this).removeClass('seleted');
	});  
	$(f).addClass('seleted');
	tLoad();
}

function sel_trainer(id,f){
	trainer_id = id;
	$('.trainer').each(function() {
		$(this).removeClass('seleted');
	});  
	$(f).addClass('seleted');
}

$(function(){
   
   $('#gymSelect').change(function(){
      $('input[name=product_category]').prop('checked',false);
      $('#pTitle').css("display","none");
      $('#tTitle').css("display","none");
      $('#show_product').empty();
      $('#show_trainer').empty();
         
   });  
   
   $('input[name=product_category]').click(function(){
	  
	  $('#tTitle').css("display","none"); 
	  $('#show_trainer').empty();
	  
      $('#pTitle').css("display","block");
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
   
    $('#kPayBtn').click(function(){
       let trainer_id = $('input:radio[name=trainer_id]:checked').val();
       let product_category = $('input[name=product_category]:checked').val();
       let product_name = $("label[for='"+product_idx+"']").text();
       let product_price = $("span[id='"+product_idx+"']").text().replace(',', '').trim();
       let gym_code = $('#gymSelect').val();
       
       if(product_category!='헬스'&&trainer_id==null){
    	   alert('트레이너를 선택해주세요');
       }
       else{
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
       }
   });
});
function sucCallBackP(resData) {
   let pData = "";
   $(resData).each(function(index, data){
      pData += ""
      +"<div class='card product' id='pIdx_"+data.product_idx+"' onclick='sel_product("+data.product_idx+",this);'><div class='card-body'>["
      +data.product_category+"]<label for='"+data.product_idx+"'>"+data.product_name+"</label>"
      +"<br><strong><span id='"+data.product_idx+"'>"+data.product_price.toLocaleString()+"</span>원</strong></div></div>"             
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
      tData = "<span style='color:red;'>트레이너가 없습니다.</span>"
   }
   $(resData).each(function(index, data){
      tData += ""
      +"<div class='card trainer' onclick='sel_trainer("+'"'+data.mem_id+'"'+",this);'><div class='card-body'>"
       +"<img src='/static/uploads/trainer/"+ data.mem_img+"' class='card-img-top'><h5 class='card-title'>"+data.mem_name+" 트레이너</h5></div></div>"             
   });
   
   $('#show_trainer').html(tData);
}
      
function errCallBackT(errData){
   console.log(errData.status+":"+errData.statusText);
}
</script>
<style type="text/css">
.price_list {
  width: 80%;
  height: auto;
}
.price {
  font-size: 50px;
}
.card-img-top {
  width: 160px;
  height: 210px;
}
.row{
	margin-bottom: 15px;
}
.card{
	width: 31%;
	text-align: center;
	border-color: #99DAEA;
	color: #767676;
	float: left;
	margin-right: 1%;
	margin-bottom: 1%;
}
.product:hover, .trainer:hover, .seleted {
	background-color: #99DAEA;
	color: white;
	border:none;
}
</style>
<%@ include file="../../../../inc/Top.jsp" %>
<div class="container" align="center">
<br>
<div align="center">
<img class="price_list" alt="" src="/static/member/images/기간권.jpg">
<img class="price_list" alt="" src="/static/member/images/횟수권.jpg">
</div><br>
	<div>
      <div class="row">
	      <div class="col-lg-1"></div>
	      <div class="col-lg-2"><strong>지점 선택</strong></div>
	      <div class="col-lg-8" align="left">          
		      <select name="gym_code" id="gymSelect">
		            <option value="">지점을 선택해주세요</option>
		            <c:forEach items="${gymList}" var="gym" varStatus="loop">
		            <option value="${gym.gym_code}">${gym.mem_name}</option>
		            </c:forEach>
		      </select>
	      </div>
	      <div class="col-lg-1"></div>
      </div>
      <div class="row">
	      <div class="col-lg-1"></div>
	      <div class="col-lg-2"><strong>프로그램 선택</strong></div>
	      <div class="col-lg-8" align="left"> 
		     <input type="radio" name="product_category" value="헬스">헬스
	         <input type="radio" name="product_category" value="GX">GX
	         <input type="radio" name="product_category" value="요가">요가
	         <input type="radio" name="product_category" value="필라테스">필라테스
	         <input type="radio" name="product_category" value="PT">PT
         </div>
         <div class="col-lg-1"></div>
	  </div>
      <div class="row">
      	 <div class="col-lg-1"></div>
	     <div class="col-lg-2">
	     <strong><span id="pTitle" style="display:none;">이용권 선택</span></strong>
	     </div>
      	 <div class="col-lg-8" align="left" id="show_product"></div>
      	 <div class="col-lg-1"></div>
      </div>
      <div class="row">
      	 <div class="col-lg-1"></div>
	     <div class="col-lg-2">
	     <strong><span id="tTitle" style="display:none;">트레이너 선택</span></strong>
	     </div>
	     <div class="col-lg-8" align="left" id="show_trainer"></div>
	     <div class="col-lg-1"></div>
      </div>
      <div>
      	<button id="kPayBtn" style="border: none; background-color: white;">
      		<img style="width:150px; border-radius: 10px;" src="static/member/images/kakao_pay.jpg">
      	</button>
	  </div>
	</div>
</div>
<!-- bottom -->
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>