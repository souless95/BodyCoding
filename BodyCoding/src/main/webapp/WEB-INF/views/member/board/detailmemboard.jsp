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
<%-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<style>

</style>
</head>
<body>
	<!-- top메뉴  -->
	<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<div style="margin-left:200px;">
			<div style="">
				<%-- <h2>${dto.mem_id }작성글상세보기</h2>--%>
			</div>
			<form name="writeFrm">
				<!-- idx숨겨놓기 -->
				<input type="hidden" name="board_idx" value="${dto.board_idx }" />
				<input type="hidden" name="category" value="${dto.board_category }" />
				<div class="card-body" style="width: 100%; margin-top:20px;">
					<table
						style="border: 2px solid black; border-left: 0px; border-right: 0px; width: 90%; margin-bottom:0px;">
						<tr style="border-bottom: 3px solid black;">
							<th width="10%">번호</th>
							<td width="10%">${dto.board_idx }</td>
							<th width="20%">작성자</th>
							<td width="20%">${dto.mem_name }</td>
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
							<th style="vertical-align: middle">내용</th>
							<td colspan="4"
								style="height: 300px; vertical-align: top; padding-top: 10px; padding-bottom: 10px;">
								${fn:replace(dto.board_contents, replaceChar, "<br/>")}
								
								<c:set var="board_file" value="${not empty dto.board_file}" />
						   		<c:if test="${board_file}">
							    	<div>
							        	<img src="../static/uploads/board/${dto.board_file}" style="width:80%; height:80%;"/>
							    	</div>
						    	</c:if>
							</td>
						</tr>
					</table>

					<div style="display:flex;">
						<c:if test="${dto.mem_id eq mem_id}">
							<button type="button" class="custom-btn btn-1" style="margin:0px; margin-top:10px; margin-right:3px; width:70px; border:2px solid #99DAEA;"
								onclick="location.href='updateboard.do?board_idx=${dto.board_idx }'">
								수정</button>
							<button type="button" class="custom-btn btn-1" style="margin:0px; margin-top:10px; margin-right:3px; width:70px; "
								onclick="location.href='memboardDelete.do?board_idx=${dto.board_idx }'">
								삭제</button>
						</c:if>

						
						<div style="margin-top:10px;">
							<button type="button" class="custom-btn btn-1"
								onclick="location.href='Freeboard.do'" style="margin:0px; width:70px; margin-right:0px;">리스트</button>
							<input type="hidden" value="${dto.board_idx }">
							<!--  <button type="button" onclick="location.href='report.do?board_idx=' + parseInt('${dto.board_idx}')">신고하기</button>-->
							<c:if test="${dto.board_category eq '자유' }">
								<button type="button" style="margin:0px; width:90px;" class="custom-btn btn-1"
									onclick="openReportForm('${dto.mem_id}', '${dto.board_idx}')">신고하기</button>
							</c:if>
						</div>
					</div>

					<br>
						<div>
							
							<div class="card" style="border: 1px solid #D7D7D7; border-radius:7px; width:90%; padding-bottom:20px;">
							<h3 style="margin-left:30px; margin-top:5px;">댓글목록</h3>
								<div class="last-comment" style="margin-left:15px; width:100%; ">
									<c:forEach var="rdto" items="${rdto}">
										<div style="width: 100%; display: flex; justify-content: space-between;">
											 <div style="display:flex; width:96%; height:40px; padding-bottom:30px; border-bottom: 1px solid #D7D7D7; align-items: center;">
													<div>
														<div style="font-weight:bold; width: 220px; height: 20px; display: flex-grow: 0; align-items: center;">${rdto.mem_name}</div>
													</div>&nbsp;
													<div style="margin-left: 10px; margin-top:30px; width: 70%;">${rdto.reply_cont }</div>
													<c:if test="${rdto.mem_id eq mem_id}">
														<input type="hidden" name="board_idx" value="${dto.board_idx }" />
														<input type="hidden" name="board_idx" value="${rdto.reply_idx }" />
														<div>
															<button type="button" style="margin-bottom:40px; width:60px; height:30px; margin: 2px; display: inline-block; margin-top:40px; "
															 class="custom-btn btn-1" onclick="setUpdateForm(${rdto.reply_idx}, '${rdto.reply_cont}');">수정</button>
														</div>
														<div>
															<button type="button" style="width:60px; height:30px; margin: 2px; display: inline-block; margin-top:40px;"
															  class="custom-btn btn-1 "
																onclick="location.href='deletereply.do?reply_idx=${rdto.reply_idx }&board_idx=${dto.board_idx }'">삭제</button>
														</div>
													</c:if>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
					</div>
				</form>
		<div style="margin-top:10px;">
			<form method="post" action="/updatereply.do" class="update-form" style="display: none;">
			    <input type="hidden" name="board_idx" value="${dto.board_idx }" />
			    <input type="hidden" name="mem_id" value="${mem_id }" />
			    <input type="hidden" id="reply_idx" name="reply_idx"  />
			    <div>
			        <div style="width: 90%">
					    <input type="text" name="reply_cont" id="reply_cont" style="width: 90%; height:50px; border-radius:30px; margin: 2px;" >
					    <textarea name="edited_reply_cont" id="edited_reply_cont"
					     style="width: 90%; display:none; margin-bottom:10px; border: 1px solid #D7D7D7; border-radius:7px;"></textarea> 
					</div>

			        <div>
			            <input type="submit" value="등록" class="custom-btn btn-1" style="margin: 2px;" id="reply_submit_button"  onclick="submitUpdatedReply();" /> <!-- 수정된 코드 -->
			            <input type="button" value="취소" class="custom-btn btn-1" style="margin: 2px;" onclick="cancelUpdate();" /> <!-- 추가된 코드 -->
			        </div>
			    </div>
			</form>
		</div>
		<div style="width:90%; margin-left:15px; margin-bottom:20px; margin-top:-10px;">
			<form method="post" action="/insertreply.do">
				<input type="hidden" name="board_idx" value="${dto.board_idx }" />
				<input type="hidden" name="mem_id" value="${UserInfo.mem_name }" />
				<div style="display: flex; flex-direction: column; width:88%; margin-top:10px;">
			      <div><span style="font-weight:bold;">${UserInfo.mem_name }</span></div>
			      <div style="display:flex; width:100%; margin-left:20px;">
				      <input type="text" name="reply_cont" id="reply_cont" placeholder=" 댓글을 입력하세요."
				       style="width:100%;border-radius: 6px; border: 1px solid #D7D7D7; margin-left:10px;"/>
				      <button type="submit" class="custom-btn btn-1" style="width: 65px; margin-left:5px; margin-right:0px; margin-bottom:0px; margin-top:0px;">등록</button>
				  </div>
			    </div>
			</form>
		</div>
	</div>
	</div>
	<%@ include file="../../../../inc/Bottom.jsp"%>

