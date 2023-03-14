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
<h2>${mem_name}지점 날짜별 매출 현황</h2>
<canvas id="myChart_submain" style="width:50%; height:50%;"></canvas>

<script>
const sub_labels = ['1월', '2월', '3월', '4월', '5월', '6월'
	,'7월', '8월', '9월', '10월', '11월', '12월'];
console.log("라벨"+sub_labels);

const sub_totalsales =[];
<c:forEach  items="${totalcategory_totalsales }" var="row">
	console.log("${row.mem_id}지점 ${row.order_date}총 매출 "+sub_totalsales);
	sub_totalsales.push('${row.sales}');
</c:forEach> 

const gxsales = [,,,,,,,,,,,];
<c:forEach  items="${gx_sales }" var="gx_sales">
	console.log("${gx_sales.order_date} 매출 ${gx_sales.sales}");
	for(var i=1; i<=12;i++){
		if(${gx_sales.order_date} === 2023-i){
			gxsales[i-1]=${gx_sales.sales};
		}
	}
</c:forEach> 
	console.log("총 매출 "+gxsales);

const healthsales = [,,,,,,,,,,,];
<c:forEach  items="${health_sales }" var="health_sales">
	console.log("${health_sales.order_date} 매출 ${health_sales.sales}");
	for(var i=1; i<=12;i++){
		if(${health_sales.order_date} === 2023-i){
			healthsales[i-1]=${health_sales.sales};
		}
	}
</c:forEach> 
	console.log("총 매출 "+healthsales);

const Pilasales = [,,,,,,,,,,,];
<c:forEach  items="${pilates_sales }" var="pilates_sales">
	console.log("${pilates_sales.order_date} 매출 ${pilates_sales.sales}");
	for(var i=1; i<=12;i++){
		if(${pilates_sales.order_date} === 2023-i){
			Pilasales[i-1]=${pilates_sales.sales};
		}
	}
</c:forEach> 
	console.log("총 매출 "+Pilasales);

const PTsales = [,,,,,,,,,,,];
<c:forEach  items="${pt_sales }" var="pt_sales">
	console.log("${pt_sales.order_date} 매출 ${pt_sales.sales}");
	for(var i=1; i<=12;i++){
		if(${pt_sales.order_date} === 2023-i){
			PTsales[i-1]=${pt_sales.sales};
		}
	}
</c:forEach> 
	console.log("총 매출 "+PTsales);

const Yogasales = [,,,,,,,,,,,];
<c:forEach  items="${yoga_sales }" var="yoga_sales">
	console.log("${yoga_sales.order_date}총 매출 ${yoga_sales.sales}");
	for(var i=1; i<=12;i++){
		if(${yoga_sales.order_date} === 2023-i){
			Yogasales[i-1]=${yoga_sales.sales};
		}
	}
</c:forEach> 
	console.log("총 매출 "+Yogasales);

function getRandomColor() {
	  var colorCode  = '#' + Math.round(Math.random() * 0xffffff).toString(16);
	  return colorCode;
}

const sub_data = {
	//모든상품 총매출
  	labels: sub_labels,
  	datasets: [{
  		type: 'line',
    	label: '모든상품 총매출',
    	backgroundColor: 'rgb(255, 99, 132)',
    	borderColor: 'rgb(255, 99, 132)',
    	data: sub_totalsales,
    	yAxisID :'y-right'
  	},{
  		type: 'bar',
    	label: 'gx 매출',
    	backgroundColor: getRandomColor(),
    	data: gxsales
  	},{
  		type: 'bar',
    	label: '헬스 매출',
    	backgroundColor: getRandomColor(),
    	data: healthsales
  	},{
  		type: 'bar',
    	label: '필라테스 매출',
    	backgroundColor: getRandomColor(),
    	data: Pilasales
  	},{
  		type: 'bar',
    	label: 'PT 매출',
    	backgroundColor: getRandomColor(),
    	data: PTsales
  	},{
  		type: 'bar',
    	label: '요가 매출',
    	backgroundColor: getRandomColor(),
    	data: Yogasales
  	}]
};
const sub_config = {
		data:sub_data,
 		options: {
	   	 scales: {
	   		 y: {
	   			axis: 'y',
	   	      	display: true,
              	position: 'left',
             	title: {
                  display: true,
                  text: '상품별 총매출액'
             	}
	   	 	 },
	   		 'y-right': {
	              position: 'right',
	              title: {
	                  display: true,
	                  text: '모든상품 매출액'
	              },
	              grid: {
	                  display: false
	              }
	   	 	  }
	   	 }
	} 
};

const sub_myChart = new Chart(document.getElementById('myChart_submain'),sub_config); 
</script>
</body>
</html>