<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>지점 정보</h2>
<div class="main_s_left">
<!-- 지도 붙이기 -->
</div>


<div style=" margin-left:20px;"> 
<!-- 리스트 -->
<h3>지점 정보</h3>
<form name="">
    <ul>
    	<li>
	        <input type="checkbox" name="facility" value="facility_parking" class="checkbox_sm" id="facility_parking" onclick="s_form.submit()">
	        <label for="facility_parking"><span></span> <img src="../static/admin/images/0002.png" width="50" height="50" align="absmiddle">
	          주차       </label>
        </li>
      	<li>
	        <input type="checkbox" name="facility" value="facility_health" class="checkbox_sm" id="facility_health" onclick="s_form.submit()">
	        <label for="facility_health"><span></span> <img src="../static/admin/images/0004.png" width="50" height="50" align="absmiddle">
	          헬스        </label>
      	</li>
      	<li>
	        <input type="checkbox" name="facility" value="facility_yoga" class="checkbox_sm" id="facility_yoga" onclick="s_form.submit()">
	        <label for="facility_yoga"><span></span> <img src="../static/admin/images/0005.png" width="50" height="50" align="absmiddle">
	          요가        </label>
      	</li>
     	 <li>
	        <input type="checkbox" name="facility" value="facility_gx" class="checkbox_sm" id="facility_gx" onclick="s_form.submit()">
	        <label for="facility_gx"><span></span> <img src="../static/admin/images/0007.png" width="50" height="50" align="absmiddle">
	          G.X       </label>
      	</li>
      	<li>
	        <input type="checkbox" name="facility" value="facility_pilates" class="checkbox_sm" id="facility_pilates" onclick="s_form.submit()">
	        <label for="facility_pilates"><span></span> <img src="../static/admin/images/0010.png" width="50" height="50" align="absmiddle">
	          필라테스        </label>
      	</li>
     	 <li>
	        <input type="checkbox" name="facility" value="facility_pt" class="checkbox_sm" id="facility_pt" onclick="s_form.submit()">
	        <label for="facility_pt"><span></span> <img src="../static/admin/images/0011.png" width="50" height="50" align="absmiddle">
	          P.T        </label>
      	</li>
     	 <li>
	        <input type="checkbox" name=facility value="facility_24hour" class="checkbox_sm" id="facility_24hour" onclick="s_form.submit()">
	        <label for="facility_24hour"><span></span> <img src="../static/admin/images/0014.png" width="50" height="50" align="absmiddle">
	          24시간        </label>
     	 </li>
     	 <li>
	        <input type="checkbox" name="facility" value="facility_shower" class="checkbox_sm" id="facility_shower" onclick="s_form.submit()">
	        <label for="facility_shower"><span></span> <img src="../static/admin/images/0017.png" width="50" height="50" align="absmiddle">
	          샤워시설        </label>
      	</li>
     	 <li>
	        <input type="checkbox" name="facility" value="facility_wear" class="checkbox_sm" id="facility_wear" onclick="s_form.submit()">
	        <label for="facility_wear"><span></span> <img src="../static/admin/images/0018.png" width="50" height="50" align="absmiddle">
	          운동복        </label>
      	</li>
      	<li>
	        <input type="checkbox" name="facility" value="facility_locker" class="checkbox_sm" id="facility_locker" onclick="s_form.submit()">
	        <label for="facility_locker"><img src="../static/admin/images/0020.png" width="50" height="50" align="absmiddle">
	          락커       </label>
      	</li>
    </ul>
</form>


<li>
<span> 지점이름 상세보기</span>
<span> 지점 주소</span>
<span> 전화번호</span>
</li>
</div>
</body>
</html>