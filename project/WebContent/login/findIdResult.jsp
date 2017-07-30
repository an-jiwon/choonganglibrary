<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	h3 {margin-bottom: 0px; }
	table {margin :auto;}
	th {line-height: 25px;}
	#foot { font-size:small; text-align: center; }
</style>
<script type="text/javascript">
function join() {
	opener.location.href="../member/joinForm.jsp";
	window.close();
}
</script>
</head>
<body>

<h3>아이디 찾기</h3>
<hr>

<form action="loginForm.jsp">
<table>
	<c:if test="${mem.name != null and mem.phone != null }">
		<tr><th> ${mem.name }님의 아이디는 아래와 같습니다.</th></tr>
		<tr><th>${mem.id }</th></tr>
		<tr><th colspan=2><input type=submit value="로그인 하기" class="btn btn-default"></th></tr>
	</c:if>
	<c:if test="${mem.name == null or mem.phone == null }">
		<tr><th>존재하지 않는 회원 정보입니다.</th></tr>
		<tr><th colspan=2><button onload="location.href='history.back()'" class="btn btn-default">돌아가기</button></th></tr>
	</c:if>
	
</table>
</form>

<hr>
<div id="foot">아직 중앙도서관 회원이 아니십니까?
<button onclick="join()" class="btn btn-default">회원가입하기</button></div> 
</body>
</html>