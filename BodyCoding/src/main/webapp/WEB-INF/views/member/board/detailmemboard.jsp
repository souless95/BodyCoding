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
				<input type="hidden" name="idx" value="${dto.board_idx }" />
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
							onclick="location.href='memboardDelete.do?board_idx=${dto.board_idx }'">
							삭제</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='updateboard.do?board_idx=${dto.board_idx }'">
							수정</button>
					</c:if>

					<button type="button" class="btn btn-primary"
						onclick="history.back()">뒤로가기</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='Freeboard.do'">리스트</button>
					<input type="hidden" value="${dto.board_idx }">
					<!--  <button type="button" onclick="location.href='report.do?board_idx=' + parseInt('${dto.board_idx}')">신고하기</button>-->
					<button type="button" onclick="openReportForm('${dto.mem_id}', '${dto.board_idx}')">신고하기</button>
				</div>
			</form>
			<%@ include file="../../../../inc/Bottom.jsp"%>
		</div>
	</div>

<script>
function openReportForm(id, idx) {
  const width = 1000;
  const height = 800;
  const left = (window.screen.width - width) / 2;
  const top = (window.screen.height - height) / 2;
  const url = 'report.do?mem_id='+id+'&board_idx='+idx;
  window.open(url, 'report.do', `width=${width}, height=${height}, left=${left}, top=${top}`);
}
</script>
</body>
</html>