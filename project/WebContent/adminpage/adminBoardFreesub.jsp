<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
<div class="wrapperadmin">
		<div class="table-responsive">
		 	<table class="table table-hover">
			<thead>
			<tr>
				<th colspan="4" style="text-align: center" bgcolor="#d8df8f">${board.title }</th>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${board.board_date }</td>
				<th>작성자</th>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><a href="#" onclick="onDownload('${board.num}')">${board.board_file}</a></td>
				<th>조회수</th>
				<td>${board.board_view }</td>
			</tr>
			<tr>
				<th colspan="4">내용</th>
			</tr>
			<tr>
				<td colspan="4">${board.board_main }</td>
			</tr>	
			</thead>		
		</table>
		<input class="btn btn-default" style="float: right;" type="button" value="글목록"
						onclick="location.href='adminBoardFree.do?pageNum=${pageNum}'">
		</div>
		</div>
</body>
</html>