<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="../barstyle.css">
<style type="text/css">
	.a {font-size: auto;}
	article li {list-style: none; color:orange;}
	#bartitle2 { margin-top : 30px ; margin-left: 20px; font-size: 15px; font-weight: bolder;}
</style>
</head>
<body>



<nav class="leftbar">
	<div class="bartitle">대출/예약 안내
		<ul>
			<li><a href="borrow.jsp">대출 안내</a></li>
			<li><a href= "reserve.jsp">예약 안내</a></li>
		</ul>
	</div>
	<div id="bartitle2" class="bartitle"><a href="request.jsp">희망도서 신청안내</a></div>
</nav>

<article>
	<h1>희망도서 신청안내</h1>
	<p><b>※신청 안내</b></p>
	<hr>
	<li> 신청대상</li>
		<p class="a"> 자료 대출 회원</p>
	<li>신청방법</li>
		<p class="a"> 희망하시는 도서가 소장된 자료인지 확인하시고 없을 경우 홈페이지 내 자유게시판을 이용하여 신청해 주시길 바랍니다.</p>
	<li>신청권수</li>
		<p class="a"> 매주 1회(화요일~월요일 기준) 1인 1권 신청 가능</p>
	<li>처리주기</li>
		<p class="a">매주 1회, 화요일~월요일</p>
	<div>
		<p class="a"> * 수험서 및 교재, 워크북은 희망도서로 신청할 수 없습니다.<br>
			(신청 시 특화도서 구입에 반영됩니다. 특화도서는 연 8회 구입합니다.)</p>
		<p class="a" >* 희망도서 제도를 악용하여 불필요한 자료구입을 
			야기하는 경우 '예고없이' 신청을 제한 할 수 있으며 그 사유를 공지할 수 있습니다.</p> 
	</div>
	<button class="btn btn-default" onclick="location.href='../board/freeBoardList.do'"> 도서 신청 바로가기 </button>
</article>

</body>
</html>