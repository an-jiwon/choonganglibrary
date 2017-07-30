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
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../all.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
	<style type="text/css">
		th{text-align:center;}
	</style>
</head>
<body>
	<form onsubmit="history.go(-1)">
	<div class="wrapperadmin">
		<div class="table-responsive">
		 	<table class="table table-hover">
			<thead>
			<tr>
				<th>아이디</th>
				<td>${id }</td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td>${mem.email }</td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td>${mem.phone }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${mem.zipcode }</td>
			<tr>
				<td></td>
				<td>${mem.addr1 }</td>
			<tr>
				<td>
				<td>${mem.addr2 }</td>
			</tr>
			<tr>
				<th colspan="2" align="right">
					<input class="btn btn-default" type="submit" value="돌아가기">
				</th>
			</tr>
			</thead>
		</table>
		</div>
		</div>
	</form>
</body>
</html>