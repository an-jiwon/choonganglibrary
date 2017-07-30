<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../adminpage/adminSessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::관리자</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="../all.css" rel="stylesheet">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
	<style type="text/css">
		th{text-align:center; width : 200px;}
	</style>
</head>
<body>
<form action="adminbookupdate.do" method="post" name="frm" enctype="multipart/form-data">
<input type ="hidden" name = "book_id" value = "${book.book_id }">
<input type ="hidden" name = "pageNum" value = "${pageNum}">
<div class="wrapperadmin">
		<div class="table-responsive">
		 	<table class="table table-hover">
			
<caption>책 수정</caption>
	<thead>
	<tr>
		<th>책 이름</th>
		<td><input type = "text" name = "title" value = "${book.title }" required="required"></td>
	</tr>
	<tr>
		<th>분류</th>
		<td><input type = "text" name = "category" value = "${book.category }" required="required"></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><input type = "text" name = "author" value = "${book.author }" required="required"></td>
	</tr>
	<tr>
		<th>출판사</th>
		<td><input type="text" name="company" value = "${book.company }" required="required"></td>
	</tr>
	<tr>
		<th>출판연도</th>
		<td><input type = "text" name = "book_public" value = "${book.book_public }" required="required"></td>
	</tr>
	<tr>
		<th>소장위치</th>
		<td><input type = "text" name = "area" value = "${book.area }" required="required"></td>
	</tr>
	<tr>
		<th>청구기호</th>
		<td><input type = "text" name = "giho" value = "${book.giho }" required="required"></td>
	</tr>
	<tr>
		<th>목차</th>
		<td><input type = "text" name = "book_index" value = "${book.book_index }" ></td>
	</tr>
	<tr>
		<th>표지</th>
		<td><input type = "file" name = "image" value = "${book.image }" ></td>
	</tr>
	<tr>
	<td>
	</td>
	<td align ="left">
	<input class="btn btn-default" type = "submit" value = "확인">
	</td>
	</tr>
	<tr>
	<td>
	</td>	
	<td>
	표지는 다시 등록해야 합니다
	</td>
	</tr>
	</thead>
</table>
</div>
</div>
</form>
</body>
</html>