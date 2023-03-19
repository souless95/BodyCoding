<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<style>
body{
   border: 1px;
}

table th, table td {
  border-bottom: 1px solid #D7D7D7;
  text-align:center;
  height:50px;
  vertical-align:middle;
}

table th {
  background-color: #E6EDEE;
  font-weight:bold;
  border-bottom: 1px solid #D7D7D7;
  
</style>
</head>
<%@ include file="../../../../inc/Top.jsp" %>
<script>
$(document).ready(function() {
   $("#yoil").change(function() {
      $.ajax({
           url: '/changeYoil',
           contentType: "application/json; charset=utf-8",
           data: {
              mem_id: '${mem_id}',
              yoil: $('#yoil').val()
           },
           dataType: 'json',
           success: function(response) {
              console.log("success", response);
              if(response.mem_id == "error_id"){
                 $("#registeredRoutine").children("div").remove();
              }
              else {
                 var listMem_Id = response.mem_id;
                 var listYoil = response.yoil;
                 var listActname = response.actname.split(",").map(String);
                 var listAtime = response.atime.split(",").map(String);
                 var listAset = response.aset.split(",").map(String);
                 
                 $("#registeredRoutine").children("div").remove();
                 
                 for (var i = 0; i < listActname.length; i++) {
                     var newDiv = document.createElement('div');
                     newDiv.setAttribute('id', 'counts' + (i+1));
                     newDiv.innerHTML = '<img src="' + listActname[i] + '" style="width:75px; height:85px;">' +
                                     '<span style="margin-right:10px; margin-left:25px;">'+ listAtime[i] +'</span>' +
                                     '<span style="margin-right:30px;">회</span>' +
                                     '<span style="margin-right:30px;">X</span>' +
                                        '<span style="margin-right:10px;">' + listAset[i] + '</span>' +
                                        '<span style="margin-right:50px;">세트</span>';
                      newDiv.style.display = 'flex';
                      newDiv.style.alignItems = 'center';
                      newDiv.style.width = '80%';
                      newDiv.style.marginLeft = '82px';
                                        
                     registeredRoutine.appendChild(newDiv);
                 }
              }
           },
           error: function(xhr, status, error) {
              console.log("error", status);
            }
       });
   }).trigger('change');
});

function routine(){
   open("routine.do?mem_id=${dto.mem_id}",
            "routineRegist",
            "width=935, height=800, left=500, top=100, "
            + "location=no, toolbar=no, menubar=no, "
            + "scrollbars=yes, resize=no");
}
function ptrecord(){
   open("addexrecord.do?mem_id=${dto.mem_id}",
            "recordRegist",
            "width=935, height=800, left=500, top=100, "
            + "location=no, toolbar=no, menubar=no, "
            + "scrollbars=yes, resize=no");
}
</script>
<body>
 <div class="container">
    <%@ include file ="../../../../inc/mypageside.jsp" %>
       <div id="layoutSidenav_content">
        <div class="card mb-5" style="border-radius:10px;">
           <div class="card-header" style="color:white; height:75px; background-color:#01538D; vertical-align:middle; border-radius:10px;">
            <h2> ${dto.mem_name } 회원 상세보기 </h2>
         </div>
               <div id="layoutSidenav">
                  <div class="card-header" style="width: 100%; background-color:white;">
                     <div style="border:1px solid #D7D7D7; margin-top:15px; margin-bottom:15px; border-radius:7px;">
                          <h3 style="margin-top:10px; margin-left:15px; margin-bottom:-2px;">상세정보</h3>
                        <div class="container-fluid">      
                           <table style="width:100%; border:1px solid #D7D7D7; border-radius:7px; border-collapse: separate; margin-bottom:0px;" >
                                 <tr>
                                    <th>이메일(아이디)</th>
                                    <td>${dto.mem_id}</td>
                                    <th>가입일자</th>
                                    <td>${dto.mem_regidate}</td>
                                    <th>생년월일</th>
                                    <td>${dto.mem_birth}</td>
                                 </tr>
                                 <tr>
                                    <th>이름</th>
                                    <td>${dto.mem_name}</td>
                                    <th>성별</th>
                                    <td>${dto.mem_gender}</td>
                                    <th>전화번호</th>
                                    <td>${dto.mem_phone}</td>
                                 </tr>
                                 <tr>
                                    <th>주소</th>
                                    <td>${dto.mem_address}</td>
                                    <th>이용권 유형</th>
                                    <td>${dto.product_type}</td>
                                    <th>이용권 이름</th>
                                    <td>${dto.product_name}</td>
                                 </tr>
                                 <tr>
                                    <th>키</th>
                                    <td>${dto.mem_height}cm</td>
                                    <th>체중</th>
                                    <td>${dto.mem_weight}kg</td>
                                    <th>보유 질병</th>
                                    <td>${dto.mem_disease}</td>
                                 </tr>
                                 <tr>
                                    <th>운동 목적</th>
                                    <td>${dto.mem_purpose}</td>
                                    <th>관심사</th>
                                    <td>${dto.mem_interest}</td>
                                    <th>방문 경로</th>
                                    <td>${dto.mem_inflow}</td>
                                 </tr>
                           </table>
                           
                           <div style="margin-top:10px;">
                              <button type="button" style="margin:0px; background-color:#DFE8EA; border: 2px solid #D7D7D7; border-radius:7px; font-weight:bold;"
                                onclick="location.href='main'">홈으로</button>  
                              <button type="button" style="margin:0px; background-color:#DFE8EA; border: 2px solid #D7D7D7; border-radius:7px; font-weight:bold;"
                                 onclick="routine();">운동루틴 등록</button>  
                              <button type="button" style="margin:0px; background-color:#DFE8EA; border: 2px solid #D7D7D7; border-radius:7px; font-weight:bold;"
                                onclick="ptrecord();">기록등록</button>
                           </div>
                           <br /><br /><br />
                              <div style="border: 2px solid #D7D7D7; border-radius:7px; margin-bottom:20px; ">   
                                 <div style="margin-bottom:10px; margin-top:10px; margin-left:10px;">
                                    <select name="yoil" id="yoil" style="width:120px;">
                                          <option value="월요일">월요일
                                          <option value="화요일">화요일
                                          <option value="수요일">수요일
                                          <option value="목요일">목요일
                                          <option value="금요일">금요일
                                          <option value="토요일">토요일
                                          <option value="일요일">일요일
                                    </select>
                                 </div>
                                    <div id="registeredRoutine" style="margin-top:15px; margin-bottom:20px;"></div>
                              </div>
                             </div>
                          </div>
                       </div>
                  </div>
                 </div>
            </div>
         </div>
</body>
<%@ include file="../../../../inc/Bottom.jsp" %>
</html>