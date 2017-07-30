<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::관리자로그인</title>
</head>
<body>
<form action="adminlogin.do">
<table><caption>로그인</caption>
	<tr><th>아이디</th><td><input type="text" name="adminid" 
		required="required"></td></tr>
	<tr><th>암호</th><td><input  type="password" name="passwd"
		required="required"></td></tr>
	<tr><th colspan="2"><input class="btn btn-default" type="submit" value="확인"></th></tr>
</table></form>
</body>
</body>
</html>