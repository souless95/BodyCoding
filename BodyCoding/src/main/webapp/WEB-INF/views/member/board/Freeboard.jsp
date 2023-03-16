<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<style>
 	
   
</style>

</head>
<body>
	<!-- Header -->
	<%@ include file="../../../../inc/Top.jsp" %>
	
	<div class="container" style="margin-top:25px;">
	
	<div class="container-fluid" style="width:80%; text-align:left; padding-left:15px;" >
	 	<div style="margin-left:145px;">
	    <form method="get" action="searchmemberboard.do" style=" display: flex;">
	        <div class="form-group" style="flex; margin-top:4px;">
	            <label for="searchType">검색 종류</label>
	            <select name="searchType" id="searchType" class="form-control">
	                <option value="board_title">제목</option>
	                <option value="board_contents">내용</option>
	                <option value="mem_id">작성자</option>
	            </select>
	        </div>
	        &nbsp;&nbsp;
	         <div class="form-group" style="flex;">
	            <label for="searchKeyword">검색어</label>
	            <input type="text" name="searchKeyword" id="searchKeyword" class="form-control">
	            <button type="submit" style="height:42px;" class="btn btn-primary" onclick="search()">검색</button>
	        </div>
	    	</form>
		</div><!-- 검색끝 -->
	 </div>		
	
	<div style="display: flex; justify-content: center;  margin-top:20px;">
		<table style="width:80%; height:300px;">
		    <thead>
		        <tr style="border-bottom:1px solid #ccc; height:50px;">
		            <td style="vertical-align:middle; text-align:center; font-weight:bold; font-size:22px;">번호</td>
		            <td style="vertical-align:middle; text-align:center; font-weight:bold; font-size:22px;">제목</td>
		            <td style="vertical-align:middle; text-align:center; font-weight:bold; font-size:22px;">작성자</td>
		            <td style="vertical-align:middle; text-align:center; font-weight:bold; font-size:22px;">작성일</td>
		            <td style="vertical-align:middle; text-align:center; font-weight:bold; font-size:22px;">조회수</td>
		            <%-- 첨부보류 <td>첨부</td>--%>
		        </tr>
		    </thead>
    	<tbody>
        <c:forEach items="${list}" var="row" varStatus="loop">
            <c:if test="${row.board_category eq '공지'}">
                <tr style=" width:100%; border-bottom:1px solid #ccc; height:45px;">
                    <td style="display:flex; align-items:center; justify-content:center; height:45px; margin-top:5px; margin-bottom:5px; ">
  					      <span style="width:50px; background-color: #FFE3E4; color: red;  text-align:center; border: 1px solid red; border-radius:10px;">공지</span>
					</td>

                   	<td style="vertical-align:middle; padding-left:60px; text-align:left;">
                   		<span style="font-weight:bold;  color:#808080">[공지]</span>&nbsp;
                    	<a style="color:red; font-weight:bold;" href="detailmemberboard.do?board_idx=${row.board_idx}">${row.board_title}</a>
                    </td>
                    
                    <td style="vertical-align:middle; text-align:center;"class="text-center">${row.mem_id}</td>
                    <td style="vertical-align:middle; text-align:center;" class="text-center">${row.board_postdate}</td>
                    <td style="vertical-align:middle; text-align:center;" class="text-center">${row.board_visitcount}</td>
                    <%-- 첨부보류 <td class="text-center"><i class="bi bi-pin-angle-fill"></i></td> --%>
                </tr>
            </c:if>
        </c:forEach>

        <c:forEach items="${list}" var="row" varStatus="loop">
            <c:if test="${row.board_category ne '공지'}">
                <tr style="width:100%; height:45px; border-bottom:1px solid #ccc; vertical-align: middle;">
                    <td style="vertical-align:middle; text-align:center;">${row.board_idx}</td>
                    <td style="vertical-align:middle; text-align:center;"><a href="detailmemberboard.do?board_idx=${row.board_idx}"><span style="color:black;">${row.board_title}</span></a></td>
                    <td style="vertical-align:middle; text-align:center;"class="text-center">${row.mem_id}</td>
                    <td style="vertical-align:middle; text-align:center;" class="text-center">${row.board_postdate}</td>
                    <td style="vertical-align:middle; text-align:center;" class="text-center">${row.board_visitcount}</td>
                    <%-- 첨부보류 <td class="text-center"><i class="bi bi-pin-angle-fill"></i></td> --%>
                </tr>
            </c:if>
	        </c:forEach>
		    </tbody>
		</table>
	 </div>      
	 
	 	<div style="text-align:right; width:90%; ">
			<div>
	            <button type="button" style="border-radius:5px; font-size:17px; height:45px; width:80px;" class="btn btn-primary" onclick="location.href='insertboard.do'">글쓰기</button>
	        </div>
		</div>
	 
        <div style="text-align:center; margin-top:10px; padding-top:10px;">
	        <ul class="paging">
			    <c:if test="${paging.prev}">
			        <span style="font-size:25px;"><a href='<c:url value="/Freeboard.do?page=${paging.startPage-1}"/>'>이전</a></span>
			    </c:if>
			    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
			        <span style="font-size:25px;"><a href='<c:url value="/Freeboard.do?page=${num}"/>'>${num}</a></span>
			    </c:forEach>
			    <c:if test="${paging.next && paging.endPage>0}">
			        <span style="font-size:25px;"><a href='<c:url value="/Freeboard.do?page=${paging.endPage+1}"/>'>다음</a></span>
			    </c:if>
			</ul>
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