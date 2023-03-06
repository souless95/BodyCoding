<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<h1>차트</h1>
<hr>
<div>
  <canvas id="myChart" style="width:500px; height:400px;"></canvas>
</div>
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