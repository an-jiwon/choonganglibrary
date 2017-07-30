<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../adminpage/adminSessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::관리자</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<link href="../all.css" rel="stylesheet">
	<script src="../js/jquery.js"></script>
</head>

<body>
	
<form action="adminMemberMain.do">
	<label>아이디</label>
	<input type="text" name = "id" required="required">
	<input type="submit" value="검색">
		<div class="wrapperadmin">
<div class="table-responsive">
 <table class="table table-hover">
 <thead>
		<tr>
			<th>아이디</th>
			<th>회원정보</th>
			<th>대출현황</th>
			<th>예약</th>
			<th>연체현황</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="5">검색결과가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="mem" items="${list}">
				<tr>
					<td>${mem.id}</td>
					<td><input class="btn btn-default" type = "button" value = "회원정보" onclick= "location.href = 'adminMemberInfo.do?id=${mem.id}&pageNum=${pagenum }'"></td>
					<td><input class="btn btn-default" type = "button" value = "대출" onclick= "location.href = 'adminMembercheckout.do?id=${mem.id}&pageNum=${pagenum }'"></td>
					<td><input class="btn btn-default" type = "button" value = "예약" onclick= "location.href = 'adminMemberReserve.do?id=${mem.id}'"></td>
					<td><input class="btn btn-default" type = "button" value = "연체" onclick= "location.href = 'adminMemberover.do?id=${mem.id}'"></td>
				</tr>
			</c:forEach>
		</c:if>
		</thead>
	</table>
	</div>
	</div>
	<div align="center">
		<c:if test="${startPage > PAGEPERBLOCK }">
			<a href="adminMemberMain.do?pageNum=${endPage-PAGEPERBLOCK}&id=${id}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="adminMemberMain.do?pageNum=${i}&id=${id}">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < totPage }">
			<a href="adminMemberMain.do?pageNum=${startPage+PAGEPERBLOCK}&id=${id}">[다음]</a>
		</c:if>
	</div>
	
	<input class="btn btn-default" type = "button" value = "목록으로" onclick= "location.href = 'adminMemberMain.do'">
	</form>	

</body>
</html>