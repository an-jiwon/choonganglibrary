<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
	<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<title>중앙도서관::신착/추천도서</title>
<style type="text/css">
	table {width: 80%;}
	.write {float: right;}
</style>
<link rel="stylesheet" type="text/css" href="${path}/all.css"> 
</head>
<body>
<jsp:include page="../leftbar/leftbar1_2.jsp"></jsp:include>

<div class="wrapper">
<div class="table-responsive">
 <table class="table table-hover">
<thead><tr><th>번호</th><th>분류</th><th width="400pt">제목</th><th>작성자</th><th>일자</th><th>조회수</th></tr></thead>

<c:forEach var="nrboard" items="${list }">
<c:set var="count" value="${count+1 }"></c:set>
<tr><td>${count }</td>
	<td>${nrboard.category }</td>
	<td><a href="nrboardview.do?num=${nrboard.num }&pageNum=${pageNum}">${nrboard.title }</a></td>
	<td>${nrboard.writer }</td>
	<td>${nrboard.nr_date }</td>
	<td>${nrboard.nr_view }</td></tr>
</c:forEach>
</table>
</div>

<div class="write">
	<% String id =(String) session.getAttribute("id"); %>
	<c:if test="${id == 'admin' }">
		<button type="button" class="btn btn-default" onclick="location.href='writeForm.jsp'">글쓰기 </button>
	</c:if>
	<c:if test="${id != 'admin' }">
		<button type="button" class="btn btn-default" disabled="disabled">글쓰기 </button>
	</c:if>
</div> <p>



<div align=center>
<c:if test="${startPage > PAGEPERBLOCK }">
	<a href="nrboardlist.do?pageNum=${endPage - PAGEPERBLOCK}">◀이전</a>
</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="nrboardlist.do?pageNum=${i}">[${i}]</a>
	</c:forEach>

<c:if test="${endPage < totPage }">
	<a href="nrboardlist.do?pageNum=${startPage + PAGEPERBLOCK}">다음▶</a>
</c:if>
</div>
</div>
</body>
</html>