<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../adminpage/adminSessionChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<form onsubmit="history.go(-1)">
		<input type="hidden" name="id" value="${id}"> <input
			type="hidden" name="pageNum" value="${pageNum}">
		<div class="wrapperadmin">
		<div class="table-responsive">
		 	<table class="table table-hover">
			<thead>
			<tr>
				<th>책</th>
				<th>대출일</th>
				<th>처리</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="3">대출기록이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="checkoutResult" items="${list}">
					<tr>
						<td>${checkoutResult.title}</td>
						<td>${checkoutResult.checkout_date}</td>
						<td>${checkoutResult.check_ok}</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<th>
				</th>
				<td><input class="btn btn-default" type="submit" value="돌아가기"></td>
				<th>
				</th>
				
			</tr>
</thead>
		</table>
		</div>
</div>

		<div align="center">
			<c:if test="${startPage > PAGEPERBLOCK }">
				<a
					href="adminMembercheckout.do?id=${id}&pageNum=${endPage-PAGEPERBLOCK}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="adminMembercheckout.do?id=${id}&pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<a
					href="adminMembercheckout.do?id=${id}&pageNum=${startPage+PAGEPERBLOCK}">[다음]</a>
			</c:if>
		</div>

	</form>
</body>
</html>