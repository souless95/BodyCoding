<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Room</title>
</head>

<script type="text/javascript">
	var ws;

	window.onload = function() {
		getRoom();
	}

	function getRoom() {
		commonAjax('/getRoom', "mem_id=${memberid}", 'post', function(result) {
			var roomid = $('#roomName').val();
			var targetRoom = null;

			for (var i = 0; i < result.length; i++) {
				if (result[i].roomName == roomid) {
					targetRoom = result[i];
					break;
				}
			}
			if (targetRoom == null) {
				var msg = {roomName : roomid};
				/* 어드민이 아니고 기존에 생성된 채팅방이 없으면 생성후 입장 */
				if ('${memberid}' != 'admin_super1') {
					commonAjax('/createRoom',msg,'post',function(createRoom) {
						goRoom(createRoom[createRoom.length - 1].roomidx, createRoom[createRoom.length - 1].roomName, "${memberid}", "${membername}");
					});
				}
			}
			/* 기존에 생성된 방이 있다면 입장 */
			else {
				goRoom(targetRoom.roomidx, targetRoom.roomName,"${memberid}", "${membername}");
			}
			/* 방 리스트 보여주기 */
			createChatingRoom(result);
		});
	}

	function goRoom(idx, rname, memid, memname){
		var url ="/moveChating?roomName="+rname+"&roomidx="+idx+"&mem_id="+memid+"&mem_name="+memname;
		console.log("이거 왜 admin_super1관리자야!!!!!!!!"+memid);
		window.open(url, "rname", "width=450,height=600, left=800, top=200");
	}

	function createChatingRoom(res) {
		if (res != null) {
			var tag = "";
			res.forEach(function(d, idx) {
				var rn = d.roomName.trim();
				var roomidx = d.roomidx;
				/* 여긴 정상적으로 이름하고 아이디 가져옴 */
				var memid = "${memberid}";
				var memname = "${membername}";
				tag += "<tr>"
					+ "<td>" + (idx + 1) + "</td>"
					+ "<td>" + rn + "</td>"
					+ "<td><button type='button' class='custom-btn btn-7' onclick='goRoom(\"" + roomidx + "\", \"" + rn + "\", \"" + memid + "\" + \"" + memname + "\")'>참여</button></td>" 
					+ "</tr>";
			});
			$("#datatablesSimple").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType) {
		$.ajax({
			url : url,
			data : parameter,
			type : type,
			contentType : contentType != null ? contentType
					: 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(res) {
				calbak(res);
			},
			error : function(err) {
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body class="sb-nav-fixed">
<input type="hidden" name="roomName" id="roomName" value="${memberid}-admin_super1">
<input type="hidden" name="memberName" id="memberName" value="${membername}">
<%@ include file ="../admin/inc/top.jsp" %>

	<div id="layoutSidenav">
	
		<%@ include file ="../admin/inc/side.jsp" %>
		
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<h1>채팅방</h1>
					</div>
					<div class="card-body">
						<table id="roomList" class="dataTable-table">
							<thead>
								<tr>
									<th>No</th>
									<th>방이름</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="datatablesSimple">
							</tbody>
						</table>
					</div>
				</div>
			</main>
		</div>
		<%@ include file ="../admin/inc/bottom.jsp" %>
	</div>
</body>
</html>