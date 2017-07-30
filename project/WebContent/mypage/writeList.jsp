<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="../login/sessionCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::나의글관리</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="../leftbar/leftbar5_5.jsp"></jsp:include>
<div class="wrapper">
	<div class="table-responsive">
	 <table class="table table-hover">
		<thead><tr>
			<th width="50">번호</th>
			<th>분류</th>
			<th width="400">제목</th>
			<th>작성자</th>
			<th>일자</th>
			
		</tr></thead>
		<c:if test="${empty list }">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="board" items="${list }">
				<tr>
				<c:set var="cnt" value="${cnt+1 }"/>
					<td>${cnt}</td>
					<td>${board.category}</td>
					<td><a href="../board/content.do?num=${board.num}&pageNum=${pageNum}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.board_date}
					<td>${board.board_view}</td>
					
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
	<div align="center">

		<c:if test="${startPage>PAGEPERBLOCK }">
			<a href="writeList.do?pageNum=${endPage-PAGEPERBLOCK}&keyword=${keyword}">[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="writeList.do?pageNum=${i }&keyword=${keyword}">[${i}]</a>
		</c:forEach>

		<c:if test="${endPage < totPage }">
			<a href="writeList.do?pageNum=${startPage+PAGEPERBLOCK}&keyword=${keyword}">[다음]</a>
		</c:if>
	</div>
	<div align="right">
	
	</div><p>
</div>
	
</body>
</html>