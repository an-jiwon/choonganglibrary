<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>중앙도서관</title>
<link rel="stylesheet" type="text/css" href="../all.css">
<style type="text/css">

#logo{float:left;display:inline-block; margin-bottom: 30px;}

 #gnb_contain{float:left; width:1017px;  z-index:1000;margin-bottom: 30px; position: relative;}
    #gnb {float:left; width:1017px; height:65px; background-color:#024F4B;position:relative; top:15px; }
    #gnb ul{float:left; padding:0; list-style:none; }
    #gnb ul li {float:left;list-style-type: none;  vertical-align: top; }
    #gnb ul li a {padding-bottom:0px; padding-top:0px; padding: 48px; color: white; font-size:20px; font-weight: bold; text-decoration:none;}
    #gnb ul li a:hover{ color: #ffcc00;  }

    #snb {display:none; width:1017px; background-color:#81a537; clear:both; padding-top:15px; position: absolute; top:100px;}
    #submenu {width:1017px;  margin:0 auto; }
    .submenu_s {float:left; text-align:left; margin-top:5px; }
    #submenu a{ color:white; font-size:16px; font-weight: bold; ;text-decoration:none; line-height:35px;}
    #submenu a:hover{ color: #ffcc00;}
    
    #login { position:relative; left:895px;}
    #login #id {position:relative; left:-85px;}
	#login a:link {color: #010933;}
	#login a:visited {color: #010933;}
	#login a:hover {color: #010933; font-weight: bold;}
	#login a:active {color: #010933; font-weight: bold;}
	#login a {text-decoration: none;}
	#containerr{width:1300px; height: 100px; padding-left: 20px;}
	.clear{clear:both;width: 1253px;}

#footer {
	color: gray;
	font-size: 13px;
	text-align: center;
	width: 1253px;
}

#content {
	padding-left: 50px;
}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#gnb>ul").hover(
      function() {
        $("#snb").stop().slideDown(200);
      },
      function() {
        $("#snb").stop().slideUp(200);
      }
    );
    $("#snb").hover(
      function() {
        $("#snb").stop().slideDown(200);
      },
      function() {
        $("#snb").stop().slideUp(200);
      }
    );
});
</script>
<decorator:head />
</head>
<body>
<div class="wrap">
<div id="containerr">
<div id="logo">
<a href="../main/main.jsp"><img alt="중앙도서관" src="../decorators/logo.png" width="210" height="100"></a>
</div>
<div id="gnb_contain">
<span id="login">
<%String id = (String)session.getAttribute("id"); %>
	<c:if test="${id == null || id == '' || id == 'null'}">
		<a href="#" onclick="window.open('../login/loginForm.jsp','로그인','width=500  height=250 left=100 top=50');">로그인</a>
		<a href="../member/joinForm.jsp">회원가입</a>
	</c:if>
	<span id="id">
	<c:if test="${id != null }">
		${id }님, 환영합니다.
		<a href="../login/logout.jsp">로그아웃</a>
	</c:if>
	</span>
</span>
	<div id="gnb">
		<ul>
			<li><a href="../search/bookSearchForm.jsp">도서검색</a></li>
			<li><a href="../board/noticeList.do">참여마당</a></li>
			<li><a href="../guide/directions.jsp">도서관안내</a></li>
			<li><a href="../bookinfo/borrow.jsp">자료신청/예약</a></li>
			<li><a href="../mypage/checkout.do" style="padding-top: 0px;">마이페이지</a></li>
		</ul>
	</div>

	<div id="snb">
		<div id="submenu" >
			<div class="submenu_s" style="margin-left: 50px">
				<a href="../search/bookSearchForm.jsp">키워드 검색</a><p>
				<a href="../bookboard/nrboardlist.do">신작/추천 도서</a>
			</div>
			<div class="submenu_s" style="margin-left: 80px">
				<a href="../board/noticeList.do">공지사항</a><p>
				<a href="../board/freeBoardList.do">자유게시판</a><p>
				<a href="../board/qna.jsp">QnA</a>
			</div>
			<div class="submenu_s" style="margin-left: 90px">
				<a href="../guide/directions.jsp">오시는길</a><p>
				<a href="../guide/serviceTime.jsp">이용안내</a>
			</div>
			<div class="submenu_s" style="margin-left: 130px">
				<a href="../bookinfo/borrow.jsp">대출/예약 안내</a><p>
				<a href="../bookinfo/request.jsp">희망 도서신청 안내</a>
			</div>
			<div class="submenu_s" style="margin-left: 90px">
				<a href="../mypage/updateForm.do">정보수정</a><p>
				<a href="../mypage/checkout.do">대출/예약 현황</a><p>
				<a href="../mypage/seat.do">열람실 이용 내역</a><p>
				<a href="../mypage/writeList.do">문의 관리</a>
			</div>
		</div>
	</div>
</div>
</div>
<hr  class="clear">
	<div id="content">
	<decorator:body />
	</div>
	<div class="clear"></div>
	<br><br><br>
	<div id="footer">
	<hr color="#D8DF8F"  >
	<p>
		서울 강남구 테헤란로 7길 중앙도서관 Tel 02-123-4567<br> 
		Copyright ⓒ 2017 by SEVEN, Design by SEVEN
	</div>
	</div>
</body>
</html>