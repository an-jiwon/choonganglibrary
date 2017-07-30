<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
	<style type="text/css">
		th{text-align:center; width : 200px;}
	</style>
</head>

<body>
<form action="adminbookinsert.do" method="post" name="frm" enctype="multipart/form-data">
<div class="wrapperadmin">
		<div class="table-responsive">
		 	<table class="table table-hover">
			
<caption>책 등록</caption>
<thead>
	<tr>
		<th>책 이름</th>
		<td><input type = "text" name = "title" required="required"></td>
	</tr>
	<tr>
		<th>분류</th>
		<td><select name="category" >
		<option value="총류">총류 <option value="IT">IT <option value="과학">과학
		<option value="예술">예술 <option value="언어">언어 <option value="문학">문학 <option value="역사">역사 <option value="기타">기타
		</select></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><input type = "text" name = "author" required="required"></td>
	</tr>
	<tr>
		<th>출판사</th>
		<td><input type="text" name="company" required="required"></td>
	</tr>
	<tr>
		<th>출판연도</th>
		<td><input type = "text" name = "book_public" required="required"></td>
	</tr>
	<tr>
		<th>소장위치</th>
		<td><input type = "text" name = "area" required="required"></td>
	</tr>
	<tr>
		<th>청구기호</th>
		<td><input type = "text" name = "giho" required="required"></td>
	</tr>
	<tr>
		<th>목차</th>
		<td><textarea name = "book_index" ></textarea></td>
	</tr>
	<tr>
		<th>표지</th>
		<td><input type = "file" name = "image"></td>
	</tr>
	<tr>
	<td></td>
	<td align = "left">
	<input class="btn btn-default" type = "submit" value = "확인">
	</td>
	</tr>
	</thead>
</table>
</div>
</div>
</form>
</body>
</html>