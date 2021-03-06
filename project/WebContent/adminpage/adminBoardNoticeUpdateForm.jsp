<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="../adminpage/adminSessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::공지사항</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
	<style type="text/css">
		th{text-align:center; width : 200px;}
	</style>
</head>
<body>
<form action="adminBoardNoticeUpdate.do" name="frm" method="post" onsubmit="return chk()" enctype="multipart/form-data">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="pageNum" value="${pageNum}">
<div class="wrapperadmin">
		<div class="table-responsive">
		 	<table class="table table-hover">
			
<caption>글쓰기</caption>
<thead>
<tr>
	<th>제목</th>
	<td><input type="text" name="title" value="${board.title}" required="required"></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea cols="50" rows="10" name="content" required="required" >${board.board_main}</textarea></td>
</tr>
<tr>
	<th>첨부파일</th>
		<td><input type="file" name="board_file"></td>
</tr>
<tr>
	<th colspan="2">
	<input class="btn btn-default" type="submit" value="수정">
	<input class="btn btn-default" type="button" value="취소" onclick="location.href = 'adminBoardNotice.do?pageNum=${pageNum}'">
	</th>
</tr>
	</thead>

</table>
</div>
</div>
</form>

</body>
</html>