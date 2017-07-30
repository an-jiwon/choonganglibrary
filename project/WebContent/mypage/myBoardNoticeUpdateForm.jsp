<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::글수정</title>
</head>
<body>
<div class="wrapper">
<form action="adminBoardNoticeUpdate.do" name="frm" method="post" onsubmit="return chk()" enctype="multipart/form-data">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="pageNum" value="${pageNum}">
<div class="table-responsive">
 <table class="table table-bordered">
<caption>글쓰기</caption>

<tr>
	<th>제목<input type="text" name="num" value="${num}"></th>
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
	<input type="submit" value="수정">
	<input type="button" value="취소" onclick="location.href = 'adminBoardNotice.do?pageNum=${pageNum}'">
	</th>
</tr>
	
</table>
</div>
</form>
</div>
</body>
</html>