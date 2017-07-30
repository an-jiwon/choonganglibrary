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
	<link href="../all.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>

</head>

<body>
<form action="adminBookMain.do">
	<select name="category">
		<option>전체<option>총류<option>IT<option>과학
		<option>예술<option>언어<option>문학<option>사회
	</select>
	<input type="text" name = "titlemin" required="required">
	<input class="btn btn-default" type="submit" value="검색">
	<div class="wrapperadmin">
		<div class="table-responsive">
		 	<table class="table table-hover">
			<thead>
		<tr>
			<th>책 이름</th>
			<th>저자</th>
			<th>분류</th>
			<th>출판사</th>
			<th>청구기호</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="7">데이터가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="mem" items="${list}">
				<tr>
					<td>${mem.title}</td>
					<td>${mem.author}</td>
					<td>${mem.category}</td>
					<td>${mem.company}</td>
					<td>${mem.giho}</td>
					<td><input class="btn btn-default" type = "button" value = "수정" onclick= "location.href = 'adminbookupdateform.do?book_id=${mem.book_id}'"></td>
					<td><input class="btn btn-default" type = "button" value = "삭제" onclick= "location.href = 'adminbookdelete.do?book_id=${mem.book_id}'"></td>
				</tr>
			</c:forEach>
		</c:if>
		</thead>
	</table>
	</div>
	</div>
	<div align="center">
		<c:if test="${startPage > PAGEPERBLOCK }">
			<a href="adminBookMain.do?pageNum=${endPage-PAGEPERBLOCK}&category=${category}&titlemin=${titlemin}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="adminBookMain.do?pageNum=${i}&category=${category}&titlemin=${titlemin}">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < totPage }">
			<a href="adminBookMain.do?pageNum=${startPage+PAGEPERBLOCK}&category=${category}&titlemin=${titlemin}">[다음]</a>
		</c:if>
	</div>
	</form>	
</body>
</body>
</html>