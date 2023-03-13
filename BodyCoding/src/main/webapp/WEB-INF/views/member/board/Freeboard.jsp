<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
	<link rel="stylesheet" href="../bootstrap5.2.3/css/bootstrap.css">
    <script src="../bootstrap5.2.3/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<style>
    /* 붉은색 버튼 스타일 */
    .btn-red {
        color: white;
        background-color: red;
        padding: 5px 10px;
        border-radius: 5px;
    }
    
    /* 일반글과 구분하는 스타일 */
    tr.normal {
        background-color: #f2f2f2;
    }
    
    tr.notice {
        background-color: #d6eaf8;
    }
</style>

</head>
<body>
	<!-- Header -->
	<%@ include file="../../../../inc/Top.jsp" %>
	<div class="container">
		<button type="button" onclick="location.href='main'">홈으로</button> 
		<button type="button" onclick="location.href='insertboard.do'">글쓰기</button>
		
		<table class="table table-hover table-striped">
            <thead class="table-dark text-center">
                <tr>
                    <td>공지</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                    <td>첨부</td>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list}" var="row" varStatus="loop">
				    <c:if test="${row.board_category eq '공지'}">
				        <tr style="width:100%;">
				            <td>${row.board_idx}</td>
				            <td><a href="detailmemberboard.do?board_idx=${row.board_idx}">${row.board_title}</a></td>
				            <td class="text-center">${row.mem_id}</td>
				            <td class="text-center">${row.board_postdate}</td>
				            <td class="text-center">${row.board_visitcount}</td>
				            <td class="text-center"><i class="bi bi-pin-angle-fill"></i></td>
				        </tr>
				    </c:if>
				</c:forEach>
            </tbody>
        </table>
		
		<table class="table table-hover table-striped">
            <thead class="table-dark text-center">
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                    <td>첨부</td>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }" var="row" varStatus="loop">
	                <tr style="width:100%;">
	                    <td>${row.board_idx }</td>
	                    <td><a href="detailmemberboard.do?board_idx=${row.board_idx }">${row.board_title }</a></td>
	                    <td class="text-center">${row.mem_id }</td>
	                    <td class="text-center">${row.board_postdate }</td>
	                    <td class="text-center">${row.board_visitcount }</td>
	                    <td class="text-center"><i class="bi bi-pin-angle-fill"></i></td>
	                </tr>
	            </c:forEach>
            </tbody>
        </table>
        <div style="text-align:center;">
        <ul class="paging">
		    <c:if test="${paging.prev}">
		        <span><a href='<c:url value="/Freeboard.do?page=${paging.startPage-1}"/>'>이전</a></span>
		    </c:if>
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
		        <span><a href='<c:url value="/Freeboard.do?page=${num}"/>'>${num}</a></span>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage>0}">
		        <span><a href='<c:url value="/Freeboard.do?page=${paging.endPage+1}"/>'>다음</a></span>
		    </c:if>
		</ul>
		</div>
	<div class="container">
    <form method="get" action="searchmemberboard.do">
        <div class="form-group">
            <label for="searchType">검색 종류</label>
            <select name="searchType" id="searchType" class="form-control">
                <option value="title">제목</option>
                <option value="content">내용</option>
                 <option value="writer">작성자</option>
            </select>
        </div>
        <div class="form-group">
            <label for="searchKeyword">검색어</label>
            <input type="text" name="searchKeyword" id="searchKeyword" class="form-control">
        </div>
        	<button type="submit" class="btn btn-primary" onclick="search()">검색</button>
        	<button type="button" onclick="location.href='Freeboard.do'">리스트</button>
	    </form>
	</div>
        
	</div>
	<!-- footer -->
	<%@ include file="../../../../inc/Bottom.jsp" %>
<script>
function search() {
	  var searchType = document.getElementById("searchType").value;
	  var searchKeyword = document.getElementById("searchKeyword").value;

}
</script>
</body>
</html>