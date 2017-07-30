<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::도서검색</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
</head>
<body>
<%@ include file="../leftbar/leftbar1_1.jsp" %>
<div class="wrapper">
<div id="id">

<form action="bookSearch.do">
	분류선택
	<select name="category" >
	<c:if test="${not empty category }"><option value="${category }">${category }</option></c:if>
		<option value="전체">전체 <option value="총류">총류 <option value="IT">IT <option value="과학">과학
		<option value="예술">예술 <option value="언어">언어 <option value="문학">문학 <option value="역사">역사 <option value="기타">기타
	</select>
<input type=text name="searchKeyword" size=50 value="${searchKeyword }">
<input type=submit value="검색" class="btn btn-default" ><p>
</form>

검색결과<P>
<div class="table-responsive">
<table class="table table-hover">
<thead><tr><th width="50px">분류</th><th width="400pt">제목</th><th>저자</th><th>출판사</th><th>출판연도</th>
	<th>소장위치</th><th>청구기호</th><th>도서상태</th></tr></thead>

<c:forEach var="book" items="${list }" >

<tr><td>${book.category }</td><td><a href="bookSearchInfo.do?book_id=${book.book_id }&searchKeyword=${searchKeyword}">${book.title }</a></td><td>${book.author }</td>
	<td>${book.company }</td><td>${book.year }</td><td>${book.area }</td>
	<td>${book.giho }</td><td>${book.state }</td>
</c:forEach>
</table>
</div>


<div align=center>
<c:if test="${startPage > PAGEPERBLOCK }">
	<a href="bookSearch.do?pageNum=${endPage - PAGEPERBLOCK}&category=${category}&searchKeyword=${searchKeyword}">◀이전</a>
</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="bookSearch.do?pageNum=${i}&category=${category}&searchKeyword=${searchKeyword}">[${i}]</a>
	</c:forEach>

<c:if test="${endPage < totPage }">
	<a href="bookSearch.do?pageNum=${startPage + PAGEPERBLOCK}&category=${category}&searchKeyword=${searchKeyword}">다음▶</a>
</c:if>
</div>
</div>
</div>
</body>
</html>