<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::환영합니다. 중앙도서관입니다.</title>
<link rel="stylesheet" type="text/css" href="../all.css">
<style type="text/css">
.slider_img {float: left; width: 1150px; height: 400px;}

.cycle-slideshow * { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; position: relative; }

.cycle-slideshow { width: 1150px; height:400px; margin: 10px auto; padding: 0; position: relative;
	clear: both;
    background: url(http://malsup.github.com/images/spinner.gif) 50% 50% no-repeat; }

.cycle-slideshow img {     position: absolute; top: 0; left: 0;    width: 100%; padding: 0; display: block;}

.cycle-slideshow img:first-child {    position: static; z-index: 100;}

/* 글 */
.cycle-overlay { font-family: tahoma, arial; position: absolute; bottom: 0; width: 100%;
			z-index: 600; background: #024f4b; color:white; padding: 15px; opacity: .5;	}
			
/* 버튼*/
.cycle-pager {     text-align: center; width: 100%; z-index: 1000; position: absolute; top: 350px; }
.cycle-pager span {     font-family: arial; font-size: 50px; width: 16px; height: 16px;   display: inline-block; color: #ddd; cursor: pointer; }
.cycle-pager span.cycle-pager-active { color: #D69746;}
.cycle-pager > * { cursor: pointer;}



	/* 3개 아래 배너 공통 */
	a:link {color : white;}
	a:visited {color : white;}
	a:hover {color : white;}
	a:active {color : white;}
	a {text-decoration: none;}
	
	/* 게시판 배너 */
	#board {margin-left:30px; width: 380px; height:200px; background-color: #81a537; position: static;  }
	#board_title {background-color: #010933; width: 380px; height: 30px; color:white; }
	#board_title a {margin-left: 10px;}	
	#board_table {width: 95%; margin-left: 10px; border: 1px solid #d8df8f;}
	#board_table tr th {background-color:  #d8df8f;}
	#board_table tr td {text-align: justify; border: 1px solid #d8df8f;}
	#direct { color:black; padding-left: 242px; }
		
	/* 휴관안내 배너 */
	#holiday {width: 228px; height:200px;  background-color: #d8df8f; position: absolute; left:520px; top:563px; margin: 5px;}
	#holiday_title {background-color: #010933; width: 228px; height: 30px; color:white; }
	#holiday_title a {margin-left: 10px;}
	#holiday_img {margin-top: 28px; margin-left: 10px; width:110px;}
	li {list-style: none;}
	.holiday_con {float:left;}
	#holiday_list {font-size: 15px; width:50; height: 15px; }
	#holiday_list ul {padding-left: 0px; margin-left: 10px; margin-top: 50px;}
	#holiday_list ul li {text-align: center; line-height: 30px;}
	
	/* 열람실 배너 */
	#seat {width: 228px;  height:200px; background-color: #d6d94a; position: absolute; left:755px; top:563px; margin: 5px;}
	#seat_title {background-color: #010933; width: 228px; height: 30px; color:white; }
	#seat_title a {margin-left: 10px;}
	#seat_img {margin-top: 10px; margin-left: 40px; width:150px;}

		/*광고 배너*/
	#ad {width: 228px;  height:200px; background-color: #d8df8f; position: absolute; left:990px; top:563px; margin: 5px;}
	#ad_title {background-color: #010933; width: 228px; height: 30px; color:white; }
	#ad_title a {margin-left: 10px;}
	#ad_img {margin-top: 0; margin-left: 3px; width:220px; height: 165px;}

</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="http://malsup.github.com/jquery.cycle2.js"></script>
<script type="text/javascript">
	function loginPop(n) {
		var url = "../login/loginForm.jsp";
		var name = "로그인";
		var win;
		if (n==0) win = window.open(url,name,"width=500  height=250 left=100 top=50");
	}
	
	$(function() {
		$.ajax({
			url:'../board/freeBoardList.do', dataType:'html',
			success: function(data) {
				$(data).find('.tt').each(function(){
					$('#title').append	('<a href="../board/freeBoardList.do">' + $(this).text()+'</a><br>');
				});
			}
		});
		return false;
	});
	function seat(){
		<%String id = (String)session.getAttribute("id");%>
		var id = '<%=id%>';
		var url = "../seat/seatList.do?id="+id;
		window.open(url,"열람실","width=825 left=100 top=100 scrollbars=yes resizable=yes");
	}
</script>

</head>
<body>
<div class="wrapper">
<div class="cycle-slideshow"   data-cycle-fx=scrollHorz   data-cycle-timeout=2000>
	<div class="cycle-overlay"></div>
    <div class="cycle-pager"></div>
		<img src="image/1.jpg" class="slider_img"
			data-cycle-title="중앙도서관에 오신 것을 환영합니다."
			data-cycle-desc="		-중앙도서관-">
			
		<img src="image/2.jpg" class="slider_img"
			data-cycle-title="오래 머물고 싶은 도서관"
			data-cycle-desc="		-중앙도서관-">
			
		<img src="image/3.jpg" class="slider_img"
			data-cycle-title="넓고 쾌적한 열람실"
			data-cycle-desc="		-중앙도서관-">
			
		<img src="image/4.jpg" class="slider_img"
			data-cycle-title="세상의 모든 도서가 있는 곳"
			data-cycle-desc="		-중앙도서관-">
			
		<img src="image/5.jpg" class="slider_img"
			data-cycle-title="세계 3대 아름다운 도서관 1위"
			data-cycle-desc="		-중앙도서관-">
			
		<img src="image/6.jpg" class="slider_img"
		 data-cycle-title="중앙도서관에서 꿈과 희망을 키우세요!"
			data-cycle-desc="		-중앙도서관-">
</div>

<div class="banner" id="board">
	<div id="board_title"><a href="../board/freeBoardList.do">참여마당 게시판</a></div>
	<div id="board_content">
		<table id="board_table">
			<tr><th>제목</th></tr>
			<tr><td><span id="title"></span></td></tr>
		</table>
	<a href="../board/freeBoardList.do" id="direct">게시판 바로가기▶</a>
	</div>
</div>

<div class="banner" id="holiday">
	<div id="holiday_title"><a href="../guide/serviceTime.jsp">도서관 안내 휴관</a></div>
	<a href="../guide/serviceTime.jsp"><img src="image/8.png" id="holiday_img" class="holiday_con"></a>
		<div  class="holiday_con" id="holiday_list">
			<ul>
				<li>2,4주 금요일</li>
				<li>법정 공휴일</li>
			</ul>
		</div>
</div>

<div class="banner" id="seat">

	<div id="seat_title"><a href="javascript:void(0);" onclick="seat();">열람실 예약 바로가기</a></div>
	<a href="javascript:void(0);" onclick="seat();"><img src="image/7.png" id="seat_img"></a>
</div>
<div class="banner" id="ad">
	<div id="ad_title"><a>지역광고</a></div>
	<a href="http://www.choongang.co.kr" target="_blank"><img src="image/ad1.png" id="ad_img"  title="신청하러 바로가기"></a>
</div>
</div>




</body>
</html>