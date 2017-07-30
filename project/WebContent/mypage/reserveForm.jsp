<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../login/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::예약관리</title>
<script type="text/javascript">
	function chk(book_id){
		if (confirm("예약을 취소하시겠습니까?") == true){    //확인
			location.href="reserveCancel.do?id=${id}&pageNum=${pageNum}&book_id="+book_id;
		}else{   //취소
		    return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="../leftbar/leftbar5_3.jsp"></jsp:include>
<div class="wrapper">
<form action = "reserveCancel.do" name = "frm"  onsubmit="return chk()">

<div class="table-responsive">
 <table class="table table-hover">
	<thead><tr>
		<th width="400pt">책</th>
		<th>예약일</th>
		<th>처리</th>
		<th>취소</th>
	</tr></thead>
	<c:if test="${empty list }">
			<tr>
				<td colspan="4">예약기록이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="reserveResult" items="${list}">
				<tr>
					<td><a href="../search/bookSearchInfo.do?book_id=${reserveResult.book_id }">${reserveResult.title}</a></td>
					<td>${reserveResult.reserve_date}</td>
					<td>${reserveResult.reserve_ok}</td>
					<td><input class="btn btn-default" type="button" onclick="return chk(${reserveResult.book_id });" value = "예약취소"></td>
				</tr>
			</c:forEach>
		</c:if>
</table>
</div>
</form>

<div align="center">
<c:if test="${startPage > PAGEPERBLOCK }">
		<a href="reserve.do?pageNum=${endPage-PAGEPERBLOCK}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="reserve.do?pageNum=${i}" >[${i}]</a>
</c:forEach>
<c:if test="${endPage < totPage }">
		<a href="reserve.do?pageNum=${startPage+PAGEPERBLOCK}">[다음]</a>
</c:if>	
</div>
</div>

</body>
</html>