<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type="text"] {
	size: 450px;
	direction: rtl;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
var mem_id = '${mem_id}';
$(document).ready(function() {
	
	var storedYoil = localStorage.getItem('selectedYoil');
	if (storedYoil !== null) {
	    $('#yoil').val(storedYoil);
	    localStorage.clear();
	}
	
	var count = 1;
	var count2 = 1;

	$("#routine-image-container img").click(function() {
	    var imgWidth = $(this).width() / 2;
	    var imgHeight = $(this).height() / 2;
	    
	    var thisCount = 'count'+ count++
	    var thisCount2 = 'counts'+ count2++
	    var count1 = $('<div>', {id: thisCount}).appendTo('#newRoutine').css({
	    	display: 'flex',
	    	alignItems: 'center',
	    	width: '80%',
	    	marginLeft: '82px'
	    });
	    
	    $('<img>', {src:'/static/member/routine/temp.png', width: imgWidth, height: imgHeight, id:'temp'}).appendTo(count1);
	    $('<input>', {type: 'text', name: 'time', style: 'margin-right: 10px; margin-left: 25px;', size: '3'}).appendTo(count1);
	    $('<span>', {text: '회', style: 'margin-right:30px'}).appendTo(count1);
	    $('<span>', {text: 'X', style: 'margin-right:30px'}).appendTo(count1);
	    $('<input>', {type: 'text', name: 'set', style: 'margin-right: 10px;', size: '3'}).appendTo(count1);
	    $('<span>', {text: '세트', style: 'margin-right:50px'}).appendTo(count1);
	    $('<button>', {type: 'button', class: 'save', style: 'margin-right: 10px; cursor:pointer;', 'data-parent':thisCount}).text('저장').appendTo(count1);
	    $('<button>', {type: 'button', class: 'cancel', style: 'cursor:pointer;', 'data-parent':thisCount}).text('취소').appendTo(count1);

	    var imgClone = $(this).clone().appendTo('body').css({
	    	position: 'absolute',
	    	top: $(this).offset().top,
	    	left: $(this).offset().left,
	    	width: $(this).width(),
	    	height: $(this).height(),
	    	border: '1px solid rgba(0, 0, 0, 0)',
	    }).animate({
	    	top: $('#'+thisCount).offset().top,
	    	left: $('#'+thisCount).offset().left,
	    	width: imgWidth,
	    	height: imgHeight
	    }, 1000, function() {
	    	$('#temp').remove();
	    	var img = $('<img>', {src: $(this).attr('src')}).prependTo(count1).css({
		    	position: 'relative',
		    	width: imgWidth,
		    	height: imgHeight,
		    });
	        $(this).remove();
	    });
	    
	    $(count1).find('.cancel').click(function() {
	        $(this).closest('div').remove();
	    });
	    
	    $(count1).find('.save').click(function() {
	    	var parentDiv = $(this).data('parent');
	    	var imgSrc = $('#'+parentDiv+' img').attr('src');
	    	var timeVal = $('#'+parentDiv+' input[name="time"]').val();
	    	var setVal = $('#'+parentDiv+' input[name="set"]').val();
	    	var yoil = $('#yoil').val();
	    	
		    var count1_2 = $('<div>', {id: thisCount2}).appendTo('#registeredRoutine').css({
		    	display: 'flex',
		    	alignItems: 'center',
		    	width: '80%',
		    	marginLeft: '82px'
		    });
		    
		    $('<img>', {src:imgSrc, width: imgWidth, height: imgHeight}).appendTo(count1_2);
		    $('<input>', {type: 'text', name: 'time', style: 'margin-right: 10px; margin-left: 15px;', size: '3', value: timeVal}).appendTo(count1_2);
		    $('<span>', {text: '회', style: 'margin-right:30px'}).appendTo(count1_2);
		    $('<span>', {text: 'X', style: 'margin-right:30px'}).appendTo(count1_2);
		    $('<input>', {type: 'text', name: 'set', style: 'margin-right: 10px;', size: '3', value: setVal}).appendTo(count1_2);
		    $('<span>', {text: '세트', style: 'margin-right:50px'}).appendTo(count1_2);
		    $('<button>', {type: 'button', class: 'save', style: 'margin-right: 10px;', 'data-parent':thisCount2}).text('수정').appendTo(count1_2);
		    $('<button>', {type: 'button', class: 'cancel', 'data-parent':thisCount2}).text('삭제').appendTo(count1_2);
		    
		    var actname = "";
		    $("#registeredRoutine div").each(function() {
		        actname += $(this).find('img').attr("src") + ",";
		    });
		    actname = actname.substring(0, actname.length-1);
		    
		    var atime = "";
		    $("#registeredRoutine input[name='time']").each(function() {
		    	atime += $(this).val() + ",";
		    });
		    atime = atime.substring(0, atime.length-1);
		    
		    var aset = "";
		    $("#registeredRoutine input[name='set']").each(function() {
		    	aset += $(this).val() + ",";
		    });
		    aset = aset.substring(0, aset.length-1);
		    
		    $(this).closest('div').remove();
		    
    	    $.ajax({
	    	    url: '/saveRoutine',
	    	    contentType: "application/json; charset=utf-8",
	    	    data: {
	    	    	mem_id: mem_id,
	    	    	yoil: yoil,
	    	    	actname: actname,
	    	    	atime: atime,
	    	    	aset: aset
	    	    },
	    	    dataType: 'json',
	    	    success: function(response) {
	    	    	localStorage.setItem('selectedYoil', yoil);
	    	    	location.reload();
	    	    },
	    	    error: function(xhr, status, error) {
	    	    	alert("뭔가 잘안됏읍니다....")
	     	    }
	    	});
	    });
	});
	
	$("#yoil").change(function() {
		$('#currentDay').text($('#yoil').val());
		$("#newRoutine div:not(#baseSetting)").remove();
		$.ajax({
    	    url: '/changeYoil',
    	    contentType: "application/json; charset=utf-8",
    	    data: {
    	    	mem_id: mem_id,
    	    	yoil: $('#yoil').val()
    	    },
    	    dataType: 'json',
    	    success: function(response) {
    	    	console.log("success", response);
    	    	if(response.mem_id == "error_id"){
    	    		$("#registeredRoutine").children("div").remove();
    	    	}
    	    	else {
	    	    	var listMem_Id = response.mem_id;
	    	    	var listYoil = response.yoil;
	    	    	var listActname = response.actname.split(",").map(String);
	    	    	var listAtime = response.atime.split(",").map(String);
	    	    	var listAset = response.aset.split(",").map(String);
	    	    	
	    	    	$("#registeredRoutine").children("div").remove();
	    	    	
	    	    	for (var i = 0; i < listActname.length; i++) {
	    	    	    var newDiv = document.createElement('div');
	    	    	    newDiv.setAttribute('id', 'counts' + (i+1));
	    	    	    newDiv.innerHTML = '<img src="' + listActname[i] + '" style="width:75px; height:85px;">' +
	     	    	    				   '<input type="text" name="time" style="margin-right:10px; margin-left:25px;" size="3" value="' + listAtime[i] + '">' +
	     	    	    				   '<span style="margin-right:30px;">회</span>' +
	     	    	    				   '<span style="margin-right:30px;">X</span>' +
	    	    	                       '<input type="text" name="set" style="margin-right:10px;" size="3" value="' + listAset[i] + '">' +
	    	    	                       '<span style="margin-right:50px;">세트</span>' +
	    	    	                       '<button type="button" class="update" style="margin-right:10px; cursor:pointer;">수정</button>' +
	    	    	                       '<button type="button" class="delete" style+"cursor:pointer;">삭제</button>';
	 	    	        newDiv.style.display = 'flex';
	 	    	        newDiv.style.alignItems = 'center';
	 	    	        newDiv.style.width = '80%';
	 	    	        newDiv.style.marginLeft = '82px';
	    	    	                       
	    	    	    registeredRoutine.appendChild(newDiv);
	    	    	}
    	    	}
    	    },
    	    error: function(xhr, status, error) {
    	    	console.log("error", status);
     	    }
    	});
	}).trigger('change');
	
	$(document).on('click', '.update', function() {
		
		var index = $(this).parent().index();
		var itime = $(this).parent().find('input[name="time"]').val();
		var iset = $(this).parent().find('input[name="set"]').val();
		
		$.ajax({
    	    url: '/changeYoil',
    	    contentType: "application/json; charset=utf-8",
    	    data: {
    	    	mem_id: mem_id,
    	    	yoil: $('#yoil').val(),
    	    },
    	    dataType: 'json',
    	    success: function(response) {
    	    	var listMem_Id = response.mem_id;
    	    	var listYoil = response.yoil;
    	    	var listActname = response.actname.split(",").map(String);
    	    	var listAtime = response.atime.split(",").map(String);
    	    	var listAset = response.aset.split(",").map(String);
    	    	
    	    	listAtime.splice(index-1, 1, itime);
    	    	listAtime = listAtime.join(',');
    	    	
    	    	listAset.splice(index-1, 1, iset);
    	    	listAset = listAset.join(',');
    	    	
    	    	$.ajax({
    	    	    url: '/updateRoutine',
    	    	    contentType: "application/json; charset=utf-8",
    	    	    data: {
    	    	    	mem_id: listMem_Id,
    	    	    	yoil: listYoil,
    	    	    	actname: listActname,
    	    	    	atime: listAtime,
    	    	    	aset: listAset
    	    	    },
    	    	    dataType: 'json',
    	    	    success: function(response) {
    	    	    	
   	    	    		$("#registeredRoutine").children("div").remove();
   	    	    		
   		    	    	var nlistMem_Id = response.mem_id;
   		    	    	var nlistYoil = response.yoil;
   		    	    	var nlistActname = response.actname.split(",").map(String);
   		    	    	var nlistAtime = response.atime.split(",").map(String);
   		    	    	var nlistAset = response.aset.split(",").map(String);
   		    	    	
   		    	    	$("#registeredRoutine").children("div").remove();
   		    	    	
   		    	    	for (var i = 0; i < nlistActname.length; i++) {
   		    	    	    var newDiv = document.createElement('div');
   		    	    	    newDiv.setAttribute('id', 'counts' + (i+1));
   		    	    	    newDiv.innerHTML = '<img src="' + nlistActname[i] + '" style="width:75px; height:85px;">' +
   		     	    	    				   '<input type="text" name="time" style="margin-right:10px; margin-left:25px;" size="3" value="' + nlistAtime[i] + '">' +
   		     	    	    				   '<span style="margin-right:30px;">회</span>' +
   		     	    	    				   '<span style="margin-right:30px;">X</span>' +
   		    	    	                       '<input type="text" name="set" style="margin-right:10px;" size="3" value="' + nlistAset[i] + '">' +
   		    	    	                       '<span style="margin-right:50px;">세트</span>' +
   		    	    	                       '<button type="button" class="update" style="margin-right:10px; cursor:pointer;">수정</button>' +
   		    	    	                       '<button type="button" class="delete" style="cursor:pointer;">삭제</button>';
   		 	    	        newDiv.style.display = 'flex';
   		 	    	        newDiv.style.alignItems = 'center';
   		 	    	        newDiv.style.width = '80%';
   		 	    	        newDiv.style.marginLeft = '82px';
   		    	    	                       
   		    	    	    registeredRoutine.appendChild(newDiv);
    	    	    	}
    	    	    },
    	    	    error: function(xhr, status, error) {
    	    	    	console.log("error", status);
    	     	    }
    	    	});
    	    },
    	    error: function(xhr, status, error) {
    	    	console.log("error", status);
     	    }
    	});
    });
	
    $(document).on('click', '.delete', function() {
		
    	$(this).closest('div').remove();
    	
		var actname = "";
	    $("#registeredRoutine div").each(function() {
	        actname += $(this).find('img').attr("src") + ",";
	    });
	    actname = actname.substring(0, actname.length-1);
	    
	    var atime = "";
	    $("#registeredRoutine input[name='time']").each(function() {
	    	atime += $(this).val() + ",";
	    });
	    atime = atime.substring(0, atime.length-1);
	    
	    var aset = "";
	    $("#registeredRoutine input[name='set']").each(function() {
	    	aset += $(this).val() + ",";
	    });
	    aset = aset.substring(0, aset.length-1);
	    
	    $.ajax({
    	    url: '/saveRoutine',
    	    contentType: "application/json; charset=utf-8",
    	    data: {
    	    	mem_id: mem_id,
    	    	yoil: $('#yoil').val(),
    	    	actname: actname,
    	    	atime: atime,
    	    	aset: aset
    	    },
    	    dataType: 'json',
    	    success: function(response) {
    	    },
    	    error: function(xhr, status, error) {
    	    	alert("뭔가 잘안됏읍니다....")
     	    }
    	});
    });
});

function closing(){
	opener.parent.location.reload();
	window.close();
}
</script>

</head>
<body>
	<div id="routine-image-container" style="border:1px solid gray; width:812px; padding:10px;">
	  <img src="/static/member/routine/witmom.png" alt="witmom" id="witmom" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/tukgulE.png" alt="tukgulE" id="tukgulE" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/running.png" alt="running" id="running" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/palgub.png" alt="palgub" id="palgub" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/lunge.png" alt="lunge" id="lunge" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/leg.png" alt="leg" id="leg" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/joolnumgi.png" alt="joolnumgi" id="joolnumgi" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/cycle.png" alt="cycle" id="cycle" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/benchpress.png" alt="benchpress" id="benchpress" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	  <img src="/static/member/routine/aryung.png" alt="aryung" id="aryung" style="width:150px; border:1px solid gray; cursor:pointer;">&nbsp;
	</div>
	<div id="newRoutine">
		<div id="baseSetting" style="width:800px; padding-top:20px; padding-left:65px; padding-bottom:15px;">
			<span>
				<select name="yoil" id="yoil" style="width:100px; margin-right:608px;">
					<option value="월요일">월요일
					<option value="화요일">화요일
					<option value="수요일">수요일
					<option value="목요일">목요일
					<option value="금요일">금요일
					<option value="토요일">토요일
					<option value="일요일">일요일
				</select>
				<button type="button" onclick="closing();"
					style="cursor:pointer;">닫기</button>
			</span>
		</div>
	</div>
	<hr />
	<div id="registeredRoutine">
		<h3 id="currentDay" style="margin-left:80px;">월요일</h3>
	
	</div>
</body>
</html>