<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::로그인</title>
<style type="text/css">
	h3 {margin-bottom: 0px; }
	#header {font-size: small; margin-top: 0px;}
	table {margin :auto;}
	#foot { font-size:small; text-align: center; }
	#find {font-size: small; text-align: center;}
</style>
<script type="text/javascript">
	function join() {
		opener.location.href="../member/joinForm.jsp";
		window.close();
	}
</script>
</head><body>

<c:if test="${not empty id }">
	<script type="text/javascript">
		opener.location.reload();	
		window.close();
	</script>
</c:if>

<h3>로그인</h3>
<font id="header">로그인 하시면 보다 더 많은 정보와 서비스를 이용하실 수 있습니다.</font>
<hr>

<form action="login.do">
<table>
	<tr><th>아이디</th><td><input type=text name=id required="required" autofocus="autofocus"></td></tr>
	<tr><th>비밀번호</th><td><input type=password name=passwd required="required"></td></tr>
	<tr><th colspan=2 style="text-align: center;"><input class="btn btn-default"  type=submit value=로그인 ></th></tr>
</table>
</form>

<hr>
<div id="foot">아직 중앙도서관 회원이 아니십니까?
<button class="btn btn-default" onclick="join()">회원가입하기</button></div> 

<div id="find">
<a href="findID.jsp">아이디 찾기</a> &nbsp; | &nbsp; <a href="findPass.jsp">비밀번호 찾기</a>
</div>
							
</body>
</html>