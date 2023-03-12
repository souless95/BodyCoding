<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Room</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.roomContainer{
			background-color: #F6F6F6;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.roomList{
			border: none;
		}
		.roomList th{
			border: 1px solid #FFBB00;
			background-color: #fff;
			color: #FFBB00;
		}
		.roomList td{
			border: 1px solid #FFBB00;
			background-color: #fff;
			text-align: left;
			color: #FFBB00;
		}
		.roomList .num{
			width: 75px;
			text-align: center;
		}
		.roomList .room{
			width: 350px;
		}
		.roomList .go{
			width: 71px;
			text-align: center;
		}
		button{
			background-color: #FFBB00;
			font-size: 14px;
			color: #000;
			border: 1px solid #000;
			border-radius: 5px;
			padding: 3px;
			margin: 3px;
		}
		.inputTable th{
			padding: 5px;
		}
		.inputTable input{
			width: 330px;
			height: 25px;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	
	window.onload = function(){
		getRoom();
		/* createRoom(); */
	}

	function getRoom(){
		/* 어드민일때 방 리스트만 보여주게 바꾸고 시펑욤 */
		if('${memberid}'!='admin_super1'){
			commonAjax('/getRoom', "mem_id=${memberid}", 'post', function(result){
				var roomid = $('#roomName').val();
				console.log("roomid="+roomid);
				var targetRoom = null;
				
				for(var i = 0; i < result.length; i++){
					if(result[i].roomName == roomid){
						targetRoom = result[i];
						break;
					}
				}
				console.log("targetRoom="+targetRoom);
				if(targetRoom == null){
					var msg = {roomName: roomid};
					console.log("msg="+msg);
					commonAjax('/createRoom', msg, 'post', function(createRoom){
						console.log("createChatingRoom(result)"+createChatingRoom(result));
						goRoom(createRoom[createRoom.length-1].roomidx, createRoom[createRoom.length-1].roomName, "${memberid}");
						console.log("여기가 createRoom="+createRoom[createRoom.length-1]);
					});
				}
				else{
					goRoom(targetRoom.roomidx, targetRoom.roomName, "${memberid}");
					console.log("2"+targetRoom);
				}
			});
		}
		else{
			commonAjax('/getRoom', "", 'post', function(result){
				createChatingRoom(result);
			});
		}
	}
	
	/* function createRoom(){
		$("#createRoom").click(function(){
			var msg = {	roomName : $('#roomName').val()	};

			commonAjax('/createRoom', msg, 'post', function(result){
				createChatingRoom(result);
			});

			$("#roomName").val("");
		});
	} */

	function goRoom(idx, rname, memid){
		var url ="/moveChating?roomName="+rname+"&"+"roomidx="+idx+"&"+"mem_id="+memid;
		window.open(url, "rname", "width=340,height=560");
	}

	function createChatingRoom(res){
		console.log(res);
		if(res != null){
			var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
			res.forEach(function(d, idx){
				var rn = d.roomName.trim();
				var roomidx = d.roomidx;
				var memid = "${memberid}";
				console.log("이거맞아?"+memid);
				tag += "<tr>"+
							"<td class='num'>"+(idx+1)+"</td>"+
							"<td class='room'>"+ rn +"</td>"+
							"<td class='go'><button type='button' onclick='goRoom(\""+roomidx+"\", \""+rn+"\", \""+memid+"\")'>참여</button></td>" +
						"</tr>";	
			});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body>
	<div class="container">
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th>방 제목</th>
					<th><input type="text" name="roomName" id="roomName" value="${memberid}-admin_super1"></th>
					<th><button id="createRoom">방 만들기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>