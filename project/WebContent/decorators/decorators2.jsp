<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	padding-right: 30px;
	padding-left: 30px;
	padding-bottom: 15px;
}
.menu ul {
list-style-type:none;

}
.menu ul li {
	
}
.menu {
	 display: inline-block;
	width: 80%;
	vertical-align: top;
	background-color: #024F4B;
	color: white;
	font-size: 20px;
	padding: 10px;
	font-weight: bold;

}
	.menu a{cursor:pointer; }
    .menu .hide{display:none;}


#footer {
	color: gray;
	font-size: 13px;
	text-align: center;
}

#side {
	float: left;
}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	    $(".menu>a").mouseover(function(){
	        var submenu = $(this).next("ul");
	        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	            submenu.slideDown();	    
	    });
	    $(".menu>a").mouseover(function() {
	    	$(".hide").slideUp();
    	});
	  
	    $(".menu .hide li").mouseout(function() {
	    	$(".hide").slideUp();
	    });
	});
</script>
<decorator:head />
</head>
<body>
	<div>
		<img alt="중앙도서관" src="../decorators/logo.png" width="180">
		&nbsp;

		<ul>
			<li class="menu">
			<a>도서검색</a>
				<ul class="hide">
					<li>키워드 검색</li>
					<li>신작/추천 도서</li>
				</ul>
			</li>
			<li class="menu">
			<a>참여마당</a>
				<ul class="hide">
					<li>공지사항</li>
					<li>자유게시판</li>
					<li>QnA</li>
				</ul>
			</li>
			<li class="menu">
			<a>도서관안내</a>
				<ul class="hide">
					<li>오시는길</li>
					<li>이용안내</li>
				</ul>
			</li>
			<li class="menu">
			<a>자료신청/예약</a>
				<ul class="hide">
					<li>대출/예약 안내</li>
					<li>희망 도서 신청 안내</li>
				</ul>
			</li>
			<li class="menu">
			<a>마이페이지</a>
				<ul class="hide">
					<li>정보수정</li>
					<li>대출/예약 현황</li>
					<li>열람실 이용 내역</li>
					<li>문의 관리</li>
				</ul>
			</li>
		</ul>	   

	</div>
	<br><br><br><br>
	<decorator:body />
	<br><br><br><br>
	<hr color="#D8DF8F">
	<p>
	<div id="footer">
		서울 강남구 테헤란로 7길 중앙도서관 Tel 02-123-4567<br> 
		Copyright ⓒ 2017 by SEVEN, Design by SEVEN
	</div>
</body>
</html>