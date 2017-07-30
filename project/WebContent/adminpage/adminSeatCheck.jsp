<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::열람실</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<link href="../all.css" rel="stylesheet">
	<script src="../js/jquery.js"></script>
</head>
<body>
<form onsubmit = "history.go(-1)">
	<div class="wrapperadmin">
<div class="table-responsive">
 <table class="table table-hover">
 <thead>
		<tr>
			<td colspan = "3">좌석번호 ${seatnum } 사용기록 조회</td>			
		</tr>
		<tr>
			<th>아이디</th>
			<th>입실시간</th>
			<th>퇴실시간</th>			
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="3">이용한 내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="seat" items="${list}">
				<tr>
					<td>${seat.id}</td>
					<td><fmt:formatDate value="${seat.seatIn}" type="both"/></td>
					<td><fmt:formatDate value="${seat.seatOut}" type="both"/></td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
				<th colspan="2" align="right">
					<input class="btn btn-default" type="submit" value="돌아가기">
				</th>
			</tr></thead>
	</table>
	</div>
	</div>
	</form>
</body>
</html>