<script>
function setUpdateForm(reply_idx, reply_cont) {
    var replyIdxElement = document.getElementById("reply_idx");
    if (replyIdxElement) {
        replyIdxElement.value = reply_idx;
    }
    
    var replyContElement = document.getElementById("reply_cont");
    if (replyContElement) {
        replyContElement.value = reply_cont;
    }
    document.getElementById("edited_reply_cont").value = reply_cont; // 추가된 코드
    document.getElementById("reply_cont").style.display = "none"; // 추가된 코드
    document.getElementById("edited_reply_cont").style.display = "block"; // 추가된 코드
    document.getElementById("reply_submit_button").value = "등록"; // 추가된 코드
    document.querySelector(".update-form").style.display = "block";
}

function submitUpdatedReply() { // 추가된 함수
    document.getElementById("reply_cont").value = document.getElementById("edited_reply_cont").value;
    document.getElementById("edited_reply_cont").style.display = "none";
    document.getElementById("reply_cont").style.display = "block";
    document.getElementById("reply_submit_button").value = "등록";
    document.forms[0].submit();
}

function cancelUpdate() { // 추가된 함수

	document.getElementById('reply_cont').value = '';
    document.getElementById('edited_reply_cont').value = '';
    document.getElementById('edited_reply_cont').style.display = 'none';
    document.getElementById('reply_cont').style.display = 'block';
    document.getElementById('reply_submit_button').style.display = 'inline-block';
    document.getElementById('reply_submit_button').value = '등록';
    
    const form = document.querySelector('.update-form');
    // 폼 요소를 숨김
    form.style.display = 'none';
    // 기본 동작을 취소
    event.preventDefault();
}


//아래는 잘되니까 건들지마
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