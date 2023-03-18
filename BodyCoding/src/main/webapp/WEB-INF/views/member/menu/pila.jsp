<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
/* sub0202 program_new */
.li {
list-style : none;
}
.img_txt_new {display:none;}
.sub0202_con {width:100%; text-align: center; margin-bottom:84px;}
.sub0202_img_new {margin:72px 0 62px;}
.sub0202_img_new img {width:auto; max-width:100%;}

.sub02_tit {position: relative; display:block; width:741px; height:80px; background:#0f594e; border-radius:30px; margin:0 auto; font-size:50px; color:#fff; font-weight:500; line-height:80px;}
.sub02_tit:before {content:''; position: absolute; top:50%; left:50%; transform:translate(-50%, -50%); width:2000px; height:6px; background:#b9cfca; z-index:-1;}

.program_txt {width:62.5%; margin:0 auto; border-top:3px solid #595757; border-bottom:3px solid #595757; padding:20px 0; margin-bottom:150px;}
.program_txt span {display:block; font-size:24px; color:#333; line-height:37px; font-weight:500;}

.sub0202_con > span {display:block; font-size:24px; color:#333; line-height:37px; font-weight:500; margin:40px 0;}

.mid_list {position:relative; padding-bottom:98px;}
.mid_list:before {content:''; position: absolute; bottom:0; left:0; width:100%; height:84.76%; background:#e0e8e5; z-index:-1;}
.mid_list:after {content:''; position: absolute; top:20px; left:0; right:0; margin:0 auto; width:/* 70.88% */ 1361px ; height: 89.34%; border:4px solid #fff;}

.mid_list .list_top {position: relative; margin-bottom:50px;}
.mid_list .list_top li {float: left; width:25%;}
.mid_list .list_top li img {width:100%;}

.list_btm {font-size:0; text-align: center;}
.list_btm li {position: relative; display:inline-block; padding-top:100px; font-size:28px; color:#575757; line-height:1; font-weight:600; width:12.5%; }
.list_btm li img {position: absolute; top:0; left:0; right:0; margin:0 auto;}

.sub0202_con2 {text-align: center;}
.sub0202_con2 > div > em {position: relative; display:block; font-size:50px; color:#0f594e; line-height:1; font-weight:600; padding-top:43px; margin-bottom:40px;}
.sub0202_con2 > div > em:before {content:''; position: absolute; top:0; left:0; right:0; width:82px; height:4px; background:#0f594e; margin:0 auto;}
.sub0202_con2 > div > span {display:block; font-size:24px; color:#333; line-height:1; font-weight:500; margin-bottom:65px;}

.con_box1 .box1_txt {position:relative; width:100%; padding:75px 0 89px; }
.con_box1 .box1_txt img {position: absolute; top:50%; left:0; transform:translateY(-52.5%); z-index:10; width:40%;}
.con_box1 .box1_txt .txt_box {position:relative; /* background:#e0e8e5; */ padding:40px 0 40px 50%; text-align: left;}
.con_box1 .box1_txt .txt_box:before {content: ''; position: absolute; top:0; right:0; width: 60%; height:100%; background:#e0e8e5; z-index:-1;}

.con_box1 .box1_txt .txt_box ul {display:inline-block; text-align: center;}
.con_box1 .box1_txt .txt_box li {font-size:24px; color:#333; line-height:37px; font-weight:500;}
.con_box1 .box1_txt .txt_box li:nth-child(2) {margin-bottom:40px; color:#0f594e;}

.con_box2 {margin:100px 0 145px;}
.time_banner {position: relative;}
.time_banner img {width:100%;}
.time_banner .time_info {position: absolute; top:50%; left:0; transform:translateY(-50%); width:100%; text-align: left; background:rgba(0,0,0,.5); padding:70px 0;}
.time_banner .time_info .inner {padding:0 130px;}
.time_banner .time_info li {position: relative; font-size:40px; color:#fff; line-height:1; font-weight:500; padding-left:325px; margin-bottom:50px;}
.time_banner .time_info li em {position: absolute; top:2px; left:0;}
.time_banner .time_info li em span {color:#f9a61f;}
.time_banner .time_info li:last-child {margin-bottom:0;}
.time_banner .time_info li:last-child em span {color:#94c4db;}
.time_banner p {text-align: left; font-size:24px; color:#333; line-height:1; font-weight:500; margin-top:29px;}

.manage_txt {width:1200;text-align:center; margin:0 auto; margin:50px 0 150px 0;}
.manage_txt span {display:block; font-size:32px; color:#333; line-height:37px; font-weight:500;}
.manage_txt span:first-child {margin-bottom:10px; color:#0f594e;}


/* Common **********************************************************************/ 
html,body {width:100%; }
html {overflow-y:scroll; box-sizing:border-box;}
*, *:before, *:after{box-sizing:inherit;}
*{
-webkit-text-size-adjust:none;
-webkit-text-size-adjust - auto | none | N% (default auto)
}
body {word-break:break-all;-ms-word-break:break-all; }
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,textarea,p,blockquote,th,td,input,select,textarea,button {margin:0; padding:0;}
fieldset,img {border:0px none; vertical-align:top;}
dl,ul,ol,menu,li {list-style:none;}
blockquote, q {quotes: none;}
blockquote:before, blockquote:after,q:before, q:after {content:''; content:none;}
button {border:0 none; background-color:transparent; cursor:pointer;}
body { background:#fff;}
body,th,td,input,select,textarea,button {font-size:15px; line-height:1.75; font-family:'Roboto', 'Noto Sans KR'; color:#555;} 
input, select, textarea, button{vertical-align:middle; }
a:link,a:active,a:visited{color:#7d7d7d; text-decoration:none; border:0px;}
a:hover,a:focus{color:#333; text-decoration:none}

table {border-collapse:collapse; border-spacing:0;}
address,caption,cite,code,dfn,em,var {font-style:normal; font-weight:normal;}
summary, caption, legend, hr {width:0; height:0; font-size: ; line-height: ; overflow: hidden; visibility: hidden; border: none; position:absolute; left:-1000em;}
caption {position:static;}
/* label hidden ì²˜ë¦¬ */
.invisible, .hide{overflow:hidden; visibility:hidden; width:0; height:0; font-size:0; line-height:0; position:absolute;}
label.invisible{*position:Absolute;}

/* common */
.clfix:after {content: "."; display: block; height:0px; clear: both; visibility: hidden;}
.clfix {display:inline-block;}
.clfix {display:block;}
* html .clfix {height:1%;} /* Hides from IE-mac */
.clfix {zoom:1;} /*for IE 5.5-7*/

.list {border-top:2px solid #1c1815; border-bottom:1px solid #1c1815;}
.center{text-align:center;}
.inner {width:1400px; margin: 0 auto;}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp" %>

<!-- <div class="sub0202_wrap">
	<img src="../static/assets/images//ready/sub0202_all_new_pc.jpg" alt="" class="pc_img" style="width:100%;"/>
	<img src="../static/assets/images//ready/sub0202_all_new_tab.jpg" alt="" class="tab_img" style="width:100%;"/>
	<img src="../static/assets/images//ready/sub0202_all_new_mob.jpg" alt="" class="mob_img" style="width:100%;"/>
</div>// sub0202_wrap -->

<div class="location_wrap" style="text-align:center;">
		 	<div class="pro" style="text-align:center; margin-top:10px;">
			 	<span style="font-size:40px; font-weight:bold;">프로그램</span>&nbsp;
			 	<span style="font-size:55px; font-weight:bold"> > </span>
		 		<span class="pro1" style="font-size:40px; font-weight:bold; color:#da304f;">필라테스
		 		
		 		</span>
			</div>
		</div>

<div class="sub0202_new_wrap" style="margin-top:20px;">
	<div class="sub0202_con">
		<em class="sub02_tit">레벨별 프로그램</em>
		<div class="sub0202_img_new">
			<img src="../static/assets/images/sub0202_img1_new_pc.jpg" alt="프로그램 이미지1" class="pc_img"/>
		</div><!-- // sub0202_img_new -->
		<div class="img_txt_new">
			<ul>
				<li><em>1. 무인지 무능력 :</em>티칭이 이해되지 않고, 어떻게 움직이는지 모르는 단계</li>
				<li><em>2. 인지 무능력 :</em>티칭의 내용은 알지만, 몸이 뜻대로 움직이지 않는 단계</li>
				<li><em>3. 인지 능력 :</em>티칭을 들으면, 바르게 움직일 수 있는 단계</li>
				<li><em>4. 무인지 능력 :</em>동작의 이름만 들어도 동작을 수행할 수 있는 단계</li>
			</ul>
		</div><!-- // img_txt -->

		<div class="program_txt">
			<span>바디코딩 필라테스는 회원님들의 운동레벨과 인지레벨을 체크하여,<br>각 레슨에 맞는 운동능력과 효과를 얻는 레벨별 레슨을 제공합니다.</span>
		</div><!-- // program_txt -->

		<em class="sub02_tit">목적별 프로그램</em>
		<span style="font-weight:bold; font-size:25px;">바디코딩 필라테스는 운동 목적에 따른 스페셜 프로그램을 제안합니다.<br>원하는 결과까지 안전하고 건강하게 도와드리겠습니다. </span>
		<div class="mid_list">
			<div class="inner">
				<ul class="list_top clfix">
					<li>
						<img src="../static/assets/images/sub0202_img2_new_pc.jpg" alt="목적별 이미지1" class="pc_img"/>
					</li>
					<li>
						<img src="../static/assets/images/sub0202_img3_new_pc.jpg" alt="목적별 이미지2" class="pc_img"/>
					</li>
					<li>
						<img src="../static/assets/images/sub0202_img4_new_pc.jpg" alt="목적별 이미지3" class="pc_img"/>
					</li>
					<li>
						<img src="../static/assets/images/sub0202_img5_new_pc.jpg" alt="목적별 이미지3" class="pc_img"/>
					</li>
				</ul><!-- // list_top -->
				<ul class="list_btm" style="z-index:1000;position:relative;">
					<li valid.idx="1" alt="골프">
						<img src="../static/assets/images/sub0202_icon1_new_pc.jpg" alt="골프" class="pc_img" valid.idx="1"/>
						골프
					</li>
					<li valid.idx="2" alt="산전산후">
						<img src="../static/assets/images/sub0202_icon2_new_pc.jpg" alt="산전산후" class="pc_img" valid.idx="2"/>
						산전산후
					</li>
					<li valid.idx="3" alt="체형교정">
						<img src="../static/assets/images/sub0202_icon3_new_pc.jpg" alt="체형교정" class="pc_img" valid.idx="3"/>
						체형교정
					</li>
					<li valid.idx="4" alt="실버">
						<img src="../static/assets/images/sub0202_icon4_new_pc.jpg" alt="실버" class="pc_img" valid.idx="4"/>
						실버
					</li>
					<li valid.idx="5" alt="키즈">
						<img src="../static/assets/images/sub0202_icon5_new_pc.jpg" alt="키즈" class="pc_img" valid.idx="5"/>
						키즈
					</li>
					<li valid.idx="6" alt="웨딩">
						<img src="../static/assets/images/sub0202_icon6_new_pc.jpg" alt="웨딩" class="pc_img" valid.idx="6"/>
						웨딩
					</li>
					<li valid.idx="7" alt="맨즈">
						<img src="../static/assets/images/sub0202_icon7_new_pc.jpg" alt="맨즈" class="pc_img" valid.idx="7"/>
						맨즈
					</li>
					<li valid.idx="8" alt="재활">
						<img src="../static/assets/images/sub0202_icon8_new_pc.jpg" alt="재활" class="pc_img" valid.idx="8"/>
						재활
					</li>
				</ul><!-- // list_btm -->
			</div><!-- // inner -->
   		</div><!-- // mid_list -->
	</div><!-- // sub0202_con -->
	<div class="sub0202_con2">
		<div class="con_box1">
			<em>개인레슨</em>
			<span style="font-weight:bold; font-size:25px;">몸과 마음의 에너지 균형을 맞추는 프로그램</span>

			<div class="box1_txt">
				<img src="../static/assets/images/sub0202_img6_new_pc.jpg" alt="레슨이미지" class="pc_img"/>
				<div class="txt_box" style="list-style: none;">
					<ul>
						<li>바디코딩 필라테스의 개인레슨은</li>
						<li>아로마테라피와 리트릿 음료를 제공합니다.</li>
						<li>자신에게 맞는 천연 에셀셜 아로마 오일을 선택하여</li>
						<li>몸과 마음을 위한 재충전의 시간을 가져보세요.</li>
					</ul>
				</div><!-- // txt_box -->
			</div><!-- // box1_txt -->
		</div><!-- // con_box1 -->
		<div class="con_box2">
			<em>그룹레슨</em>
			<span style="font-weight:bold; font-size:25px;">현대인의 라이프 스타일을 고려한 프로그램</span>
			<div class="time_banner">
				<div style="position:relative;">
					<img src="../static/assets/images/sub0202_img7_new_pc.jpg" alt="" class="pc_img"/>
					<div class="time_info">
						<div class="inner">
							<ul>
								<li><em><span>출근 전</span> 필라테스: </em>am7:00-8:00  / am8:00-9:00</li>	
								<li><em><span>출근 후</span> 필라테스: </em>pm10:00-11:00  / pm11:00-12:00</li>	
							</ul>
						</div>
					</div><!-- // time_info -->
				</div>
				<div class="inner">
					<span style="font-weight:bold; font-size:25px;">매일 정해진 시간의 운동은 삶에 건강한 루틴을 만들어 줍니다.  바디코딩 필라테스만의 그룹레슨 프로그램을 체험해보세요.</span>
				</div><!-- // inner -->
			</div><!-- // time_banner -->
		</div><!-- // con_box2 -->
	</div><!-- // sub0202_con2 -->
</div><!-- // sub0202_new_wrap -->




<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>