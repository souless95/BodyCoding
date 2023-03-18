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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div class="sub_container">
		<%@ include file="../../../../inc/mypageside.jsp"%>
		<br />
		<h2>체중 그래프</h2>
		<hr style="border: 1px solid #01538D;">
		<div style="width: 80%; float: left;">
		  	<canvas id="myChart" style="width:850px; height:450px;"></canvas>
		  	<p>
		  	<form method="post" action="chart">
		  		오늘의 체중 : 
			  	<input type="hidden" name="mem_id" value=${mem_id }>
			  	<input type="number" name="mem_weight">
			  	<input type="submit" value="입력">
			</form>
		</div>
	</div>
	<%@ include file="../../../../inc/Bottom.jsp" %>
</div>
<!-- 차트 관련 script는 아래로 내려가야함 -->
<script>
const labels = [];
	 <c:forEach  items="${weight }" var="row1">
	labels.push('${row1.mem_weight_date}');
	</c:forEach> 
console.log("라벨"+labels);

const weight_data =[];
	<c:forEach  items="${weight }" var="row2">
	weight_data.push('${row2.mem_weight}');
	</c:forEach> 
console.log("몸무게"+weight_data);
	
const data = {
  labels: labels,
  datasets: [{
    label: '몸무게 변화',
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: weight_data
  }]
};
const config = {
  type: 'line',
  data,
  options: {
	  responsive: true,
      title: {
          display: true,
          text: '체중 변화'
      },
      tooltips: {
          mode: 'index',
          intersect: false,
      },
      hover: {
          mode: 'nearest',
          intersect: true
      }
  }
};

 const myChart = new Chart(
   document.getElementById('myChart'),
   config
 );
</script>
	

</body>
</html>