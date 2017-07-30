<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../adminpage/adminSessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::관리자</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<link href="../all.css" rel="stylesheet">
<script src="../js/jquery.js"></script>
<style type="text/css">
th {
	text-align: center;
	width: 200px;
}
</style>
</head>
<body>
	<form action="adminMemberMail.do" method="post">
		<div class="wrapperadmin">
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>메일 보내기</caption>
					<thead>
						<tr>
							<th>제목</th>
							<td><input type="text" name="subject" required="required"></td>
						</tr>
						<tr>
							<th>내용<br>
							<br>
							<br>
							<br>
							<br></th>
							<td><textarea rows="5" cols="30" name="msg"
									required="required"></textarea></td>
						</tr>
						<tr>
						<td>
						</td>
						<td>
						<input class="btn btn-default" type="submit" value="확인">
						</td>
						</tr>
					</thead>
				</table>
				
			</div>
		</div>
		<br>*주의* 속도 오래 걸립니다 <br>다른 작업을 하지 못할 수도 있습니다
	</form>
</body>
</html>