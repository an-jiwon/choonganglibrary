<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="../adminpage/adminSessionChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::자유게시판</title>
<script type="text/javascript">
/* 	function chk() {
		if(frm.keyword.value != null)
			frm.keyword.value==${keyword};
			
	} */
</script>
</head>
<body>
<div class="wrapperadmin">
<div class="table-responsive">
	<table class="table table-hover">
		<caption>자유게시판</caption>
		<thead><tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>일자</th>
			<th>조회</th>
			<th>삭제</th>
		</tr></thead>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">데이터가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="board" items="${list }">
				<tr>
				<c:set var="cnt" value="${cnt+1 }"/>


				

				
					<td>${cnt}</td>
					<td>${board.category}</td>
					<td><a href="adminBoardFreesub.do?num=${board.num }&pageNum=${pageNum }" target="blank">${board.title}</a></td>
					
					<td>${board.writer}</td>
					<td>${board.board_date}
					<td>${board.board_view}</td>
					<td><input class="btn btn-default" type="button" onclick= "location.href = 'adminBoardDeleteForm.do?num=${board.num}&pageNum=${pageNum }'" value = "삭제"></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
	<div align="center">

		<c:if test="${startPage>PAGEPERBLOCK }">
			<a href="adminBoardFree.do?pageNum=${endPage-PAGEPERBLOCK}&keyword=${keyword}">[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="adminBoardFree.do?pageNum=${i }&keyword=${keyword}">[${i}]</a>
		</c:forEach>

		<c:if test="${endPage < totPage }">
			<a href="adminBoardFree.do?pageNum=${startPage+PAGEPERBLOCK}&keyword=${keyword}">[다음]</a>
		</c:if>
	</div>
	<div align="right">
	
	</div><p>
	<form name="frm" action="adminBoardFree.do" method="post">
	<div align="center">
	<input type="text" name="keyword" value="${keyword }" >
	<input class="btn btn-default" type="submit" value="검색">
	</div>
	</form>
	</div>
	
</body>
</html>