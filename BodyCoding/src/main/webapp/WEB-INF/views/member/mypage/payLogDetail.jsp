<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.pImg {
	margin-top: 6px;
	width: 140px;
	height: 138px;
	width: 140px;
}

.title {
	font-weight: bolder;
}

.content {
	font-weight: bold;
	color: gray;
}

.pInfo {
	height: 35px;
}

.status {
	border-radius: 7%;
	border: 1.5px solid #E83838;
	color: #E83838;
	padding: 3px;
	font-weight: bolder;
}

.sign {
	line-height: 100px;
	font-size: 30px;
	font-weight: bold;
	color: gray;
}

.cal {
	text-align: center;
}

.hi {
	border-top: 1px solid #01538D;
	margin-left: 1px;
}
.point {
	border-radius: 5px;
	border: 1.5px solid #E83838;
	color: #E83838;
	padding: 3px;
	font-weight: bolder;
}
</style>
</head>
<body>
	<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<%@ include file="../../../../inc/mypageside.jsp"%>
		<br />
		<h2>결제 내역 상세</h2>
		<hr style="border: 1px solid #01538D; width: 70%">
		<div class="card" style="width: 70%">
			<div class="card-body">
				<div style="float: left; margin-right: 5%">
					<span class="title">주문번호</span>${payLog.order_idx}</div>
				<div style="float: left; margin-right: 5%">
					<span class="title">주문일자</span>
					<fmt:formatDate value="${payLog.order_date}" pattern="yyyy-MM-dd" />
				</div>
				<div style="float: left; margin-right: 5%">
					<span class="title">주문명</span> ${payLog.order_name}
				</div>
				<div class="row" style="clear: both;">
					<c:forEach items="${orderlist}" var="orderlist">
						<div class="col-lg-2">
							<img class="pImg"
								src="static/uploads/product/${orderlist.product_img}">
						</div>
						<div class="col-lg-4">
							<div class="pInfo" style="font-size: 15px;">
								<span class="status">${orderlist.order_status}</span>
							</div>
							<div class="pInfo">${orderlist.product_name}</div>
							<div class="pInfo">
								<fmt:formatNumber value="${orderlist.product_price}"
									pattern="###,###,###원" />
							</div>
							<div class="pInfo">
								<span>${orderlist.product_count}</span>개
							</div>
						</div>
						<div class="col-lg-6"></div>
					</c:forEach>
					<div class="row hi">
						<div class="col-lg-3 cal" style="float: left;">
							<span class="title">주문금액</span> <br> <span class="content">
								<fmt:formatNumber value="${payLog.total_price}"
									pattern="###,###,###원" />
							</span>
						</div>
						<div class="col-lg-1 cal">
							<span class="sign">-</span>
						</div>
						<div class="col-lg-3 cal" style="float: left;">
							<span class="title">사용포인트</span> <br> <span class="content">
								<fmt:formatNumber value="${payLog.use_point}"
									pattern="###,###,###P" />
							</span>
						</div>
						<div class="col-lg-1 cal">
							<span class="sign">=</span>
						</div>
						<div class="col-lg-3 cal" style="float: left;">
							<span class="title">최종주문금액</span> <br> <span class="content"
								style="color: #E83838;"> <fmt:formatNumber
									value="${payLog.final_price}" pattern="###,###,###원" /></span>
						</div>
						<div class="col-lg-1 cal" style="clear: both;"></div>
						<div align="center">
							<span class="title point">적립포인트 : <b><fmt:formatNumber
									value="${payLog.save_point}" pattern="###,###,###P" /></b>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>