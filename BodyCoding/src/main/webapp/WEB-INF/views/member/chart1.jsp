<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<canvas id="myChart" style="width:1300px; height:800px;"></canvas>
<script>
const labels = ['1월', '2월', '3월', '4월', '5월', '6월'
	,'7월', '8월', '9월', '10월', '11월', '12월'];
console.log("라벨"+labels);

const weight_data =[];
	weight_data.push('1');
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