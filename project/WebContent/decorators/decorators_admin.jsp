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
#footer {
	color: gray;
	font-size: 20px;
	text-align: center;
}
#logo{ float:left;display:inline-block;
}
#topMenu {
	
	height: 60px; /* 메인 메뉴의 높이 */
	width: 1000px; /* 메인 메뉴의 넓이 */
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
	margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
	padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white; /* 글씨 색을 흰색으로 설정 */
	background-color: #33332d; /* 배경 색설정 */
	float: left; /* 왼쪽으로 나열되도록 설정 */
	line-height: 50px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	text-align: center; /* 텍스트를 가운데로 정렬 */
	position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	
	display:inline-block;
	text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
	display: block; /* a 태그의 클릭 범위를 넓힘 */
	width: 150px; /* 기본 넓이를 150px로 설정 */
	line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	font-size: 15px; /* 폰트 사이즈를 12px로 설정 */
	font-weight: bold; /* 폰트를 굵게 설정 */
	font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: white;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: yellow; /* 글씨 색 */
	background-color: #4d4d4d; /* 배경색을 밝은 회색으로 설정 */
	
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */
	background-color: white; /* 배경색을 흰색으로 설정 */
	border: solid 1px black; /* 테두리를 설정 */
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	-moz-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	-o-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 93px; /* 높이를 93px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: red; /* 글씨색을 빨간색으로 설정 */
	background-color: #dddddd; /* 배경을 RGB(DDDDDD)로 설정 */
}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	
</script>
<decorator:head />
</head>
<body>
<%String id = request.getParameter("id"); %>
<div id="logo">
<a href = "adminMain.jsp"><img alt="중앙도서관" src="../decorators/logo_admin.png" width="180"></a>
</div>
	<div id="topMenu">
		
		<ul>
			<li class="topMenuLi"><a class="menuLink" href="../adminpage/adminBookMain.do">도서 관리</a>
				<ul class="submenu">
					<li><a href="../adminpage/adminBookInsertForm.jsp" class="submenuLink">도서 등록</a></li>
					<li><a href="../adminpage/adminBookMain.do" class="submenuLink">도서 수정</a></li>
				</ul>
			</li>
			
			<li class="topMenuLi"><a class="menuLink"href="../adminpage/adminMemberMain.do">회원관리</a>
				<ul class="submenu">
					<li><a href="../adminpage/adminMemberMain.do" class="submenuLink longLink">회원 목록</a></li>
					<li><a href="../adminpage/adminMemberover.do" class="submenuLink longLink">회원 연체관리</a></li>
					<li><a href="../adminpage/adminMemberMail.jsp" class="submenuLink longLink">전체메일 발송</a></li>
				</ul>
			</li>
			
			<li class="topMenuLi"><a class="menuLink" href="../adminpage/adminBoardFree.do">게시판 관리</a>
				<ul class="submenu">
					<li><a href="../adminpage/adminBoardFree.do" class="submenuLink">자유게시판</a></li>
					<li><a href="../adminpage/adminBoardNotice.do" class="submenuLink">공지사항</a></li>
				</ul>			
			</li>			
			<li class="topMenuLi"><a class="menuLink" href="../adminpage/adminSeatList.do">열람실 관리</a></li>
		</ul>
	</div>
	<br><br>
	<hr color="#475060">
	<br><br>
	<decorator:body />
	<br><br><br><br>
	
	<hr color="#475060">
	<p>
	<div id="footer">
		사용중인 관리자 : ${adminid }		
	</div>
	
</body>

</html>