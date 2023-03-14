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
<h2>전체지점 날짜별 매출 현황</h2>
<canvas id="myChart_supmain" style="width:50%; height:50%;"></canvas>

<script>
const sup_labels = ['1월', '2월', '3월', '4월', '5월', '6월'
	,'7월', '8월', '9월', '10월', '11월', '12월'];
console.log("라벨"+sup_labels);

const sup_totalsales =[];
<c:forEach  items="${totalgym_totalsales }" var="row">
	sup_totalsales.push('${row.sales}');
</c:forEach> 
console.log("모든지점 총 매출 "+sup_totalsales);

<c:forEach  items="${gym_sales }" var="gyms">
	eval("var ${gyms.key} = [,,,,,,,,,,,];");
	<c:forEach  items="${gyms.value }" var="gym">
		for(var i=1; i<=12;i++){
			if(${gym.order_date} === 2023-i){
				${gyms.key}[i-1]=${gym.sales};
			}
		}
	</c:forEach> 
</c:forEach> 
		
function getRandomColor() {
	  var colorCode  = '#' + Math.round(Math.random() * 0xffffff).toString(16);
	  return colorCode;
}

const sup_data = {
	//모든지점 총매출
  	labels: sup_labels,
  	datasets: [{
  		type: 'line',
    	label: '모든지점 총매출',
    	backgroundColor: 'rgb(255, 99, 132)',
    	borderColor: 'rgb(255, 99, 132)',
    	data: sup_totalsales,
    	yAxisID :'y-right'
  	},
  	//지점별 매출현황
  	<c:forEach  items="${gym_sales }" var="gyms">
		<c:forEach  items="${gyms.key }" var="gym">
		  	{
		  		type: 'bar',
		  		label: '${gyms.key} 총매출',
		    	backgroundColor: getRandomColor(),
		    	data: ${gyms.key}
		  	},
		</c:forEach> 
	</c:forEach> 
  	]
};
const sup_config = {
		data:sup_data,
 		options: {
	   	 scales: {
	   		 y: {
	   			axis: 'y',
	   	      	display: true,
              	position: 'left',
             	title: {
                display: true,
                text: '모든지점 총매출액'
             	}
	   	 	 },
	   		 'y-right': {
	              position: 'right',
	              title: {
                  display: true,
                  text: '지점별 매출액'
	              },
	              grid: {
	                  display: false
	              }
	   	 	  }
	   	 }
	} 
};

const sup_myChart = new Chart(document.getElementById('myChart_supmain'),sup_config); 
</script>
</body>
</html>