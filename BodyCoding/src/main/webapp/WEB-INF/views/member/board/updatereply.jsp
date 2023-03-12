<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<!-- top메뉴  -->
	<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<div>
			<div>
				<h2>${dto.mem_id }작성글상세보기</h2>
			</div>
			<form name="writeFrm">
				<!-- idx숨겨놓기 -->
				<input type="hidden" name="board_idx" value="${dto.board_idx }" />
				<input type="hidden" name="category" value="${dto.board_category }" />
				<div class="card-body" style="width: 90%">
					<table
						style="border: 2px solid black; border-left: 0px; border-right: 0px; width: 90%;">
						<tr style="border-bottom: 3px solid black;">
							<th width="10%">번호</th>
							<td width="10%">${dto.board_idx }</td>
							<th width="20%">작성자</th>
							<td width="20%">${dto.mem_id }</td>
							<th width="20%">작성일</th>
							<td width="*">${dto.board_postdate }</td>
						</tr>
						<tr style="border-bottom: 1px solid gray;">
							<th>제목</th>
							<td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">${dto.board_title }</td>
							<th>조회수</th>
							<td>${dto.board_visitcount }</td>
						</tr>
						<tr style="border-bottom: 1px solid gray;">
							<th>내용</th>
							<td colspan="4"
								style="height: 300px; vertical-align: top; padding-top: 10px; padding-bottom: 10px;">
								${fn:replace(dto.board_contents, replaceChar, "<br/>")}</td>
						</tr>
						<tr style="text-align: center">
							<th>파일첨부</th>
							<td>${dto.board_file }</td>
						</tr>

					</table>
					<c:if test="${dto.mem_id eq mem_id}">
						<button type="button" class="btn btn-primary"
							onclick="location.href='updateboard.do?board_idx=${dto.board_idx }'">
							수정</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='memboardDelete.do?board_idx=${dto.board_idx }'">
							삭제</button>
						
					</c:if>

					<button type="button" class="btn btn-primary"
						onclick="location.href='Freeboard.do'">리스트</button>
					<input type="hidden" value="${dto.board_idx }">
					<!--  <button type="button" onclick="location.href='report.do?board_idx=' + parseInt('${dto.board_idx}')">신고하기</button>-->
					<button type="button"
						onclick="openReportForm('${dto.mem_id}', '${dto.board_idx}')">신고하기</button>
					<br>
					<br>
					<div>
					<h4>댓글리스트</h4>
					<div>
						<c:forEach var="rdto" items="${rdto}">
							<div id="reply" class="list-group-item" style="width: 90%">
								<div>작성자: ${rdto.mem_id }&nbsp;</div>
								
								<div style="display: flex; justify-content: space-between;" style="width: 90%">
									<div style="margin-left: 20px;" style="width: 90%">${rdto.reply_cont }</div>
									<c:if test="${rdto.mem_id eq mem_id}">
									<div>
										<button type="button" class="btn btn-primary"
											onclick="location.href='updatereply.do?reply_idx=${rdto.reply_idx }&board_idx=${dto.board_idx }">수정</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='deletereply.do?reply_idx=${rdto.reply_idx }&board_idx=${dto.board_idx }'">삭제</button>
									</div>
								</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</form>

		<form method="post" action="/updateReply.do">
		    <input type="hidden" name="board_idx" value="${rdto.board_idx }" />
		    <input type="hidden" name="reply_idx" value="${rdto.reply_idx }" />
		    <div class="card">
		        <div style="width: 90%">
		            <textarea rows="1" name="reply_cont" id="reply_cont" style="width: 90%" >${rdto.reply_cont }</textarea>
		        </div>
		        <div>
		            <input type="submit" value="수정" class="btn btn-primary" />
		        </div>
		    </div>
		</form>
	</div>
	<%@ include file="../../../../inc/Bottom.jsp"%>
	</div>

	<script>
function openReportForm(id, idx) {
	open('report.do?mem_id='+id+'&board_idx='+idx,
       	"calendarUpdate",
        "width=650, height=600, left=500, top=100, "
   	    + "location=no, toolbar=no, menubar=no, "
        + "scrollbars=yes, resize=no");
}
</script>
</body>
</html>